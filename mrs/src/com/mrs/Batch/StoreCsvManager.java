package com.mrs.Batch;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.PreparedStatement;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.mrs.Batch.Oci.Oci;
import com.mrs.Vo.BranchOffice_Store_CsvVO;

public class StoreCsvManager {
	private Oci conn = null;

	public String encSHA256(String str){
		/*
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();

		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
		*/
		return str;
	}

	
	public void getConnection(String[] jdbcdiver) {
		try {
			conn = new Oci(jdbcdiver);
	    }
	    catch (Exception e) {
	    	conn.log(" connection Excetion : " + e.toString());
	    }
	}

	public void closeConnection() {
		try {
			if ( conn!= null ) conn.close();
	    }
	    catch (Exception e) {
	    	try{
	    	conn.log(" connection close Excetion : " + e.toString());
	    	}catch(Exception e1){;}
	    }
	}



	/*상점 정보 다량 등록*/
	public int doCSVInsert(String id, String tblName, List<String[]> data, int seq, int[] insertCountInfo,String[] jdbcdiver) throws Exception {
		StringBuffer strBuf = new StringBuffer();
		List<String> failList = new ArrayList<String>();
		String[] tmpList = null;
		String trans = "";
		String transid = "";
		
		getConnection(jdbcdiver);
		
		int last = 0, t = 0;
		int count = 0;
		int countUpdated[] = new int[1000];
		int SUCC_IDX=0,INCOR_IDX=1, FAIL_IDX=2, DUP_IDX=3;
        
        try{
        	strBuf.append("insert into " +tblName+ "(  ");
            strBuf.append("b_id, s_id, S_NAME, ACTIVE_STATUS, S_TEL1, ");
            strBuf.append("S_TEL2, S_BALANCE, COOK_TIME, S_ADDR1, S_ADDR2, ");
            strBuf.append("S_ADDR_BUILDING, S_ADDR_NUM, S_ADDR_APPENDIX, S_CRN, LOGIN_ID, ");
            strBuf.append("LOGIN_PASSWD, CONTRACT_SDATE, CONTRACT_EDATE, SERVICE_START_DATE, OPEN_TIME, ");
            strBuf.append("CLOSE_TIME, NOTI_FLAG, NOTI_RIDER_ASSIGN, NOTI_CARD_PAY, SERVICE_TYPE,  ");
            strBuf.append("CHARGE_TYPE, CHARGE_METHOD, CHARGE_OPTION, CID_ID, CID_PORT,   ");
            strBuf.append("CID_PORT_SPEED, PRINTER_ID, PRINTER_PORT, PRINTER_PORT_SPEED, CAT_ID,   ");
            strBuf.append("VAN_ID, V_BANK, V_ACCOUNT, V_NAME, BASIC_DISTANCE,   ");
            strBuf.append("BASIC_CHARGE, ADD_DISTANCE, ADD_CHARGE, S_REPRESENTATIVE, MONTHLY_OPTION, ");
            strBuf.append("MONTHLY_CHARGE");
            strBuf.append(")");
         
			//strBuf.append(" values( ?, ?, ?, ifnull((select * from (select max(idx+0)+1 from info_blacklist where id = ?) as temp), 1), now() )");
			strBuf.append(" values( ?, ?, ?, ?, ?,");
			strBuf.append(" ?, ?, ?, ?, ?, ");
			strBuf.append(" ?, ?, ?, ?, ?, ");
			strBuf.append(" ?, ?, ?, ?, ?, ");
			strBuf.append(" ?, ?, ?, ?, ?, ");
			strBuf.append(" ?, ?, ?, ?, ?, ");
			strBuf.append(" ?, ?, ?, ?, ?, ");
			strBuf.append(" ?, ?, ?, ?, ?, ");
			strBuf.append(" ?, ?, ?, ?, ?,  ");
			strBuf.append(" ?)");
	      
			strBuf.append("on duplicate key update S_NAME = ?, ");
			strBuf.append("ACTIVE_STATUS = ?, ");
			strBuf.append("S_TEL1 = ?, ");
			strBuf.append("S_TEL2 = ?, ");
			strBuf.append("S_BALANCE = ?, ");
			strBuf.append("COOK_TIME = ?, ");
			strBuf.append("S_ADDR1 = ?, ");
			strBuf.append("S_ADDR2 = ?, ");
			strBuf.append("S_ADDR_BUILDING = ?, ");
			strBuf.append("S_ADDR_NUM = ?, ");
			strBuf.append("S_ADDR_APPENDIX = ?, ");
			strBuf.append("S_CRN = ?, ");
			strBuf.append("LOGIN_ID = ?, ");
			strBuf.append("LOGIN_PASSWD = ?, ");
			strBuf.append("CONTRACT_SDATE = ?, ");
			strBuf.append("CONTRACT_EDATE = ?, ");
			strBuf.append("SERVICE_START_DATE = ?, ");
			strBuf.append("OPEN_TIME = ?, ");
			strBuf.append("CLOSE_TIME = ?, ");
			strBuf.append("NOTI_FLAG = ?, ");
			strBuf.append("NOTI_RIDER_ASSIGN = ?, ");
			strBuf.append("NOTI_CARD_PAY = ?, ");
			strBuf.append("SERVICE_TYPE = ?, ");
			strBuf.append("CHARGE_TYPE = ?, ");
			strBuf.append("CHARGE_METHOD = ?, ");
			strBuf.append("CHARGE_OPTION = ?, ");
			strBuf.append("CID_ID = ?, ");
			strBuf.append("CID_PORT = ?, ");
			strBuf.append("CID_PORT_SPEED = ?, ");
			strBuf.append("PRINTER_ID = ?, ");
			strBuf.append("PRINTER_PORT = ?, ");
			strBuf.append("PRINTER_PORT_SPEED = ?, ");
			strBuf.append("CAT_ID = ?, ");
			strBuf.append("VAN_ID = ?, ");
			strBuf.append("V_BANK = ?, ");
			strBuf.append("V_ACCOUNT = ?, ");
			strBuf.append("V_NAME = ?, ");
			strBuf.append("BASIC_DISTANCE = ?, ");
			strBuf.append("BASIC_CHARGE = ?, ");
			strBuf.append("ADD_DISTANCE = ?, ");
			strBuf.append("ADD_CHARGE = ?, ");
			strBuf.append("S_REPRESENTATIVE = ?, ");
			strBuf.append("MONTHLY_OPTION = ?, ");
			strBuf.append("MONTHLY_CHARGE = ? ");
  
			PreparedStatement ps = conn.doPrepare(strBuf.toString());
            	conn.setAutoCommit(false);

            	for(int i=0, n = data.size(); i < n; i++)
            	{
            		tmpList = (String[])data.get(i);
               
	                if(!tmpList[1].equals("")){
	                    ps.setString(1, tmpList[0]);                                                                                                                                             
	                    ps.setString(2, tmpList[1]);
	                    ps.setString(3, tmpList[2]);
	                    ps.setString(4, tmpList[3]);
	                    ps.setString(5, tmpList[4]);
	                    ps.setString(6, tmpList[5]);
	                    ps.setString(7, tmpList[6]);
	                    ps.setString(8, tmpList[7]);
	                    ps.setString(9, tmpList[8]);
	                    ps.setString(10, tmpList[9]);
	                    ps.setString(11, tmpList[10]);
	                    ps.setString(12, tmpList[11]);
	                    ps.setString(13, tmpList[12]);
	                    ps.setString(14, tmpList[13]);
	                    ps.setString(15, tmpList[14]);
	                    ps.setString(16, tmpList[15]);
	                    ps.setString(17, tmpList[16]);
	                    ps.setString(18, tmpList[17]);
	                    ps.setString(19, tmpList[18]);
	                    ps.setString(20, tmpList[19]);
	                    ps.setString(21, tmpList[20]);
	                    ps.setString(22, tmpList[21]);
	                    ps.setString(23, tmpList[22]);
	                    ps.setString(24, tmpList[23]);
	                    ps.setString(25, tmpList[24]);
	                    ps.setString(26, tmpList[25]);
	                    ps.setString(27, tmpList[26]);
	                    ps.setString(28, tmpList[27]);
	                    ps.setString(29, tmpList[28]);
	                    ps.setString(30, tmpList[29]);
	                    ps.setString(31, tmpList[30]);
	                    ps.setString(32, tmpList[31]);
	                    ps.setString(33, tmpList[32]);
	                    ps.setString(34, tmpList[33]);
	                    ps.setString(35, tmpList[34]);
	                    ps.setString(36, tmpList[35]);
	                    ps.setString(37, tmpList[36]);
	                    ps.setString(38, tmpList[37]);
	                    ps.setString(39, tmpList[38]);
	                    ps.setString(40, tmpList[39]);
	                    ps.setString(41, tmpList[40]);
	                    ps.setString(42, tmpList[41]);
	                    ps.setString(43, tmpList[42]);
	                    ps.setString(44, tmpList[43]);
	                    ps.setString(45, tmpList[44]);
	                    ps.setString(46, tmpList[45]);
	                    ps.setString(47, tmpList[2]);
	                    ps.setString(48, tmpList[3]);
	                    ps.setString(49, tmpList[4]);
	                    ps.setString(50, tmpList[5]);
	                    ps.setString(51, tmpList[6]);
	                    ps.setString(52, tmpList[7]);
	                    ps.setString(53, tmpList[8]);
	                    ps.setString(54, tmpList[9]);
	                    ps.setString(55, tmpList[10]);
	                    ps.setString(56, tmpList[11]);
	                    ps.setString(57, tmpList[12]);
	                    ps.setString(58, tmpList[13]);
	                    ps.setString(59, tmpList[14]);
	                    ps.setString(60, tmpList[15]);
	                    ps.setString(61, tmpList[16]);
	                    ps.setString(62, tmpList[17]);
	                    ps.setString(63, tmpList[18]);
	                    ps.setString(64, tmpList[19]);
	                    ps.setString(65, tmpList[20]);
	                    ps.setString(66, tmpList[21]);
	                    ps.setString(67, tmpList[22]);
	                    ps.setString(68, tmpList[23]);
	                    ps.setString(69, tmpList[24]);
	                    ps.setString(70, tmpList[25]);
	                    ps.setString(71, tmpList[26]);
	                    ps.setString(72, tmpList[27]);
	                    ps.setString(73, tmpList[28]);
	                    ps.setString(74, tmpList[29]);
	                    ps.setString(75, tmpList[30]);
	                    ps.setString(76, tmpList[31]);
	                    ps.setString(77, tmpList[32]);
	                    ps.setString(78, tmpList[33]);
	                    ps.setString(79, tmpList[34]);
	                    ps.setString(80, tmpList[35]);
	                    ps.setString(81, tmpList[36]);
	                    ps.setString(82, tmpList[37]);
	                    ps.setString(83, tmpList[38]);
	                    ps.setString(84, tmpList[39]);
	                    ps.setString(85, tmpList[40]);
	                    ps.setString(86, tmpList[41]);
	                    ps.setString(87, tmpList[42]);
	                    ps.setString(88, tmpList[43]);
	                    ps.setString(89, tmpList[44]);
	                    ps.setString(90, tmpList[45]);
	                    ps.addBatch();
				}else {
					insertCountInfo[INCOR_IDX]++;
				}

				if( (i+1) % 1000 == 0)                                                                                                                                                           
                {                                                                                                                                                                            
                    countUpdated = ps.executeBatch();                                                                                                                                        
                                                                                                                                                                                             
                    for(int j=0; j<countUpdated.length; j++)                                                                                                                                 
                    {                                                                                                                                                                        
                        if(countUpdated[j] < 0) {                                                                                                                                            
                            insertCountInfo[FAIL_IDX]++;                                                                                                                                     
                        } else {                                                                                                                                                             
                            /* on duplicate key update는 성공시 2를 반환 */                                                                                                                  
                            if(countUpdated[j] == 2) {                                                                                                                                       
                                insertCountInfo[DUP_IDX]++;                                                                                                                                  
                            } else {                                                                                                                                                         
                                insertCountInfo[SUCC_IDX]++;                                                                                                                                 
                            }                                                                                                                                                                
                        }                                                                                                                                                                    
                    }                                                                                                                                                                        
                }                                                                                                                                                                            
            } 

			countUpdated = ps.executeBatch();                                                                                                                                                
                                                                                                                                                                                             
            for(int j=0; j<countUpdated.length; j++)                                                                                                                                         
            {                                                                                                                                                                                
                if(countUpdated[j] < 0) {                                                                                                                                                    
                    insertCountInfo[FAIL_IDX]++;                                                                                                                                             
                } else {                                                                                                                                                                     
                    /* on duplicate key update는 성공시 2를 반환 */                                                                                                                          
                    if(countUpdated[j] == 2) {                                                                                                                                               
                        insertCountInfo[DUP_IDX]++;                                                                                                                                          
                    } else {                                                                                                                                                                 
                        insertCountInfo[SUCC_IDX]++;                                                                                                                                         
                    }                                                                                                                                                                        
                }                                                                                                                                                                            
            } 
			
			conn.commit();                                                                                                                                                                   
            conn.setAutoCommit(true);                                                                                                                                                        
            System.out.println("doCSVInsert [Grp Update] Query : " + strBuf.toString());                                                                                                                  
            return 1;                                                                                                                                                                        
                                                                                                                                                                                             
        }catch (Exception e){                                                                                                                                                                
        	System.out.println(" doInsert1 : " + e.toString() );                                                                                                                                          
            conn.rollback();                                                                                                                                                                 
            return -1;                                                                                                                                                                       
        } finally {                                                                                                                                                                          
            closeConnection();                                                                                                                                                               
        }                                                                                                                                                                                    
    }
}
