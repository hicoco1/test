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
<form action="His_cardfail" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="hour"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">이력
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				카드 결제 실패 이력</font>
			<hr color="#ff0059" />
			<table id="searchTable" style="background-color: #b8e2fc; margin-top: 20px;">
				<colgroup>
					<col width="1%">	
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td></td>
					<td><br />
					<input TYPE="IMAGE" src="resources/images/search_btn.PNG" width="15px" height="15px"  align="absmiddle">
					검색&nbsp; :&nbsp; 
						<input type="text" name="up_date_start" id="contract_sdate" value="" class="readonly">
						~ <input type="text" name="up_date_end" id="contract_edate" value="" class="readonly">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="searchFlag">
							<option value="1">지점이름</option>
							<option value="2">지점ID</option>
							<option value="3">업소이름</option>
							<option value="4">업소ID</option>
							<option value="5">배달기사이름</option>
							<option value="6">배달기사ID</option>
							<option value="7">배달대행요청ID(운송장번호)</option>
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
					<col>
					<col>
				</colgroup>
				<tr>
					<th>No</th>
					<th>지점ID<br/>(이름)</th>
					<th>가맹점ID<br/>(이름)</th>
					<th>배달기사ID<br/>(이름)</th>
					<th>배달대행요청ID<br/>운송장번호</th>
					<th>결제요청일자</th>
					<th>결제<br/>입출금<br/>구분</th>
					<th>신용카드<br/>결제승인번호</th>
					<th>에러메시지</th>
					<th>물품구매금액</th>
					<th>카드결제금액</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="11" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*20)+status.count-20}</td>
					<td>${data.b_id}<br/>(${data.b_name})</td>
					<td>${data.s_id}<br/>(${data.s_name})</td>
					<td>${data.r_id}<br/>(${data.r_name})</td>
					<td>${data.order_id}</td>
					<td><fmt:parseDate value="${data.payment_time}" var="dateFmt" pattern="yyyyMMddHHmmss"/>
     				<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${data.card_payment_flag}</td>
					<td>${data.credit_accept_number}</td>
					<td>${data.error_msg}</td>
					<td><fmt:formatNumber value="${data.purchase_price}" type="number"/></td>
					<td><fmt:formatNumber value="${data.card_payment_price}" type="number"/></td>
				</tr>
				</c:forEach>
				
				<c:forEach var="data_all" items="${list_all }">
					<tr class="datalist" style="cursor:pointer; color: red; font-weight: bold;">
						<td colspan="9">합계</td>
						<td><fmt:formatNumber value="${data_all.purchase_price_all}" type="number"/></td>
						<td><fmt:formatNumber value="${data_all.card_payment_price_all}" type="number"/></td>
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