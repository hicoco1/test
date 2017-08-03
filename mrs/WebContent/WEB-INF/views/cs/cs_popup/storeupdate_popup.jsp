<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs_CS.jsp"%>
<script type="text/javascript">
$(".updateBtn").click(function(){
	var date = new Date();
	var year = new String(date.getFullYear());
	var month =  new String(date.getMonth()+1);
	var date =  new String(date.getDate());
	if(date.length == 1){
		var today = year + month + "0" + date;
	}else if(month.length == 1){
		var today = year + "0" + month  + date;
	}else {
		var today = year  + month +  date;
	}
	
	//var b_id = $(this).parent().find(".b_id").val();
	var b_id = $("#mainForm").find("input[id=b_id]").val();
	var b_name = $("#mainForm").find("input[id=b_name]").val();
	var s_id = $("#mainForm").find("input[id=s_id]").val();
	var s_crn = $("#mainForm").find("input[id=s_crn]").val();
	var s_name = $("#mainForm").find("input[id=s_name]").val();
	var s_addr1 = $("#mainForm").find("input[id=s_addr1]").val();
	var s_addr2 = $("#mainForm").find("input[id=s_addr2]").val();
	var location_x = $("#mainForm").find("input[id=location_x]").val();
	var location_y = $("#mainForm").find("input[id=location_y]").val();
	var s_tel1 = $("#mainForm").find("input[id=s_tel1]").val();
	var s_tel2 = $("#mainForm").find("input[id=s_tel2]").val();
	var login_id = $("#mainForm").find("input[id=login_id]").val();
	var login_passwd = $("#mainForm").find("input[id=login_passwd]").val();
	var active_status = $("#mainForm").find("input[id=active_status]").val();
	var cook_time = $("#mainForm").find("input[id=cook_time]").val();
	var terminal_type = $("#mainForm").find("input[id=terminal_type]").val();
	var cid_id = $("#mainForm").find("input[id=cid_id]").val();
	var cid_connect_status = $("#mainForm").find("input[id=cid_connect_status]").val();
	var cid_port = $("#mainForm").find("input[id=cid_port]").val();
	var printer_id = $("#mainForm").find("input[id=printer_id]").val();
	var printer_connect_status = $("#mainForm").find("input[id=printer_connect_status]").val();
	var printer_port = $("#mainForm").find("input[id=printer_port]").val();
	var monthly_fee = $("#mainForm").find("input[id=monthly_fee]").val();
	var basic_distance = $("#mainForm").find("input[id=basic_distance]").val();
	var basic_charge = $("#mainForm").find("input[id=basic_charge]").val();
	var add_distance = $("#mainForm").find("input[id=add_distance]").val();
	var add_charge = $("#mainForm").find("input[id=add_charge]").val();
	var service_type = $("#mainForm").find("input[id=service_type]").val();
	var charge_method = $("#mainForm").find("input[id=charge_method]").val();
	var s_balance = $("#mainForm").find("input[id=s_balance]").val();
	var rider_delay_duration = $("#mainForm").find("input[id=rider_delay_duration]").val();
	var batch_extra_amount = $("#mainForm").find("input[id=batch_extra_amount]").val();
	var last_recharge_amount = $("#mainForm").find("input[id=last_recharge_amount]").val();
	var last_recharge_date = $("#mainForm").find("input[id=last_recharge_date]").val();
	var charge_type = $("#mainForm").find("input[id=charge_type]").val();
	var charge_option = $("#mainForm").find("input[id=charge_option]").val();
	var credit_used_flag = $("#mainForm").find("input[id=credit_used_flag]").val();
	var credit_member_id = $("#mainForm").find("input[id=credit_member_id]").val();
	var noti_flag = $("#mainForm").find("input[id=noti_flag]").val();
	var noti_rider_assign = $("#mainForm").find("input[id=noti_rider_assign]").val();
	var noti_card_pay = $("#mainForm").find("input[id=noti_card_pay]").val();
	var open_time = $("#mainForm").find("input[id=open_time]").val();
	var close_time = $("#mainForm").find("input[id=close_time]").val();
	var monthly_order_count = $("#mainForm").find("input[id=monthly_order_count]").val();
	var daily_order_count = $("#mainForm").find("input[id=daily_order_count]").val();
	var cat_id = $("#mainForm").find("input[id=cat_id]").val();
	var van_id = $("#mainForm").find("input[id=van_id]").val();
	var v_bank = $("#mainForm").find("input[id=v_bank]").val();
	var v_account = $("#mainForm").find("input[id=v_account]").val();
	var s_representative = $("#mainForm").find("input[id=s_representative]").val();
	var contract_sdate = $("#mainForm").find("input[id=contract_sdate]").val();
	var contract_edate = $("#mainForm").find("input[id=contract_edate]").val();
	var service_start_date = $("#mainForm").find("input[id=service_start_date]").val();
	var update_date = $("#mainForm").find("input[id=update_date]").val();
	//var r_op_id = $(this).parent().find(".r_op_id").val();
	var u_op_id = $("#mainForm").find("input[id=u_op_id]").val();
	var store_statement = $("#mainForm").find("input[id=store_statement]").val();
	var kitchen_statement = $("#mainForm").find("input[id=kitchen_statement]").val();
	var customer_statement = $("#mainForm").find("input[id=customer_statement]").val();
	var store_type = $(this).parent().find(".store_type").val();
	
	if(open_time != null || open_time != '') {
		if(open_time.substring(0,2) >= 0 && open_time.substring(0,2) <= 9) {
			var openh = open_time.substring(1,2);
		}else {
			var openh = open_time.substring(0,2);
		}
		if(open_time.substring(2,4) == 00 || open_time.substring(2,4) == 05) {
			var openm = open_time.substring(3,4);
		}else {
			var openm = open_time.substring(2,4);
		}
	}
	
	if(close_time != null || close_time != '') {
		if(close_time.substring(0,2) >= 0 && close_time.substring(0,2) <= 9) {
			var closeh = close_time.substring(1,2);
		}else {
			var closeh = close_time.substring(0,2);
		}
		
		if(close_time.substring(2,4) == 00 || close_time.substring(2,4) == 05) {
			var closem = close_time.substring(3,4);
		}else {
			var closem = close_time.substring(2,4);
		}
	}
	
	if(v_bank == "한국은행") {
		v_bank2 = "001";
	}else if(v_bank == ("산업은행")) {
		v_bank2 = "002";
	}else if(v_bank == ("기업은행")) {
		v_bank2 = "003";
	}else if(v_bank == ("국민은행")) {
		v_bank2 = "004";
	}else if(v_bank == ("외환은행")) {
		v_bank2 = "005";
	}else if(v_bank == ("수협중앙회")) {
		v_bank2 = "007";
	}else if(v_bank == ("수출입은행")) {
		v_bank2 = "008";
	}else if(v_bank == ("농협중앙회")) {
		v_bank2 = "011";
	}else if(v_bank == ("단위 농축협")) {
		v_bank2 = "012";
	}else if(v_bank == ("우리은행")) {
		v_bank2 = "020";
	}else if(v_bank == ("SC은행")) {
		v_bank2 = "023";
	}else if(v_bank == ("한국씨티은행")) {
		v_bank2 = "027";
	}else if(v_bank == ("대구은행")) {
		v_bank2 = "031";
	}else if(v_bank == ("부산은행")) {
		v_bank2 = "032";
	}else if(v_bank == ("광주은행")) {
		v_bank2 = "034";
	}else if(v_bank == ("제주은행")) {
		v_bank2 = "035";
	}else if(v_bank == ("전북은행")) {
		v_bank2 = "037";
	}else if(v_bank == ("경남은행")) {
		v_bank2 = "039";
	}else if(v_bank == ("새마을금고중앙회")) {
		v_bank2 = "045";
	}else if(v_bank == ("신협중앙회")) {
		v_bank2 = "048";
	}else if(v_bank == ("상호저축은행")) {
		v_bank2 = "050";
	}else if(v_bank == ("산림조합중앙회")) {
		v_bank2 = "064";
	}else if(v_bank == ("우체국")) {
		v_bank2 = "071";
	}else if(v_bank == ("하나은행")) {
		v_bank2 = "081";
	}else if(v_bank == ("신한은행")) {
		v_bank2 = "088";
	}else {
		v_bank2 = v_bank;
	}
	$("#UpdateForm").find("input[name=b_id]").val(b_id);
	$("#UpdateForm").find("input[name=b_name]").val(b_name);
	$("#UpdateForm").find("input[name=s_id]").val(s_id);
	$("#UpdateForm").find("input[name=s_crn]").val(s_crn);
	$("#UpdateForm").find("input[name=s_name]").val(s_name);
	$("#UpdateForm").find("input[name=s_addr1]").val(s_addr1);
	$("#UpdateForm").find("input[name=s_addr2]").val(s_addr2);
	$("#UpdateForm").find("input[name=location_x]").val(location_x);
	$("#UpdateForm").find("input[name=location_y]").val(location_y);
	$("#UpdateForm").find("input[name=s_tel1]").val(s_tel1);
	$("#UpdateForm").find("input[name=s_tel2]").val(s_tel2);
	$("#UpdateForm").find("input[name=login_id]").val(login_id);
	$("#UpdateForm").find("input[name=login_passwd]").val("");
	if(active_status != null && active_status != '') $("select[name=active_status]").val(active_status).attr("selected","selected");
	$("#UpdateForm").find("input[name=cook_time]").val(cook_time);
	if(terminal_type != null && terminal_type != '') $("select[name=terminal_type]").val(terminal_type).attr("selected","selected");
	$("#UpdateForm").find("input[name=cid_id]").val(cid_id);
	if(cid_connect_status != null && cid_connect_status != '') $("select[name=cid_connect_status]").val(cid_connect_status).attr("selected","selected");
	if(cid_port != null && cid_port != '') $("select[name=cid_port]").val(cid_port).attr("selected","selected");
	$("#UpdateForm").find("input[name=printer_id]").val(printer_id);
	if(printer_connect_status != null && printer_connect_status != '') $("select[name=printer_connect_status]").val(printer_connect_status).attr("selected","selected");
	if(printer_port != null && printer_port != '') $("select[name=printer_port]").val(printer_port).attr("selected","selected");
	$("#UpdateForm").find("input[name=monthly_fee]").val(monthly_fee);
	$("#UpdateForm").find("input[name=basic_distance]").val(basic_distance);
	$("#UpdateForm").find("input[name=basic_charge]").val(basic_charge);
	$("#UpdateForm").find("input[name=add_distance]").val(add_distance);
	$("#UpdateForm").find("input[name=add_charge]").val(add_charge);
	if(service_type != null && service_type != '') $("select[name=service_type]").val(service_type).attr("selected","selected");
	if(charge_method != null && charge_method != '') $("select[name=charge_method]").val(charge_method).attr("selected","selected");
	$("#UpdateForm").find("input[name=s_balance]").val(s_balance);
	$("#UpdateForm").find("input[name=rider_delay_duration]").val(rider_delay_duration);
	$("#UpdateForm").find("input[name=batch_extra_amount]").val(batch_extra_amount);
	$("#UpdateForm").find("input[name=last_recharge_amount]").val(last_recharge_amount);
	$("#UpdateForm").find("input[name=last_recharge_date]").val(last_recharge_date);
	if(charge_type != null && charge_type != '') $("select[name=charge_type]").val(charge_type).attr("selected","selected");
	if(charge_option != null && charge_option != '') $("select[name=charge_option]").val(charge_option).attr("selected","selected");
	if(credit_used_flag != null && credit_used_flag != '') $("select[name=credit_used_flag]").val(credit_used_flag).attr("selected","selected");
	$("#UpdateForm").find("input[name=credit_member_id]").val(credit_member_id);
	if(noti_flag != null && noti_flag != '') $("select[name=noti_flag]").val(noti_flag).attr("selected","selected");
	if(noti_rider_assign != null && noti_rider_assign != '') $("select[name=noti_rider_assign]").val(noti_rider_assign).attr("selected","selected");
	if(noti_card_pay != null && noti_card_pay != '') $("select[name=noti_card_pay]").val(noti_card_pay).attr("selected","selected");
	if(open_time != null && open_time != '') $("select[name=open_time_h]").val(openh).attr("selected","selected");
	if(open_time != null && open_time != '') $("select[name=open_time_m]").val(openm).attr("selected","selected");
	if(close_time != null && close_time != '') $("select[name=close_time_h]").val(closeh).attr("selected","selected");
	if(close_time != null && close_time != '') $("select[name=close_time_m]").val(closem).attr("selected","selected");
	$("#UpdateForm").find("input[name=monthly_order_count]").val(monthly_order_count);
	$("#UpdateForm").find("input[name=daily_order_count]").val(daily_order_count);
	$("#UpdateForm").find("input[name=cat_id]").val(cat_id);
	$("#UpdateForm").find("input[name=van_id]").val(van_id);
	if(v_bank != null && v_bank != '') $("select[name=v_bank]").val(v_bank).attr("selected","selected");
	$("#UpdateForm").find("input[name=v_account]").val(v_account);
	$("#UpdateForm").find("input[name=s_representative]").val(s_representative);
	$("#UpdateForm").find("input[name=contract_sdate]").val(contract_sdate);
	$("#UpdateForm").find("input[name=contract_edate]").val(contract_edate);
	$("#UpdateForm").find("input[name=service_start_date]").val(service_start_date);
	$("#UpdateForm").find("input[name=update_date]").val(today);
	//$("#UpdateForm").find("input[name=r_op_id]").val(r_op_id);
	$("#UpdateForm").find("input[name=u_op_id]").val(u_op_id);
	if(store_statement != null && store_statement != '') $("select[name=store_statement]").val(store_statement).attr("selected","selected");
	if(kitchen_statement != null && kitchen_statement != '') $("select[name=kitchen_statement]").val(kitchen_statement).attr("selected","selected");
	if(customer_statement != null && customer_statement != '') $("select[name=customer_statement]").val(customer_statement).attr("selected","selected");
	if(store_type != null && store_type != '') $("select[name=store_type]").val(store_type).attr("selected","selected");
	
	$('#Updatepopup').bPopup();
});
</script>
<div id="Updatepopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
		<form id="UpdateForm" name="UpdateForm" action="updatebranchoffice_store_CS" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action" />
				<table>
					<tr>
						<td id ="pop_header">업소 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td rowspan="22">업소 기본 정보</td>
					</tr>
					<tr>
						<td >소속 지점 ID : </td>
						<td><input type="text" name="b_id" value="" maxlength="5" readonly="readonly" style="border: none;"></td>
					</tr>
					<tr>
						<td >소속 지점 이름 : </td>
						<td><input type="text" name="b_name" value="" maxlength="5" readonly="readonly" style="border: none;"></td>
					</tr>
					<tr>
						<td>대표자 이름 : </td>
						<td><input type="text" name="s_representative" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td >가맹점 이름 : </td>
						<td><input type="text" name="s_name" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td >가맹점 ID : </td>
						<td><input type="text" name="s_id" value="" maxlength="10" readonly="readonly" style="border: none;"></td>
					</tr>
					<tr>
						<td>가맹점 상태 :</td>
						<td> 
							<select name="active_status">
								<option value="">선택</option>
								<option value="0">정상</option>
								<option value="1">해지</option>
								<option value="2">중지(가상계좌 잔액부족)</option>
								<option value="3">등록중인 상태(가등록)</option>
							</select>
						</td>
					</tr>
					<tr>
						<td >가맹점 위치 X좌표 : </td>
						<td><input type="text" name="location_x" value=""></td>
					</tr>
					<tr>
						<td >가맹점 위치 Y좌표 : </td>
						<td><input type="text" name="location_y" value=""></td>
					</tr>
					<tr>
						<td >기사 도착 제한 시간(단위 : 분) : </td>
						<td><input type="text" name="cook_time" value="" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>가맹점 사용 수신단말 타입 :</td>
						<td> 
							<select name="terminal_type">
								<option value="">선택</option>
								<option value="0">미사용</option>
								<option value="1">CID단말기</option>
								<option value="2">IP단말기</option>
							</select>
						</td>
					</tr>
					<tr>
						<td >서비스 타입 : </td>
						<td>
							<select name="service_type">
								<option value="">선택</option>
								<option value="1">배달대행</option>
								<option value="2">심부름 대행</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>기사 도착 지연 시간(단위 : 분 / 예) 0: 지연 없음) : </td>
						<td><input type="text" name="rider_delay_duration" value="" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >사업자 번호 : </td>
						<td><input type="text" name="s_crn" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>연락처1 : </td>
						<td><input type="text" name="s_tel1" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>연락처2 : </td>
						<td><input type="text" name="s_tel2" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>로그인 계정 : </td>
						<td><input type="text" name="login_id" value="" maxlength="20" readonly="readonly" style="border: none;"></td>
					</tr>
					<tr>
						<td>로그인 패스워드 : </td>
						<td><input type="text" name="login_passwd" value="" maxlength="60"></td>
					</tr>
					<tr>
						<td>계약 시작 일자(YYYYMMDD) : </td>
						<td><input type="text" name="contract_sdate" id="contract_sdate_up" value="" maxlength="8" readonly="readonly"></td>
					</tr>
					<tr>
						<td>계약 종료 일자(YYYYMMDD) : </td>
						<td><input type="text" name="contract_edate" id="contract_edate_up" value="" maxlength="8" readonly="readonly"></td>
					</tr>
					<tr>
						<td>서비스 시작 일자(YYYYMMDD) : </td>
						<td><input type="text" name="service_start_date" id="service_start_date_up" value="" maxlength="8" readonly="readonly"></td>
					</tr>
					<tr>
						<td >가맹점 유형 : </td>
						<td>
							<select name="store_type">
								<option value="">선택</option>
								<option value="0" selected>일반가맹점</option>
								<option value="1">프랜차이즈</option>
								<option value="2">지자체지정업소/맛집/멋집</option>
								<option value="3">외국브랜드업체</option>
								<option value="4">푸드코트</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="3">주소</td>
					</tr>
					<tr>
						<td >가맹점 주소1 : </td>
						<td><input type="text" name="s_addr1" value="" maxlength="100" style=" width:500px;"></td>
					</tr>
					<tr>
						<td >가맹점 주소2 : </td>
						<td><input type="text" name="s_addr2" value="" maxlength="100" style=" width:300px;"></td>
					</tr>
				
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="3">업소 서비스 정보</td>
					</tr>
					<tr>
						<td>영업 시작 시간(HHMM) : </td>
						<td><input type="hidden" name="open_time" value="" maxlength="20">
						<select name="open_time_h">
						<c:forEach var="i" begin="00" end="23" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
						</select>
						<select name="open_time_m">
						<c:forEach var="i" begin="00" end="50" step="5">
							<option value="${i}">${i}</option>
						</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td>영업 종료 시간(HHMM) : </td>
						<td><input type="hidden" name="close_time" value="" maxlength="20">
						<select name="close_time_h">
						<c:forEach var="i" begin="00" end="23" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
						</select>
						<select name="close_time_m">
						<c:forEach var="i" begin="00" end="50" step="5">
							<option value="${i}">${i}</option>
						</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>	
					
					<tr>
						<td rowspan="6"  style="border-right: 1px;">업소 카드 결제 정보 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>CAT_ID : </td>
						<td><input type="text" name="cat_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>VAN_ID : </td>
						<td><input type="text" name="van_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>가상계좌 은행 : </td>
						<td>
						<c:if test="${!empty list_bank}" >
						<select name="v_bank" id="v_bank" style="width:80px;">
							<option value="">선택</option>
							<c:forEach var="list_bank" items="${list_bank}" varStatus="i">
							<option value="${list_bank.bank_id}">${list_bank.v_bank}</option>
							</c:forEach>
						</select>
						</c:if>
						</td>
					</tr>
					<tr>
						<td>가상 계좌번호 : </td>
						<td><input type="text" name="v_account" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; border: none;' readonly="readonly"></td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="15">업소 과금 정보</td>
					</tr>
					<tr>
						<td >금액 계산 방식 : </td>
						<td>
							<select name="charge_method">
								<option value="">선택</option>
								<option value="1">거리금액</option>
								<option value="2">구간금액</option>
								<option value="3">지정요금제</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>잔액 : </td>
						<td><input type="text" name="s_balance" value="" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >월 납부 금액 : </td>
						<td><input type="text" name="monthly_fee" value="" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >기준 거리(단위 : m) : </td>
						<td><input type="text" name="basic_distance" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >기본 요금 : </td>
						<td><input type="text" name="basic_charge" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >추가 기준 거리(단위 : m) : </td>
						<td><input type="text" name="add_distance" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >추가 요금 : </td>
						<td><input type="text" name="add_charge" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>일괄 할증 금액(예) 0:할증 없음) : </td>
						<td><input type="text" name="batch_extra_amount" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>마지막 충전 금액 : </td>
						<td><input type="text" name="last_recharge_amount" value=""  maxlength="6" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>마지막 충전 일자(YYYYMMDD) : </td>
						<td><input type="text" name="last_recharge_date" id="lastrechg_up" value="" maxlength="8"></td>
					</tr>
					<tr>
						<td>요금 타입 : </td>
						<td>
							<select name="charge_type">
								<option value="">선택</option>
								<option value="1">선불</option>
								<option value="2">후불</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>요금 옵션 : </td>
						<td>
							<select name="charge_option">
								<option value="">선택</option>
								<option value="1">콜당 차감</option>
								<option value="2">일별 차감</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>신용카드 결제 사용 여부 : </td>
						<td>
							<select name="credit_used_flag">
								<option value="">선택</option>
								<option value="0">미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
					<!-- 신용카드 결제 사용일때 -->
					<tr>
						<td>가맹점 결제 ID : </td>
						<td><input type="text" name="credit_member_id" value=""></td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="4">CID 정보</td>
					</tr>
					<tr>
						<td >CID단말기 코드 : </td>
						<td><input type="text" name="cid_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>CID Client 연결 상태 :</td>
						<td> 
							<select name="cid_connect_status">
								<option value="">선택</option>
								<option value="0">미연결</option>
								<option value="1">연결</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>CID 연결 Port:</td>
						<td> 
							<select name="cid_port">
								<option value="">선택</option>
								<option value="1">COM1</option>
								<option value="2">COM2</option>
								<option value="3">COM3</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="7">전표 프린터 정보</td>
					</tr>
					<tr>
						<td >프린터 단말기 코드 : </td>
						<td><input type="text" name="printer_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>프린터 Client 연결 상태 :</td>
						<td> 
							<select name="printer_connect_status">
								<option value="">선택</option>
								<option value="0">미연결</option>
								<option value="1">연결</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>프린터 연결 Port:</td>
						<td> 
							<select name="printer_port">
								<option value="">선택</option>
								<option value="1">COM1</option>
								<option value="2">COM2</option>
								<option value="3">COM3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>매장용 전표 출력 여부 : </td>
						<td>
							<select name="store_statement">
								<option value="">선택</option>
								<option value="0">미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>주방용 전표 출력 여부 : </td>
						<td>
							<select name="kitchen_statement">
								<option value="">선택</option>
								<option value="0">미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>고객용 전표 출력 여부 : </td>
						<td>
							<select name="customer_statement">
								<option value="">선택</option>
								<option value="0">미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
				
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="4">Noti</td>
					</tr>
					<tr>
						<td>Noti 전송 설정 여부 : </td>
						<td>
							<select name="noti_flag">
								<option value="">선택</option>
								<option value="0">미전송</option>
								<option value="1">전송</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>배달기사 수배완료 시 Noti 전송 : </td>
						<td>
							<select name="noti_rider_assign">
								<option value="">선택</option>
								<option value="0">미전송</option>
								<option value="1">전송</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>카드결제 시 Noti 전송 : </td>
						<td>
							<select name="noti_card_pay">
								<option value="">선택</option>
								<option value="0">미전송</option>
								<option value="1">전송</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="3">주문/변경/취소 건수</td>
					</tr>
					<tr>
						<td>일 단위 주문 건수 : </td>
						<td><input type="text" name="daily_order_count" value="" maxlength="6" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>월 단위 주문 건수 : </td>
						<td><input type="text" name="monthly_order_count" value="" maxlength="6" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td><input type="hidden" name="update_date" value="" maxlength="8"></td>
					</tr>
					<!--  
					<tr>
						<td>등록 운영자ID : </td>
						<td><input type="text" name="r_op_id" value="" maxlength="20"></td>
					</tr>
					-->
					<tr>
						<td><input type="hidden" name="u_op_id" value="" maxlength="20"></td>
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
				<input type="hidden" name="v_bank_org" value="">
		</form>
	</div>
</div>