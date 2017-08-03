<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(".updateBtn").click(function(){
	
	var h_http_ip_addr = $(this).parent().find(".h_http_ip_addr").val();
	var h_http_ip_addr2 = h_http_ip_addr.split('.');
	
	$("#UpdateForm").find("input[name=h_http_ip_addr1]").val(h_http_ip_addr2[0]);
	$("#UpdateForm").find("input[name=h_http_ip_addr2]").val(h_http_ip_addr2[1]);
	$("#UpdateForm").find("input[name=h_http_ip_addr3]").val(h_http_ip_addr2[2]);
	$("#UpdateForm").find("input[name=h_http_ip_addr4]").val(h_http_ip_addr2[3]);
	
	var b_sequence = $(this).parent().find(".b_sequence").val();
	//var h_http_ip_addr = $(this).parent().find(".h_http_ip_addr").val();
	var b_cs_address_web_link = $(this).parent().find(".b_cs_address_web_link").val();
	var h_bank = $(this).parent().find(".h_bank").val();
	var h_account = $(this).parent().find(".h_account").val();
	var h_name = $(this).parent().find(".h_name").val();
	var h_institution_code = $(this).parent().find(".h_institution_code").val();
	
	$("#UpdateForm").find("input[name=b_sequence]").val(b_sequence);
	//$("#UpdateForm").find("input[name=h_http_ip_addr]").val(h_http_ip_addr);
	$("#UpdateForm").find("input[name=b_cs_address_web_link]").val(b_cs_address_web_link);
	$("#UpdateForm").find("input[name=h_bank]").val(h_bank);
	$("#UpdateForm").find("input[name=h_account]").val(h_account);
	$("#UpdateForm").find("input[name=h_name]").val(h_name);
	$("#UpdateForm").find("input[name=h_institution_code]").val(h_institution_code);
	
	$('#Updatepopup').bPopup();
});
</script>
<div id="Updatepopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="UpdateForm" name="UpdateForm" action="updateheadoffice_config" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action">
				<table>
					<tr>
						<td id ="pop_header">모 계좌 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">	
					<input type="hidden" name="b_sequence" value="" readonly="readonly" style="border: none;">
					<input type="hidden" name="h_http_ip_addr1" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
					<input type="hidden" name="h_http_ip_addr2" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
					<input type="hidden" name="h_http_ip_addr3" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
					<input type="hidden" name="h_http_ip_addr4" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
					<input type="hidden" name="b_cs_address_web_link" value="" maxlength="200">
				<!-- 
					<tr>
						<td >B_SEQUENCE : </td>
						<td><input type="text" name="b_sequence" value="" readonly="readonly" style="border: none;"></td>
					</tr>
					<tr>
						<td>본사웹접속IP : </td>
						<td>
						<input type="text" name="h_http_ip_addr1" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						.<input type="text" name="h_http_ip_addr2" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						.<input type="text" name="h_http_ip_addr3" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						.<input type="text" name="h_http_ip_addr4" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" name="h_http_ip_addr" value="" >
						</td>
					</tr>
					<tr>
						<td>주소관리웹링크 : </td>
						<td><input type="text" name="b_cs_address_web_link" value="" maxlength="200"></td>
					</tr>
					 -->
					<tr>
						<td>모 계좌 은행 : </td>
						<td><input type="text" name="h_bank" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>모 계좌 계좌번호: </td>
						<td><input type="text" name="h_account" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>모 계좌 예금주: </td>
						<td><input type="text" name="h_name" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>모 계좌 관리코드: </td>
						<td><input type="text" name="h_institution_code" value="" maxlength="20"></td>
					</tr>
					</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="수정" class="blue small btn" id="act_update"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_up"></td>
					</tr>
				</table>
					</form>
			</div>
</div>