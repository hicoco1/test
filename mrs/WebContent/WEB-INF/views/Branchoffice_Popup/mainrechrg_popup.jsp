<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script type="text/javascript">
$(".rechrgBtn").click(function(){
	var b_id = $(this).parent().find(".b_id").val();
	var b_balance = $(this).parent().find(".b_balance").val();
	
	$("#RechrgForm").find("input[name=b_id]").val(b_id);
	$("#RechrgForm").find("input[name=b_balance]").val(b_balance);
	
	$('#Rechrgpopup').bPopup();
});
</script>
<div id="Rechrgpopup" class="Pstyle">
		<span class="b-close">X</span>
		<div class="content">
			<form id="RechrgForm" name="RechrgForm" action="rechrgbranchoffice" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">지점 잔액 충전</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점 ID : </td>
						<td><input type="hidden" name="b_name" value="">
						<input type="hidden" name="username" value="">
						<input type="text" name="b_id" value="" style="border: none;" readonly="readonly"></td>
					</tr>
					<tr>
						<td >지점 잔액 : </td>
						<td>
						<input type="text" name="b_balance" value="" maxlength="10" style=" width:100px; ime-mode:disabled; border: none;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						</td>
					</tr>
					<tr>
						<td >충전 할 금액 : </td>
						<td><input type="text" name="b_balance_rechrg" value="" datetimeonly="true" maxlength="10" style=" width:100px; ime-mode:disabled;">
						</td>
					</tr>
					</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="충전" class="blue small btn" id="act_rechrg"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_rechrg"></td>
					</tr>
				</table>
				<input type="hidden" name="searchFlag" value="">
				<input type="hidden" name="searchContent" value="">
				<input type="hidden" name="pageNo" value="">
			</form>
		</div>
	</div>
	