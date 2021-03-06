<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	var date = new Date();
	var year = new String(date.getFullYear());
	var year2 = new String(date.getFullYear()+1);
	var month =  new String(date.getMonth()+1);
	var date =  new String(date.getDate());
	//if(date.length == 1){
		if(month.length == 1 && date.length == 1) {
			var today = year + "0" + month + "0" + date;
			var today2 = year2 + "0" + month + "0" + date;
		}else if(month.length == 1 && date.length != 1) {
			var today = year + "0" + month  + date;
			var today2 = year2 + "0" + month + date;
		}else if(month.length != 1 && date.length == 1) {
			var today = year + month  + "0" + date;
			var today2 = year2 + month + "0" + date;
		}else {
			var today = year + month + date;
			var today2 = year2 + month  + date;
		}
		/*
	}else if(month.length == 1){
		var today = year + "0" + month  + date;
		var today2 = year2 + "0" + month + date;
	}else {
		var today = year  + month +  date;
		var today2 = year2 + month + date;
	}
	*/
	$("#InsertForm").find("input[name=contract_sdate]").val(today);
	$("#InsertForm").find("input[name=contract_edate]").val(today2);
	$("#InsertForm").find("input[name=service_start_date]").val(today);
	$("#InsertForm").find("input[name=b_id]").val("${b_seq}");
	
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	if("${bidFlag}" != null && "${bidFlag}" != '') $("select[name=bidFlag]").val("${bidFlag}").attr("selected","selected");

	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var b_id = $(this).parent().find(".b_id").val();
			var v_bank = $(this).parent().find(".v_bank").val();
			var v_account = $(this).parent().find(".v_account").val();
			var calculatepercall = $(this).parent().find(".calculatepercall").val();
			var v_name = $(this).parent().find(".v_name").val();
			var b_representative = $(this).parent().find(".b_representative").val();
			var contract_sdate = $(this).parent().find(".contract_sdate").val();
			var contract_edate = $(this).parent().find(".contract_edate").val();
			var org_v_name = $(this).parent().find(".org_v_name").val();
			var org_contract_sdate = $(this).parent().find(".org_contract_sdate").val();
			var org_contract_edate = $(this).parent().find(".org_contract_edate").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var bidFlag = $("#searchForm").find("select[name=bidFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=bidFlag]").val(bidFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			$("#mainForm").find("input[name=b_id]").val(b_id);
			$("#mainForm").find("input[name=v_bank]").val(v_bank);
			$("#mainForm").find("input[name=v_account]").val(v_account);
			$("#mainForm").find("input[name=calculatepercall]").val(calculatepercall);
			$("#mainForm").find("input[name=v_name]").val(v_name);
			$("#mainForm").find("input[name=b_representative]").val(b_representative);
			$("#mainForm").find("input[name=org_v_name]").val(org_v_name);
			$("#mainForm").find("input[name=contract_sdate]").val(contract_sdate);
			$("#mainForm").find("input[name=contract_edate]").val(contract_edate);
			$("#mainForm").find("input[name=org_contract_sdate]").val(org_contract_sdate);
			$("#mainForm").find("input[name=org_contract_edate]").val(org_contract_edate);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deletebranchoffice").submit();	
		}
    });
	
	function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 2);
            tmp += '-';
            tmp += str.substr(5);
            return tmp;
        }
        return str;
    }

	var b_crn = document.getElementById('b_crn');
	b_crn.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenPhone(_val) ;
}
	
	var b_crn2 = document.getElementById('b_crn2');
	b_crn2.onkeyup = function(event){
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenPhone(_val) ;
}
	
	$("#act_insert").click(function(){
		var q,lat,lng,return_url,location_x,location_y;
		var date = new Date();
		var year = new String(date.getFullYear());
		var month =  new String(date.getMonth()+1);
		var date =  new String(date.getDate());
		/*
		if(date.length == 1){
			var today = year + month + "0" + date;
		}else if(month.length == 1){
			var today = year + "0" + month  + date;
		}else {
			var today = year  + month +  date;
		} 
		*/
		
		if(month.length == 1 && date.length == 1) {
			var today = year + "0" + month + "0" + date;
		}else if(month.length == 1 && date.length != 1) {
			var today = year + "0" + month  + date;
		}else if(month.length != 1 && date.length == 1) {
			var today = year + month  + "0" + date;
		}else {
			var today = year + month + date;
		}
		
		var contract_sdate = $("#InsertForm").find("input[name=contract_sdate]").val();
		var contract_edate = $("#InsertForm").find("input[name=contract_edate]").val();
		var basic_distance = $("#InsertForm").find("input[name=basic_distance]").val();
		var v_bank = $("#InsertForm").find("select[name=v_bank]").val();
		//var v_name = $("#InsertForm").find("input[name=v_name]").val();
		//var dupchk_flag = $("#searchForm").find("input[name=dupchk_flag]").val();
		var login_id = $("#InsertForm").find("input[name=login_id]").val().trim();
		$("#InsertForm").find("input[name=login_id]").val(login_id);
		var login_passwd = $("#InsertForm").find("input[name=login_passwd]").val().trim();
		$("#InsertForm").find("input[name=login_passwd]").val(login_passwd);
		var b_name = $("#InsertForm").find("input[name=b_name]").val().trim();
		$("#InsertForm").find("input[name=b_name]").val(b_name);
		var b_representative = $("#InsertForm").find("input[name=b_representative]").val().trim();
		$("#InsertForm").find("input[name=b_representative]").val(b_representative);
		var b_addr_appendix = $("#InsertForm").find("input[name=b_addr_appendix]").val().trim();
		$("#InsertForm").find("input[name=b_addr_appendix]").val(b_addr_appendix);
		var closetime = new String($("#InsertForm").find("select[name=close_time_h]").val()) + new String($("#InsertForm").find("select[name=close_time_m]").val());
		var close_time = $("#InsertForm").find("input[name=close_time]").val(closetime);
		var insert_date = $("#InsertForm").find("input[name=insert_date]").val(today);
		var update_date = $("#InsertForm").find("input[name=update_date]").val(today);
		var r_op_id = $("#InsertForm").find("input[name=r_op_id]").val("${username}");
		var u_op_id = $("#InsertForm").find("input[name=u_op_id]").val("${username}");
		var b_id = $("#InsertForm").find("input[name=b_id]").val("${b_seq}");
		var addr_chk_flag = $("#InsertForm").find("input[name=addr_chk_flag]").val();
		var dupchk_flag = $("#searchForm").find("input[name=dupchk_flag]").val();
		var b_crn = $("#InsertForm").find("input[name=b_crn]").val();
		
		if(b_name == '') {
			alert("지점 이름을 입력해주세요.");
			$("#InsertForm").find("input[name=b_name]").focus();
			return false;
		}
		
		if(addr_chk_flag != '1') {
			alert("주소를 선택해주세요.");
			return false;
		}
		
		if (b_crn != '') {
			if (b_crn.length != 12) {
		        alert("사업자 번호는 10자리 이어야 합니다.");
		        $("#InsertForm").find("input[name=b_crn]").focus();
		        return false;
		    }
		}
		
		if(login_id == '') {
			alert("로그인 계정을 입력해 주세요.");
			$("#InsertForm").find("input[name=login_id]").focus();
			return false;
		}
		
		if(dupchk_flag != '1') {
			alert("로그인 계정 중복확인을 해주세요.");
			return false;
		}
		if(addr_chk_flag == '1') {
			var b_addr_appendix = $("#InsertForm").find("input[name=b_addr_appendix]").val().trim();
			$("#InsertForm").find("input[name=b_addr_appendix]").val(b_addr_appendix);
			var q = $("#InsertForm").find("input[name=sample4_jibunAddress]").val().trim();
			var b_address = q + " " + $("#InsertForm").find("input[name=b_addr_appendix]").val().trim();
			$("#InsertForm").find("input[name=b_address]").val(b_address);
			//var url ="http://apis.daum.net/local/geo/addr2coord?apikey=780b74dbe8ca7d669e9524afece6c1b0513b61b0&q="+q+"&output=json";
			//var url ="http://apis.daum.net/local/geo/addr2coord?apikey=f8501504ca36b8914665e6d46fad1f0a&q="+encodeURIComponent(q)+"&output=json";
			var url ="http://apis.daum.net/local/geo/addr2coord?apikey=d4e2977331428caa9436ce9d118a9cf8&q="+encodeURIComponent(q)+"&output=json";
			
	        $.getJSON(url+"&callback=?", function(data) {
	        	var totalCount = data["channel"].totalCount;
	        	if(totalCount == 0) {
	        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
	    			return false;
	    		}
	        	
	        	if(totalCount > 1) {
	        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 중복 수집).");
	    			return false;
	    		}
	        		
	          $('#list li').remove();
	          $.each(data.channel.item, function(i,item) {
	            lat = item.point_y;
	            lng = item.point_x;
	            $('#list').append('<li>'+item.title+'(위도:'+lat+' / 경도:'+lng+') 새주소 : '+item.newAddress);
				
	        	location_x = $("#InsertForm").find("input[name=location_x]").val(lng);
	    		location_y = $("#InsertForm").find("input[name=location_y]").val(lat);
	    		
	    		if((item.point_x == "" && item.point_y=="") ||(item.point_x == null && item.point_y==null)) {
	    			alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
	    			return false;
	    		}
	    		
	    		if(item.localName_3 != null || item.localName_3 != '') {
	    			var localname = item.localName_3.split(' ');
	    			if(item.localName_3.indexOf(" ") != -1) {
	    				$("#InsertForm").find("input[name=b_town_code]").val(localname[0]);
	    				$("#InsertForm").find("input[name=b_dong_code]").val(localname[1]);
	    			}else {
	    				$("#InsertForm").find("input[name=b_town_code]").val("");
	    				$("#InsertForm").find("input[name=b_dong_code]").val(item.localName_3);
	    			}
	    		}
	    		
	    		var url_return = "https://apis.daum.net/local/geo/coord2detailaddr?apikey=d4e2977331428caa9436ce9d118a9cf8&x="+item.point_x+"&y="+item.point_y+"&inputCoordSystem=WGS84&output=json"
	   			
	    				$.getJSON(url_return+"&callback=?", function(data) {
	        		  	var new_name = data["new"].name;
	        		  	var new_roadName = data["new"].roadName;
		            	var new_bunji = data["new"].bunji;
		            	var new_ho = data["new"].ho;
		            
		            	
		            	var old_name = data["old"].name;
		            	var old_bunji = data["old"].bunji;
		            	var old_ho = data["old"].ho;  	
		            	var old_san = data["old"].san;
		            	
		            	if(old_san == "Y")old_san=1;
		            	else old_san=0;
		    			
		            	if(b_name == '') {
		        			alert("지점 이름을 입력해주세요.");
		        			$("#InsertForm").find("input[name=b_name]").focus();
		        			return false;
		        		}
		            	
		            	if(login_id == '') {
		        			alert("로그인 계정을 입력해 주세요.");
		        			$("#InsertForm").find("input[name=login_id]").focus();
		        			return false;
		        		}
		        		
		        		if(dupchk_flag != '1') {
		        			alert("로그인 계정 중복확인을 해주세요.");
		        			return false;
		        		}
		    			
		    			if(login_id != '') {
		    				if(login_passwd == '') {
		    					alert("로그인 비밀번호를 입력해주세요.");
		    					$("#InsertForm").find("input[name=login_passwd]").focus();
		    					return false;
		    				}
		    			}
		    			
		    			if (b_crn != '') {
		    				if (b_crn.length != 12) {
		    			        alert("사업자 번호는 10자리 이어야 합니다.");
		    			        $("#InsertForm").find("input[name=b_crn]").focus();
		    			        return false;
		    			    }
		    			}
		    			
		    			if(basic_distance == ''){
		    				alert("기준거리를 입력해주세요.");
		    				$("#InsertForm").find("input[name=basic_distance]").focus();
		    				return false;
		    			}
		    			
		    			if(v_bank == '') {
		    	    		alert("가상계좌 은행을 선택해주세요.");
		    	    		return false;
		    	    	}
		    			
		    			if(b_representative == ''){
		    				alert("대표자 이름을 입력해주세요.");
		    				$("#InsertForm").find("input[name=b_representative]").focus();
		    				return false;
		    			}
		    			
		    			if(contract_sdate > contract_edate) {
		    				alert("계약 종료 일자가 계약 시작 일자보다 작을 수 없습니다.");
		    				return false;
		    			};
		    			
		    			
		    			
		    			if($("#InsertForm").find("select[name=open_time_h]").val().length == 1 && $("#InsertForm").find("select[name=open_time_m]").val().length == 1) {
		    				var opentime = "0" + new String($("#InsertForm").find("select[name=open_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=open_time_m]").val());
		    			}else if($("#InsertForm").find("select[name=open_time_h]").val().length == 1) {
		    				var opentime = "0" + new String($("#InsertForm").find("select[name=open_time_h]").val()) + new String($("#InsertForm").find("select[name=open_time_m]").val());
		    			}else if($("#InsertForm").find("select[name=open_time_m]").val().length == 1) {
		    				var opentime = new String($("#InsertForm").find("select[name=open_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=open_time_m]").val());
		    			}else {
		    				var opentime = new String($("#InsertForm").find("select[name=open_time_h]").val()) + new String($("#InsertForm").find("select[name=open_time_m]").val());
		    			}
		    			var open_time = $("#InsertForm").find("input[name=open_time]").val(opentime);
		    			
		    			if($("#InsertForm").find("select[name=close_time_h]").val().length == 1 && $("#InsertForm").find("select[name=close_time_m]").val().length == 1) {
		    				var closetime = "0" + new String($("#InsertForm").find("select[name=close_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=close_time_m]").val());
		    			}else if($("#InsertForm").find("select[name=close_time_h]").val().length == 1) {
		    				var closetime = "0" + new String($("#InsertForm").find("select[name=close_time_h]").val()) + new String($("#InsertForm").find("select[name=close_time_m]").val());
		    			}else if($("#InsertForm").find("select[name=close_time_m]").val().length == 1) {
		    				var closetime = new String($("#InsertForm").find("select[name=close_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=close_time_m]").val());
		    			}else {
		    				var closetime = new String($("#InsertForm").find("select[name=close_time_h]").val()) + new String($("#InsertForm").find("select[name=close_time_m]").val());
		    			}
		    			var close_time = $("#InsertForm").find("input[name=close_time]").val(closetime);
		    		
		    		
		    			$("input[name=action]").val("INSERT");
		    			b_crn = b_crn.replace(/\-/g,''); //특정문자 제거
		    			$("#InsertForm").find("input[name=b_crn]").val(b_crn);
		    			$("#InsertForm").submit();
	    				 }); 
	   	   });  
	   	 }) ;
		}else {
			if(login_id != '' && dupchk_flag != '0') {
				if(login_passwd == '') {
					alert("로그인 비밀번호를 입력해주세요.");
					$("#InsertForm").find("input[name=login_passwd]").focus();
					return false;
				}
			}
			
			if (b_crn != '') {
				if (b_crn.length != 12) {
			        alert("사업자 번호는 10자리 이어야 합니다.");
			        $("#InsertForm").find("input[name=b_crn]").focus();
			        return false;
			    }
			}
			
			if(basic_distance == ''){
				alert("기준거리를 입력해주세요.");
				$("#InsertForm").find("input[name=basic_distance]").focus();
				return false;
			}
			
			if(v_bank == '') {
	    		alert("가상계좌 은행을 선택해주세요.");
	    		return false;
	    	}
			
			if(b_representative == ''){
				alert("대표자 이름을 입력해주세요.");
				$("#InsertForm").find("input[name=b_representative]").focus();
				return false;
			}
			
			if(contract_sdate > contract_edate) {
				alert("계약 종료 일자가 계약 시작 일자보다 작을 수 없습니다.");
				return false;
			};
			
			if($("#InsertForm").find("select[name=open_time_h]").val().length == 1 && $("#InsertForm").find("select[name=open_time_m]").val().length == 1) {
				var opentime = "0" + new String($("#InsertForm").find("select[name=open_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=open_time_m]").val());
			}else if($("#InsertForm").find("select[name=open_time_h]").val().length == 1) {
				var opentime = "0" + new String($("#InsertForm").find("select[name=open_time_h]").val()) + new String($("#InsertForm").find("select[name=open_time_m]").val());
			}else if($("#InsertForm").find("select[name=open_time_m]").val().length == 1) {
				var opentime = new String($("#InsertForm").find("select[name=open_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=open_time_m]").val());
			}else {
				var opentime = new String($("#InsertForm").find("select[name=open_time_h]").val()) + new String($("#InsertForm").find("select[name=open_time_m]").val());
			}
			var open_time = $("#InsertForm").find("input[name=open_time]").val(opentime);
			
			if($("#InsertForm").find("select[name=close_time_h]").val().length == 1 && $("#InsertForm").find("select[name=close_time_m]").val().length == 1) {
				var closetime = "0" + new String($("#InsertForm").find("select[name=close_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=close_time_m]").val());
			}else if($("#InsertForm").find("select[name=close_time_h]").val().length == 1) {
				var closetime = "0" + new String($("#InsertForm").find("select[name=close_time_h]").val()) + new String($("#InsertForm").find("select[name=close_time_m]").val());
			}else if($("#InsertForm").find("select[name=close_time_m]").val().length == 1) {
				var closetime = new String($("#InsertForm").find("select[name=close_time_h]").val()) + "0" + new String($("#InsertForm").find("select[name=close_time_m]").val());
			}else {
				var closetime = new String($("#InsertForm").find("select[name=close_time_h]").val()) + new String($("#InsertForm").find("select[name=close_time_m]").val());
			}
			var close_time = $("#InsertForm").find("input[name=close_time]").val(closetime);
		
		
			$("input[name=action]").val("INSERT");
			$("#InsertForm").find("input[name=location_x]").val("0");
			$("#InsertForm").find("input[name=location_y]").val("0");
			b_crn = b_crn.replace(/\-/g,''); //특정문자 제거
			$("#InsertForm").find("input[name=b_crn]").val(b_crn);
			$("#InsertForm").submit();
		}
    }) ;
	
	$("#act_rechrg").click(function(){
		var b_balance = $("#RechrgForm").find("input[name=b_balance]").val();
		var b_id = $("#RechrgForm").find("input[name=b_id]").val();
		var username = $("#RechrgForm").find("input[name=username]").val("${username}");
		var b_name = $("#RechrgForm").find("input[name=b_name]").val($("#mainForm").find("input[name=b_name]").val());
		var b_balance_rechrg = $("#RechrgForm").find("input[name=b_balance_rechrg]").val();
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var bidFlag = $("#searchForm").find("select[name=bidFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		var tot_b_balance = Number(b_balance)+Number(b_balance_rechrg);
		
		if(b_balance_rechrg == '') {
			alert("충전 할 금액를 입력해주세요.");
			$("#RechrgForm").find("input[name=b_balance_rechrg]").focus();
			return false;
		}
		
		if(tot_b_balance > 9999999999 || String(tot_b_balance).length > 10) {
			alert("충전 가능 금액을 초과하였습니다.\n최대 충전 가능 금액은 9,999,999,999원 입니다.");
			$("#RechrgForm").find("input[name=b_balance_rechrg]").focus();
			return false;
		}
		
		$("#RechrgForm").find("input[name=searchFlag]").val(searchFlag);
		$("#RechrgForm").find("input[name=bidFlag]").val(bidFlag);
		$("#RechrgForm").find("input[name=searchContent]").val(searchContent);
		$("#RechrgForm").find("input[name=pageNo]").val(pageNo);
		$("input[name=action]").val("RECHRG");
		$("#RechrgForm").submit();
		
	});
	
	$("#act_dupchk").click(function(){
		var param = $("#DupForm").find("input[name=login_id_chk]").val();
		fn_setGuAddr(param, this);
		
		var tmpVal =$("#DupForm").find("input[name=login_id_chk]").val();
		$(this).next().next().next().val(tmpVal);
		
	});
	
	
	$("#act_update").click(function(){
		var q,lat,lng,return_url;
		var date = new Date();
		var year = new String(date.getFullYear());
		var month =  new String(date.getMonth()+1);
		var date =  new String(date.getDate());
		
		if(month.length == 1 && date.length == 1) {
			var today = year + "0" + month + "0" + date;
		}else if(month.length == 1 && date.length != 1) {
			var today = year + "0" + month  + date;
		}else if(month.length != 1 && date.length == 1) {
			var today = year + month  + "0" + date;
		}else {
			var today = year + month + date;
		}
		var contract_sdate = $("#UpdateForm").find("input[name=contract_sdate]").val();
		var contract_edate = $("#UpdateForm").find("input[name=contract_edate]").val();
		var basic_distance = $("#UpdateForm").find("input[name=basic_distance]").val();
		var closetime = new String($("#UpdateForm").find("select[name=close_time_h]").val()) + new String($("#UpdateForm").find("select[name=close_time_m]").val());
		var close_time = $("#UpdateForm").find("input[name=close_time]").val(closetime);
		var insert_date = $("#UpdateForm").find("input[name=insert_date]").val(today);
		var update_date = $("#UpdateForm").find("input[name=update_date]").val(today);
		var r_op_id = $("#UpdateForm").find("input[name=r_op_id]").val("${username}");
		var u_op_id = $("#UpdateForm").find("input[name=u_op_id]").val("${username}");
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var bidFlag = $("#searchForm").find("select[name=bidFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		var v_bank = $("#UpdateForm").find("select[name=v_bank]").val();
		var b_name = $("#UpdateForm").find("input[name=b_name]").val().trim();
		var addr_chk_flag = $("#UpdateForm").find("input[name=addr_chk_flag]").val();
		$("#UpdateForm").find("input[name=b_name]").val(b_name);
		var login_passwd = $("#UpdateForm").find("input[name=login_passwd]").val().trim();
		$("#UpdateForm").find("input[name=login_passwd]").val(login_passwd);
		var b_representative = $("#UpdateForm").find("input[name=b_representative]").val().trim();
		$("#UpdateForm").find("input[name=b_representative]").val(b_representative);
		var loction_x = $("#UpdateForm").find("input[name=location_x]").val();
		var loction_y = $("#UpdateForm").find("input[name=location_y]").val();
		var b_addr_appendix = $("#UpdateForm").find("input[name=b_addr_appendix]").val().trim();
		$("#UpdateForm").find("input[name=b_addr_appendix]").val(b_addr_appendix);
		var b_crn = $("#UpdateForm").find("input[name=b_crn]").val();
		
		if(addr_chk_flag == '1') {
			
			if(b_name == '') {
				alert("지점 이름을 입력해주세요.");
				$("#UpdateForm").find("input[name=b_name]").focus();
				return false;
			}
			
			if (b_crn != '') {
				if (b_crn.length != 12) {
			        alert("사업자 번호는 10자리 이어야 합니다.");
			        $("#UpdateForm").find("input[name=b_crn]").focus();
			        return false;
			    }
			}
				
			if(basic_distance == ''){
				alert("기준거리를 입력해주세요.");
				$("#UpdateForm").find("input[name=basic_distance]").focus();
				return false;
			}
			
			if(v_bank == '') {
	    		alert("가상계좌 은행을 선택해주세요.");
	    		return false;
	    	}
		
			if(b_representative == ''){
				alert("대표자 이름을 입력해주세요.");
				$("#UpdateForm").find("input[name=b_representative]").focus();
				return false;
			}
			
			if(contract_sdate > contract_edate) {
				alert("계약 종료 일자가 계약 시작 일자보다 작을 수 없습니다.");
				return false;
			};
			
			
			
		/*2016.08.03 지점주소 좌표 구하기 위해 추가*/
		var q = $("#UpdateForm").find("input[name=sample4_jibunAddress]").val();
		var b_addr_appendix =  $("#UpdateForm").find("input[name=b_addr_appendix_up]").val().trim();
		$("#UpdateForm").find("input[name=b_addr_appendix]").val(b_addr_appendix);
		var b_address = q + " " + $("#UpdateForm").find("input[name=b_addr_appendix_up]").val().trim();
		$("#UpdateForm").find("input[name=b_address]").val(b_address);
		
		
		var url ="http://apis.daum.net/local/geo/addr2coord?apikey=d4e2977331428caa9436ce9d118a9cf8&q="+encodeURIComponent(q)+"&output=json";
        $.getJSON(url+"&callback=?", function(data) {
        	var totalCount = data["channel"].totalCount;
        	if(totalCount == 0) {
        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
    			return false;
    		}
        	
        	if(totalCount > 1) {
        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 중복 수집).");
    			return false;
    		}
        	
          $('#list li').remove();
          $.each(data.channel.item, function(i,item) {
            lat = item.point_y;
            lng = item.point_x;
            $('#list').append('<li>'+item.title+'(위도:'+lat+' / 경도:'+lng+') 새주소 : '+item.newAddress);
           
        	$("#UpdateForm").find("input[name=location_x]").val(lng);
    		$("#UpdateForm").find("input[name=location_y]").val(lat);
    		
    		if((item.point_x == "" && item.point_y=="") ||(item.point_x == null && item.point_y==null)) {
    			alert("주소 좌표 검증 실패 입니다.");
    			return false;
    		}
    		
    		if(item.localName_3 != null || item.localName_3 != '') {
    			var localname = item.localName_3.split(' ');
    			if(item.localName_3.indexOf(" ") != -1) {
    				$("#UpdateForm").find("input[name=b_town_code]").val(localname[0]);
    				$("#UpdateForm").find("input[name=b_dong_code]").val(localname[1]);
    			}else {
    				$("#UpdateForm").find("input[name=b_town_code]").val("");
    				$("#UpdateForm").find("input[name=b_dong_code]").val(item.localName_3);
    			}
    		}
    		
    		var url_return = "https://apis.daum.net/local/geo/coord2detailaddr?apikey=d4e2977331428caa9436ce9d118a9cf8&x="+item.point_x+"&y="+item.point_y+"&inputCoordSystem=WGS84&output=json"
   			 $.getJSON(url_return+"&callback=?", function(data) {
        		  	var new_name = data["new"].name;
        		  	var new_roadName = data["new"].roadName;
	            	var new_bunji = data["new"].bunji;
	            	var new_ho = data["new"].ho;
	        	
	            	var old_name = data["old"].name;
	            	var old_bunji = data["old"].bunji;
	            	var old_ho = data["old"].ho;  	
	            	var old_san = data["old"].san;
	            	
	            	if(old_san == "Y")old_san=1;
	            	else old_san=0;
	            	
	            	var old_nameArray=old_name.split(' ');		
	            	
	            	if(v_bank == '') {
	            		alert("가상계좌 은행을 선택해주세요.");
	            		return false;
	            	}
	        		
	        		if(basic_distance == ''){
	        			alert("기준거리를 입력해주세요.");
	        			$("#UpdateForm").find("input[name=basic_distance]").focus();
	        			return false;
	        		}
	        		
	        		if(contract_sdate > contract_edate) {
	        			alert("계약 종료 일자가 계약 시작 일자보다 작을 수 없습니다.");
	        			return false;
	        		};
	        		
	        		if($("#UpdateForm").find("select[name=open_time_h]").val().length == 1 && $("#UpdateForm").find("select[name=open_time_m]").val().length == 1) {
	        			var opentime = "0" + new String($("#UpdateForm").find("select[name=open_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=open_time_m]").val());
	        		}else if($("#UpdateForm").find("select[name=open_time_h]").val().length == 1) {
	        			var opentime = "0" + new String($("#UpdateForm").find("select[name=open_time_h]").val()) + new String($("#UpdateForm").find("select[name=open_time_m]").val());
	        		}else if($("#UpdateForm").find("select[name=open_time_m]").val().length == 1) {
	        			var opentime = new String($("#UpdateForm").find("select[name=open_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=open_time_m]").val());
	        		}else {
	        			var opentime = new String($("#UpdateForm").find("select[name=open_time_h]").val()) + new String($("#UpdateForm").find("select[name=open_time_m]").val());
	        		}
	        		var open_time = $("#UpdateForm").find("input[name=open_time]").val(opentime);
	        		
	        		if($("#UpdateForm").find("select[name=close_time_h]").val().length == 1 && $("#UpdateForm").find("select[name=close_time_m]").val().length == 1) {
	        			var closetime = "0" + new String($("#UpdateForm").find("select[name=close_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=close_time_m]").val());
	        		}else if($("#UpdateForm").find("select[name=close_time_h]").val().length == 1) {
	        			var closetime = "0" + new String($("#UpdateForm").find("select[name=close_time_h]").val()) + new String($("#UpdateForm").find("select[name=close_time_m]").val());
	        		}else if($("#UpdateForm").find("select[name=close_time_m]").val().length == 1) {
	        			var closetime = new String($("#UpdateForm").find("select[name=close_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=close_time_m]").val());
	        		}else {
	        			var closetime = new String($("#UpdateForm").find("select[name=close_time_h]").val()) + new String($("#UpdateForm").find("select[name=close_time_m]").val());
	        		}
	        		var close_time = $("#UpdateForm").find("input[name=close_time]").val(closetime);
	        		
	        		$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
	        		$("#UpdateForm").find("input[name=bidFlag]").val(bidFlag);
	        		$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
	        		$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
	        		$("input[name=action]").val("UPDATE");
	        		b_crn = b_crn.replace(/\-/g,''); //특정문자 제거
	    			$("#UpdateForm").find("input[name=b_crn]").val(b_crn);
	        		$("#UpdateForm").submit();
   			}); 
          });  
        }) ;	
        
   			 }else {
   				 
   				if(b_name == '') {
   					alert("지점 이름을 입력해주세요.");
   					$("#UpdateForm").find("input[name=b_name]").focus();
   					return false;
   				} 
   				 
   				if (b_crn != '') {
   					if (b_crn.length != 12) {
   				        alert("사업자 번호는 10자리 이어야 합니다.");
   				     	$("#UpdateForm").find("input[name=b_crn]").focus();
   				        return false;
   				    }
   				}
   				
   				if(basic_distance == ''){
   					alert("기준거리를 입력해주세요.");
   					$("#UpdateForm").find("input[name=basic_distance]").focus();
   					return false;
   				}
   				
   				if(v_bank == '') {
   		    		alert("가상계좌 은행을 선택해주세요.");
   		    		return false;
   		    	}
   				
   				if(b_representative == ''){
   					alert("대표자 이름을 입력해주세요.");
   					$("#UpdateForm").find("input[name=b_representative]").focus();
   					return false;
   				}
   				
   				if(contract_sdate > contract_edate) {
   					alert("계약 종료 일자가 계약 시작 일자보다 작을 수 없습니다.");
   					return false;
   				};
   				
   				if($("#UpdateForm").find("select[name=open_time_h]").val().length == 1 && $("#UpdateForm").find("select[name=open_time_m]").val().length == 1) {
   					var opentime = "0" + new String($("#UpdateForm").find("select[name=open_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=open_time_m]").val());
   				}else if($("#UpdateForm").find("select[name=open_time_h]").val().length == 1) {
   					var opentime = "0" + new String($("#UpdateForm").find("select[name=open_time_h]").val()) + new String($("#UpdateForm").find("select[name=open_time_m]").val());
   				}else if($("#UpdateForm").find("select[name=open_time_m]").val().length == 1) {
   					var opentime = new String($("#UpdateForm").find("select[name=open_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=open_time_m]").val());
   				}else {
   					var opentime = new String($("#UpdateForm").find("select[name=open_time_h]").val()) + new String($("#UpdateForm").find("select[name=open_time_m]").val());
   				}
   				var open_time = $("#UpdateForm").find("input[name=open_time]").val(opentime);
   				
   				if($("#UpdateForm").find("select[name=close_time_h]").val().length == 1 && $("#UpdateForm").find("select[name=close_time_m]").val().length == 1) {
   					var closetime = "0" + new String($("#UpdateForm").find("select[name=close_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=close_time_m]").val());
   				}else if($("#UpdateForm").find("select[name=close_time_h]").val().length == 1) {
   					var closetime = "0" + new String($("#UpdateForm").find("select[name=close_time_h]").val()) + new String($("#UpdateForm").find("select[name=close_time_m]").val());
   				}else if($("#UpdateForm").find("select[name=close_time_m]").val().length == 1) {
   					var closetime = new String($("#UpdateForm").find("select[name=close_time_h]").val()) + "0" + new String($("#UpdateForm").find("select[name=close_time_m]").val());
   				}else {
   					var closetime = new String($("#UpdateForm").find("select[name=close_time_h]").val()) + new String($("#UpdateForm").find("select[name=close_time_m]").val());
   				}
   				var close_time = $("#UpdateForm").find("input[name=close_time]").val(closetime);
   				
   				var b_town_code_up = $("#UpdateForm").find("input[name=b_town_code_up]").val();
   				$("#UpdateForm").find("input[name=b_town_code]").val(b_town_code_up);
   				var b_city_code_up = $("#UpdateForm").find("input[name=b_city_code_up]").val();
   				$("#UpdateForm").find("input[name=b_city_code]").val(b_city_code_up);
   				var b_dong_code_up = $("#UpdateForm").find("input[name=b_dong_code_up]").val();
   				$("#UpdateForm").find("input[name=b_dong_code]").val(b_dong_code_up);
   				var b_gu_code_up = $("#UpdateForm").find("input[name=b_gu_code_up]").val();
   				$("#UpdateForm").find("input[name=b_gu_code]").val(b_gu_code_up);
   				
   				$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
   				$("#UpdateForm").find("input[name=bidFlag]").val(bidFlag);
   				$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
   				$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
   				$("input[name=action]").val("UPDATE");
   				b_crn = b_crn.replace(/\-/g,''); //특정문자 제거
    			$("#UpdateForm").find("input[name=b_crn]").val(b_crn);
   				$("#UpdateForm").submit();
   			 }		
		
    }) ;
	
	 $("#searchFlag option:selected").each(function(){ 
	        if($(this).val() == '2') {
	        	$("#bidFlag").show();
	        	$("#searchContent").hide();
	        	if("${bidFlag}" == '1') {
	        		$("#bidFlag").html("<option value=''>전체</option><option value='1' selected='selected'>본사 직영</option><option value='2'>유치된 지점</option>");
	        	}else if("${bidFlag}" == '2') {
	        		$("#bidFlag").html("<option value=''>전체</option><option value='1'>본사 직영</option><option value='2' selected='selected'>유치된 지점</option>");
	        	}else {
	        		$("#bidFlag").html("<option value='' selected='selected'>전체</option><option value='1'>본사 직영</option><option value='2'>유치된 지점</option>");
	        	}
	        }else {
	        	$("#bidFlag").hide();
	        	$("#searchContent").show();
	        }
	    });  
	
	$("#searchFlag").change(function(){ 
	    $("#searchFlag option:selected").each(function(){ 
	        if($(this).val() == '2') {
	        	$("#bidFlag").show();
	        	$("#searchContent").hide();
	        	$("#bidFlag").html("<option value=''>전체</option><option value='1'>본사 직영</option><option value='2'>유치된 지점</option>");
	        }else {
	        	$("#bidFlag").hide();
	        	$("#searchContent").show();
	        }
	    });  
	});
	
	/*
	function fn_setGuAddr(param,obj){		
		$.ajax({
			type:"POST",
			url:"iddupchkbranchoffice",
			cache:false,
			data:{
				js_sido:param
			},
			success:function(data, status){
				if(data > 0) {
					alert("이미 등록된 로그인 계정입니다. 다른 계정을 입력해 주세요.");
					$("#InsertForm").find("input[name=login_id]").val(param);
					$("#searchForm").find("input[name=dupchk_flag]").val("2");
					return false;
				}else {
						alert("사용가능한 로그인 계정입니다.");
						$("#InsertForm").find("input[name=login_id]").val(param);
						$("#searchForm").find("input[name=dupchk_flag]").val("1");
				}
			},
			error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
			
		});
	}
	*/
	
	
	
	function fn_setGuAddr(param,obj){		
		$.ajax({
			type:"POST",
			url:"iddupchkbranchoffice",
			cache:false,
			data:{
				js_sido:param
			},
			success:function(data, status){
				if(data > 0) {
					alert("이미 등록된 로그인 계정입니다.");
					$('#chk_text').text('이미 등록된 로그인 계정입니다.');
					$("#InsertForm").find("input[name=login_id]").val(param);
					$("#searchForm").find("input[name=dupchk_flag]").val("0");
					$("input[name=login_id]").attr("readonly",false);
					return false;
				}else {
					$('#chk_text').text('사용 가능한 로그인 계정입니다.');
					if(confirm("사용 가능한 로그인 계정입니다. 사용 하시겠습니까?")){
						$("#InsertForm").find("input[name=login_id]").val(param);
						$("#searchForm").find("input[name=dupchk_flag]").val("1");
						$("input[name=login_id]").attr("readonly",true);
						$('#Duppopup').bPopup().close();
					}
				}
			},
			error:function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
			
		});
	}
	
	
	$("#act_cancel_dupchk").click(function(){
		$('#Duppopup').bPopup().close();
	});
	
	/*숫자랑 하이픈만 허용*/
	$(function()
		{
			 $(document).on("keyup", "input:text[datetimeOnly]", function() {$(this).val( $(this).val().replace(/[^0-9\-]/gi,"") );});
		});

	$(document).ready(function()
	{
	    $('#account_flag').change(function(){
	        if($('#account_flag option:selected').val() == '2'){
	        	$(".addr_old").css("display","none");
	        	$(".addr_old2").css("display","");
	        }else {
	        	$(".addr_old2").css("display","none");
	        	$(".addr_old").css("display","");
	        }
	    });
	});
	
	
	$(document).ready(function()
			{
			    $('#account_flag2').change(function(){
			        if($('#account_flag2 option:selected').val() == '2'){
			        	$(".addr_old").css("display","none");
			        	$(".addr_old2").css("display","");
			        }else {
			        	$(".addr_old2").css("display","none");
			        	$(".addr_old").css("display","");
			        }
			    });
			});

});


