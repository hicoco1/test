<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 파일 업로드 처리를 위한 MultipartRequest 객체를 임포트 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!-- 파일 중복처리 객체 임포트 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!-- 파일 중복처리 객체 임포트 -->
<%@ page import="au.com.bytecode.opencsv.CSVReader"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.mrs.Vo.BranchOffice_StoreVO" %>
<%@ page import="com.mrs.StoreCsvManager"%> 
<%@ include file="/WEB-INF/views/common/taglibs_CS.jsp"%>
<html>
<head>
<script>
$(document).ready(function(){
	$.ajaxSetup({
	 	headers: {
	        'X-CSRF-TOKEN': $('meta[name="${_csrf.parameterName}"]').attr('content')
	    }
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
 System.out.println("aaaaaaaaaaaaa");
 int size = 50*1024*1024;        // 업로드 파일 최대 크기 지정
 int result;
 int number_cnt = 0;
 int bcnt = 0;
 int failcnt = 0, deleteCount=0, dup_idx=0, successCount=0;
 int insertCountInfo[] = new int[4];
 int SUCC_IDX=0,INCOR_IDX=1, FAIL_IDX=2, DUP_IDX=3;
 //String uploadPath = "/home/develop/delivery_web/apache-tomcat-7.0.64/webapps/mrs/WEB-INF/views/BranchOffice/csv";
 String uploadPath = "C:/workspace/mrs/WebContent/csv/";
 String tbl_name    = "afd_storeinfo_test";
 String filename = "";
 String message = ""; 
 String search_condition1 = "";
 String search_condition2 = "";
 String[] nextLine;
 List<String[]> data = new ArrayList<String[]>();
 System.out.println("bbb");
 for(int i=0; i<insertCountInfo.length; i++){
         insertCountInfo[i] = 0;
 }
 System.out.println("ccccc");
 try{
	 System.out.println("11111111111111");
  StoreCsvManager dMng      = new StoreCsvManager();
  System.out.println("2222222222");
  MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
  System.out.println("ddddddd");                                       
  // 업로드한 파일들을 Enumeration 타입으로 반환                                                 
  // Enumeration형은 데이터를 뽑아올때 유용한 인터페이스 Enumeration객체는 java.util 팩키지에 정의 되어있으므로
  // java.util.Enumeration을 import 시켜야 한다.                                                 
  Enumeration files = multi.getFileNames(); 
  String file = (String)files.nextElement();                                                     
  filename = multi.getFilesystemName(file);                                                      
  System.out.println("eeeeeeee");                                                                                           
  //확장자 검사                                                                                  
  if(filename.substring(filename.lastIndexOf(".")+1,filename.length()).equals("csv"))            
  {  
	  System.out.println("ffffffff11");
    filename = uploadPath+filename;  
	  System.out.println("ffffffff222::::"+filename);
    CSVReader reader = new CSVReader(new FileReader(filename));                                  
    int n = 0;                                                                                   
    while((nextLine = reader.readNext()) != null)                                                
    {          
    	System.out.println("ggggggg");                                                                                  
          n++;                                                                                   
          if(n == 1) continue; //제목은 skip                                                     
          System.out.println("hhh");                                                                                       
        /* 라인 단위로 List에 저장 */                                                            
          data.add(nextLine);           
          System.out.println("iiiiii");
    }                                                                    
    System.out.println("data=======" + data);
                                                                                                 
    /* DB Insert 수행 */                                                                 
    result = dMng.doCSVInsert("admin", tbl_name, data, -1, insertCountInfo);               
                                                                                                                        
    if(result == -10 ) {                                                                         
        message = "형식이 올바르지 않은 정보가 있습니다. \\n 확인 후 다시 시도해 주세요.";  
    }else if(result > 0)                                                                         
    {   
    	System.out.println("jjjjjjj");
        successCount = insertCountInfo[SUCC_IDX]; 
        message = "총 " + data.size() + " 건  등록요청 ==> ";                                             

        message += successCount + " 건  등록 성공.";                                                      

        if(data.size() != successCount)                                                                           

        { 
        	System.out.println("kkkkkk");

            message += "\\n\\n업소정보 등록 실패 ";                                                       
			/*
            message += "===============================================";                                         

            message += "\\n1. 중복      번호 : " + insertCountInfo[DUP_IDX] + " 건";                              

            message += "\\n2. 번호형식오류 : " + insertCountInfo[INCOR_IDX] + " 건";                              

            message += "\\n3. 기            타 : " + insertCountInfo[FAIL_IDX] + " 건";                           

            message += "===============================================";                                         
			*/
        }                                                                                        
    }                                                                                            
    else                                                                                         
        message = "실패하였습니다..";                                                            
  }                                                                                              
  else                                                                                           
    message = "CSV파일이 아닙니다. 다시 시도해 주세요.";                                         
                                                                                                 
 }catch(Exception e){                                                                            
  // 예외처리                                                                                    
  e.printStackTrace();                                                                           
 }                                                                                               
%>                                                                                               
