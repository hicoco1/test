<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="InsertForm" name="InsertForm" action="insertheadoffice_addr" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">전국 주소 정보 등록</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >시도 : </td>
						<td><input type="hidden" name="location_x" value="" maxlength="20" style=" width:300px;">
						<input type="hidden" name="location_y" value="" maxlength="20" style=" width:300px;">
						<input type="text" name="city_code" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >시군구 : </td>
						<td><input type="text" name="gu_code" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >읍면 : </td>
						<td><input type="text" name="town_code" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >행정동명 : </td>
						<td><input type="text" name="dong_code" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >리 : </td>
						<td><input type="text" name="li_code" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td>산 여부 :</td>
						<td> 
							<select name="san_flag">
								<option value="" selected>선택</option>
								<option value="0">산 아님</option>
								<option value="1">산</option>
							</select>
						</td>
					</tr>
					<tr>
						<td >지번 본번 : </td>
						<td><input type="text" name="ji_bonbun" value="" maxlength="5" style="width:300px; ime-mode:disabled;"  onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td >지번 부번 : </td>
						<td><input type="text" name="ji_bubun" value="" maxlength="5" style=" width:300px; ime-mode:disabled;"  onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td >아파트/건물명 : </td>
						<td><input type="text" name="building_name" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >동/호수 : </td>
						<td><input type="text" name="building_dongho" value="" maxlength="5" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >도로명 코드 : </td>
						<td><input type="text" name="road_codenum" value="" maxlength="15" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >도로명 : </td>
						<td><input type="text" name="road_code" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >도로명 건물 본번 : </td>
						<td><input type="text" name="road_bonbun" value="" maxlength="15" style=" width:300px; ime-mode:disabled;"  onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td >도로명 건물 부번 : </td>
						<td><input type="text" name="road_bubun" value="" maxlength="50" style=" width:300px; ime-mode:disabled;"  onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						<input type="hidden" name="full_addr" value="" maxlength="50">
						<input type="hidden" name="full_addr_road" value="" maxlength="50">
						</td>
						
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
