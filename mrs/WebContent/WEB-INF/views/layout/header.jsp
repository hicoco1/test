<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("${sessionScope.manager_level}");
	});
</script>
<div class="header" style="height: 150px;">
<%--
	<table style="background-color: #97E9FF;">
--%>
	<table>
		<tr>
			<td>
			<img id="weblogo" align="absmiddle" alt="" src="resources/images/weblogo5.JPG" width="200px" height="150px">
			
			</td>
			<td style="padding-left: 10px">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="HeadOffice_main"><span id="font">본사 관리</span></a>
				<img id="divider" align="absmiddle" alt="" src="resources/images/divider2.png" style="padding: 20px; width: 3px; height: 15px;">
			</sec:authorize>
			</td>
			
			<td>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_TEST')">
				<a href="BranchOffice_main"><span id="font">지점 관리</span></a>
				<img id="divider" align="absmiddle" alt="" src="resources/images/divider2.png" style="padding: 20px; width: 3px; height: 15px;">
			</sec:authorize>
			</td>
			
			<td>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_TEST')">
				<a href="BranchOfficeInfo_sw_ver"><span id="font">환경정보 관리</span></a>
				<img id="divider" align="absmiddle" alt="" src="resources/images/divider2.png" style="padding: 20px; width: 3px; height: 15px;">
			</sec:authorize>
			</td>
			
			<td>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_TEST')">
				<a href="Statistics_main"><span id="font">통계</span></a>
				<img id="divider" align="absmiddle" alt="" src="resources/images/divider2.png" style="padding: 20px; width: 3px; height: 15px;">
			</sec:authorize>
			</td>
			
			<td>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_TEST')">
				<a href="Calc_main"><span id="font">정산</span></a>
				<img id="divider" align="absmiddle" alt="" src="resources/images/divider2.png" style="padding: 20px; width: 3px; height: 15px;">
			</sec:authorize>
			</td>
			
			<td>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER', 'ROLE_TEST')">
				<a href="His_branch"><span id="font">이력</span></a>
			</sec:authorize>
			</td>
			
			
		</tr>
	</table>
</div>
