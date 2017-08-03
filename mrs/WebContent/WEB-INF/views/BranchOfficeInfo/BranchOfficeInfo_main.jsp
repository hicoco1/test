<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>
$(document).ready(function(){
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var idx = $(this).parent().find(".idx").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			$("#mainForm").find("input[name=idx]").val(idx);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deletebranchofficeinfo").submit();	
		}
    });
	
	$(".updateBtn").click(function(){
		var printer_id = $(this).parent().find(".printer_id").val();
		var printer_detail = $(this).parent().find(".printer_detail").val();
		
		$("#UpdateForm").find("input[name=printer_id]").val(printer_id);
		$("#UpdateForm").find("input[name=printer_detail]").val(printer_detail);
		
		$('#Updatepopup').bPopup();
	});
		
	$("#act_insert").click(function(){
		var idx = $("#InsertForm").find("input[name=idx]").val("${maxIdx_Printer}");
		var printer_id = $("#InsertForm").find("input[name=printer_id]").val();
		
		if(printer_id == '') {
			alert("프린터 단말기 ID를 입력해주세요.");
			$("#InsertForm").find("input[name=printer_id]").focus();
			return false;
		}
		
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
		
	});
	
	$("#act_update").click(function(){
		var idx = $("#UpdateForm").find("input[name=idx]").val("${maxIdx_Printer}");
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		var printer_id = $("#UpdateForm").find("input[name=printer_id]").val();
		
		if(printer_id == '') {
			alert("프린터 단말기 ID를 입력해주세요.");
			$("#UpdateForm").find("input[name=printer_id]").focus();
			return false;
		}

		$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
		$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
		$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
	});
});
</script>

</head>
<body>	

<form action="BranchOfficeInfo_main" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">환경정보 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				프린터 정보 관리</font>
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
					검색&nbsp; :&nbsp; 
						<select name="searchFlag">
							<option value="1">프린터 단말기 ID</option>
							<option value="2">제조사 및 기기 정보</option>
						</select>
						<input type="text" name="searchContent" value="${searchContent}" size="20"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	<input type="hidden" name="action"/>
		<div id="mainFrame">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
					<col width="4%">
					<col width="20%">
					<col width="*%">
					<col width="10%">	
				</colgroup>
				<tr>
					<th>No</th>
					<th>프린터 단말기 ID</th>
					<th>제조사 및 기기 정보</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="10" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*10)+status.count-10}</td>
					<td>${data.printer_id}</td>
					<td>${data.printer_detail}</td>	
					<td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						</sec:authorize>
						<input type="hidden" class="idx" value="${data.idx }">
						<input type="hidden" class="printer_id" value="${data.printer_id }">
						<input type="hidden" class="printer_detail" value="${data.printer_detail }">
					</td>			
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></div>
			</sec:authorize>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="idx" value="">
			<input type="hidden" name="printer_id" value="">
			<input type="hidden" name="printer_detail" value="">
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="pageNo" value="">
	</form>
	
	<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
	<form id="InsertForm" name="InsertForm" action="insertbranchofficeinfo" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action"/>
	<table>
		<tr>
			<td id ="pop_header">프린터 단말기 정보 등록</td>
		</tr>
	</table>
	<hr color="#87CEFA" />
	<table id ="pop_layout">
		<tr>
			<td >프린터 단말기 ID : </td>
			<td><input type="hidden" name="idx" value="">
			<input type="text" name="printer_id" value="" maxlength="20"></td>
		</tr>
		<tr>
			<td >제조사 및 기기 정보 : </td>
			<td><input type="text" name="printer_detail" value="" maxlength="100"></td>
		</tr>
		</table>
		<hr color="#87CEFA" />
		<table id ="pop_layout_btn">
		<tr>
			<td><input type="button" value="등록" class="blue small btn" id="act_insert"></td>
			<td><input type="button" value="취소" class="white small btn" id="act_cancel"></td>
		</tr>
	</table>
		</form>
	</div>
</div>

	<div id="Updatepopup" class="Pstyle">
		<span class="b-close">X</span>
		<div class="content">
			<form id="UpdateForm" name="UpdateForm" action="updatebranchofficeinfo" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">프린터 단말기 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >프린터 단말기 ID : </td>
						<td><input type="hidden" name="idx" value="">
						<input type="text" name="printer_id" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >제조사 및 기기 정보 : </td>
						<td><input type="text" name="printer_detail" value="" maxlength="100"></td>
					</tr>
				</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="수정" class="blue small btn" id="act_update"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_up"></td>
					</tr>
				</table>
				<input type="hidden" name="searchFlag" value="">
				<input type="hidden" name="searchContent" value="">
				<input type="hidden" name="pageNo" value="">
			</form>
		</div>
	</div>
	
		
		

</body>
</html>