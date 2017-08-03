<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(".updateBtn").click(function(){
	var seq = $(this).parent().find(".seq").val();
	var city_code = $(this).parent().find(".city_code").val();
	var gu_code = $(this).parent().find(".gu_code").val();
	var town_code = $(this).parent().find(".town_code").val();
	var dong_code = $(this).parent().find(".dong_code").val();
	var li_code = $(this).parent().find(".li_code").val();
	var san_flag = $(this).parent().find(".san_flag").val();
	var ji_bonbun = $(this).parent().find(".ji_bonbun").val();
	var ji_bubun = $(this).parent().find(".ji_bubun").val();
	var building_name = $(this).parent().find(".building_name").val();
	var building_dongho = $(this).parent().find(".building_dongho").val();
	var road_codenum = $(this).parent().find(".road_codenum").val();
	var road_code = $(this).parent().find(".road_code").val();
	var road_bonbun = $(this).parent().find(".road_bonbun").val();
	var road_bubun = $(this).parent().find(".road_bubun").val();
	var full_addr = $(this).parent().find(".full_addr").val();
	var full_addr_road = $(this).parent().find(".full_addr_road").val();
	var location_x = $(this).parent().find(".location_x").val();
	var location_y = $(this).parent().find(".location_y").val();
	
	$("#UpdateForm").find("input[name=seq]").val(seq);
	$("#UpdateForm").find("input[name=city_code]").val(city_code);
	$("#UpdateForm").find("input[name=gu_code]").val(gu_code);
	$("#UpdateForm").find("input[name=town_code]").val(town_code);
	$("#UpdateForm").find("input[name=dong_code]").val(dong_code);
	$("#UpdateForm").find("input[name=li_code]").val(li_code);
	if(san_flag != null && san_flag != '') $("select[name=san_flag]").val(san_flag).attr("selected","selected");
	$("#UpdateForm").find("input[name=ji_bonbun]").val(ji_bonbun);
	$("#UpdateForm").find("input[name=ji_bubun]").val(ji_bubun);
	$("#UpdateForm").find("input[name=building_name]").val(building_name);
	$("#UpdateForm").find("input[name=building_dongho]").val(building_dongho);
	$("#UpdateForm").find("input[name=road_codenum]").val(road_codenum);
	$("#UpdateForm").find("input[name=road_code]").val(road_codenum);
	$("#UpdateForm").find("input[name=road_bonbun]").val(road_bonbun);
	$("#UpdateForm").find("input[name=road_bubun]").val(road_bubun);
	$("#UpdateForm").find("input[name=full_addr]").val(full_addr);
	$("#UpdateForm").find("input[name=full_addr_road]").val(full_addr_road);
	$("#UpdateForm").find("input[name=location_x]").val(location_x);
	$("#UpdateForm").find("input[name=location_y]").val(location_y);
	
	$('#Updatepopup').bPopup();
});
</script>
<div id="Updatepopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="UpdateForm" name="UpdateForm" action="updateheadoffice_addr" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action">
				<table>
					<tr>
						<td id ="pop_header">전국 주소 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >시도 : </td>
						<td><input type="hidden" name="seq" value="">
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
								<option value="">선택</option>
								<option value="0">산 아님</option>
								<option value="1">산</option>
							</select>
						</td>
					</tr>
					<tr>
						<td >지번 본번 : </td>
						<td><input type="text" name="ji_bonbun" value="" maxlength="5" style=" width:300px; ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td >지번 부번 : </td>
						<td><input type="text" name="ji_bubun" value="" maxlength="5" style=" width:300px; ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
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
						<td><input type="text" name="road_bonbun" value="" maxlength="15" style=" width:300px; ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td >도로명 건물 부번 : </td>
						<td><input type="text" name="road_bubun" value="" maxlength="50" style=" width:300px; ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="수정" class="blue small btn" id="act_update"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_up"></td>
					</tr>
				</table>
				<input type="hidden" name="searchFlag" value="">
				<input type="hidden" name="searchContent" value="">
				<input type="hidden" name="pageNo" value="">
			</form>
	</div>
</div>