</script>

</head>
<body>

	<form action="BranchOffice_main" id="searchForm" name="searchForm"
		method="POST">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<div id="searchFrame">
			<hr color=#ff0059 />
			<font id="font_little">지점 관리 <input TYPE="IMAGE"
				src="resources/images/arrow.PNG" width="15px" height="15px"
				align="absmiddle"> 지점 정보 관리
			</font>
			<hr color="#ff0059" />
			<table id="searchTable"
				style="background-color: #b8e2fc; margin-top: 20px;">
				<colgroup>
					<col width="1%">
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td></td>
					<td><br />
					<input TYPE="IMAGE" src="resources/images/search_btn.PNG"
						width="15px" height="15px" align="absmiddle"> 검색&nbsp;
						:&nbsp; <select name="searchFlag" id="searchFlag">
							<option value="1">지점 이름</option>
							<option value="8">지점 ID</option>
							<option value="2">지점 구분</option>
							<option value="4">사업자 번호</option>
							<option value="5">연락처1</option>
							<option value="6">연락처2</option>
							<option value="7">로그인 계정</option>
							<!-- 
							<option value="8">지점 상태</option>
							<option value="9">배차 방식</option>
							<option value="10">일괄 할증 설정</option>
							<option value="11">일괄 할증 금액</option>
							<option value="12">영업 시작 시간</option>
							<option value="13">영업 종료 시간</option>
							<option value="14">가상계좌 은행</option>
							<option value="15">가상계좌 번호</option>
							<option value="16">예금주</option>
							 -->
					</select> <select id="bidFlag" name="bidFlag" hidden></select> <input
						type="text" name="searchContent" id="searchContent"
						value="${searchContent}" size="20">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" value="검색" class="blue small btn" id="searchBtn"><br />
					<br /></td>
					<td></td>
				</tr>
			</table>
			<input type="hidden" name="pageNo" id="pageNo" value="${pageno}">
			<input type="hidden" name="pageSize" id="pageSize"
				value="${pageInfo.CURRENT}"> <input type="hidden"
				name="action" id="action" value=""> <input type="hidden"
				name="dupchk_flag" id="dupchk_flag" value="0">
		</div>
	</form>

	<form id="mainForm" name="mainForm" method="get">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="hidden" name="action" />
		<div id="mainFrame">
			<div>
				<font id="font_little">Total: ${totalCount }</font>
			</div>
			<table id="mainTable">
				<colgroup>
					<col width="4%">
					<col width="4%">
					<col width="13%">
					<col width="5%">
					<col width="8%">
					<col width="12%">
					<col width="10%">
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="12%">
				</colgroup>
				<tr>
					<th>No</th>
					<th>ID</th>
					<th>이름</th>
					<th>잔액</th>
					<th>구분</th>
					<th>주소</th>
					<th>사업자 번호</th>
					<th>연락처1</th>
					<th>연락처2</th>
					<th>로그인 계정</th>
					<th>관리</th>
				</tr>

				<c:if test="${totalCount < 1 }">
					<tr>
						<td colspan="10" style="text-align: center;">검색된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
					<c:forEach var="data" items="${list }" varStatus="status">

						<tr class="datalist" style="cursor: pointer;">
							<td>${(pageInfo.current*10)+status.count-10}</td>
							<td>${data.b_id}</td>
							<td><div
									style="width: 160px; text-overflow: ellipsis; overflow: hidden;">
									<nobr
										title="<c:out value="${data.b_name}">${data.b_name}</c:out>">
										<c:out value="${data.b_name}">${data.b_name}</c:out>
									</nobr>
								</div></td>
							<td>${data.b_balance}</td>
							<td><c:choose>
									<c:when test="${data.bid_flag == 0}">Admin지점</c:when>
									<c:when test="${data.bid_flag == 1}">본사 직영</c:when>
									<c:otherwise>유치된 지점</c:otherwise>
								</c:choose></td>
							<td>
								<div
									style="width: 200px; text-overflow: ellipsis; overflow: hidden;">
									<nobr
										title="<c:out value="${data.b_address}">${data.b_address}</c:out>">
										<c:out value="${data.b_address}">${data.b_address}</c:out>
									</nobr>
								</div>
							</td>	
							<c:set var="b_crn" value="${data.b_crn}"/>
							<c:set var="b_crn_len" value="${fn:length(b_crn)}"/>
							<c:choose>
								<c:when test="${b_crn_len == 10}">
									<td>${fn:substring(b_crn,0,3)}-${fn:substring(b_crn,3,5)}-${fn:substring(b_crn,5,10)}</td>
								</c:when>
								<c:otherwise><td>${data.b_crn}</td></c:otherwise>
							</c:choose>
							<td>${data.b_tel1}</td>
							<td>${data.b_tel2}</td>
							<td>${data.login_id}</td>
							<td><input type="button" value="상세"
								class="detailBtn white small btn"> <sec:authorize
									access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
									<input type="button" value="수정"
										class="updateBtn white small btn">
									<input type="button" value="충전"
										class="rechrgBtn white small btn">
									<input type="button" value="삭제"
										class="deleteBtn blue small btn">
								</sec:authorize> <input type="hidden" class="b_id" value="${data.b_id }">
								<input type="hidden" class="bid_flag" value="${data.bid_flag }">
								<input type="hidden" class="b_name" id="b_name" name="b_name" value="${data.b_name }">
								<input type="hidden" class="b_address" value="${data.b_address }">
								<input type="hidden" class="b_crn" value="${data.b_crn }">
								<input type="hidden" class="b_tel1" value="${data.b_tel1 }">
								<input type="hidden" class="b_tel2" value="${data.b_tel2 }">
								<input type="hidden" class="login_id" value="${data.login_id }">
								<input type="hidden" class="login_passwd" value="${data.login_passwd}">
								<input type="hidden" class="active_status" value="${data.active_status}">
								<input type="hidden" class="bc_type" value="${data.bc_type}">
								<input type="hidden" class="warning_amount" value="${data.warning_amount}">
								<input type="hidden" class="suspend_amount" value="${data.suspend_amount}">
								<input type="hidden" class="max_call" value="${data.max_call}">
								<input type="hidden" class="callcatch_penalty_value" value="${data.callcatch_penalty_value}">
								<input type="hidden" class="rider_delay_set" value="${data.rider_delay_set}">
								<input type="hidden" class="rider_delay_duration" value="${data.rider_delay_duration}">
								<input type="hidden" class="alarm_limit_duration" value="${data.alarm_limit_duration}">
								<input type="hidden" class="batch_extra_flag" value="${data.batch_extra_flag}">
								<input type="hidden" class="batch_extra_amount" value="${data.batch_extra_amount}">
								<input type="hidden" class="service_type" value="${data.service_type}">
								<input type="hidden" class="charge_method" value="${data.charge_method}">
								<input type="hidden" class="basic_distance" value="${data.basic_distance}">
								<input type="hidden" class="basic_charge" value="${data.basic_charge}">
								<input type="hidden" class="add_distance" value="${data.add_distance}">
								<input type="hidden" class="add_charge" value="${data.add_charge}">
								<input type="hidden" class="open_time" value="${data.open_time}">
								<input type="hidden" class="close_time" value="${data.close_time}">
								<input type="hidden" class="v_bank" value="${data.v_bank}">
								<input type="hidden" class="v_account" value="${data.v_account}">
								<input type="hidden" class="calculatepercall" value="${data.calculatepercall}">
								<input type="hidden" class="v_name" value="${data.v_name}">
								<input type="hidden" class="contract_sdate" value="${data.contract_sdate}">
								<input type="hidden" class="contract_edate" value="${data.contract_edate}">
								<input type="hidden" class="insert_date" value="${data.insert_date}">
								<input type="hidden" class="service_start_date"	value="${data.service_start_date}">
								<input type="hidden" class="update_date" value="${data.update_date}">
								<input type="hidden" class="r_op_id" value="${data.r_op_id}">
								<input type="hidden" class="u_op_id" value="${data.u_op_id}">
								<input type="hidden" class="calculate_period" value="${data.calculate_period}">
								<input type="hidden" class="calculate_date" value="${data.calculate_date}">
								<input type="hidden" class="b_balance" value="${data.b_balance}">
								<input type="hidden" class="b_representative" value="${data.b_representative}">
								<input type="hidden" class="b_addr_appendix" value="${data.b_addr_appendix}">
								<input type="hidden" class="location_x" value="${data.location_x}">
								<input type="hidden" class="location_y" value="${data.location_y}">
								<input type="hidden" class="b_city_code" value="${data.b_city_code}">
								<input type="hidden" class="b_gu_code" value="${data.b_gu_code}">
								<input type="hidden" class="b_dong_code" value="${data.b_dong_code}"> 
								<input type="hidden" class="b_town_code" value="${data.b_town_code}">
								<input type="hidden" class="account_flag" value="${data.account_flag}">
								<input type="hidden" class="b_bank" value="${data.b_bank}">
								<input type="hidden" class="b_account" value="${data.b_account}">
								<input type="hidden" class="ridercard_flag" value="${data.ridercard_flag}">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div style="clear: both; height: 5px;"></div>
			<div style="clear: both;"></div>
			<div style="clear: both; height: 20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
				<div style="float: right">
					<input type="button" value="등록" class="red big btn" id="insertBtn">
				</div>
			</sec:authorize>
		</div>
		<%-- paging --%>
		<div style="width: 100%; text-align: center">
			<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>
		<input type="hidden" name="b_id" value=""> <input
			type="hidden" name="bid_flag" value=""> <input type="hidden"
			name="b_name" value=""> <input type="hidden" name="b_address"
			value=""> <input type="hidden" name="b_crn" value="">
		<input type="hidden" name="b_tel1" value=""> <input
			type="hidden" name="b_tel2" value=""> <input type="hidden"
			name="login_id" value=""> <input type="hidden"
			name="login_passwd" value=""> <input type="hidden"
			name="active_status" value=""> <input type="hidden"
			name="bc_type" value=""> <input type="hidden"
			name="warning_amount" value=""> <input type="hidden"
			name="suspend_amount" value=""> <input type="hidden"
			name="max_call" value=""> <input type="hidden"
			name="callcatch_penalty_value" value=""> <input type="hidden"
			name="rider_delay_set" value=""> <input type="hidden"
			name="rider_delay_duration" value=""> <input type="hidden"
			name="alarm_limit_duration" value=""> <input type="hidden"
			name="batch_extra_flag" value=""> <input type="hidden"
			name="batch_extra_amount" value=""> <input type="hidden"
			name="service_type" value=""> <input type="hidden"
			name="charge_method" value=""> <input type="hidden"
			name="basic_distance" value=""> <input type="hidden"
			name="basic_charge" value=""> <input type="hidden"
			name="add_distance" value=""> <input type="hidden"
			name="add_charge" value=""> <input type="hidden"
			name="open_time" value=""> <input type="hidden"
			name="close_time" value=""> <input type="hidden"
			name="v_bank" value=""> <input type="hidden"
			name="org_v_bank" value=""> <input type="hidden"
			name="v_account" value=""><input type="hidden"
			name="calculatepercall" value=""> <input type="hidden" name="v_name"
			value=""><input
			type="hidden" name="contract_sdate" value=""> <input
			type="hidden" name="contract_edate" value=""> <input
			type="hidden" name="insert_date" value=""> <input
			type="hidden" name="service_start_date" value=""> <input
			type="hidden" name="update_date" value=""> <input
			type="hidden" name="r_op_id" value=""> <input type="hidden"
			name="u_op_id" value=""> <input type="hidden"
			name="calculate_period" value=""> <input type="hidden"
			name="calculate_date" value=""> <input type="hidden"
			name="org_contract_sdate" value=""> <input type="hidden"
			name="org_contract_edate" value=""> <input type="hidden"
			name="b_balance" value=""> <input type="hidden"
			name="searchFlag" value=""> <input type="hidden"
			name="bidFlag" value=""> <input type="hidden"
			name="searchContent" value=""> <input type="hidden"
			name="pageNo" value=""> <input type="hidden"
			name="b_representative" value=""> <input type="hidden"
			name="dupchk_flag" value="0"> <input type="hidden"
			name="b_addr_appendix" value=""> <input type="hidden"
			name="location_x" value=""> <input type="hidden"
			name="location_y" value=""> <input type="hidden"
			name="b_city_code" value="0"> <input type="hidden"
			name="b_gu_code" value=""> <input type="hidden"
			name="b_dong_code" value=""> 
			<input type="hidden" name="b_town_code" value="">
			<input type="hidden" name="account_flag" value="">
			<input type="hidden" name="b_bank" value="">
			<input type="hidden" name="b_account" value="">
			<input type="hidden" name="ridercard_flag" value="">
		<%--
			<input type="hidden" name="org_calculate_period" value="">
			<input type="hidden" name="org_calculate_date" value="">
			 --%>
	</form>
	<div>
		<%@ include
			file="/WEB-INF/views/Branchoffice_Popup/maininsert_popup.jsp"%>
	</div>

	<div>
		<%@ include
			file="/WEB-INF/views/Branchoffice_Popup/mainupdate_popup.jsp"%>
	</div>

	<div>
		<%@ include
			file="/WEB-INF/views/Branchoffice_Popup/maindetail_popup.jsp"%>
	</div>

	<div>
		<%@ include
			file="/WEB-INF/views/Branchoffice_Popup/mainrechrg_popup.jsp"%>
	</div>

	<div>
		<%@ include
			file="/WEB-INF/views/Branchoffice_Popup/mainiddup_popup.jsp"%>
	</div>
</body>
</html>