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
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	$('input:radio[name=enabled]:input[value=${enabled}]').attr("checked", true);
	
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var login_id = $(this).parent().find(".login_id").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			$("#mainForm").find("input[name=login_id]").val(login_id);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deleteheadoffice").submit();	
		}
    });
	
	$("#act_insert").click(function(){
		var email = $("#InsertForm").find("input[name=e_mail]").val();
		var pw = $("#InsertForm").find("input[name=login_passwd]").val();
		var id = $("#InsertForm").find("input[name=login_id]").val();
		
		if(email.length != 0) {
			var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(regex.test(email) === false) {
				alert("잘못된 이메일 형식입니다.");
				$("#InsertForm").find("input[name=e_mail]").focus();
		 	return false;
			}
		}
		if(id.length == 0){
			alert("아이디를 입력하세요.");
			$("#InsertForm").find("input[name=login_id]").focus();
			return false;
		}
		if(pw.length == 0){
			alert("비밀번호를 입력하세요.");
			$("#InsertForm").find("input[name=login_passwd]").focus();
			return false;
		}
		
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
	});
	
	$("#act_update").click(function(){
		var email = $("#UpdateForm").find("input[name=e_mail]").val();
		var id = $("#UpdateForm").find("input[name=login_id]").val();
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		
		if(email.length != 0) {
			var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if(regex.test(email) === false) {
				alert("잘못된 이메일 형식입니다.");
				$("#UpdateForm").find("input[name=e_mail]").focus();
		 		return false;
			} 
		}
		
		if(id.length == 0){
			alert("아이디를 입력하세요.");
			$("#UpdateForm").find("input[name=login_id]").focus();
			return false;
		}
		$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
		$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
		$("#UpdateForm").find("input[name=pageNo]").val("1");
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
	});
});
</script>
</head>
<body>	
<sec:authorize access="hasRole('ROLE_ADMIN')">
<form action="HeadOffice_main" name="searchForm" id="searchForm" method="POST">
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">본사 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				계정 관리</font>
			<hr color="#ff0059" />
			<table id="searchTable" style="background-color: #b8e2fc; margin-top: 20px;">
				<colgroup>
					<col width="1%">	
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td></td>
					<td><br /><input TYPE="IMAGE" src="resources/images/search_btn.PNG" width="15px" height="15px"  align="absmiddle">
						아이디&nbsp;:&nbsp;<input type="text" name="searchContent" value="${searchContent}"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						그룹&nbsp;:&nbsp;
						<select name="searchFlag">
							<option value="">전체</option>
							<option value="ROLE_ADMIN">관리자</option>
							<option value="ROLE_USER">운영자</option>
							<option value="ROLE_TEST">모니터</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						웹 접근 구분&nbsp;:&nbsp;
						<input type="radio" name="enabled" value="">전체&nbsp;&nbsp;&nbsp;
						<input type="radio" name="enabled" value="1">활성화&nbsp;&nbsp;&nbsp;
						<input type="radio" name="enabled" value="0">비활성화&nbsp;&nbsp;&nbsp;
						<input type="button" value="검색" class="blue small btn" id="searchBtn"><br /><br />
					</td>				
					<td></td>			
				</tr>	
			</table>
					<input type="hidden" name="pageNo" id="pageNo"   value="${pageno}">
					<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
					<input type="hidden" name="action"  id="action" value="">
		</div>

	</form>
	<form id="mainForm" name="mainForm" method="get">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden"   name="action"/>
		<div id="mainFrame">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
					<col width="8%">
					<col width="*%">
					<col width="20%">
					<col width="20%">	
					<col width="20%">			
				</colgroup>
				<tr>
					<th>No</th>
					<th>아이디</th>
					<th>웹 접근 구분</th>
					<th>그룹</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="6" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*10)+status.count-10}</td>
					<td>${data.login_id}</td>
					<td>
						<c:choose>
							<c:when test="${data.enabled == 1}">활성화</c:when>
							<c:otherwise>비활성화</c:otherwise>
						</c:choose>
						 
					</td>
					<td>
						<c:choose>
							<c:when test="${data.authority == 'ROLE_ADMIN'}">관리자</c:when>
							<c:when test="${data.authority == 'ROLE_USER'}">운영자</c:when>
							<c:otherwise>모니터</c:otherwise>
						</c:choose>
					</td>		
					<td>
						<input type="button" value="상세" class="detailBtn white small btn">
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						
						<input type="hidden" class="login_id" value="${data.login_id }">
						<input type="hidden" class="login_passwd" value="${data.login_passwd }">
						<input type="hidden" class="enabled" value="${data.enabled }">
						<input type="hidden" class="authority" value="${data.authority }">
						<input type="hidden" class="e_mail" value="${data.e_mail }">
						<input type="hidden" class="address" value="${data.address }">
						<input type="hidden" class="tel1" value="${data.tel1 }">
						<input type="hidden" class="tel2" value="${data.tel2 }">
						<input type="hidden" class="position" value="${data.position }">
						<input type="hidden" class="department" value="${data.department }">
					</td>			
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></div>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="login_id" value="">
			<input type="hidden" name="login_passwd" value="">
			<input type="hidden" name="enabled" value="">
			<input type="hidden" name="authority" value="">
			<input type="hidden" name="e_mail" value="">
			<input type="hidden" name="address" value="">
			<input type="hidden" name="tel1" value="">
			<input type="hidden" name="tel2" value="">
			<input type="hidden" name="position" value="">
			<input type="hidden" name="department" value="">
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="pageNo" value="">
			
	</form>
	
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/maininsert_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/mainupdate_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/maindetail_popup.jsp"%>
		</div>
		</sec:authorize>
</body>
</html>