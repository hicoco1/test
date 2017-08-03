<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(".detailBtn").click(function(){
	var idx = $(this).parent().find(".idx").val();
	var b_id = $(this).parent().find(".b_id").val();
	var b_name = $(this).parent().find(".b_name").val();
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
	
	if(san_flag == "") {
		san_flag = "";
	}else if(san_flag == "0") {
		san_flag = "산 아님";		
	}else {
		san_flag = "산";
	}
	
	$("#DetailForm").find("input[name=idx]").val(idx);
	$("#DetailForm").find("input[name=b_id]").val(b_id);
	$("#DetailForm").find("input[name=b_name]").val(b_name);
	$("#DetailForm").find("input[name=city_code]").val(city_code);
	$("#DetailForm").find("input[name=gu_code]").val(gu_code);
	$("#DetailForm").find("input[name=town_code]").val(town_code);
	$("#DetailForm").find("input[name=dong_code]").val(dong_code);
	$("#DetailForm").find("input[name=li_code]").val(li_code);
	$("#DetailForm").find("input[name=san_flag]").val(san_flag);
	$("#DetailForm").find("input[name=ji_bonbun]").val(ji_bonbun);
	$("#DetailForm").find("input[name=ji_bubun]").val(ji_bubun);
	$("#DetailForm").find("input[name=building_name]").val(building_name);
	$("#DetailForm").find("input[name=building_dongho]").val(building_dongho);
	$("#DetailForm").find("input[name=road_codenum]").val(road_codenum);
	$("#DetailForm").find("input[name=road_code]").val(road_code);
	$("#DetailForm").find("input[name=road_bonbun]").val(road_bonbun);
	$("#DetailForm").find("input[name=road_bubun]").val(road_bubun);
	$("#DetailForm").find("input[name=full_addr]").val(full_addr);
	$("#DetailForm").find("input[name=full_addr_road]").val(full_addr_road);
	$("#DetailForm").find("input[name=location_x]").val(location_x);
	$("#DetailForm").find("input[name=location_y]").val(location_y);
	
	$('#Detailpopup').bPopup();
});
</script>
<div id="Detailpopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="DetailForm" name="DetailForm" action="detailbranchoffice_addr" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table>
					<tr>
						<td id ="pop_header">지점 주소 정보 상세보기</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점 ID : </td>
						<td><input type="hidden" name="idx" value="">
						<input type="text" name="b_id" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >지점 이름 : </td>
						<td><input type="text" name="b_name" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >시도 : </td>
						<td><input type="text" name="city_code" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >시군구 : </td>
						<td><input type="text" name="gu_code" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >읍면 : </td>
						<td><input type="text" name="town_code" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >행정동명 : </td>
						<td><input type="text" name="dong_code" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >리 : </td>
						<td><input type="text" name="li_code" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td>산 여부 :</td>
						<td> 
							<input type="text" name="san_flag" value="" maxlength="5" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td >지번 본번 : </td>
						<td><input type="text" name="ji_bonbun" value="" maxlength="5" readonly="readonly"></td>
					</tr>
					<tr>
						<td >지번 부번 : </td>
						<td><input type="text" name="ji_bubun" value="" maxlength="5" readonly="readonly"></td>
					</tr>
					<tr>
						<td >아파트/건물명 : </td>
						<td><input type="text" name="building_name" value="" maxlength="50" readonly="readonly"></td>
					</tr>
					<tr>
						<td >동/호수 : </td>
						<td><input type="text" name="building_dongho" value="" maxlength="5" readonly="readonly"></td>
					</tr>
					<tr>
						<td >도로명 코드 : </td>
						<td><input type="text" name="road_codenum" value="" maxlength="15" readonly="readonly"></td>
					</tr>
					<tr>
						<td >도로명 : </td>
						<td><input type="text" name="road_code" value="" maxlength="50" readonly="readonly"></td>
					</tr>
					<tr>
						<td >도로명 건물 본번 : </td>
						<td><input type="text" name="road_bonbun" value="" maxlength="15" readonly="readonly"></td>
					</tr>
					<tr>
						<td >도로명 건물 부번 : </td>
						<td><input type="text" name="road_bubun" value="" maxlength="50" readonly="readonly"></td>
					</tr>
					</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="닫기" class="white small btn" id="act_cancel_detail"></td>
					</tr>
				</table>
		</form>
	</div>
</div>