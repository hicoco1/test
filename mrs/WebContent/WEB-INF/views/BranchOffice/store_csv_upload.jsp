<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script language="javascript">
$(document).ready(function(){
	 $(window).load(function() {     
        $('#loading').hide();   
   }); 
}); 
</script>
<div id="loading"><img id="loading-image" src="resources/images/loading.gif" alt="Loading..." /></div>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" style="padding : 0px 0 0px 0">
    <div class="COMMON_POPUP_BODY" id="USER_ID01">
        <table width="370" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
            <form name="fileForm" id="fileForm" action="store_csv_insert?${_csrf.parameterName}=${_csrf.token}"  method="POST"  enctype="multipart/form-data">
            <input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <table width="370" border="0" cellspacing="1" cellpadding="5" bgcolor="#E5E5E5">
                  <tr>                                                                           
                    <!--폼시작-->                                                                
                    <td bgcolor="#F9F9F9" class="11px_txt_b" align="center" height="50">         
                    	파일명(CSV파일)<br/>                                                         
                     CSV Sample : <a href="sample_csv?${_csrf.parameterName}=${_csrf.token}">(Sample download)</a>    
                    <input type="file" name="file" size="50" maxlength="50" required>               
                    </td>                                                                        
                  </tr>                                                                          
                  <tr>                                                                           
                    <td bgcolor="#F9F9F9" class="11px_txt_b" align="center" height="50">
                  		<div style="float:right"><input type="submit" value="등록" class="red big btn" id="spring_loading"></div>
                    </td>
                  </tr>                                                                          
                </table>
            </form>                                                                              
            </td>                                                                                
          </tr>                                                                                  
          <tr>                                                                                   
            <td height="10"></td>                                                                
          </tr>                                                                                  
          <tr>          
          <td id="line1"></td>                                                                 
          </tr>                                                                                  
        </table>                                                                                 
    </div>                                                                                       
    </td>                                                                                        
  </tr>
</table>
</body>
</html>