<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(".detailBtn").click(function(){
		var b_id = $(this).parent().find(".b_id").val();
		var bid_flag = $(this).parent().find(".bid_flag").val();
		var b_name = $(this).parent().find(".b_name").val();
		var b_address = $(this).parent().find(".b_address").val();
		var b_crn = $(this).parent().find(".b_crn").val();
		var b_tel1 = $(this).parent().find(".b_tel1").val();
		var b_tel2 = $(this).parent().find(".b_tel2").val();
		var login_id = $(this).parent().find(".login_id").val();
		var login_passwd = $(this).parent().find(".login_passwd").val();
		var active_status = $(this).parent().find(".active_status").val();
		var bc_type = $(this).parent().find(".bc_type").val();
		var warning_amount = $(this).parent().find(".warning_amount").val();
		var suspend_amount = $(this).parent().find(".suspend_amount").val();
		var max_call = $(this).parent().find(".max_call").val();
		var callcatch_penalty_value = $(this).parent().find(".callcatch_penalty_value").val();
		var rider_delay_set = $(this).parent().find(".rider_delay_set").val();
		var rider_delay_duration = $(this).parent().find(".rider_delay_duration").val();
		var alarm_limit_duration = $(this).parent().find(".alarm_limit_duration").val();
		var batch_extra_flag = $(this).parent().find(".batch_extra_flag").val();
		var batch_extra_amount = $(this).parent().find(".batch_extra_amount").val();
		var service_type = $(this).parent().find(".service_type").val();
		var charge_method = $(this).parent().find(".charge_method").val();
		var basic_distance = $(this).parent().find(".basic_distance").val();
		var basic_charge = $(this).parent().find(".basic_charge").val();
		var add_distance = $(this).parent().find(".add_distance").val();
		var add_charge = $(this).parent().find(".add_charge").val();
		var calculatepercall = $(this).parent().find(".calculatepercall").val();
		var open_time = $(this).parent().find(".open_time").val();
		var close_time = $(this).parent().find(".close_time").val();
		var v_bank = $(this).parent().find(".v_bank").val();
		var v_account = $(this).parent().find(".v_account").val();
		var b_bank = $(this).parent().find(".b_bank").val();
		var b_account = $(this).parent().find(".b_account").val();
		var v_name = $(this).parent().find(".v_name").val();
		var contract_sdate = $(this).parent().find(".contract_sdate").val();
		var contract_edate = $(this).parent().find(".contract_edate").val();
		var insert_date = $(this).parent().find(".insert_date").val();
		var service_start_date = $(this).parent().find(".service_start_date").val();
		var update_date = $(this).parent().find(".update_date").val();
		var r_op_id = $(this).parent().find(".r_op_id").val();
		var u_op_id = $(this).parent().find(".u_op_id").val();
		var calculate_period = $(this).parent().find(".calculate_period").val();
		var calculate_date = $(this).parent().find(".calculate_date").val();
		var b_balance = $(this).parent().find(".b_balance").val();
		var b_representative = $(this).parent().find(".b_representative").val();
		var account_flag = $(this).parent().find(".account_flag").val();
		var ridercard_flag = $(this).parent().find(".ridercard_flag").val();
		
		if(account_flag == "1") {
			account_flag = "가상계좌";
		}else{
			account_flag = "실계좌";
		}
		
		if(ridercard_flag == "1") {
			ridercard_flag = "카드 결제금액 수정 가능";
		}else{
			ridercard_flag = "카드 결제금액 수정 불가능";
		}
		
		if(bid_flag == "") {
			bid_flag = "";
		}else if(bid_flag == "0") {
			bid_flag = "Admin지점";			
		}else if(bid_flag == "1") {
			bid_flag = "본사 직영";
		}else {
			bid_flag = "유치된 지점";
		}
		
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
		
		if(bc_type == "") {
			bc_type = "";
		}else if(bc_type == "0") {
			bc_type = "전투 배차";		
		}else {
			bc_type = "강제 배차";
		}
		
		if(rider_delay_set == "") {
			rider_delay_set = "";
		}else if(rider_delay_set == "0") {
			rider_delay_set = "기사도착지연없음";			
		}else if(rider_delay_set == "1") {
			rider_delay_set = "기사도착지연 발생함";
		}else {
			rider_delay_set = "무한정 지연";
		}
		
		if(batch_extra_flag == "") {
			batch_extra_flag = "";
		}else if(batch_extra_flag == "0") {
			batch_extra_flag = "미설정";		
		}else {
			batch_extra_flag = "설정";
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
		
		if(calculate_period == "") {
			calculate_period = "";
		}else if(calculate_period == "1") {
			calculate_period = "일단위 정산";			
		}else if(calculate_period == "2") {
			calculate_period = "주단위 정산";
		}else {
			calculate_period = "월단위 정산";
		}
		
		if(calculate_date == "") {
			calculate_date = "";
		}else if(calculate_date == "1") {
			calculate_date = "일단위";			
		}else if(calculate_date == "2") {
			calculate_date = "주단위";
		}else {
			calculate_date = "월단위";
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
		
		if(b_bank == "001") {
			b_bank = "한국은행";
		}else if(b_bank == ("002")) {
			b_bank = "산업은행";
		}else if(b_bank == ("003")) {
			b_bank = "기업은행";
		}else if(b_bank == ("004")) {
			b_bank = "국민은행";
		}else if(b_bank == ("005")) {
			b_bank = "외환은행";
		}else if(b_bank == ("007")) {
			b_bank = "수협중앙회";
		}else if(b_bank == ("008")) {
			b_bank = "수출입은행";
		}else if(b_bank == ("011")) {
			b_bank = "농협중앙회";
		}else if(b_bank == ("012")) {
			b_bank = "단위 농축협";
		}else if(b_bank == ("020")) {
			b_bank = "우리은행";
		}else if(b_bank == ("023")) {
			b_bank = "SC은행";
		}else if(b_bank == ("027")) {
			b_bank = "한국씨티은행";
		}else if(b_bank == ("031")) {
			b_bank = "대구은행";
		}else if(b_bank == ("032")) {
			b_bank = "부산은행";
		}else if(b_bank == ("034")) {
			b_bank = "광주은행";
		}else if(b_bank == ("035")) {
			b_bank = "제주은행";
		}else if(b_bank == ("037")) {
			b_bank = "전북은행";
		}else if(b_bank == ("039")) {
			b_bank = "경남은행";
		}else if(b_bank == ("045")) {
			b_bank = "새마을금고중앙회";
		}else if(b_bank == ("048")) {
			b_bank = "신협중앙회";
		}else if(b_bank == ("050")) {
			b_bank = "상호저축은행";
		}else if(b_bank == ("064")) {
			b_bank = "산림조합중앙회";
		}else if(b_bank == ("071")) {
			b_bank = "우체국";
		}else if(b_bank == ("081")) {
			b_bank = "하나은행";
		}else if(b_bank == ("088")) {
			b_bank = "신한은행";
		}else {
			b_bank = b_bank;
		}
		
		if(b_crn.length == 10) {
	    	b_crn = b_crn.substring(0,3) + '-' + b_crn.substring(3,5) + '-' + b_crn.substring(5,b_crn.length);
	    }else {
	    	b_crn = b_crn;
	    }
		
		$("#DetailForm").find("input[name=b_id]").val(b_id);
		$("#DetailForm").find("input[name=bid_flag]").val(bid_flag);
		$("#DetailForm").find("input[name=b_name]").val(b_name);
		$("#DetailForm").find("input[name=b_address]").val(b_address);
		$("#DetailForm").find("input[name=b_crn]").val(b_crn);
		$("#DetailForm").find("input[name=b_tel1]").val(b_tel1);
		$("#DetailForm").find("input[name=b_tel2]").val(b_tel2);
		$("#DetailForm").find("input[name=login_id]").val(login_id);
		$("#DetailForm").find("input[name=login_passwd]").val(login_passwd);
		$("#DetailForm").find("input[name=active_status]").val(active_status);
		$("#DetailForm").find("input[name=bc_type]").val(bc_type);
		$("#DetailForm").find("input[name=warning_amount]").val(warning_amount);
		$("#DetailForm").find("input[name=suspend_amount]").val(suspend_amount);
		$("#DetailForm").find("input[name=max_call]").val(max_call);
		$("#DetailForm").find("input[name=callcatch_penalty_value]").val(callcatch_penalty_value);
		$("#DetailForm").find("input[name=rider_delay_set]").val(rider_delay_set);
		$("#DetailForm").find("input[name=rider_delay_duration]").val(rider_delay_duration);
		$("#DetailForm").find("input[name=alarm_limit_duration]").val(alarm_limit_duration);
		$("#DetailForm").find("input[name=batch_extra_flag]").val(batch_extra_flag);
		$("#DetailForm").find("input[name=batch_extra_amount]").val(batch_extra_amount);
		$("#DetailForm").find("input[name=service_type]").val(service_type);
		$("#DetailForm").find("input[name=charge_method]").val(charge_method);
		$("#DetailForm").find("input[name=basic_distance]").val(basic_distance);
		$("#DetailForm").find("input[name=basic_charge]").val(basic_charge);
		$("#DetailForm").find("input[name=add_distance]").val(add_distance);
		$("#DetailForm").find("input[name=add_charge]").val(add_charge);
		$("#DetailForm").find("input[name=calculatepercall]").val(calculatepercall);
		$("#DetailForm").find("input[name=open_time]").val(open_time);
		$("#DetailForm").find("input[name=close_time]").val(close_time);
		$("#DetailForm").find("input[name=v_bank]").val(v_bank);
		$("#DetailForm").find("input[name=v_account]").val(v_account);
		$("#DetailForm").find("input[name=b_bank]").val(b_bank);
		$("#DetailForm").find("input[name=b_account]").val(b_account);
		$("#DetailForm").find("input[name=v_name]").val(v_name);
		$("#DetailForm").find("input[name=contract_sdate]").val(contract_sdate);
		$("#DetailForm").find("input[name=contract_edate]").val(contract_edate);
		$("#DetailForm").find("input[name=insert_date]").val(insert_date);
		$("#DetailForm").find("input[name=service_start_date]").val(service_start_date);
		$("#DetailForm").find("input[name=update_date]").val(update_date);
		$("#DetailForm").find("input[name=r_op_id]").val(r_op_id);
		$("#DetailForm").find("input[name=u_op_id]").val(u_op_id);
		$("#DetailForm").find("input[name=calculate_period]").val(calculate_period);
		$("#DetailForm").find("input[name=calculate_date]").val(calculate_date);
		$("#DetailForm").find("input[name=b_balance]").val(b_balance);
		$("#DetailForm").find("input[name=b_representative]").val(b_representative);
		$("#DetailForm").find("input[name=account_flag]").val(account_flag);
		$("#DetailForm").find("input[name=ridercard_flag]").val(ridercard_flag);
		
		$('#Detailpopup').bPopup();
	});
</script>
<div id="Detailpopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="DetailForm" name="DetailForm" action="detailbranchoffice" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table>
					<tr>
						<td id ="pop_header">지점 정보 상세보기</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점 ID : </td>
						<td><input type="text" name="b_id" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>지점 구분 :</td>
						<td><input type="text" name="bid_flag" value="" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td >지점 이름 : </td>
						<td><input type="text" name="b_name" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >지점 주소 : </td>
						<td><input type="text" name="b_address" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >지점 잔액 : </td>
						<td><input type="text" name="b_balance" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >대표자 이름 : </td>
						<td><input type="text" name="b_representative" value=""></td>
					</tr>
					<tr>
						<td >사업자 번호 : </td>
						<td><input type="text" name="b_crn" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >연락처1 : </td>
						<td><input type="text" name="b_tel1" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >연락처2 : </td>
						<td><input type="text" name="b_tel2" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >로그인 계정 : </td>
						<td><input type="text" name="login_id" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >지점 상태 : </td>
						<td><input type="text" name="active_status" value=""  readonly="readonly"></td>
					</tr>
					<tr>
						<td >배차 방식 : </td>
						<td><input type="text" name="bc_type" value=""  readonly="readonly"></td>
					</tr>
					<tr>
						<td>Warning_Amount : </td>
						<td><input type="text" name="warning_amount" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>Suspend_Amount : </td>
						<td><input type="text" name="suspend_amount" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>라이더별 동시 배달 가능 콜수 : </td>
						<td><input type="text" name="max_call" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>배달기사 콜 잡기 지연 패널티 값 : </td>
						<td><input type="text" name="callcatch_penalty_value" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>일괄 기사 도착 지연 설정 : </td>
						<td><input type="text" name="rider_delay_set" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>일괄 기사 도착 지연 시간 : </td>
						<td><input type="text" name="rider_delay_duration" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>배달기사 도착 알람 시간 : </td>
						<td><input type="text" name="alarm_limit_duration" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>기사 카드결제 금액 수정 여부 : </td>
						<td><input type="text" name="ridercard_flag" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>일괄 할증 설정 : </td>
						<td><input type="text" name="batch_extra_flag" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>일괄 할증 금액 : </td>
						<td><input type="text" name="batch_extra_amount" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>서비스 타입 : </td>
						<td><input type="text" name="service_type" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>금액 계산 방식 : </td>
						<td><input type="text" name="charge_method" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>기준거리 : </td>
						<td><input type="text" name="basic_distance" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>기본 요금 : </td>
						<td><input type="text" name="basic_charge" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>추가 기준거리 : </td>
						<td><input type="text" name="add_distance" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>추가 요금 : </td>
						<td><input type="text" name="add_charge" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>지점 콜비 금액 : </td>
						<td><input type="text" name="calculatepercall" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>영업 시작 시간 : </td>
						<td><input type="text" name="open_time" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>영업 종료 시간 : </td>
						<td><input type="text" name="close_time" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>가상계좌/실계좌 사용구분 : </td>
						<td><input type="text" name="account_flag" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>가상계좌 은행 : </td>
						<td><input type="text" name="v_bank" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>가상계좌번호 : </td>
						<td><input type="text" name="v_account" value="" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td>실계좌 은행 : </td>
						<td><input type="text" name="b_bank" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>실계좌번호 : </td>
						<td><input type="text" name="b_account" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>예금주 : </td>
						<td><input type="text" name="v_name" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>계약 시작 일자 : </td>
						<td><input type="text" name="contract_sdate" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>계약 종료 일자 : </td>
						<td><input type="text" name="contract_edate" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>등록 일자 : </td>
						<td><input type="text" name="insert_date" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>서비스 시작 일자 : </td>
						<td><input type="text" name="service_start_date" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>지점 정보 변경 일자 : </td>
						<td><input type="text" name="update_date" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>등록 운영자 ID : </td>
						<td><input type="text" name="r_op_id" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>업데이트 운영자 ID : </td>
						<td><input type="text" name="u_op_id" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>정산 주기 : </td>
						<td><input type="text" name="calculate_period" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>정산 날짜 : </td>
						<td><input type="text" name="calculate_date" value="" readonly="readonly"></td>
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
	