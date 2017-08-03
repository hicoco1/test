<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>
$(document).ready(function(){

	//makeWeekSelectOptions();
	var date = new Date();
	var year = new String(date.getFullYear());
	var month =  new String(date.getMonth()+1);
	var date =  new String(date.getDate());
	<%--
	if(month.length == 1) {
		var today = year + "0" + month + date;
	}else if(date.length == 1) {
		var today = year + month + "0" + date;
	}else if(month.length == 1 && date.length == 1) {
		var today = year + "0" + month + "0" + date;
	}else {
		var today = year + month + date;
	}
	--%>
	
	if(month.length == 1 && date.length == 1) {
		var today = year + "0" + month + "0" + date;
	}else if(month.length == 1 && date.length != 1) {
		var today = year + "0" + month  + date;
	}else if(month.length != 1 && date.length == 1) {
		var today = year + month  + "0" + date;
	}else {
		var today = year + month + date;
	}
	

	
	if("${up_date_start}" == null || "${up_date_start}" == "") {
		$("#searchForm").find("input[name=up_date_start]").val(today);
	}else {
		$("#searchForm").find("input[name=up_date_start]").val("${up_date_start}");
	}
	
	if("${up_date_end}" == null || "${up_date_end}" == "") {
		$("#searchForm").find("input[name=up_date_end]").val(today);
	}else {
		$("#searchForm").find("input[name=up_date_end]").val("${up_date_end}");
	}
	
	
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	$('input:radio[name=pay_type]:input[value=${pay_type}]').attr("checked", true);
	
	$("#searchBtn").click(function(){
		var up_date_start = $("#searchForm").find("input[name=up_date_start]").val();
		var up_date_end = $("#searchForm").find("input[name=up_date_end]").val();
		if(up_date_start > up_date_end) {
			alert("시작 일자가 종료일자보다 작을 수 없습니다.");
			return;
		}
		
    	$("#searchForm").submit();
    });
});
</script>

</head>
<body>	
<form action="His_main" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="hour"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">충전 이력
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				업소 충전 이력</font>
			<hr color="#ff0059" />
			<table id="searchTable" style="background-color: #b8e2fc; margin-top: 20px;">
				<colgroup>
					<col width="1%">	
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td>
						</td>
					<td><br />
					<input TYPE="IMAGE" src="resources/images/search_btn.PNG" width="15px" height="15px"  align="absmiddle">
					검색&nbsp; :&nbsp; 
						<input type="text" name="up_date_start" id="contract_sdate" value="" class="readonly">
						~ <input type="text" name="up_date_end" id="contract_edate" value="" class="readonly"><br /><br />
						입출금 구분&nbsp; :&nbsp; <input type="radio" name="pay_type" value="">전체&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pay_type" value="1">입금&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pay_type" value="2">출금&nbsp;&nbsp;&nbsp;
						<br /><br />
						<select name="searchFlag">
							<option value="3">지점이름</option>
							<option value="1">지점ID</option>
							<option value="4">업소이름</option>
							<option value="2">업소ID</option>
						</select>
						<input type="text" name="searchContent" value="${searchContent}"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="검색" class="blue small btn" id="searchBtn">
						<br /><br />
					</td>				
					<td></td>
				</tr>	
			</table>
		</div>
		<input type="hidden" name="pageNo" id="pageNo" value="1">
		<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
	</form>


	<form id="mainForm" name="mainForm" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div><font id="font_little">Total: ${totalCount }</font></div>
		<div id="mainFrame" width:1000px; height:450px; white-space:nowrap;">
			<table id="mainTable">
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<tr>
					<th>No</th>
					<th>지점ID(이름)</th>
					<th>업소ID(이름)</th>
					<th>충전일자</th>
					<th>입출금<br/>구분</th>
					<th>메모</th>
					<th>충전 전 잔액</th>
					<th>충전금액</th>
					<th>충전 후 잔액</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="9" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*20)+status.count-20}</td>
					<td>${data.b_id}(${data.b_name})</td>
					<td>${data.dest_id}(${data.dest_name})</td>
					<td><fmt:parseDate value="${data.up_date}" var="dateFmt" pattern="yyyyMMddHHmmss"/>
     				<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<c:choose>
							<c:when test="${data.pay_type == 1}">입금</c:when>
							<c:when test="${data.pay_type == 2}">출금</c:when>
							<c:otherwise>${data.pay_type}</c:otherwise>
						</c:choose>
					</td>
					<td>${data.detail}</td>
					<td><fmt:formatNumber value="${data.before_balance}" type="number"/></td>
					<td><fmt:formatNumber value="${data.amount}" type="number"/></td>
					<td><fmt:formatNumber value="${data.after_balance}" type="number"/></td>
				</tr>
				</c:forEach>
				
				<c:forEach var="data_all" items="${list_all }">
					<tr class="datalist" style="cursor:pointer; color: red; font-weight: bold;">
						<td colspan="6">합계</td>
						<td><fmt:formatNumber value="${data_all.before_balance_all}" type="number"/></td>
						<td><fmt:formatNumber value="${data_all.amount_all}" type="number"/></td>
						<td><fmt:formatNumber value="${data_all.after_balance_all}" type="number"/></td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
	</form>
</body>
</html>