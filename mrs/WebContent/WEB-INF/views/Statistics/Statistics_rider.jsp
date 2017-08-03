<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>

$(document).ready(function(){
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	$('input:radio[name=enabled]:input[value=${enabled}]').attr("checked", true);
	var date = new Date();
	var year = new String(date.getFullYear());
	var month =  new String(date.getMonth()+1);
	var date =  new String(date.getDate());
	/*
	if(month.length == 1) {
		var today = year + "0" + month + date;
	}else if(date.length == 1) {
		var today = year + month + "0" + date;
	}else if(month.length == 1 && date.length == 1) {
		var today = year + "0" + month + "0" + date;
	}else {
		var today = year + month + date;
	}
	*/
	
	if(month.length == 1 && date.length == 1) {
		var today = year + "0" + month + "0" + date;
	}else if(month.length == 1 && date.length != 1) {
		var today = year + "0" + month  + date;
	}else if(month.length != 1 && date.length == 1) {
		var today = year + month  + "0" + date;
	}else {
		var today = year + month + date;
	}
	
	if("${start_date}" != null){
		$("#searchForm").find("input[name=start_date]").val("${start_date}".substring(0,8));
	}
	if("${end_date}" != null){
		$("#searchForm").find("input[name=end_date]").val("${end_date}");
	}
	if("${start_date}" == null || "${start_date}" == ''){
		$("#searchForm").find("input[name=start_date]").val(today);
		$("#searchForm").find("input[name=end_date]").val(today);
	}
	
	$("#searchBtn").click(function(){
		var start_date = new String($("#searchForm").find("input[name=start_date]").val());
		var end_date = new String($("#searchForm").find("input[name=end_date]").val());
		var order_date =start_date.substring(0, 8);
		var order_date2 =end_date.substring(0, 8);
		$("#searchForm").find("input[name=start_date]").val(order_date);
		$("#searchForm").find("input[name=end_date]").val(order_date2);
		$("#searchForm").find("input[name=order_date]").val(order_date);
    	$("#searchForm").submit();
    });

});
</script>

</head>
<body>	

<form action="Statistics_rider" id="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="order_date" value=""/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">통계
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				기사별 통계</font>
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
					<select name="searchFlag_date">
						<option value="2">일별</option>
						</select>
					<input type="text" name="start_date" id="contract_sdate" value="" class="readonly" size="10">
					~ <input type="text" name="end_date" id="contract_edate" value="" class="readonly" size="10">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="searchFlag">
							<option value="2">지점이름</option>
							<option value="1">지점ID</option>
							<option value="3">기사명</option>
						</select>
						<input type="text" name="searchContent" value="${searchContent}"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="검색" class="blue small btn" id="searchBtn"><br /><br />
					</td>				
					<td></td>
				</tr>	
			</table>
		</div>
			<input type="hidden" name="pageNo" id="pageNo"   value="${pageno}">
			<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
			<input type="hidden" name="action"  id="action" value="">
	</form>
	<form id="mainForm" name="mainForm" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="mainFrame">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable" style="width: 100%">
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<tr>
					<th>일자</th>
					<th>지점ID(이름)</th>
					<th>기사명</th>
					<th>전체</th>
					<th>성공</th>
					<th>실패</th>
					<th>배달금액</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="7" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }">
				<tr class="datalist" style="cursor:pointer">
					<td><fmt:parseDate value="${data.order_date}" var="dateFmt" pattern="yyyyMMdd"/>
     				<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd"/></td>
					<td>${data.b_id}(${data.b_name})</td>
					<td>${data.r_name}</td>
					<td><fmt:formatNumber value="${data.total_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.succ_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.fail_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.call_amount}" type="number"/></td>
				</tr>
				</c:forEach>
				<c:forEach var="data_all" items="${list_all }">
				<tr class="datalist" style="cursor:pointer; color: red; font-weight: bold;">
					<td colspan="3">합계</td>
					<td><fmt:formatNumber value="${data_all.total_cnt}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.succ_cnt}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.fail_cnt}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.call_amount_cnt}" type="number"/></td>
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
		<input type="hidden" name="order_date" value="">
		<input type="hidden" name="b_id" value="">
		<input type="hidden" name="total_rider_count" value="">
		<input type="hidden" name="active_rider_count" value="">
		<input type="hidden" name="closed_rider_count" value="">
		<input type="hidden" name="money_lack_rider_count" value="">
		<input type="hidden" name="late_rider_count" value="">
		<input type="hidden" name="call_reject_rider_count" value="">
		<input type="hidden" name="bad_rider_count" value="">
		<input type="hidden" name="prov_ing_rider_count" value="">
		<input type="hidden" name="penalty_rider_count" value="">
		<input type="hidden" name="card_keep_rider_count" value="">
	</form>
</body>
</html>