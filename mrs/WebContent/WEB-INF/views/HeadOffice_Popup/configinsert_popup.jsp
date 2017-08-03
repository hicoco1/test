<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="InsertForm" name="InsertForm" action="insertheadoffice_config" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">모 계좌 정보 등록</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
				
						<input type="hidden" name="h_http_ip_addr1" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" name="h_http_ip_addr2" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" name="h_http_ip_addr3" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" name="h_http_ip_addr4" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" name="h_http_ip_addr" value="">
						<input type="hidden" name="b_cs_address_web_link" value="" maxlength="200">
				<!-- 
					<tr>
						<td >본사웹접속IP : </td>
						<td>
						<input type="text" name="h_http_ip_addr1" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						.<input type="text" name="h_http_ip_addr2" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						.<input type="text" name="h_http_ip_addr3" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						.<input type="text" name="h_http_ip_addr4" value="" maxlength="3" size="4" style="ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" name="h_http_ip_addr" value="">
						</td>
					</tr>
					<tr>
						<td >주소페이지링크 : </td>
						<td><input type="text" name="b_cs_address_web_link" value="" maxlength="200"></td>
					</tr>
					 -->
					<tr>
						<td >모 계좌 은행 : </td>
						<td><input type="text" name="h_bank" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td >모 계좌 번호 : </td>
						<td><input type="text" name="h_account" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td >모 계좌 예금주 : </td>
						<td><input type="text" name="h_name" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td >모 계좌 관리코드 : </td>
						<td><input type="text" name="h_institution_code" value="" maxlength="20"></td>
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