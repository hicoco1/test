<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>

$(document).ready(function(){
	var date = new Date();
	var year = new String(date.getFullYear());
	var month =  new String(date.getMonth()+1);
	var date =  new String(date.getDate());
	
	
	if(month.length == 1 && date.length == 1) {
		var today = year + "0" + month + "0" + date;
	}else if(month.length == 1 && date.length != 1) {
		var today = year + "0" + month  + date;
	}else if(month.length != 1 && date.length == 1) {
		var today = year + month  + "0" + date;
	}else {
		var today = year + month + date;
	}
	
	
	
	if("${calculate_sdate}" == null || "${calculate_sdate}" == "") {
		$("#searchForm").find("input[name=calculate_sdate]").val(today);
	}else {
		$("#searchForm").find("input[name=calculate_sdate]").val("${calculate_sdate}");
	}
	
	if("${calculate_edate}" == null || "${calculate_edate}" == "") {
		$("#searchForm").find("input[name=calculate_edate]").val(today);
	}else {
		$("#searchForm").find("input[name=calculate_edate]").val("${calculate_edate}");
	}
	
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	
	$("#searchBtn").click(function(){
		var sdate = $("#searchForm").find("input[name=calculate_sdate]").val();
		var edate = $("#searchForm").find("input[name=calculate_edate]").val();
		
		if(sdate > edate) {
			alert("시작 일자가 종료일자보다 작을 수 없습니다.");
			return;
		}
		
    	$("#searchForm").submit();
    });
});
</script>

</head>
<body>	
<form action="Calc_sol" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="hour"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">정산
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				솔루션사 정산</font>
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
						<input type="text" name="calculate_sdate" id="contract_sdate" value="" class="readonly">
						~ <input type="text" name="calculate_edate" id="contract_edate" value="" class="readonly">
						
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="button" value="검색" class="blue small btn" id="searchBtn">
					<br /><br /></td>				
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
		<div id="mainFrame" style="width:100%;">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
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
					<th>정산시작일</th>
					<th>정산종료일</th>
					<th>총건수</th>
					<th>성공건수</th>
					<th>실패건수</th>
					<th>건당기준금액</th>
					<th>정산금액</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="12" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }">
				<tr class="datalist" style="cursor:pointer">
					<td><fmt:parseDate value="${data.calculate_sdate}" var="dateFmt" pattern="yyyyMMddHHmmss"/>
     				<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:parseDate value="${data.calculate_edate}" var="dateFmt" pattern="yyyyMMddHHmmss"/>
     				<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatNumber value="${data.total_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.succ_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.fail_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.calculate_base_amount}" type="number"/></td>
					<td><fmt:formatNumber value="${data.calculate_amount}" type="number"/></td>
				</tr>
				</c:forEach>
				
				<c:forEach var="data_all" items="${list_all }">
					<tr class="datalist" style="cursor:pointer; color: red; font-weight: bold;">
						<td colspan="2">합계</td>
						<td><fmt:formatNumber value="${data_all.total_cnt}" type="number"/></td>
						<td><fmt:formatNumber value="${data_all.succ_cnt}" type="number"/></td>
						<td><fmt:formatNumber value="${data_all.fail_cnt}" type="number"/></td>
						<td><fmt:formatNumber value="${data_all.calculate_base_amount_all}" type="number"/></td>
						<td><fmt:formatNumber value="${data_all.calculate_amount_all}" type="number"/></td>
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