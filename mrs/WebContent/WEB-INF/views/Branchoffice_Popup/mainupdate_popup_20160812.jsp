<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script type="text/javascript">
$().ready(function() {
	 $("#UpdateForm").validate();
	 
		$("input[name=addr_flag]").change(function() {
			var radioValue = $(this).val();
			if (radioValue == "1") {
				$(".addr_old").css("display",""); 
				$(".addr_new").css("display","none"); 
				
				$("#UpdateForm").find("input[name=b_road_code]").val("");
				$("#UpdateForm").find("input[name=b_road_bonbun]").val("");
				$("#UpdateForm").find("input[name=b_road_bubun]").val("");	

				$("#UpdateForm").find("input[name=b_dong_code]").addClass("required");
				$("#UpdateForm").find("input[name=b_ji_bonbun]").addClass("required");	
				
			}else if (radioValue == "2") {
				$(".addr_new").css("display",""); 
				$(".addr_old").css("display","none"); 
			
				$("#UpdateForm").find("input[name=b_dong_code]").val("");
				$("#UpdateForm").find("input[name=b_ji_bonbun]").val("");
				$("#UpdateForm").find("input[name=b_ji_bubun]").val("");

				$("#UpdateForm").find("input[name=b_road_code]").addClass("required");
				$("#UpdateForm").find("input[name=b_road_bonbun]").addClass("required");	
		
			}
		});
	});
	
