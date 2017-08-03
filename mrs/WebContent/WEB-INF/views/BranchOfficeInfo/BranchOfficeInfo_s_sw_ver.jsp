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
			var store_sw_version = $(this).parent().find(".store_sw_version").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			$("#mainForm").find("input[name=store_sw_version]").val(store_sw_version);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deletebranchofficeinfo_s_sw_ver").submit();	
		}
    });
	
	$(".applyBtn").click(function(){
		if(confirm("적용 하시겠습니까?")){
			var version = $(this).parent().find(".version").val();
			var up_date = $(this).parent().find(".up_date").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			$("#mainForm").find("input[name=store_sw_version]").val(version);
			$("#mainForm").find("input[name=store_sw_update]").val(up_date);
			$("#mainForm").find("input[name=action]").val("APPLY");
			$("#mainForm").attr("action","applybranchofficeinfo_s_sw_ver").submit();	
		}
    });
	
	
	$(".updateBtn").click(function(){
		var store_sw_update = $(this).parent().find(".store_sw_update").val();
		var store_sw_url = $(this).parent().find(".store_sw_url").val();
		var store_sw_version = $(this).parent().find(".store_sw_version").val();
		var store_sw_version2 = store_sw_version.split('.');
		
		$("#UpdateForm").find("input[name=store_sw_update]").val(store_sw_update);
		$("#UpdateForm").find("input[name=store_sw_url]").val(store_sw_url);
		$("#UpdateForm").find("input[name=store_sw_version1]").val(store_sw_version2[0]);
		$("#UpdateForm").find("input[name=store_sw_version2]").val(store_sw_version2[1]);
		$("#UpdateForm").find("input[name=store_sw_version3]").val(store_sw_version2[2]);
		$("#UpdateForm").find("input[name=store_sw_version4]").val(store_sw_version2[3]);
		
		$('#Updatepopup').bPopup();
	});
	
	$("#act_insert").click(function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		today = yyyy+mm+dd;
		
		var store_sw_url = $("#InsertForm").find("input[name=store_sw_url]").val();
		var store_sw_version1 = $("#InsertForm").find("input[name=store_sw_version1]").val();
		var store_sw_version2 = $("#InsertForm").find("input[name=store_sw_version2]").val();
		var store_sw_version3 = $("#InsertForm").find("input[name=store_sw_version3]").val();
		var store_sw_version4 = $("#InsertForm").find("input[name=store_sw_version4]").val();
		
		if(store_sw_version1 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#InsertForm").find("input[name=store_sw_version1]").focus();
			return false;
		}
		
		if(store_sw_version2 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#InsertForm").find("input[name=store_sw_version2]").focus();
			return false;
		}
		
		if(store_sw_version3 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#InsertForm").find("input[name=store_sw_version3]").focus();
			return false;
		}
		
		if(store_sw_version4 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#InsertForm").find("input[name=store_sw_version4]").focus();
			return false;
		}
		
		var store_sw_version = store_sw_version1+"."+store_sw_version2+"."+store_sw_version3+"."+store_sw_version4;
		$("#InsertForm").find("input[name=store_sw_version]").val(store_sw_version);
		$("#InsertForm").find("input[name=store_sw_update]").val(today);
		
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
		
	});
	
	$("#act_update").click(function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		today = yyyy+mm+dd;
		
		$("#UpdateForm").find("input[name=store_sw_update_org]").val($("#UpdateForm").find("input[name=store_sw_update]").val());
		$("#UpdateForm").find("input[name=store_sw_update]").val(today);
		
		var store_sw_url = $("#UpdateForm").find("input[name=store_sw_url]").val();
		var store_sw_version1 = $("#UpdateForm").find("input[name=store_sw_version1]").val();
		var store_sw_version2 = $("#UpdateForm").find("input[name=store_sw_version2]").val();
		var store_sw_version3 = $("#UpdateForm").find("input[name=store_sw_version3]").val();
		var store_sw_version4 = $("#UpdateForm").find("input[name=store_sw_version4]").val();
		var store_sw_version = store_sw_version1+"."+store_sw_version2+"."+store_sw_version3+"."+store_sw_version4;
		var store_sw_memo = $("#store_sw_memo_org").val().replace("\n", " ");
		
		if($("#UpdateForm").find("input[name=store_sw_version_org]").val() != store_sw_version) {
			if($("#UpdateForm").find("input[name=uploadfile]").val() == '') {
				alert("첨부파일을 선택해 주세요.");
				return false;
			}
		}
		
		if(store_sw_version1 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#UpdateForm").find("input[name=store_sw_version1]").focus();
			return false;
		}
		
		if(store_sw_version2 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#UpdateForm").find("input[name=store_sw_version2]").focus();
			return false;
		}
		
		if(store_sw_version3 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#UpdateForm").find("input[name=store_sw_version3]").focus();
			return false;
		}
		
		if(store_sw_version4 == '') {
			alert("업소 프로그램 버전을 입력해주세요.");
			$("#UpdateForm").find("input[name=store_sw_version4]").focus();
			return false;
		}
		
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		
		$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
		$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
		$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
		$("#UpdateForm").find("input[name=store_sw_memo]").val(store_sw_memo);
		$("#UpdateForm").find("input[name=store_sw_version]").val(store_sw_version);
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
	});
});



