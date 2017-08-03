<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>와따</title>
<script type="text/javascript">
	$(document).ready(function(){
		 $(window).load(function() {     
	          $('#loading').hide();   
	     }); 
	}); 
</script>
<style type="text/css">

</style>
</head>
<body>
<%--
<div id="loading"><img id="loading-image" src="resources/images/loading.gif" alt="Loading..." /></div>
--%>
	   <div class="main" style="width:1500px;overflow:hidden;fixed;">
      <div class="header">
         <tiles:insertAttribute name="header"></tiles:insertAttribute>
      </div>
      <div style="clear:both;"></div>
      <div style="width:100%;">
      <div style="float:left;width:14%;overflow:hidden;fixed;" id="left">
         <tiles:insertAttribute name="left"></tiles:insertAttribute>
      </div>
      <div style="float:left;width:80%;overflow:hidden;fixed; margin-top: 10px;" id="body">
         <tiles:insertAttribute name="body"></tiles:insertAttribute>
      </div>
      </div>
      <div style="clear:both;"></div>
      <div>
         <tiles:insertAttribute name="footer"></tiles:insertAttribute>
      </div>
   </div>
</body>
</html>