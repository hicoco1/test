<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
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
	
	$(".updateBtn").click(function(){
		var seq = $(this).parent().find(".seq").val();
		var city_code = $(this).parent().find(".city_code").val();
		var gu_code = $(this).parent().find(".gu_code").val();
		var dong_code = $(this).parent().find(".dong_code").val();
		
		$("#UpdateForm").find("input[name=seq]").val(seq);
		$("#UpdateForm").find("input[name=city_code]").val(city_code);
		$("#UpdateForm").find("input[name=gu_code]").val(gu_code);
		$("#UpdateForm").find("input[name=dong_code]").val(dong_code);
		
		$('#Updatepopup').bPopup();
	});
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var seq = $(this).parent().find(".seq").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			$("#mainForm").find("input[name=seq]").val(seq);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deleteheadoffice_dong").submit();	
		}
    });
	
	$("#act_insert").click(function(){
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
	});
	
	$("#act_update").click(function(){
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		
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

<form action="HeadOffice_dong" name="searchForm" id="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">본사 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				전국 동 코드 정보</font>
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
							<option value="1">시도</option>
							<option value="2">시군구</option>
							<option value="3">행정동명</option>
						</select>
						<input type="text" name="searchContent" value="${searchContent}"> 
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
					<th>시도</th>
					<th>시군구</th>
					<th>행정동명</th>
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
					<td>${data.city_code}</td>
					<td>${data.gu_code}</td>
					<td>${data.dong_code}</td>		
					<td>
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						
						<input type="hidden" class="seq" value="${data.seq }">
						<input type="hidden" class="city_code" value="${data.city_code }">
						<input type="hidden" class="gu_code" value="${data.gu_code }">
						<input type="hidden" class="dong_code" value="${data.dong_code }">
						
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
			<input type="hidden" name="seq" value="">
			<input type="hidden" name="city_code" value="">
			<input type="hidden" name="gu_code" value="">
			<input type="hidden" name="dong_code" value="">
	</form>
	
		<div id="Insertpopup" class="Pstyle">
			<span class="b-close">X</span>
			<div class="content">
		<form id="InsertForm" name="InsertForm" action="insertheadoffice_dong" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">전국 동 코드 정보 등록</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >시도 : </td>
						<td><input type="text" name="city_code" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td >시군구 : </td>
						<td><input type="text" name="gu_code" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td >행정동명 : </td>
						<td><input type="text" name="dong_code" value="" maxlength="50"></td>
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
		<form id="UpdateForm" name="UpdateForm" action="updateheadoffice_dong" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action">
				<table>
					<tr>
						<td id ="pop_header">전국 동 코드 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >시도 : </td>
						<td><input type="hidden" name="seq" value="">
						<input type="text" name="city_code" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td >시군구 : </td>
						<td><input type="text" name="gu_code" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td >행정동명 : </td>
						<td><input type="text" name="dong_code" value="" maxlength="50"></td>
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