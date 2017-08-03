<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>
$(document).ready(function(){
	$(".deleteBtn").click(function(){
		if(confirm("사용중인 가상계좌 은행에서 삭제 하시겠습니까?")){
			var str = ""; 
			var chksize = $("#mainForm :checked").size();
			var bank_id = $("#mainForm").find("input[name=bank_id]").val();
			
			for(var a = 0; a < chksize; a++) {
				$("#mainForm").find("input[name=action]").val("DELETE");
				$("#mainForm").attr("action","deletebank").submit();	
			}
		}
    });
	
	$(".updateBtn").click(function(){
		var bank_id = $("#mainForm").find("input[name=bank_id]").val();
		alert(bank_id);
		if(bank_id == null) {
			alert("a");
		}else {
		if(confirm("사용중인 가상계좌 은행에 추가 하시겠습니까?")){
		var str = ""; 
		var chksize = $("#mainForm :checked").size();
		
		for(var a = 0; a < chksize; a++) {
			$("#mainForm").find("input[name=action]").val("UPDATE");
			$("#mainForm").attr("action","updatebank").submit();	
		}
	}
	}
	});
	
});
</script>
</head>
<body>	
<sec:authorize access="hasRole('ROLE_ADMIN')">
<form action="HeadOffice_bank" name="searchForm" id="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">본사 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				가상계좌 은행 관리</font>
			<hr color="#ff0059" />
		</div>
	</form>
	<form id="mainForm" name="mainForm" method="get">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden"   name="action"/>
		<div id="mainFrame">
			<div style="margin-bottom: 30px;">
				<font id="font_little">Total: ${totalCount }</font>
			</div>
			<div style="float: left; width: 40%;">
			<table id="mainTable" style="width: 100%;">
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="6" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<tr>
					<td style="background-color: #87CEFA;"><font id="font">가상계좌 은행 목록</font></td>
				</tr>
				<tr>
				<td style="text-align:left;">
					<c:forEach var="data" items="${list }" varStatus="status">
						<c:if test="${data.bank_use == 0}">
							<input type="checkbox" name="bank_id" value="${data.bank_id }">
							&nbsp;&nbsp;
							<font id="font_little">${data.v_bank }</font><br />
						</c:if>
					</c:forEach>
				</td>
				<c:forEach var="data" items="${list }" varStatus="status">
					<input type="hidden" class="bank_id" value="${data.bank_id }">
					<input type="hidden" class="v_bank" value="${data.v_bank }">
					<input type="hidden" class="bank_use" value="${data.bank_use }">
				</c:forEach>
				</tr>	
			</table>
			</div>
			
			<div style="float: left; width: 19%; display:table-cell;">
			<table style="width: 125px; height:50%; margin-left: 80px;">
				<tr>
					<td>
						<input TYPE="IMAGE" src="resources/images/add.PNG" width="80px" height="60px" align="absmiddle" class="updateBtn"><br /><br /><br /><br />
						<input TYPE="IMAGE" src="resources/images/del.PNG" width="80px" height="60px" align="absmiddle" class="deleteBtn">
						<%--
						<input type="button" value="추가" class="updateBtn white small btn"><br /><br />
						<input type="button" value="삭제" class="deleteBtn red small btn">
						 --%>
					</td>
				</tr>
			</table>
			</div>
			 
			<div style="float: right; width: 40%;">
				<table id="mainTable" style="width: 100%;">
					<tr>
						<td style="background-color: #87CEFA;"><font id="font">사용중인 가상계좌 은행 목록</font></td>
					</tr>
					<tr>
						<td style="text-align:left;">
							<c:forEach var="data" items="${list }" varStatus="status">
								<c:if test="${data.bank_use == 1}">
									<input type="checkbox" name="bank_id" value="${data.bank_id }">
									&nbsp;&nbsp;
									<font id="font_little">${data.v_bank }</font><br />
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
	</div>
	</form>
</sec:authorize>
</body>
</html>