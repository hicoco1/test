package com.mrs.Batch.Oci;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Oci {
	@Resource(name = "mybatis_prop")
	private Properties mybatis_prop; // vxml_url     = ems_prop.getProperty("pvsvxml.url"); 프로퍼티에서 일케 가져와도 대여.
	
        private Connection m_hConnection = null;
        private PreparedStatement m_pstmt = null;
        private CallableStatement m_cstmt = null;
        private CallableStatement m_cstmt1 = null;
	    private Statement m_stmt = null;
	    private String mQuery;
        public ResultSet m_rs = null;
        private boolean autoCommit = true;
        private boolean rollbackFlag = false;


        public String ociException = new String();
        private int parameterIndex= 1 ;

        public int registerOutParameterIndex= 1 ;
        public String registerOutParameterType= new String() ;
        public String registerOutParameterReturn = new String() ;

        public void log(String err){
            log("[DB ERROR]",err);
        }
        public void log(String errorCondition, String err){
            Date today = new Date();
	        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
    	    String currentTime = dateformat.format(today);

            try {
                FileWriter file = new FileWriter("jsp_log_dbAccess.log", true);
                BufferedWriter  bw = new BufferedWriter(file);
                bw.write("\n" + errorCondition + " " + currentTime + " \n " + err + " \n " + mQuery + "\n");

                bw.close();
                System.out.println("\n" + errorCondition + " " + currentTime + " \n " + err + " \n " + mQuery + "\n");
            } catch(IOException e) {
                e.printStackTrace();
            }
        }
        public void log(Exception e){
            log("[SQL ERROR ]",((SQLException)e).getErrorCode() + "-" + ((SQLException)e).getSQLState());
        }


        public Oci(String[]jdbcdiver) throws SQLException{

        	doConnect(jdbcdiver);
        	
        }
        
  


        public void setAutoCommit(boolean commitMode) throws SQLException{
        	m_hConnection.setAutoCommit(commitMode);
        	autoCommit=commitMode;
        }

        public void commit() throws SQLException{
			m_hConnection.commit();
		}

        public void rollback() throws SQLException{
			m_hConnection.rollback();
		}

      
 
        public void doConnect(String[] jdbcdiver) throws SQLException {
        	
        	 String driverClass = "";
	       	 String jdbcurl = "";
	       	 String jdbcusername = "";
	       	 String jdbcpassword = "";
	        	
        	 for(int i=0; i<jdbcdiver.length; i++){
        		  
        		  driverClass = jdbcdiver[0];
            	  jdbcurl = jdbcdiver[1];
            	  jdbcusername = jdbcdiver[2];
            	  jdbcpassword = jdbcdiver[3];
        		 
		 	}
        	
        	 
        	 
        	  try{
            	Class.forName(driverClass);
            	
                m_hConnection = DriverManager.getConnection(jdbcurl,jdbcusername, jdbcpassword);
            }
            catch(Exception e){
                log(e.toString());
            }

        }

        public String getJDBCVersion() throws SQLException{
        	DatabaseMetaData meta = m_hConnection.getMetaData();
        	return "JDBC driver version is " + meta.getDriverVersion();
        }

        public Connection getConnnection(){
            return m_hConnection;
        }

        public PreparedStatement doPrepare(String m_sql) throws SQLException {
            try
            {
            	if(m_pstmt!=null){
		        	try{
			            m_pstmt.clearParameters();
		        	}catch(Exception e){
		            }
		        }
    	        m_pstmt = m_hConnection.prepareStatement(m_sql);
        	    this.mQuery = m_sql;

                return m_pstmt;
            }   catch(Exception e) {
                log(e.toString()+" - doPrepare()");
                return null;
    	    }
        }


        public CallableStatement doPrepareReturn(String m_sql)  throws SQLException {
            try
            {

            	if(m_cstmt!=null){
		        	try{
			            m_cstmt.clearParameters();
		        	}catch(Exception e){
		            }
		        }
    	        m_cstmt = m_hConnection.prepareCall("begin " + m_sql +"; end;");
    	        return m_cstmt;
    	    }   catch(Exception e) {
                log(e.toString());
                return null;
    	    }
        }



        public void set(String s) throws SQLException{
        	try
            {
            if (s != null){ m_pstmt.setObject(this.parameterIndex++, s);
            mQuery = mQuery.replaceFirst("\\?", s);}
           // System.out.println(parameterIndex + " : " + s);
            }   catch(Exception e) {
                 log(e.toString()+"set(String)" + parameterIndex);
    	    }
        }
        
        public void set(Timestamp s) throws SQLException{
        	try
            {
            if (s != null){ m_pstmt.setTimestamp(this.parameterIndex++, s);
            mQuery = mQuery.replaceFirst("\\?", s.toString());}
            //System.out.println(parameterIndex + " : " + s);
            }   catch(Exception e) {
                 log(e.toString()+"set(String)" + parameterIndex);
    	    }
        }

    	public void set(int I) throws SQLException{
    		try
            {
            if (Integer.toString(I) != null){ m_pstmt.setObject(this.parameterIndex++, Integer.toString(I));
            mQuery = mQuery.replaceFirst("\\?", Integer.toString(I));}
            }   catch(Exception e) {
                 log(e.toString()+"set(Int)" + parameterIndex);
    	    }
        }


        public void set(int i,String s) throws SQLException{
    	    try
            {
            if (s != null) m_pstmt.setObject(i, s);
            }   catch(Exception e) {
                 log(e.toString()+" - set(i,String)");
    	    }
        }


        public void set(int i,int I) throws SQLException{
    	    try
            {
            if (Integer.toString(I) != null) m_pstmt.setObject(i, Integer.toString(I));
            }   catch(Exception e) {
                 log(e.toString()+" - set(i,int)");

    	    }
        }

        public void set(int i,String s,String type) throws SQLException,Exception{
    	    try
            {
                if (s != null){
                   
                    if(type.toUpperCase().equals("STRING"))
                        m_pstmt.setObject(i, s);
                    if(type.toUpperCase().equals("INT"))
                        m_pstmt.setInt(i, Integer.parseInt(s));
                }
            }   catch(SQLException e) {
                 log(e.toString()+" - set(i,String,type) "+ type);

    	    }   catch(Exception e) {
                 log(e.toString()+" - set(i,String,type) "+ type);

    	    }
        }

        public void set(int i,int I,String type) throws SQLException,Exception{
    	    try
            {
                if (Integer.toString(I) != null && type.toUpperCase().equals("INT"))
                    m_pstmt.setObject(i, Integer.toString(I));
                if (Integer.toString(I) != null && type.toUpperCase().equals("STRING"))
                    m_pstmt.setObject(i, Integer.toString(I));
              
            }   catch(SQLException e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }   catch(Exception e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }
        }

        public void setC(String s) throws SQLException{
        	try
            {
            if (s != null) m_cstmt.setObject(this.parameterIndex++, s);
            }   catch(Exception e) {
                 log(e.toString()+"set(String)" + parameterIndex);
    	    }
        }

    	public void setC(int I) throws SQLException{
    	    try
            {
            if (Integer.toString(I) != null) m_cstmt.setObject(this.parameterIndex++, Integer.toString(I));
            }   catch(Exception e) {
                 log(e.toString()+"set(Int)" + parameterIndex);
    	    }
        }

    

        public void setC(int i,String s) throws SQLException{
    	    try
            {
            if (s != null) m_cstmt.setObject(i, s);
            }   catch(Exception e) {
                 log(e.toString()+" - set(i,String)");
    	    }
        }

   

        public void setC(int i,int I) throws SQLException{
    	    try
            {
            if (Integer.toString(I) != null) m_cstmt.setObject(i, Integer.toString(I));
            }   catch(SQLException e) {
                 log(e.toString()+" - set(i,int)");

    	    }
        }

        public void setC(int i,String s,String type) throws SQLException,Exception{
    	    try
            {
                if (s != null){
                 
                    if(type.toUpperCase().equals("STRING"))
                        m_cstmt.setObject(i, s);
                    if(type.toUpperCase().equals("INT"))
                        m_cstmt.setInt(i, Integer.parseInt(s));
                }
            }   catch(SQLException e) {
                 log(e.toString()+" - set(i,String,type) "+ type);

    	    }   catch(Exception e) {
                 log(e.toString()+" - set(i,String,type) "+ type);

    	    }
        }

        public void setC(int i,int I,String type) throws SQLException,Exception{
    	    try
            {
                if (Integer.toString(I) != null && type.toUpperCase().equals("INT"))
                    m_cstmt.setObject(i, Integer.toString(I));
                if (Integer.toString(I) != null && type.toUpperCase().equals("STRING"))
                    m_cstmt.setObject(i, Integer.toString(I));
                
            }   catch(SQLException e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }   catch(Exception e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }
        }
        public void setReturn(String type)throws SQLException,Exception {
        	try
            {
        		registerOutParameterType = type.toUpperCase();
        		registerOutParameterIndex = parameterIndex;
        		if ( type.toUpperCase().equals("INT"))
                	m_cstmt.registerOutParameter( this.parameterIndex++, Types.INTEGER );
                if ( type.toUpperCase().equals("STRING"))
                	m_cstmt.registerOutParameter( this.parameterIndex++, Types.VARCHAR );
                if ( type.toUpperCase().equals("CLOB"))
                	m_cstmt.registerOutParameter( this.parameterIndex++, Types.CLOB );
            }   catch(SQLException e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }   catch(Exception e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }
        }
        public void setReturn(int I,String type) throws SQLException,Exception {
        	try
            {
        		registerOutParameterType = type.toUpperCase();
        		registerOutParameterIndex = I;
        		if (Integer.toString(I) != null && type.toUpperCase().equals("INT"))
                	m_cstmt.registerOutParameter( I, Types.INTEGER );
                if (Integer.toString(I) != null && type.toUpperCase().equals("STRING"))
                	m_cstmt.registerOutParameter( I, Types.VARCHAR );
                if (Integer.toString(I) != null && type.toUpperCase().equals("CLOB"))
                	m_cstmt.registerOutParameter( I, Types.CLOB );
            }   catch(SQLException e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }   catch(Exception e) {
                 log(e.toString()+" - set(i,int,type) " + type);

    	    }
        	m_cstmt.registerOutParameter( I, Types.INTEGER );
        }

        public ResultSet executeQuery() throws SQLException{
            try
            {
    		    m_rs = m_pstmt.executeQuery();
    		    this.parameterIndex = 1;

    		    if(!autoCommit && !rollbackFlag){
    		    	m_hConnection.commit();
    		    	setAutoCommit(true);
    		    }
                return m_rs;
            }   catch(Exception e) {
                this.parameterIndex = 1;
                log(e.toString()+" - executeQuery()");
                if(!autoCommit)
                	rollbackFlag = true;
                return null;
    	    }
    	}

        public void execute() throws SQLException{
    	    try
            {
    		    m_cstmt.execute();
    		    if(!autoCommit && !rollbackFlag){
    		    	m_hConnection.commit();
    		    	setAutoCommit(true);
    		    }
    		    this.parameterIndex = 1;
    		}   catch(Exception e) {
    		    this.parameterIndex = 1;
                log(e.toString()+" - executeUpdate()");
                if(!autoCommit)
                	rollbackFlag = true;
    	    }
        }

    	public int executeUpdate() throws SQLException{
    		int rs_row=0;
    	    try
            {
    		    rs_row = m_pstmt.executeUpdate();
    		    this.parameterIndex = 1;
    		    if(!autoCommit && !rollbackFlag){
    		    	m_hConnection.commit();
    		    	setAutoCommit(true);
    		    }
    		    
    		}   catch(SQLException e) {
    		    this.parameterIndex = 1;
                log(e.toString()+"\n"+((SQLException)e).getSQLState()+"\n"+((SQLException)e).getErrorCode()+"\n"+((SQLException)e).getMessage()+" - executeUpdate()");
                if(!autoCommit)
                	rollbackFlag = true;
                rs_row=0;
                throw (SQLException)e;
    	    }
    		return rs_row;
        }


    	public int executeUpdateLog() throws SQLException{
    		int rs_row=0;
    	    try
            {
    		    rs_row = m_pstmt.executeUpdate();
    		    this.parameterIndex = 1;
    		    if(!autoCommit && !rollbackFlag){
    		    	m_hConnection.commit();
    		    	setAutoCommit(true);
    		    }
    		}   catch(SQLException e) {
    		    this.parameterIndex = 1;
                log(e.toString()+"\n"+((SQLException)e).getSQLState()+"\n"+((SQLException)e).getErrorCode()+"\n"+((SQLException)e).getMessage()+" - executeUpdate()");
                if(!autoCommit)
                	rollbackFlag = true;
                rs_row=0;
                throw (SQLException)e;
    	    }
    		return rs_row;
        }


    	public int executeUpdateRE() throws SQLException{
    		    int rs_row = m_pstmt.executeUpdate();
    		    this.parameterIndex = 1;
    		    if(!autoCommit && !rollbackFlag){
    		    	m_hConnection.commit();
    		    	setAutoCommit(true);
    		    }
    		    return rs_row;
        }

    	

    	public String getC() throws SQLException{
    		if ( registerOutParameterType.equals("INT"))
    			return Integer.toString(m_cstmt.getInt( registerOutParameterIndex));
            if ( registerOutParameterType.equals("STRING"))
            	return m_cstmt.getString( registerOutParameterIndex );
         
    		return registerOutParameterReturn;
    	}
        public int getInt(String str) throws SQLException{
            return this.m_rs.getInt(str);
        }

        public double getDouble(String str) throws SQLException{
            return this.m_rs.getDouble(str);
        }

        public String getString(String str) throws SQLException{
            if( this.m_rs.getString(str) != null ) return this.m_rs.getString(str);
            else return "";
        }



        public Date getDate(String str) throws SQLException{
            if( this.m_rs.getTimestamp(str) != null ) return this.m_rs.getTimestamp(str);
            else return new Date((long) 0);
        }


        public String getDate(String str, String sFormat) throws SQLException{
            SimpleDateFormat dt = new SimpleDateFormat(sFormat);
            if( this.m_rs.getTimestamp(str) != null ) {
                return dt.format(this.m_rs.getTimestamp(str));
            } else {
                return sFormat.replaceAll("[a-zA-Z]","0");
            }
        }


        public boolean next() throws SQLException
        {
            return m_rs.next();
        }


        public void close() throws SQLException{
	        	if(rollbackFlag){
			    	m_hConnection.rollback();
			    }
		        if(m_rs!=null){
		            try{
		            	m_rs.close();
		            	m_rs = null;
		            }catch(Exception e){
		            }
		        }
		        if(m_stmt!=null){
		        	try{
			            m_stmt.close();
			            m_stmt = null;
		        	}catch(Exception e){
		            }
		        }
		        if(m_pstmt!=null){
		        	try{
	                    m_pstmt.close();
	                    m_pstmt = null;
		        	}catch(Exception e){
		            }
                }
		        if(m_cstmt!=null){
		        	try{
	                    m_cstmt.close();
	                    m_cstmt = null;
		        	}catch(Exception e){
		            }
                }
		        if(m_cstmt1!=null){
		        	try{
	                    m_cstmt1.close();
	                    m_cstmt1 = null;
		        	}catch(Exception e){
		            }
                }
                if(m_hConnection != null){
                	try{
	    		        m_hConnection.close();
	    		        m_hConnection = null;
	                }catch(Exception e){
		            }
    		    }
        }


    
}