$(document).ready(function(){
	function fn_setGuAddr2(param,obj){
		$.ajax({
			type:"POST",
			url:"branchoffice_selectgu",
			cache:false,
			data:{
				js_sido:param
			},
			success:function(data, status){
				html="";
				
				if($("#UpdateForm").find("input[name=gu_flag]").val() == "1"){
					 $("#UpdateForm").find("input[name=gu]").val("");
				}
				for(var idx=0; idx<data.length; idx++) {	
			
					if($("#UpdateForm").find("input[name=gu]").val() == data[idx].gu_code){
						html += "<option value="+data[idx].gu_code+" selected>"+data[idx].gu_code+"</option>";
						
					}else{
						html += "<option value="+data[idx].gu_code+">"+data[idx].gu_code+"</option>";
					}
					
					$(obj).next().empty();
					$(obj).next().append(html);
			 	}
				
				if($("#UpdateForm").find("input[name=gu_flag]").val() == "1"){
					fn_setTownAddr(data[0].gu_code,obj);
				}else{
					fn_setTownAddr($("#UpdateForm").find("input[name=gu]").val(),obj);
				}
				
				
				
			},
			error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
	}
	
	function fn_setTownAddr(param,obj){
		$.ajax({
			type:"POST",
			url:"branchoffice_selecttown",
			cache:false,
			data:{
				js_gugun:param
			},
			success:function(data, status){
				html="";
				for(var idx=0; idx<data.length; idx++) {
					html += "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
					$(obj).next().next().empty();
					$(obj).next().next().append(html);
			 	}
				if($("#town_code option").size() == 2) {
					$("select[name=b_town_code]").hide();
				}else {
					$("select[name=b_town_code]").show();
				}
			},
			error:function(request,status,error){
	       		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
	}
	
	function fn_setTownAddr2(param,obj){
		$.ajax({
			type:"POST",
			url:"branchoffice_selecttown",
			cache:false,
			data:{
				js_gugun:param
			},
			success:function(data, status){
				html="";
	
	
				for(var idx=0; idx<data.length; idx++) {
					
					html += "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
						
					$(obj).next().empty();
					$(obj).next().append(html);
			 	}
			
				if($("#town_code2 option").size() == 2) {
					$("select[name=b_town_code]").hide();
				}else {
					$("select[name=b_town_code]").show();
				}
			},
			error:function(request,status,error){
	       		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
	}
		
	$("#city_code2").change(function(){
		var param = $(this).children("option:selected").text();
		$("#UpdateForm").find("input[name=gu_flag]").val("1");
		fn_setGuAddr2(param, this);
		
		var tmpVal = $(this).children("option:selected").val();
	
		$(this).next().next().next().val(tmpVal);
	});
	
	$("#gu_code2").change(function(){
		var param = $(this).children("option:selected").text();
		
		fn_setTownAddr2(param, this);
	
		var tmpVal = $(this).children("option:selected").val();
		$(this).next().next().val(tmpVal);
	});
	
	$("#town_code2").change(function(){
		var tmpVal = $(this).children("option:selected").val();
		$(this).next().val(tmpVal);
	});
	
	
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
	var bc_distance = $(this).parent().find(".bc_distance").val();
	var bc_time = $(this).parent().find(".bc_time").val();
	var open_time = $(this).parent().find(".open_time").val();
	var close_time = $(this).parent().find(".close_time").val();
	var v_bank = $(this).parent().find(".v_bank").val();
	var v_account = $(this).parent().find(".v_account").val();
	var v_name = $(this).parent().find(".v_name").val();
	var s_sequence = $(this).parent().find(".s_sequence").val();
	var r_sequence = $(this).parent().find(".r_sequence").val();
	var contract_sdate = $(this).parent().find(".contract_sdate").val();
	var contract_edate = $(this).parent().find(".contract_edate").val();
	//var insert_date = $(this).parent().find(".insert_date").val();
	var service_start_date = $(this).parent().find(".service_start_date").val();
	var update_date = $(this).parent().find(".update_date").val();
	//var r_op_id = $(this).parent().find(".r_op_id").val();
	var u_op_id = $(this).parent().find(".u_op_id").val();
	var calculate_period = $(this).parent().find(".calculate_period").val();
	var calculate_date = $(this).parent().find(".calculate_date").val();
	var b_balance = $(this).parent().find(".b_balance").val();
	var b_representative = $(this).parent().find(".b_representative").val();
	var b_addr_appendix = $(this).parent().find(".b_addr_appendix").val();
	
	var city_code = $(this).parent().find(".b_city_code").val();
	var gu_code = $(this).parent().find(".b_gu_code").val();
	var town_code = $(this).parent().find(".b_town_code").val();
	$("#UpdateForm").find("input[name=gu]").val(gu_code);
	$("#UpdateForm").find("input[name=town]").val(town_code);

	fn_setGuAddr2(city_code, $("#city_code2"));
	var tmpVal = $(this).children("option:selected").val();
	$(this).next().next().val(tmpVal);
	
	var dong_code = $(this).parent().find(".b_dong_code").val();
	var ji_bonbun = $(this).parent().find(".b_ji_bonbun").val();
	var ji_bubun = $(this).parent().find(".b_ji_bubun").val();
	var road_codenum = $(this).parent().find(".road_codenum").val();
	var road_code = $(this).parent().find(".b_road_code").val();
	var road_bonbun = $(this).parent().find(".b_road_bonbun").val();
	var road_bubun = $(this).parent().find(".b_road_bubun").val();
	var b_address = $(this).parent().find(".b_address").val();
	var location_x = $(this).parent().find(".location_x").val();
	var location_y = $(this).parent().find(".location_y").val();
	
	if(city_code != null && city_code != '') $("select[name=b_city_code]").val(city_code).attr("selected","selected");
	if(gu_code != null && gu_code != '') $("select[name=b_gu_code]").val(gu_code).attr("selected","selected");
	if(town_code != null && town_code != '') $("select[name=b_town_code]").val(town_code).attr("selected","selected");
	$("#UpdateForm").find("input[name=b_dong_code]").val(dong_code);
	$("#UpdateForm").find("input[name=b_ji_bonbun]").val(ji_bonbun);
	$("#UpdateForm").find("input[name=b_ji_bubun]").val(ji_bubun);
	$("#UpdateForm").find("input[name=road_codenum]").val(road_codenum);
	$("#UpdateForm").find("input[name=b_road_code]").val(road_code);
	$("#UpdateForm").find("input[name=b_road_bonbun]").val(road_bonbun);
	$("#UpdateForm").find("input[name=b_road_bubun]").val(road_bubun);
	$("#UpdateForm").find("input[name=b_address]").val(b_address);
	$("#UpdateForm").find("input[name=location_x]").val(location_x);
	$("#UpdateForm").find("input[name=location_y]").val(location_y);
	
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
	if(bid_flag != null && bid_flag != '') $("select[name=bid_flag]").val(bid_flag).attr("selected","selected");
	$("#UpdateForm").find("input[name=b_name]").val(b_name);
	$("#UpdateForm").find("input[name=b_address]").val(b_address);
	$("#UpdateForm").find("input[name=b_crn]").val(b_crn);
	$("#UpdateForm").find("input[name=b_tel1]").val(b_tel1);
	$("#UpdateForm").find("input[name=b_tel2]").val(b_tel2);
	$("#UpdateForm").find("input[name=login_id]").val(login_id);
	$("#UpdateForm").find("input[name=login_passwd]").val("");
	if(active_status != null && active_status != '') $("select[name=active_status]").val(active_status).attr("selected","selected");
	if(bc_type != null && bc_type != '') $("select[name=bc_type]").val(bc_type).attr("selected","selected");
	$("#UpdateForm").find("input[name=warning_amount]").val(warning_amount);
	$("#UpdateForm").find("input[name=suspend_amount]").val(suspend_amount);
	$("#UpdateForm").find("input[name=max_call]").val(max_call);
	$("#UpdateForm").find("input[name=callcatch_penalty_value]").val(callcatch_penalty_value);
	if(rider_delay_set != null && rider_delay_set != '') $("select[name=rider_delay_set]").val(rider_delay_set).attr("selected","selected");
	$("#UpdateForm").find("input[name=rider_delay_duration]").val(rider_delay_duration);
	$("#UpdateForm").find("input[name=alarm_limit_duration]").val(alarm_limit_duration);
	if(batch_extra_flag != null && batch_extra_flag != '') $("select[name=batch_extra_flag]").val(batch_extra_flag).attr("selected","selected");
	$("#UpdateForm").find("input[name=batch_extra_amount]").val(batch_extra_amount);
	if(service_type != null && service_type != '') $("select[name=service_type]").val(service_type).attr("selected","selected");
	if(charge_method != null && charge_method != '') $("select[name=charge_method]").val(charge_method).attr("selected","selected");
	$("#UpdateForm").find("input[name=basic_distance]").val(basic_distance);
	$("#UpdateForm").find("input[name=basic_charge]").val(basic_charge);
	$("#UpdateForm").find("input[name=add_distance]").val(add_distance);
	$("#UpdateForm").find("input[name=add_charge]").val(add_charge);
	$("#UpdateForm").find("input[name=bc_distance]").val(bc_distance);
	$("#UpdateForm").find("input[name=bc_time]").val(bc_time);
	//$("#UpdateForm").find("input[name=open_time]").val(open_time);
	//$("#UpdateForm").find("input[name=close_time]").val(close_time);
	if(open_time != null && open_time != '') $("select[name=open_time_h]").val(openh).attr("selected","selected");
	if(open_time != null && open_time != '') $("select[name=open_time_m]").val(openm).attr("selected","selected");
	if(close_time != null && close_time != '') $("select[name=close_time_h]").val(closeh).attr("selected","selected");
	if(close_time != null && close_time != '') $("select[name=close_time_m]").val(closem).attr("selected","selected");
	if(v_bank != null && v_bank != '') $("select[name=v_bank]").val(v_bank).attr("selected","selected");
	$("#UpdateForm").find("input[name=v_account]").val(v_account);
	$("#UpdateForm").find("input[name=v_name]").val(v_name);
	$("#UpdateForm").find("input[name=s_sequence]").val(s_sequence);
	$("#UpdateForm").find("input[name=r_sequence]").val(r_sequence);
	$("#UpdateForm").find("input[name=contract_sdate]").val(contract_sdate);
	$("#UpdateForm").find("input[name=contract_edate]").val(contract_edate);
	//$("#UpdateForm").find("input[name=insert_date]").val(insert_date);
	$("#UpdateForm").find("input[name=service_start_date]").val(service_start_date);
	$("#UpdateForm").find("input[name=update_date]").val(today);
	//$("#UpdateForm").find("input[name=r_op_id]").val(r_op_id);
	$("#UpdateForm").find("input[name=u_op_id]").val("${username}");
	if(calculate_period != null && calculate_period != '') $("select[name=calculate_period]").val(calculate_period).attr("selected","selected");
	if(calculate_date != null && calculate_date != '') $("select[name=calculate_date]").val(calculate_date).attr("selected","selected");
	$("#UpdateForm").find("input[name=b_balance]").val(b_balance);
	$("#UpdateForm").find("input[name=b_representative]").val(b_representative);
	$("#UpdateForm").find("input[name=b_addr_appendix]").val(b_addr_appendix);
	
	$('#Updatepopup').bPopup();
});
});
</script>
<div id="Updatepopup" class="Pstyle">
		<span class="b-close">X</span>
		<div class="content">
			<form id="UpdateForm" name="UpdateForm" action="updatebranchoffice" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
			<input type="hidden" name="gu" />
			<input type="hidden" name="town" />
			<input type="hidden" name="gu_flag" value="0" />
				<table>
					<tr>
						<td id ="pop_header">지사 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지사 ID : </td>
						<td><input type="text" name="b_id" value="" maxlength="5" readonly="readonly" style=" width:300px; border: none;"></td>
					</tr>
					<tr>
						<td >지사 이름 : </td>
						<td><input type="text" name="b_name" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td>지사 구분 :</td>
						<td> 
							<select name="bid_flag">
								<option value="" >선택</option>
								<option value="1">본사 직영</option>
								<option value="2">유치된 지사</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>주소 선택 : </td>
						<td>
							<select name="b_city_code" id="city_code2">
								<option value="">-시/도 선택-</option>
								<c:forEach var="nation_data" items="${nation_list }" varStatus="status">
								<option value="${nation_data.city_code}">${nation_data.city_code}</option>
								</c:forEach>
							</select>
							<select name="b_gu_code" id="gu_code2">
								<option value="">-시/군/구 선택-</option>
							
							</select>
							<select name="b_town_code" id="town_code2">
								<option value="">-읍/면 선택-</option>
							</select>
						</td>
					</tr>
					<input type="hidden" name="li_code" value="" >
					<input type="hidden" name="san_flag" value="0" >
					<tr>
						<td>나머지 주소 입력 :</td>
						<td> 
							<input type="radio" name="addr_flag" value="1" checked >구주소
							<input type="radio" name="addr_flag" value="2">신주소
							
						</td>
					</tr>
					<tr class="addr_old">
						<td>행정동/리 : </td>
						<td><input type="text" name="b_dong_code"  value="" maxlength="20" style="width:300px;" class="required"></td>
					</tr>
					<tr class="addr_old">
						<td >지번 본번 : </td>
						<td><input type="text" name="b_ji_bonbun" value="" maxlength="5" style=" width:300px;" class="required" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr class="addr_old">
						<td >지번 부번 : </td>
						<td><input type="text" name="b_ji_bubun" value="" maxlength="5" style=" width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' ></td>
					</tr>
					<!-- <tr class="addr_new" style="display:none;">
						<td >도로명 코드 : </td>
						<td>
							<input type="text" name="road_codenum" value="" maxlength="15" style="width:300px;">
						</td>
					</tr> --><input type="hidden" name="road_codenum" value="">
					<tr class="addr_new" style="display:none;">
						<td >도로명 : </td>
						<td><input type="text" name="b_road_code" value="" maxlength="50" style="width:300px;"></td>
					</tr>
					<tr class="addr_new" style="display:none;">
						<td >도로명 건물 본번 : </td>
						<td><input type="text" name="b_road_bonbun" value="" maxlength="15" style="width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr class="addr_new" style="display:none;">
						<td >도로명 건물 부번 : </td>
						<td><input type="text" name="b_road_bubun" value="" maxlength="50" style="width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td >주소 추가 정보 : </td>
						<td><input type="text" name="b_addr_appendix" value="" maxlength="50" style=" width:300px;">
						</td>
					</tr>
						
					<tr>
						<td >지사 잔액 : </td>
						<td><input type="text" name="b_balance" value="" maxlength="10" style=" width:100px; ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
						</td>
					</tr>
					<tr>
						<td >대표자 이름 : </td>
						<td><input type="text" name="b_representative" value="" maxlength="50" style=" width:100px;">
						</td>
					</tr>
					<tr>
						<td >사업자 번호 : </td>
						<td><input type="text" name="b_crn" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; width:300px;'></td>
					</tr>
					<tr>
						<td >연락처1 : </td>
						<td><input type="text" name="b_tel1" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; width:300px;'></td>
					</tr>
					<tr>
						<td >연락처2 : </td>
						<td><input type="text" name="b_tel2" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; width:300px;'></td>
					</tr>
					<tr>
						<td >로그인 계정 : </td>
						<td><input type="text" name="login_id" value="" maxlength="20" readonly="readonly" style="border: none;"></td>
					</tr>
					<tr>
						<td >로그인 비밀번호 (수정시에만 입력) : </td>
						<td><input type="password" name="login_passwd" value="" maxlength="60"></td>
					</tr>
					<tr>
						<td >지사 상태 : </td>
						<td>
							<select name="active_status">
								<option value="">선택</option>
								<option value="0">정상</option>
								<option value="1">해지</option>
								<option value="2">중지(가상계좌 잔액부족)</option>
								<option value="R">등록중인 상태(가등록)</option>
							</select>
						</td>
					</tr>
					<tr>
						<td >배차 방식 : </td>
						<td>
							<select name="bc_type">
								<option value="">선택</option>
								<option value="0">전투 배차</option>
								<option value="1">강제 배차</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Warning_Amount : </td>
						<td><input type="text" name="warning_amount" value="" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>Suspend_Amount : </td>
						<td><input type="text" name="suspend_amount" value="" maxlength="10" datetimeonly="true" style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>라이더별 동시 배달 가능 콜수 : </td>
						<td><input type="text" name="max_call" value="" maxlength="1"></td>
					</tr>
					<tr>
						<td>배달기사 콜 잡기 지연 패널티 값(단위 : 초) : </td>
						<td><input type="text" name="callcatch_penalty_value" value="" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>일괄 기사 도착 지연 설정(설정 시 모든 가맹점에 Noti) : </td>
						<td>
							<select name="rider_delay_set">
								<option value="">선택</option>
								<option value="0">기사 도착 지연 없음</option>
								<option value="1">기사 도착 지연 발생함</option>
								<option value="2">무한정 지연</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>일괄 기사 도착 지연 시간(단위 : 분) : </td>
						<td><input type="text" name="rider_delay_duration" value="" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>일괄 기사 도착 지연 시간(단위 : 분) : </td>
						<td><input type="text" name="alarm_limit_duration" value="" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>일괄 할증 설정 : </td>
						<td>
							<select name="batch_extra_flag">
								<option value="">선택</option>
								<option value="0">미설정</option>
								<option value="1">설정</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>일괄 할증 금액 : </td>
						<td><input type="text" name="batch_extra_amount" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>서비스 타입 : </td>
						<td>
							<select name="service_type">
								<option value="">선택</option>
								<option value="1">배달 대행</option>
								<option value="2">심부름 대행</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>금액 계산 방식 : </td>
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
						<td>기준거리(단위 : m) : </td>
						<td><input type="text" name="basic_distance" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>기본 요금 : </td>
						<td><input type="text" name="basic_charge" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>추가 기준거리(단위 : m) : </td>
						<td><input type="text" name="add_distance" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>추가 요금 : </td>
						<td><input type="text" name="add_charge" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>2차 배차 기준 거리(단위 m 이내) : </td>
						<td><input type="text" name="bc_distance" value="" maxlength="2" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>2차 배차 전송 duration(단위 : *초 후 전송) : </td>
						<td><input type="text" name="bc_time" value="" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
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
						<td>가맹비 은행 : </td>
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
						<td>가맹비 계좌 번호 : </td>
						<td><input type="text" name="v_account" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; border: none;' readonly="readonly"></td>
					</tr>
					<tr>
					<!-- 
					<tr>
                  		<td>가상계좌 예금주 : </td>
                  		<td><input type="text" name="v_name" value="" maxlength="20" class="readonly" style="border: none;"></td>
              		</tr>
					 -->
					<tr>
						<td>s_sequence : </td>
						<td><input type="text" name="s_sequence" value="" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>r_sequence : </td>
						<td><input type="text" name="r_sequence" value="" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					
					<tr>
						<td>계약 시작 일자 : </td>
						<td><input type="text" name="contract_sdate" id="contract_sdate_up" value="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>계약 종료 일자 : </td>
						<td><input type="text" name="contract_edate" id="contract_edate_up" value="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					
					<!-- 
					<tr>
						<td>등록 일자 : </td>
						<td><input type="text" name="insert_date" value=""></td>
					</tr>
					 -->
					<tr>
						<td>서비스 시작 일자 : </td>
						<td><input type="text" name="service_start_date" id="service_start_date_up" value="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					
					<tr>
						<td><input type="hidden" name="update_date" value=""></td>
					</tr>
					<!-- 
					<tr>
						<td>등록 운영자 ID : </td>
						<td><input type="text" name="r_op_id" value=""></td>
					</tr>
					-->
					<tr>
						<td><input type="hidden" name="u_op_id" value=""></td>
					</tr>
					
					<tr>
						<td>정산 주기 : </td>
						<td>
							<select name="calculate_period">
								<option value="">선택</option>
								<option value="1">일단위 정산</option>
								<option value="2">주단위 정산</option>
								<option value="3">월단위 정산</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>정산 날짜 : </td>
						<td>
							<select name="calculate_date">
								<option value="">선택</option>
								<option value="1">일단위</option>
								<option value="2">주단위</option>
								<option value="3">월단위</option>
							</select>
						</td>
					</tr>
						<input type="hidden" name="b_address" value="">
						<input type="hidden" name="location_x" value="">
						<input type="hidden" name="location_y" value="">
					</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="수정" class="blue small btn" id="act_update"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_up"></td>
					</tr>
				</table>
				<input type="hidden" name="gu_code" value="">
				<input type="hidden" name="searchFlag" value="">
				<input type="hidden" name="searchContent" value="">
				<input type="hidden" name="pageNo" value="">
			</form>
		</div>
	</div>
	