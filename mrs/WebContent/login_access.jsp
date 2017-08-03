<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login</title>
<script type="text/javascript">
//alert("${CSRF_TOKEN}");
</script>
</head>
<link href='<c:url value="/resources/css/login.css"/>'  rel="stylesheet" type="text/css">
<body onload='document.f.j_username.focus();'>

<%--
	<c:if test="${not empty error}">
		<div class="error">
			로그인을 할 수 없습니다. 다시 시도해 주세요.<br /> 
			Reason: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
 --%>
	<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
	<div class="login_access" align="center">
		<table>
			<tr>
				<td><input type='text' name='login_id' size="25" id="login_id" tabindex='1'></td>
				<td rowspan="2">
				<input TYPE="IMAGE" src="resources/images/login_btn.png" name="submit" id="login_img" value="submit"  align="absmiddle" tabindex='3'></td>	
			</tr>
			<tr>
				<td><input type='password' name='login_passwd' size="25"  id="login_pw" tabindex='1' autocomplete="off"></td>
			</tr>
		</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</div>
	</form>
</body>
</html>