</script>

</head>
<body>	

<form action="BranchOfficeInfo_s_sw_ver" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">환경정보 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				업소 CS S/W 관리</font>
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
							<option value="1">S/W 버전</option>
							<option value="2">업데이트 날짜</option>
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
					<col width="15%">
					<col width="15%">
					<col width="*%">
					<col width="4%">	
				</colgroup>
				<tr>
					<th>No</th>
					<th>S/W 버전</th>
					<th>업데이트 날짜</th>
					<th>S/W URL</th>
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
					<td>${status.count}</td>
					<td>${data.store_sw_version}</td>
					<td>${data.store_sw_update}</td>	
					<td>${data.store_sw_url}</td>
					<td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
						<input type="button" value="수정" class="updateBtn white small btn">
						<!-- input type="button" value="삭제" class="deleteBtn blue small bt -->
						</sec:authorize>
						
						<input type="hidden" class="store_sw_version" value="${data.store_sw_version }">
						<input type="hidden" class="store_sw_update" value="${data.store_sw_update }">
						<input type="hidden" class="store_sw_url" value="${data.store_sw_url }">
					</td>			
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<!-- div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></d -->
			</sec:authorize><br/>
		</div>
		
	<div id="mainFrame">
			<div align="center"><font id="font_little">업소 CS S/W 적용 이력 및 메모</font></div>
			<div><font id="font_little">Total: ${his_totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
					<col width="4%">
					<col width="15%">
					<col width="15%">
					<col width="*%">
					<col width="4%">
				</colgroup>
				<tr>
					<th>No</th>
					<th>S/W 버전</th>
					<th>업데이트 날짜</th>
					<th>메모</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${his_totalCount < 1 }">
				<tr>
					<td colspan="10" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${his_totalCount > 0 }">
				<c:forEach var="his_data" items="${his_list }" varStatus="status">
				
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*10)+status.count-10}</td>
					<td>${his_data.version}</td>
					<td>${his_data.up_date}</td>	
					<td>${his_data.memo}</td>
					<td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
						<input type="button" value="적용" class="applyBtn white small btn">
						</sec:authorize>
						<input type="hidden" class="version" value="${his_data.version }">
						<input type="hidden" class="up_date" value="${his_data.up_date }">
					</td>	
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<!-- div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></d -->
			</sec:authorize>
		</div>
	
	
	<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="store_sw_version" value="">
			<input type="hidden" name="store_sw_update" value="">
			<input type="hidden" name="store_sw_url" value="">
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="pageNo" value="">
	</form>
	
	
	<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
	<form id="InsertForm" name="InsertForm" action="insertbranchofficeinfo_s_sw_ver" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action"/>
	<table>
		<tr>
			<td id ="pop_header">업소 프로그램 정보 등록</td>
		</tr>
	</table>
	<hr color="#87CEFA" />
	<table id ="pop_layout">
		<tr>
			<td ><div style="width:100%; height:50px; overflow:auto">업소 프로그램 버전 : </div></td>
			<td>
			<div style="width:100%; height:50px; overflow:auto">
				<table id ="store">
					<c:forEach var="data2" items="${list }" varStatus="status">
						${data2.store_sw_version}<br />
					</c:forEach>
						<input type="hidden" name="store_sw_update" value="" maxlength="8" size="5">
				</table>
			</div>
			</td>
		</tr>
		<tr>
			<td >등록 할 업소 프로그램 버전: </td>
			<td><input type="text" name="store_sw_version1" value="" maxlength="8" size="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
			.<input type="text" name="store_sw_version2" value="" maxlength="8" size="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
			.<input type="text" name="store_sw_version3" value="" maxlength="2" size="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
			.<input type="text" name="store_sw_version4" value="" maxlength="2" size="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
			<input type="hidden" name="store_sw_version" value="" maxlength="8" size="5">
			</td>
		</tr>
		<tr>
			<td >S/W URL : </td>
			<td><input type="text" name="store_sw_url" value="" maxlength="200" size="50"></td>
		</tr>
		
		<tr>
			<td>첨부파일: </td>
			<td><input type="file" name="fileData" id="fileData" required="required"></td>
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
			<form id="UpdateForm" name="UpdateForm" action="updatebranchofficeinfo_s_sw_ver" method="POST" enctype="multipart/form-data">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">업소 프로그램 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
				<tr>
				<td><div style="width:100%; height:50px; overflow:auto">업소 프로그램 버전 : </div></td>
				<td>
					<div style="width:100%; height:50px; overflow:auto">
					<table id ="store">
					<c:forEach var="data2" items="${list }" varStatus="status">
						${data2.store_sw_version}<br />
						<input type="hidden" name="store_sw_version_org" value="${data2.store_sw_version}" maxlength="8" size="5">
					</c:forEach>
						<input type="hidden" name="store_sw_update" value="" maxlength="8" size="5">
				</table>
				</div>
				</td>
			</tr>
			<tr>
				<td >등록 할 업소 프로그램 버전: </td>
				<td><input type="text" name="store_sw_version1" value="" maxlength="8" size="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
				.<input type="text" name="store_sw_version2" value="" maxlength="8" size="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
				.<input type="text" name="store_sw_version3" value="" maxlength="2" size="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
				.<input type="text" name="store_sw_version4" value="" maxlength="2" size="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
				<input type="hidden" name="store_sw_version" value="" maxlength="8" size="5"></td>
			</tr>
			<tr>
				<td >S/W URL : </td>
				<td><input type="text" name="store_sw_url" value="" maxlength="200" size="50" readonly="readonly" style="border:none;"></td>
			</tr>
			<tr>
				<td>첨부파일: </td>
				<td><input type="file" name="uploadfile"></td>
			</tr>
			<tr>
				<td >메모 : </td>
				<td><textarea name="store_sw_memo_org" style="overflow=auto" rows="7" cols="60" id="store_sw_memo_org" maxlength="200"></textarea>
				<input type="hidden" name="store_sw_memo" value=""></td>
			</tr>
				</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="수정" class="blue small btn" id="act_update"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_up"></td>
					</tr>
				</table>
					<input type="hidden" name="store_sw_update_org" value="">
					<input type="hidden" name="searchFlag" value="">
					<input type="hidden" name="searchContent" value="">
					<input type="hidden" name="pageNo" value="">
			</form>
		</div>
	</div>
</body>
</html>
