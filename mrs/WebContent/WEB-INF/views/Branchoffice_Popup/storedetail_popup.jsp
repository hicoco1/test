<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(".detailBtn").click(function(){
	var b_id = $(this).parent().find(".b_id").val() + "(" +  $(this).parent().find(".b_name").val() + ")";
	var s_id = $(this).parent().find(".s_id").val();
	var s_crn = $(this).parent().find(".s_crn").val();
	var s_name = $(this).parent().find(".s_name").val();
	var s_addr1 = $(this).parent().find(".s_addr1").val();
	var s_addr2 = $(this).parent().find(".s_addr2").val();
	var location_x = $(this).parent().find(".location_x").val();
	var location_y = $(this).parent().find(".location_y").val();
	var s_tel1 = $(this).parent().find(".s_tel1").val();
	var s_tel2 = $(this).parent().find(".s_tel2").val();
	var login_id = $(this).parent().find(".login_id").val();
	var login_passwd = $(this).parent().find(".login_passwd").val();
	var active_status = $(this).parent().find(".active_status").val();
	var cook_time = $(this).parent().find(".cook_time").val();
	var terminal_type = $(this).parent().find(".terminal_type").val();
	var cid_id = $(this).parent().find(".cid_id").val();
	var cid_connect_status = $(this).parent().find(".cid_connect_status").val();
	var cid_port = $(this).parent().find(".cid_port").val();
	var printer_id = $(this).parent().find(".printer_id").val();
	var printer_connect_status = $(this).parent().find(".printer_connect_status").val();
	var printer_port = $(this).parent().find(".printer_port").val();
	var monthly_fee = $(this).parent().find(".monthly_fee").val();
	var basic_distance = $(this).parent().find(".basic_distance").val();
	var basic_charge = $(this).parent().find(".basic_charge").val();
	var add_distance = $(this).parent().find(".add_distance").val();
	var add_charge = $(this).parent().find(".add_charge").val();
	var service_type = $(this).parent().find(".service_type").val();
	var charge_method = $(this).parent().find(".charge_method").val();
	var s_balance = $(this).parent().find(".s_balance").val();
	var rider_delay_duration = $(this).parent().find(".rider_delay_duration").val();
	var batch_extra_amount = $(this).parent().find(".batch_extra_amount").val();
	var last_recharge_amount = $(this).parent().find(".last_recharge_amount").val();
	var last_recharge_date = $(this).parent().find(".last_recharge_date").val();
	var charge_type = $(this).parent().find(".charge_type").val();
	var charge_option = $(this).parent().find(".charge_option").val();
	var credit_used_flag = $(this).parent().find(".credit_used_flag").val();
	var credit_member_id = $(this).parent().find(".credit_member_id").val();
	var noti_flag = $(this).parent().find(".noti_flag").val();
	var noti_rider_assign = $(this).parent().find(".noti_rider_assign").val();
	var noti_card_pay = $(this).parent().find(".noti_card_pay").val();
	var open_time = $(this).parent().find(".open_time").val();
	var close_time = $(this).parent().find(".close_time").val();
	var monthly_order_count = $(this).parent().find(".monthly_order_count").val();
	var daily_order_count = $(this).parent().find(".daily_order_count").val();
	var cat_id = $(this).parent().find(".cat_id").val();
	var van_id = $(this).parent().find(".van_id").val();
	var v_bank = $(this).parent().find(".v_bank").val();
	var v_account = $(this).parent().find(".v_account").val();
	var v_name = $(this).parent().find(".v_name").val();
	var contract_sdate = $(this).parent().find(".contract_sdate").val();
	var contract_edate = $(this).parent().find(".contract_edate").val();
	var service_start_date = $(this).parent().find(".service_start_date").val();
	var update_date = $(this).parent().find(".update_date").val();
	var r_op_id = $(this).parent().find(".r_op_id").val();
	var u_op_id = $(this).parent().find(".u_op_id").val();
	var store_statement = $(this).parent().find(".store_statement").val();
	var kitchen_statement = $(this).parent().find(".kitchen_statement").val();
	var customer_statement = $(this).parent().find(".customer_statement").val();
	var store_type = $(this).parent().find(".store_type").val();
	var s_representative = $(this).parent().find(".s_representative").val();
	
	if(active_status == "") {
		active_status = "";
	}else if(active_status == "0") {
		active_status = "정상";			
	}else if(active_status == "1") {
		active_status = "해지";
	}else if(active_status == "2") {
		active_status = "중지(가상계좌 잔액부족)";
	}else {
		active_status = "등록중인 상태(가등록)";
	}
	
	if(terminal_type == "") {
		terminal_type = "";
	}else if(terminal_type == "0") {
		terminal_type = "미사용";
	}else if(terminal_type == "1") {
		terminal_type = "CID단말기";
	}else {
		terminal_type = "IP단말기";
	}
	
	if(cid_connect_status == "") {
		cid_connect_status = "";
	}else if(cid_connect_status == "0") {
		cid_connect_status = "미연결";
	}else {
		cid_connect_status = "연결";
	}
	
	if(cid_port == "") {
		cid_port = "";
	}else if(cid_port == "1") {
		cid_port = "COM1";
	}else if(cid_port == "2") {
		cid_port = "COM2";
	}else {
		cid_port = "COM3";
	}
	
	
	if(printer_connect_status == "") {
		printer_connect_status = "";
	}else if(printer_connect_status == "0") {
		printer_connect_status = "미연결";
	}else {
		printer_connect_status = "연결";
	}
	
	if(printer_port == "") {
		printer_port = "";
	}else if(printer_port == "1") {
		printer_port = "COM1";
	}else if(printer_port == "2") {
		printer_port = "COM2";
	}else {
		printer_port = "COM3";
	}
	
	if(service_type == "") {
		service_type = "";
	}else if(service_type == "1") {
		service_type = "배달 대행";		
	}else {
		service_type = "심부름 대행";
	}
	
	if(charge_method == "") {
		charge_method = "";
	}else if(charge_method == "1") {
		charge_method = "거리금액";			
	}else if(charge_method == "2") {
		charge_method = "구간금액";
	}else {
		charge_method = "지정요금제";
	}
	
	if(charge_type == "") {
		charge_type = "";
	}else if(charge_type == "1") {
		charge_type = "선불";			
	}else {
		charge_type = "후불";
	}
	
	if(charge_option == "") {
		charge_option = "";
	}else if(charge_option == "1") {
		charge_option = "콜당 차감";			
	}else {
		charge_option = "일별 차감";
	}
	
	if(credit_used_flag == "") {
		credit_used_flag = "";
	}else if(credit_used_flag == "0") {
		credit_used_flag = "미사용";			
	}else {
		credit_used_flag = "사용";
	}
	
	if(noti_flag == "") {
		noti_flag = "";
	}else if(noti_flag == "0") {
		noti_flag = "미전송";			
	}else {
		noti_flag = "전송";
	}
	
	if(noti_rider_assign == "") {
		noti_rider_assign = "";
	}else if(noti_rider_assign == "0") {
		noti_rider_assign = "미전송";			
	}else {
		noti_rider_assign = "전송";
	}
	
	if(noti_card_pay == "") {
		noti_card_pay = "";
	}else if(noti_card_pay == "0") {
		noti_card_pay = "미전송";			
	}else {
		noti_card_pay = "전송";
	}
	
	if(store_statement == "") {
		store_statement = "";
	}else if(store_statement == "0") {
		store_statement = "미사용";			
	}else {
		store_statement = "사용";
	}
	
	if(kitchen_statement == "") {
		kitchen_statement = "";
	}else if(kitchen_statement == "0") {
		kitchen_statement = "미사용";			
	}else {
		kitchen_statement = "사용";
	}
	
	if(customer_statement == "") {
		customer_statement = "";
	}else if(customer_statement == "0") {
		customer_statement = "미사용";			
	}else {
		customer_statement = "사용";
	}
	
	if(v_bank == "001") {
		v_bank = "한국은행";
	}else if(v_bank == ("002")) {
		v_bank = "산업은행";
	}else if(v_bank == ("003")) {
		v_bank = "기업은행";
	}else if(v_bank == ("004")) {
		v_bank = "국민은행";
	}else if(v_bank == ("005")) {
		v_bank = "외환은행";
	}else if(v_bank == ("007")) {
		v_bank = "수협중앙회";
	}else if(v_bank == ("008")) {
		v_bank = "수출입은행";
	}else if(v_bank == ("011")) {
		v_bank = "농협중앙회";
	}else if(v_bank == ("012")) {
		v_bank = "단위 농축협";
	}else if(v_bank == ("020")) {
		v_bank = "우리은행";
	}else if(v_bank == ("023")) {
		v_bank = "SC은행";
	}else if(v_bank == ("027")) {
		v_bank = "한국씨티은행";
	}else if(v_bank == ("031")) {
		v_bank = "대구은행";
	}else if(v_bank == ("032")) {
		v_bank = "부산은행";
	}else if(v_bank == ("034")) {
		v_bank = "광주은행";
	}else if(v_bank == ("035")) {
		v_bank = "제주은행";
	}else if(v_bank == ("037")) {
		v_bank = "전북은행";
	}else if(v_bank == ("039")) {
		v_bank = "경남은행";
	}else if(v_bank == ("045")) {
		v_bank = "새마을금고중앙회";
	}else if(v_bank == ("048")) {
		v_bank = "신협중앙회";
	}else if(v_bank == ("050")) {
		v_bank = "상호저축은행";
	}else if(v_bank == ("064")) {
		v_bank = "산림조합중앙회";
	}else if(v_bank == ("071")) {
		v_bank = "우체국";
	}else if(v_bank == ("081")) {
		v_bank = "하나은행";
	}else if(v_bank == ("088")) {
		v_bank = "신한은행";
	}else {
		v_bank = v_bank;
	}
	
	if(store_type == "") {
		store_type = "";
	}else if(store_type == "0") {
		store_type = "일반가맹점";			
	}else if(store_type == "1") {
		store_type = "프랜차이즈";			
	}else if(store_type == "2") {
		store_type = "지자체지정업소/맛집/멋집";			
	}else if(store_type == "3") {
		store_type = "외국브랜드업체";			
	}else {
		store_type = "푸드코트";
	}
	
	if(s_crn.length == 10) {
    	s_crn = s_crn.substring(0,3) + '-' + s_crn.substring(3,5) + '-' + s_crn.substring(5,s_crn.length);
    }else {
    	s_crn = s_crn;
    }
	
	$("#DetailForm").find("input[name=b_id]").val(b_id);
	$("#DetailForm").find("input[name=s_id]").val(s_id);
	$("#DetailForm").find("input[name=s_crn]").val(s_crn);
	$("#DetailForm").find("input[name=s_name]").val(s_name);
	$("#DetailForm").find("input[name=s_addr1]").val(s_addr1);
	$("#DetailForm").find("input[name=s_addr2]").val(s_addr2);
	$("#DetailForm").find("input[name=location_x]").val(location_x);
	$("#DetailForm").find("input[name=location_y]").val(location_y);
	$("#DetailForm").find("input[name=s_tel1]").val(s_tel1);
	$("#DetailForm").find("input[name=s_tel2]").val(s_tel2);
	$("#DetailForm").find("input[name=login_id]").val(login_id);
	$("#DetailForm").find("input[name=login_passwd]").val(login_passwd);
	$("#DetailForm").find("input[name=active_status]").val(active_status);
	$("#DetailForm").find("input[name=cook_time]").val(cook_time);
	$("#DetailForm").find("input[name=terminal_type]").val(terminal_type);
	$("#DetailForm").find("input[name=cid_id]").val(cid_id);
	$("#DetailForm").find("input[name=cid_connect_status]").val(cid_connect_status);
	$("#DetailForm").find("input[name=cid_port]").val(cid_port);
	$("#DetailForm").find("input[name=printer_id]").val(printer_id);
	$("#DetailForm").find("input[name=printer_connect_status]").val(printer_connect_status);
	$("#DetailForm").find("input[name=printer_port]").val(printer_port);
	$("#DetailForm").find("input[name=monthly_fee]").val(monthly_fee);
	$("#DetailForm").find("input[name=basic_distance]").val(basic_distance);
	$("#DetailForm").find("input[name=basic_charge]").val(basic_charge);
	$("#DetailForm").find("input[name=add_distance]").val(add_distance);
	$("#DetailForm").find("input[name=add_charge]").val(add_charge);
	$("#DetailForm").find("input[name=service_type]").val(service_type);
	$("#DetailForm").find("input[name=charge_method]").val(charge_method);
	$("#DetailForm").find("input[name=s_balance]").val(s_balance);
	$("#DetailForm").find("input[name=rider_delay_duration]").val(rider_delay_duration);
	$("#DetailForm").find("input[name=batch_extra_amount]").val(batch_extra_amount);
	$("#DetailForm").find("input[name=last_recharge_amount]").val(last_recharge_amount);
	$("#DetailForm").find("input[name=last_recharge_date]").val(last_recharge_date);
	$("#DetailForm").find("input[name=charge_type]").val(charge_type);
	$("#DetailForm").find("input[name=charge_option]").val(charge_option);
	$("#DetailForm").find("input[name=credit_used_flag]").val(credit_used_flag);
	$("#DetailForm").find("input[name=credit_member_id]").val(credit_member_id);
	$("#DetailForm").find("input[name=noti_flag]").val(noti_flag);
	$("#DetailForm").find("input[name=noti_rider_assign]").val(noti_rider_assign);
	$("#DetailForm").find("input[name=noti_card_pay]").val(noti_card_pay);
	$("#DetailForm").find("input[name=open_time]").val(open_time);
	$("#DetailForm").find("input[name=close_time]").val(close_time);
	$("#DetailForm").find("input[name=monthly_order_count]").val(monthly_order_count);
	$("#DetailForm").find("input[name=daily_order_count]").val(daily_order_count);
	$("#DetailForm").find("input[name=cat_id]").val(cat_id);
	$("#DetailForm").find("input[name=van_id]").val(van_id);
	$("#DetailForm").find("input[name=v_bank]").val(v_bank);
	$("#DetailForm").find("input[name=v_account]").val(v_account);
	$("#DetailForm").find("input[name=v_name]").val(v_name);
	$("#DetailForm").find("input[name=contract_sdate]").val(contract_sdate);
	$("#DetailForm").find("input[name=contract_edate]").val(contract_edate);
	$("#DetailForm").find("input[name=service_start_date]").val(service_start_date);
	$("#DetailForm").find("input[name=update_date]").val(update_date);
	$("#DetailForm").find("input[name=r_op_id]").val(r_op_id);
	$("#DetailForm").find("input[name=u_op_id]").val(u_op_id);
	$("#DetailForm").find("input[name=store_statement]").val(store_statement);
	$("#DetailForm").find("input[name=kitchen_statement]").val(kitchen_statement);
	$("#DetailForm").find("input[name=customer_statement]").val(customer_statement);
	$("#DetailForm").find("input[name=store_type]").val(store_type);
	$("#DetailForm").find("input[name=s_representative]").val(s_representative);
	
	$('#Detailpopup').bPopup();
});
</script>
<div id="Detailpopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
		<form id="DetailForm" name="DetailForm" action="detailbranchoffice_store" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table>
					<tr>
						<td id ="pop_header">업소 정보 상세보기</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td rowspan="20">업소 기본 정보</td>
					</tr>
					<tr>
						<td >소속 지점 ID(이름) : </td>
						<td><input type="text" name="b_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >가맹점 이름 : </td>
						<td><input type="text" name="s_name" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >대표자 이름 : </td>
						<td><input type="text" name="s_representative" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >가맹점 ID : </td>
						<td><input type="text" name="s_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>가맹점 상태 :</td>
						<td><input type="text" name="active_status" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >가맹점 위치 X좌표 : </td>
						<td><input type="text" name="location_x" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >가맹점 위치 Y좌표 : </td>
						<td><input type="text" name="location_y" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >기사 도착 제한 시간 : </td>
						<td><input type="text" name="cook_time" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>가맹점 사용 수신단말 타입 :</td>
						<td><input type="text" name="terminal_type" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >서비스 타입 : </td>
						<td><input type="text" name="service_type" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>기사 도착 지연 시간 : </td>
						<td><input type="text" name="rider_delay_duration" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >사업자 번호 : </td>
						<td><input type="text" name="s_crn" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>연락처1 : </td>
						<td><input type="text" name="s_tel1" value="" readonly="readonly" style="border:none; width:150px;"></td>
					</tr>
					<tr>
						<td>연락처2 : </td>
						<td><input type="text" name="s_tel2" value="" readonly="readonly" style="border:none; width:150px;"></td>
					</tr>
					<tr>
						<td>로그인 계정 : </td>
						<td><input type="text" name="login_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>계약 시작 일자 : </td>
						<td><input type="text" name="contract_sdate" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>계약 종료 일자 : </td>
						<td><input type="text" name="contract_edate" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>서비스 시작 일자 : </td>
						<td><input type="text" name="service_start_date" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>지점 정보 변경 일자 일자 : </td>
						<td><input type="text" name="update_date" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>가맹점 유형 : </td>
						<td><input type="text" name="store_type" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="3">주소</td>
					</tr>
					<tr>
						<td >가맹점 주소1 : </td>
						<td><input type="text" name="s_addr1" value="" readonly="readonly" style="border:none; width:300px;"></td>
					</tr>
					<tr>
						<td >가맹점 주소2 : </td>
						<td><input type="text" name="s_addr2" value="" readonly="readonly" style="border:none; width:300px;"></td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="3">업소 서비스 정보</td>
					</tr>
					<tr>
						<td>영업 시작 시간 : </td>
						<td><input type="text" name="open_time" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>영업 종료 시간 : </td>
						<td><input type="text" name="close_time" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>	
					
					<tr>
						<td rowspan="6"  style="border-right: 1px;">업소 카드 결제 정보 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>결제 단말기 ID : </td>
						<td><input type="text" name="cat_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>VAN_ID : </td>
						<td><input type="text" name="van_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>가상계좌 은행 : </td>
						<td><input type="text" name="v_bank" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>가상 계좌 계좌번호 : </td>
						<td><input type="text" name="v_account" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>가상 계좌 예금주 : </td>
						<td><input type="text" name="v_name" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="14">업소 과금 정보</td>
					</tr>
					<tr>
						<td >금액 계산 방식 : </td>
						<td><input type="text" name="charge_method" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>잔액 : </td>
						<td><input type="text" name="s_balance" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >월 납부 금액 : </td>
						<td><input type="text" name="monthly_fee" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >기준 거리(단위 : m) : </td>
						<td><input type="text" name="basic_distance" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >기본 요금 : </td>
						<td><input type="text" name="basic_charge" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >추가 기준 거리(단위 : m) : </td>
						<td><input type="text" name="add_distance" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td >추가 요금 : </td>
						<td><input type="text" name="add_charge" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>일괄 할증 금액 : </td>
						<td><input type="text" name="batch_extra_amount" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>마지막 충전 금액 : </td>
						<td><input type="text" name="last_recharge_amount" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>마지막 충전 일자 : </td>
						<td><input type="text" name="last_recharge_date" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>요금 타입 : </td>
						<td><input type="text" name="charge_type" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>요금 옵션 : </td>
						<td><input type="text" name="charge_option" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>신용카드 결제 사용 여부 : </td>
						<td><input type="text" name="credit_used_flag" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<!-- 
					<tr>
						<td>가맹점 결제 ID : </td>
						<td><input type="text" name="credit_member_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					 -->
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="4">CID 정보</td>
					</tr>
					<tr>
						<td >CID단말기 코드 : </td>
						<td><input type="text" name="cid_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>CID Client 연결 상태 :</td>
						<td><input type="text" name="cid_connect_status" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>CID 연결 Port:</td>
						<td><input type="text" name="cid_port" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="7">전표 프린터 정보</td>
					</tr>
					<tr>
						<td >프린터 단말기 코드 : </td>
						<td><input type="text" name="printer_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>프린터 Client 연결 상태 :</td>
						<td><input type="text" name="printer_connect_status" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>프린터 연결 Port:</td>
						<td><input type="text" name="printer_port" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>매장용 전표 출력 여부 : </td>
						<td><input type="text" name="store_statement" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>주방용 전표 출력 여부 : </td>
						<td><input type="text" name="kitchen_statement" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>고객용 전표 출력 여부 : </td>
						<td><input type="text" name="customer_statement" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="4">Noti</td>
					</tr>
					<tr>
						<td>Noti 전송 설정 여부 : </td>
						<td><input type="text" name="noti_flag" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>배달기사 수배완료 시 Noti 전송 : </td>
						<td><input type="text" name="noti_rider_assign" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>카드결제 시 Noti 전송 : </td>
						<td><input type="text" name="noti_card_pay" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="3">주문/변경/취소 건수</td>
					</tr>
					<tr>
						<td>일 단위 주문 건수 : </td>
						<td><input type="text" name="daily_order_count" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>월 단위 주문 건수 : </td>
						<td><input type="text" name="monthly_order_count" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="3">기타 정보</td>
					</tr>
					
					<tr>
						<td>등록 운영자ID : </td>
						<td><input type="text" name="r_op_id" value="" readonly="readonly" style="border:none;"></td>
					</tr>
					<tr>
						<td>마지막 업데이트 운영자ID : </td>
						<td><input type="text" name="u_op_id" value="" readonly="readonly" style="border:none;"></td>
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
