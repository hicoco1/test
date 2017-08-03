<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>

$(document).ready(function(){
	if("${searchFlag_date}" != null && "${searchFlag_date}" != '') $("select[name=searchFlag_date]").val("${searchFlag_date}").attr("selected","selected");
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	if("${start_date}" != null && "${start_date}" != '')$("select[name=start_date]").val("${start_date}").attr("selected","selected");
	if("${end_date}" != null && "${end_date}" != '')$("select[name=end_date]").val("${end_date}").attr("selected","selected");
	//if("${start_time}" != null && "${start_time}" != '')$("select[name=start_time]").val("${start_time}").attr("selected","selected");
	//if("${end_time}" != null && "${end_time}" != '')$("select[name=end_time]").val("${end_time}").attr("selected","selected");
	
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
	
	if("${searchFlag_date}" == 1) {
		$("#searchForm").find("input[name=start_date]").val("${start_date}");
		$("#searchForm").find("input[name=end_date]").val("${end_date}");
	}else if("${searchFlag_date}" == 2) {
		$("#searchForm").find("input[name=start_date]").val("${start_date}");
		$("#searchForm").find("input[name=end_date]").val("${end_date}");
		$(".start_time").hide();
        $(".end_time").hide();
	}else {
		$("#searchForm").find("input[name=start_date]").val(today);
		$("#searchForm").find("input[name=end_date]").val(today);
	}
	
	$("#searchBtn").click(function(){
		//var target = document.getElementById("start_time");
		//var target2 = document.getElementById("end_time");
		var start_date = new String($("#searchForm").find("input[name=start_date]").val());
		var end_date = new String($("#searchForm").find("input[name=end_date]").val());
		
		$("#searchForm").find("input[name=start_date]").val(start_date);
		//$("#searchForm").find("select[name=start_time]").val(target.options[target.selectedIndex].text).attr("selected","selected");
		//$("#searchForm").find("select[name=end_time]").val(target2.options[target2.selectedIndex].text).attr("selected","selected");
		$("#searchForm").find("input[name=end_date]").val(end_date);
		/*
		else if($("#searchForm").find("select[name=searchFlag_date]").val() == 3) {
			var hour = $("#searchForm").find("input[name=hour]").val(start_date.substring(0, 6) + "," + end_date.substring(0, 6));
		}else if($("#searchForm").find("select[name=searchFlag_date]").val() == 4) {
			var hour = $("#searchForm").find("input[name=hour]").val(start_date.substring(0, 4) + "," + end_date.substring(0, 4));
		}
		*/
    	$("#searchForm").submit();
    });
	
	 $("select[name=searchFlag_date]").change(function() {
         var selValue = $(this).val();
         if (selValue == "1") {
        	 //$(".monstart_cal").hide();
             //$(".monend_cal").hide();
             $("#contract_sdate").show();
        	 $("#contract_edate").show();
             $(".start_time").show();
             $(".end_time").show();
         }
         else {
         }
     });
	 
	 $("select[name=searchFlag_date]").change(function() {
         var selValue = $(this).val();
         if (selValue == "2") {
        	 $(".start_time").hide();
             $(".end_time").hide();
             $("#contract_sdate").show();
        	 $("#contract_edate").show();
         }
         else {
         }
     });
	 
	 /*
	 $("select[name=searchFlag_date]").change(function() {
         var selValue = $(this).val();
         if (selValue == "3") {
        	 $("#contract_sdate").hide();
        	 $("#contract_edate").hide();
             $(".monstart_cal").show();
             $(".monend_cal").show();
         }
         else {
        	 $(".monstart_cal").hide();
             $(".monend_cal").hide();
         }
     });
	 
	 $("select[name=searchFlag_date]").change(function() {
         var selValue = $(this).val();
         if (selValue == "4") {
        	 $("#contract_sdate").hide();
        	 $("#contract_edate").hide();
             $(".yearstart_cal").show();
        	 $(".yearend_cal").show();
         }
         else {
        	 $(".yearstart_cal").hide();
        	 $(".yearend_cal").hide();
         }
     });
	 */
});
</script>

</head>
<body>	
<form action="Statistics_store" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="hour"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">통계
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				업소별 통계</font>
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
						<%-- 
						<span class="start_time">
							<select name="start_time" id="start_time">
							<script>
								for(i=0; i<24; i++) {
									var hour = '';
									var min  = ':00';
									if((Math.ceil(i)) < 10 ) {
										hour = '0'+(Math.floor(i));
									}else{
										hour = (Math.floor(i));
									}
							
										document.write('<option value='+hour+'>'+hour+'</option>');
									}
							</script>
							</select>
						</span>
						--%>
						~ <input type="text" name="end_date" id="contract_edate" value="" class="readonly" size="10">
						<%--
						<span class="end_time">
							<select name='end_time' id="end_time">
							<script>
								for(i=0; i<24; i++) {
									var hour = '';
									var min  = ':00';
									if((Math.ceil(i)) < 10 ) {
										hour = '0'+(Math.floor(i));
									}else{
										hour = (Math.floor(i));
									}
							
										document.write('<option value='+hour+'>'+hour+'</option>');
									}
							</script>
							</select>
						</span>
						 --%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="searchFlag">
							<option value="2">지점이름</option>
							<option value="1">지점ID</option>
							<option value="3">업소명</option>
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
	<%--
		<div id="mainFrame" style="overflow:scroll; width:100%; height:400px; white-space:nowrap;">
	--%>
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
					<col>
					<col>
				</colgroup>
				<tr>
					<th>
						<c:choose>
							<c:when test="${searchFlag_date == 1}">일자</c:when>
							<c:when test="${searchFlag_date == 2}">일자</c:when>
							<c:otherwise>일자</c:otherwise>
						</c:choose>
					</th>
					<th>지점ID(이름)</th>
					<th>업소명</th>
					<th>전체</th>
					<th>성공</th>
					<th>실패</th>
					<th>카드건수</th>
					<th>주문금액</th>
					<th>배달금액</th>
				</tr>
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="9" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }">
				<tr class="datalist" style="cursor:pointer">
					<td>
						<fmt:parseDate value="${data.order_date}" var="dateFmt" pattern="yyyyMMdd"/>
     					<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd"/>
					</td>
					<td>${data.b_id}(${data.b_name})</td>
					<td>${data.s_name}</td>
					<td><fmt:formatNumber value="${data.total_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.succ_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.fail_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.card_payment_count}" type="number"/></td>
					<td><fmt:formatNumber value="${data.total_purchase_price}" type="number"/></td>
					<td><fmt:formatNumber value="${data.call_amount}" type="number"/></td>
				</tr>
				</c:forEach>
				
				<c:forEach var="data_all" items="${list_all }">
				<tr class="datalist" style="cursor:pointer; color: red; font-weight: bold;">
					<td colspan="3">합계</td>
					<td><fmt:formatNumber value="${data_all.total_cnt}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.succ_cnt}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.fail_cnt}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.card_payment_count_all}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.total_purchase_price_all}" type="number"/></td>
					<td><fmt:formatNumber value="${data_all.call_amount_all}" type="number"/></td>	
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