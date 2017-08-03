<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(".detailBtn").click(function(){
	var b_id = $(this).parent().find(".b_id").val();
	var s_id = $(this).parent().find(".s_id").val();
	var r_id = $(this).parent().find(".r_id").val();
	var r_name = $(this).parent().find(".r_name").val();
	var r_type = $(this).parent().find(".r_type").val();
	var r_tel1 = $(this).parent().find(".r_tel1").val();
	var max_call = $(this).parent().find(".max_call").val();
	var login_id = $(this).parent().find(".login_id").val();
	var r_address = $(this).parent().find(".r_address").val();
	var contract_sdate = $(this).parent().find(".contract_sdate").val();
	var contract_edate = $(this).parent().find(".contract_edate").val();
	var active_status = $(this).parent().find(".active_status").val();
	var card_keep_flag = $(this).parent().find(".card_keep_flag").val();
	var card_id = $(this).parent().find(".card_id").val();
	var callcatch_penalty_value = $(this).parent().find(".callcatch_penalty_value").val();
	var service_start_date = $(this).parent().find(".service_start_date").val();
		
	if(r_type == "") {
		r_type = "";
	}else if(r_type == "0") {
		r_type = "지점 소속 기사";			
	}else if(r_type == "1") {
		r_type = "업소 소속 기사";
	}
	
	if(max_call == "") {
		max_call = "";
	}else if(max_call == "0") {
		max_call = "0개";
	}else if(max_call == "5") {
		max_call = "5개";
	}else {
		max_call = "10개";
	}
	
	if(active_status == "") {
		active_status = "";
	}else if(active_status == "0") {
		active_status = "정상";
	}else if(active_status == "1") {
		active_status = "해지";
	}else if(active_status == "2") {
		active_status = "중지(가상계좌 잔액부족)";
	}else if(active_status == "3") {
		active_status = "중지(지각)";
	}else if(active_status == "4") {
		active_status = "중지(콜거부)";
	}else if(active_status == "5") {
		active_status = "중지(불성실)";
	}else {
		active_status = "청약(가등록)";
	}
	
	
	$("#DetailForm").find("input[name=b_id]").val(b_id);
	$("#DetailForm").find("input[name=s_id]").val(s_id);
	$("#DetailForm").find("input[name=r_id]").val(r_id);
	$("#DetailForm").find("input[name=r_name]").val(r_name);
	$("#DetailForm").find("input[name=r_type]").val(r_type);
	$("#DetailForm").find("input[name=r_tel1]").val(r_tel1);
	$("#DetailForm").find("input[name=max_call]").val(max_call);
	$("#DetailForm").find("input[name=login_id]").val(login_id);
	$("#DetailForm").find("input[name=r_address]").val(r_address);
	$("#DetailForm").find("input[name=contract_sdate]").val(contract_sdate);
	$("#DetailForm").find("input[name=contract_edate]").val(contract_edate);
	$("#DetailForm").find("input[name=active_status]").val(active_status);
	$("#DetailForm").find("input[name=card_keep_flag]").val(card_keep_flag);
	$("#DetailForm").find("input[name=card_id]").val(card_id);
	$("#DetailForm").find("input[name=callcatch_penalty_value]").val(callcatch_penalty_value);
	$("#DetailForm").find("input[name=service_start_date]").val(service_start_date);
	
	$('#Detailpopup').bPopup();
});
</script>
<div id="Detailpopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
		<form id="DetailForm" name="DetailForm" action="detailbranchoffice_rider" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table>
					<tr>
						<td id ="pop_header">기사 정보 상세보기</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >소속 지점 ID : </td>
						<td><input type="text" name="b_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >기사이름 : </td>
						<td><input type="text" name="r_name" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >배달기사 소속 유형 : </td>
						<td><input type="text" name="r_type" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>사업자번호 :</td>
						<td><input type="text" name="r_crn" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >전화번호 : </td>
						<td><input type="text" name="r_tel1" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >동시배달가능콜수: </td>
						<td><input type="text" name="max_call" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >로그인 계정 : </td>
						<td><input type="text" name="login_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>주소 :</td>
						<td><input type="text" name="b_address" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >계약 시작 일자 : </td>
						<td><input type="text" name="contract_sdate" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >계약 종료 일자 : </td>
						<td><input type="text" name="contract_edate" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >청약상태 : </td>
						<td><input type="text" name="active_status" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >카드 단말기 보유 : </td>
						<td><input type="text" name="card_keep_flags" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >카드 결제기 ID : </td>
						<td><input type="text" name="card_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >콜잡기 Delay : </td>
						<td><input type="text" name="callcatch_penalty_value" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >서비스 시작 일자 : </td>
						<td><input type="text" name="service_start_date" value="" readonly="readonly" style="border:none;"></td>
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
