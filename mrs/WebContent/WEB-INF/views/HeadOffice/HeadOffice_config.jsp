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
			var b_sequence = $(this).parent().find(".b_sequence").val();
			$("#mainForm").find("input[name=b_sequence]").val(b_sequence);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deleteheadoffice_config").submit();	
		}
    });
	
	$("#act_insert").click(function(){
		
		var h_http_ip_addr1 = $("#InsertForm").find("input[name=h_http_ip_addr1]").val();
		var h_http_ip_addr2 = $("#InsertForm").find("input[name=h_http_ip_addr2]").val();
		var h_http_ip_addr3 = $("#InsertForm").find("input[name=h_http_ip_addr3]").val();
		var h_http_ip_addr4 = $("#InsertForm").find("input[name=h_http_ip_addr4]").val();
		var h_http_ip_addr = h_http_ip_addr1+"."+h_http_ip_addr2+"."+h_http_ip_addr3+"."+h_http_ip_addr4;
		
		$("#InsertForm").find("input[name=h_http_ip_addr]").val(h_http_ip_addr);
		
		var h_bank = $("#InsertForm").find("input[name=h_bank]").val();
		var b_sequence = $("#InsertForm").find("input[name=b_sequence]").val();
		var b_cs_address_web_link = $("#InsertForm").find("input[name=b_cs_address_web_link]").val();
		var h_bank = $("#InsertForm").find("input[name=h_bank]").val();
		var h_account = $("#InsertForm").find("input[name=h_account]").val();
		var h_name = $("#InsertForm").find("input[name=h_name]").val();
		var h_institution_code = $("#InsertForm").find("input[name=h_institution_code]").val();
		
		if(h_http_ip_addr1 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#InsertForm").find("input[name=h_http_ip_addr1]").focus();
			return false;
		}
		
		if(h_http_ip_addr2 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#InsertForm").find("input[name=h_http_ip_addr2]").focus();
			return false;
		}
		
		if(h_http_ip_addr3 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#InsertForm").find("input[name=h_http_ip_addr3]").focus();
			return false;
		}
		
		if(h_http_ip_addr4 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#InsertForm").find("input[name=h_http_ip_addr4]").focus();
			return false;
		}
		
		if(b_cs_address_web_link == '') {
			alert("주소페이지링크를 입력해주세요.");
			$("#InsertForm").find("input[name=b_cs_address_web_link]").focus();
			return false;
		}
		
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
		
	});
	
	$("#act_update").click(function(){
		
		var h_http_ip_addr1 = $("#UpdateForm").find("input[name=h_http_ip_addr1]").val();
		var h_http_ip_addr2 = $("#UpdateForm").find("input[name=h_http_ip_addr2]").val();
		var h_http_ip_addr3 = $("#UpdateForm").find("input[name=h_http_ip_addr3]").val();
		var h_http_ip_addr4 = $("#UpdateForm").find("input[name=h_http_ip_addr4]").val();
		var h_http_ip_addr = h_http_ip_addr1+"."+h_http_ip_addr2+"."+h_http_ip_addr3+"."+h_http_ip_addr4;
		$("#UpdateForm").find("input[name=h_http_ip_addr]").val(h_http_ip_addr);
		
		var h_bank = $("#UpdateForm").find("input[name=h_bank]").val();
		var b_sequence = $("#UpdateForm").find("input[name=b_sequence]").val();
		var b_cs_address_web_link = $("#UpdateForm").find("input[name=b_cs_address_web_link]").val();
		var h_bank = $("#UpdateForm").find("input[name=h_bank]").val();
		var h_account = $("#UpdateForm").find("input[name=h_account]").val();
		var h_name = $("#UpdateForm").find("input[name=h_name]").val();
		var h_institution_code = $("#UpdateForm").find("input[name=h_institution_code]").val();
		/*
		if(h_http_ip_addr1 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#UpdateForm").find("input[name=h_http_ip_addr1]").focus();
			return false;
		}
		
		if(h_http_ip_addr2 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#UpdateForm").find("input[name=h_http_ip_addr2]").focus();
			return false;
		}
		
		if(h_http_ip_addr3 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#UpdateForm").find("input[name=h_http_ip_addr3]").focus();
			return false;
		}
		
		if(h_http_ip_addr4 == '') {
			alert("본사웹접속IP를 입력해주세요.");
			$("#UpdateForm").find("input[name=h_http_ip_addr4]").focus();
			return false;
		}
		
		if(b_cs_address_web_link == '') {
			alert("주소페이지링크를 입력해주세요.");
			$("#UpdateForm").find("input[name=b_cs_address_web_link]").focus();
			return false;
		}
		*/
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
		
	});
});
</script>
</head>
<body>	
<sec:authorize access="hasRole('ROLE_ADMIN')">
<form action="HeadOffice_config" name="searchForm" id="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">본사 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				모 계좌 은행 관리</font>
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
							<option value="1">모 계좌 은행</option>
							<option value="2">모 계좌 번호</option>
							<option value="3">모 계좌 예금주</option>
							<option value="4">모 계좌 관리코드</option>
						</select>
						<input type="text" name="searchContent" value="${searchContent}"> 
						<input type="button" value="검색" class="blue small btn" id="searchBtn"><br /><br />
					</td>				
					<td></td>			
				</tr>	
			</table>
						<input type="hidden" name="pageNo" id="pageNo"   value="1">
						<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
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
					<col width="15%">		
				</colgroup>
				<tr>
					<th>No</th>
					<th>모 계좌 은행</th>
					<th>모 계좌 번호</th>
					<th>모 계좌 예금주</th>
					<th>모 계좌 관리코드</th>
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
					<td>${data.h_bank}</td>
					<td>${data.h_account}</td>
					<td>${data.h_name}</td>
					<td>${data.h_institution_code}</td>
					<td>
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						
						<input type="hidden" class="b_sequence" value="${data.b_sequence }">
						<input type="hidden" class="h_http_ip_addr" value="${data.h_http_ip_addr }">
						<input type="hidden" class="b_cs_address_web_link" value="${data.b_cs_address_web_link }">
						<input type="hidden" class="h_bank" value="${data.h_bank }">
						<input type="hidden" class="h_account" value="${data.h_account }">
						<input type="hidden" class="h_name" value="${data.h_name }">
						<input type="hidden" class="h_institution_code" value="${data.h_institution_code }">
					</td>			
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<c:if test="${totalCount < 1 }">
			<div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></div>
			</c:if>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="b_sequence" value="">
			<input type="hidden" name="h_http_ip_addr" value="">
			<input type="hidden" name="b_cs_address_web_link" value="">
			<input type="hidden" name="h_bank" value="">
			<input type="hidden" name="h_account" value="">
			<input type="hidden" name="h_name" value="">
			<input type="hidden" name="h_institution_code" value="">
	</form>
	
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/configinsert_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/configupdate_popup.jsp"%>
		</div>
		</sec:authorize>
</body>
</html>