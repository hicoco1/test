<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

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
	
	$("#InsertForm").find("input[name=contract_sdate]").val(today);
	$("#InsertForm").find("input[name=contract_edate]").val(today2);
	$("#InsertForm").find("input[name=service_start_date]").val(today);
	
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var r_id = $(this).parent().find(".r_id").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").find("input[name=r_id]").val(r_id);
			$("#mainForm").attr("action","deletebranchoffice_rider").submit();	
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

	var r_crn = document.getElementById('r_crn');
	r_crn.onkeyup = function(event){
	    event = event || window.event;
	    var _val = this.value.trim();
	    this.value = autoHypenPhone(_val);
	}
	
	var r_crn2 = document.getElementById('r_crn2');
	r_crn2.onkeyup = function(event){
	    event = event || window.event;
	    var _val = this.value.trim();
	    this.value = autoHypenPhone(_val);
	}
	
	$("#act_insert").click(function(){
		var q,lat,lng,return_url,location_x,location_y;
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
		var contract_sdate = $("#InsertForm").find("input[name=contract_sdate]").val();
		var contract_edate = $("#InsertForm").find("input[name=contract_edate]").val();
		var update_date = $("#InsertForm").find("input[name=update_date]").val(today);
		var insert_date = $("#InsertForm").find("input[name=insert_date]").val(today);
		var r_op_id = $("#InsertForm").find("input[name=r_op_id]").val("${username}");
		var u_op_id = $("#InsertForm").find("input[name=u_op_id]").val("${username}");
		var b_id = $("#InsertForm").find("select[name=b_id]").val();
		var addr_flag 		= $("#InsertForm").find("input[name=addr_chk_flag]").val();
		var login_id 		= $("#InsertForm").find("input[name=login_id]").val();
		var login_passwd 		= $("#InsertForm").find("input[name=login_passwd]").val();
		q = $("#InsertForm").find("input[name=sample4_jibunAddress]").val().trim();
		$("#InsertForm").find("input[name=r_address]").val(q+" "+$("#InsertForm").find("input[name=r_addr_appendix]").val());
		var dupchk_flag = $("#searchForm").find("input[name=dupchk_flag]").val();
		var r_name = $("#InsertForm").find("input[name=r_name]").val();
		var r_crn = $("#InsertForm").find("input[name=r_crn]").val();
		var r_tel1 = $("#InsertForm").find("input[name=r_tel1]").val();
		
		if(b_id == '') {
			alert("소속 지점 ID를 선택해 주세요.");
			return false;
		}
		
		if(r_name == '') {
			alert("기사 이름을 입력해 주세요.");
			$("#InsertForm").find("input[name=r_name]").focus();
			return false;
		}
		
		if (r_crn != '') {
			if (r_crn.length != 12) {
		        alert("사업자 번호는 10자리 이어야 합니다.");
		        $("#InsertForm").find("input[name=r_crn]").focus();
		        return false;
		    }
		}
		
		if(r_tel1 != '') { 
			var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			// 01로 시작하는 핸드폰 및 지역번호와 050, 070 검증
			// 원래 050은 0505 평생번호인가 그런데 보편적으로 050-5xxx-xxxx 로 인식함
			// 0505-xxx-xxxx 라는 식으로 넣으면 통과할 수 없음. 그래서 경고창 띄울때 예시 넣는것이 좋음.
			// -(하이픈)은 넣어도 되고 생략해도 되나 넣을 때에는 정확한 위치에 넣어야 함.

			if (!regExp.test(r_tel1)) {
			        alert("잘못된 전화번호입니다. \n01로 시작하는 10~11자리 번호를 입력해주세요.");
			        $("#InsertForm").find("input[name=r_tel1]").focus();
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
		
		if(dupchk_flag != '0') {
	       	if(login_id != '') {
				if(login_passwd == '') {
					alert("로그인 패스워드를 입력해주세요.");
					$("#InsertForm").find("input[name=login_passwd]").focus();
					return false;
				}
	       	}
       	}
    
		if(addr_flag != '1') {
			alert("주소를 선택하여 주십시오.");
			return false;
		}
		
        if(contract_sdate > contract_edate) {
        	alert("계약 시작 일자가 계약 종료 일자보다 클 수 없습니다.");
        	return false;
        }

		var url ="http://apis.daum.net/local/geo/addr2coord?apikey=d4e2977331428caa9436ce9d118a9cf8&q="+encodeURIComponent(q)+"&output=json";
		
        $.getJSON(url+"&callback=?", function(data) {
        	var totalCount = data["channel"].totalCount;
        	if(totalCount == 0) {
        		alert("입력 된 업소 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
    			return false;
    		}
        	
        	if(totalCount > 1) {
        		alert("입력 된 업소 주소 정보를 확인해주세요(지점 위치 정보 중복 수집).");
    			return false;
    		}
        	
          $('#list li').remove();
          $.each(data.channel.item, function(i,item) {
            lat = item.point_y;
            lng = item.point_x;
            $('#list').append('<li>'+item.title+'(위도:'+lat+' / 경도:'+lng+') 새주소 : '+item.newAddress);
            
        	location_x = $("#InsertForm").find("input[name=location_x]").val(lng);
    		location_y = $("#InsertForm").find("input[name=location_y]").val(lat);
    		
    		var lo_x = $("#InsertForm").find("input[name=location_x]").val();
    		var lo_x_split = lo_x.split('.');
    		lo_x = lo_x_split[0]+"."+lo_x_split[1].substring(0,6);
			$("#InsertForm").find("input[name=location_x]").val(lo_x);
    		
			var lo_y = $("#InsertForm").find("input[name=location_y]").val();
    		var lo_y_split = lo_y.split('.');
    		lo_y = lo_y_split[0]+"."+lo_y_split[1].substring(0,6);
			$("#InsertForm").find("input[name=location_y]").val(lo_y);
			
    		/*
    		if(item.mainAddress != null || item.mainAddress != '') {
    			if(item.subAddress != null || item.subAddress != '') {
    				$("#InsertForm").find("input[name=s_addr_num]").val(item.mainAddress+"-"+item.subAddress);
    			}else {
    				$("#InsertForm").find("input[name=s_addr_num]").val(item.mainAddress);
    			}
    		}
    		
    		$("#InsertForm").find("input[name=s_addr2]").val(item.localName_3);
    		*/
    		
    		
    		if(item.localName_3 != null || item.localName_3 != '') {
    			var localname = item.localName_3.split(' ');
    			if(item.localName_3.indexOf(" ") != -1) {
    				$("#InsertForm").find("input[name=r_town_code]").val(localname[0]);
    				$("#InsertForm").find("input[name=r_dong_code]").val(localname[1]);
    			}else {
    				$("#InsertForm").find("input[name=r_town_code]").val("");
    				$("#InsertForm").find("input[name=r_dong_code]").val(item.localName_3);
    			}
    		}
    		
    		if((item.point_x == "" && item.point_y=="") ||(item.point_x == null && item.point_y==null)) {
    			alert("입력 된  기사 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
    			return false;
    		}
    	
		
		$("input[name=action]").val("INSERT");
		r_crn = r_crn.replace(/\-/g,''); //특정문자 제거
		$("#InsertForm").find("input[name=r_crn]").val(r_crn);
		$("#InsertForm").submit();
		
       }); 
      });  
     }) ;

	/*
	$("#act_dupchk").click(function(){
		var param = $("#InsertForm").find("input[name=login_id]").val();
		if(param != '') {
			fn_setGuAddr(param, this);
		}else {
			alert("로그인 계정을 입력해 주세요.");
			$("#InsertForm").find("input[name=login_id]").focus();
			return false;
		}
		
		var tmpVal =$("#InsertForm").find("input[name=login_id]").val();
		$(this).next().next().next().val(tmpVal);	
	});
	*/
	
	$("#act_dupchk").click(function(){
		var param = $("#DupForm").find("input[name=login_id_chk]").val();
		fn_setGuAddr(param, this);
		
		var tmpVal =$("#DupForm").find("input[name=login_id_chk]").val();
		$(this).next().next().next().val(tmpVal);
		
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
	
	$("#act_update").click(function(){
		
		var q,lat,lng,return_url,location_x,location_y;
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
		var contract_sdate = $("#UpdateForm").find("input[name=contract_sdate]").val();
		var contract_edate = $("#UpdateForm").find("input[name=contract_edate]").val();
		var update_date = $("#UpdateForm").find("input[name=update_date]").val(today);
		var insert_date = $("#UpdateForm").find("input[name=insert_date]").val(today);
		var r_op_id = $("#UpdateForm").find("input[name=r_op_id]").val("${username}");
		var u_op_id = $("#UpdateForm").find("input[name=u_op_id]").val("${username}");
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		var v_bank = $("#UpdateForm").find("select[name=v_bank]").val();
		var loction_x = $("#UpdateForm").find("input[name=location_x]").val();
		var loction_y = $("#UpdateForm").find("input[name=location_y]").val();
		var addr_flag 		= $("#UpdateForm").find("input[name=addr_chk_flag]").val();
		var r_crn 		= $("#UpdateForm").find("input[name=r_crn]").val();
		var b_id = $("#UpdateForm").find("select[name=b_id]").val();
		var r_name 		= $("#UpdateForm").find("input[name=r_name]").val();
		var r_tel1 		= $("#UpdateForm").find("input[name=r_tel1]").val();
		
		if(addr_flag == '1') {
			var q = $("#UpdateForm").find("input[name=r_address]").val().trim();
			var url ="http://apis.daum.net/local/geo/addr2coord?apikey=d4e2977331428caa9436ce9d118a9cf8&q="+encodeURIComponent(q)+"&output=json";
			
	        $.getJSON(url+"&callback=?", function(data) {
	        	var totalCount = data["channel"].totalCount;
	        	if(totalCount == 0) {
	        		alert("입력 된 기사 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
	    			return false;
	    		}
	        	
	        	if(totalCount > 1) {
	        		alert("입력 된 기사 주소 정보를 확인해주세요(지점 위치 정보 중복 수집).");
	    			return false;
	    		}
	        	
	          $('#list li').remove();
	          $.each(data.channel.item, function(i,item) {
	            lat = item.point_y;
	            lng = item.point_x;
	            $('#list').append('<li>'+item.title+'(위도:'+lat+' / 경도:'+lng+') 새주소 : '+item.newAddress);
	            
	        	location_x = $("#UpdateForm").find("input[name=location_x]").val(lng);
	        	location_y = $("#UpdateForm").find("input[name=location_y]").val(lat);
	    		
	    		var lo_x = $("#UpdateForm").find("input[name=location_x]").val();
	    		var lo_x_split = lo_x.split('.');
	    		lo_x = lo_x_split[0]+"."+lo_x_split[1].substring(0,6);
				$("#UpdateForm").find("input[name=location_x]").val(lo_x);
	    		
				var lo_y = $("#UpdateForm").find("input[name=location_y]").val();
	    		var lo_y_split = lo_y.split('.');
	    		lo_y = lo_y_split[0]+"."+lo_y_split[1].substring(0,6);
				$("#UpdateForm").find("input[name=location_y]").val(lo_y);
	    		
	    		if((item.point_x == "" && item.point_y=="") ||(item.point_x == null && item.point_y==null)) {
	    			alert("입력 된 기사 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
	    			return false;
	    		}
	    	
	    		if(item.localName_3 != null || item.localName_3 != '') {
	    			var localname = item.localName_3.split(' ');
	    			if(item.localName_3.indexOf(" ") != -1) {
	    				$("#UpdateForm").find("input[name=r_town_code]").val(localname[0]);
	    				$("#UpdateForm").find("input[name=r_dong_code]").val(localname[1]);
	    			}else {
	    				$("#UpdateForm").find("input[name=r_town_code]").val("");
	    				$("#UpdateForm").find("input[name=r_dong_code]").val(item.localName_3);
	    			}
	    		}
	    		
	    		if(b_id == '') {
	    			alert("소속 지점 ID를 선택해 주세요.");
	    			return false;
	    		}
	    		
	    		if(r_name == '') {
	    			alert("기사 이름을 입력해 주세요.");
	    			$("#UpdateForm").find("input[name=r_name]").focus();
	    			return false;
	    		}
	    		
	            if(contract_sdate > contract_edate) {
	            	alert("계약 시작 일자가 계약 종료 일자보다 클 수 없습니다.");
	            	return false;
	            }
	    		
	    		
	    		//$("#UpdateForm").find("input[name=r_town_code]").val(item.localName_3);
	    		
	 			$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
	 			$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
	 			$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
	 			$("input[name=action]").val("UPDATE");
	 			r_crn = r_crn.replace(/\-/g,''); //특정문자 제거
				$("#UpdateForm").find("input[name=r_crn]").val(r_crn);
	 			$("#UpdateForm").submit();
	          });
	        }); 
	       
        }else {
        	
        	if(b_id == '') {
    			alert("소속 지점 ID를 선택해 주세요.");
    			return false;
    		}
    		
    		if(r_name == '') {
    			alert("기사 이름을 입력해 주세요.");
    			$("#UpdateForm").find("input[name=r_name]").focus();
    			return false;
    		}
    		
    		if(r_tel1 != '') { 
    			var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    			// 01로 시작하는 핸드폰 및 지역번호와 050, 070 검증
    			// 원래 050은 0505 평생번호인가 그런데 보편적으로 050-5xxx-xxxx 로 인식함
    			// 0505-xxx-xxxx 라는 식으로 넣으면 통과할 수 없음. 그래서 경고창 띄울때 예시 넣는것이 좋음.
    			// -(하이픈)은 넣어도 되고 생략해도 되나 넣을 때에는 정확한 위치에 넣어야 함.

    			if (!regExp.test(r_tel1)) {
    			        alert("잘못된 전화번호입니다. \n01로 시작하는 10~11자리 번호를 입력해주세요.");
    			        $("#UpdateForm").find("input[name=r_tel1]").focus();
    			        return false;
    			    }
    				  
    		}
    		
    		if (r_crn != '') {
				if (r_crn.length != 12) {
			        alert("사업자 번호는 10자리 이어야 합니다.");
			        $("#UpdateForm").find("input[name=r_crn]").focus();
			        return false;
			    }
			}
    		
            if(contract_sdate > contract_edate) {
            	alert("계약 시작 일자가 계약 종료 일자보다 클 수 없습니다.");
            	return false;
            }
    		
			var r_address_up = $("#UpdateForm").find("input[name=r_address_up]").val();
			$("#UpdateForm").find("input[name=r_address]").val(r_address_up);
			var r_town_code_up = $("#UpdateForm").find("input[name=r_town_code_up]").val();
			$("#UpdateForm").find("input[name=r_town_code]").val(r_town_code_up);
			var r_city_code_up = $("#UpdateForm").find("input[name=r_city_code_up]").val();
			$("#UpdateForm").find("input[name=r_city_code]").val(r_city_code_up);
			var r_dong_code_up = $("#UpdateForm").find("input[name=r_dong_code_up]").val();
			$("#UpdateForm").find("input[name=r_dong_code]").val(r_dong_code_up);
			var r_gu_code_up = $("#UpdateForm").find("input[name=r_gu_code_up]").val();
			$("#UpdateForm").find("input[name=r_gu_code]").val(r_gu_code_up);
			var r_addr_appendix_up = $("#UpdateForm").find("input[name=r_addr_appendix_up]").val();
			$("#UpdateForm").find("input[name=r_addr_appendix]").val(r_addr_appendix_up);
			var location_x_up = $("#UpdateForm").find("input[name=location_x_up]").val();
			var location_y_up = $("#UpdateForm").find("input[name=location_y_up]").val();
		
			$("#UpdateForm").find("input[name=location_x]").val(location_x_up);
			$("#UpdateForm").find("input[name=location_y]").val(location_y_up);
			$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
			$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
			$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
			$("input[name=action]").val("UPDATE");
			r_crn = r_crn.replace(/\-/g,''); //특정문자 제거
			$("#UpdateForm").find("input[name=r_crn]").val(r_crn);
			$("#UpdateForm").submit();
        }
	});
});


</script>

</head>
<body>	

<form action="BranchOffice_rider" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">지점 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				기사 정보 관리</font>
			<hr color="#ff0059" />
			<table id="searchTable" style="background-color: #b8e2fc; margin-top: 20px;">
				<colgroup>
					<col width="1%">	
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td></td>
					<td><br /><input TYPE="IMAGE" src="resources/images/search_btn.PNG" width="15px" height="15px"  align="absmiddle">
					검색&nbsp; :&nbsp; 
						<select name="searchFlag">
							<option value="1">기사코드</option>
							<option value="2">이름</option>
						</select>
						<input type="text" name="searchContent" value="${searchContent}" size="20"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="검색" class="blue small btn" id="searchBtn"><br /><br />
					</td>				
					<td></td>
				</tr>	
			</table>
					<input type="hidden" name="pageNo" id="pageNo"   value="${pageno}">
					<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
					<input type="hidden" name="action"  id="action" value="">
					<input type="hidden" name="dupchk_flag" id="dupchk_flag" value="0">
		</div>
	</form>
	<form id="mainForm" name="mainForm" method="get">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action" />
		<div id="mainFrame">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
					<col>
					<col>
					<col>	
					<col>
					<col>
					<col>	
					<col>		
				</colgroup>
				<tr>
					<th>No</th>
					<th>기사코드<br/>(이름)</th>
					<th>청약상태</th>
					<th>전화번호1</th>
					<th>동시배달가능콜수</th>
					<th>주소</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="7" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*10)+status.count-10}</td>
					<td>${data.r_id}(${data.r_name})</td>
					<td>
					<c:choose>
						<c:when test="${data.active_status == 0}">정상</c:when>
						<c:when test="${data.active_status == 1}">해지</c:when>
						<c:when test="${data.active_status == 2}">중지(가상계좌 잔액부족)</c:when>
						<c:when test="${data.active_status == 3}">중지(지각)</c:when>
						<c:when test="${data.active_status == 4}">중지(콜거부)</c:when>
						<c:when test="${data.active_status == 5}">중지(불성실)</c:when>
						<c:otherwise>청약(가등록)</c:otherwise>
					</c:choose>
					</td>
					<td>${data.r_crn}</td>
					<td>${data.max_call}</td>
					<td>${data.r_address}</td>
					<!-- 
					<td>
					<div style="width:150px; text-overflow:ellipsis; overflow:hidden;" >                                                                                              
                       <nobr title="<c:out value="${data.r_address}">${data.r_address}</c:out>">                                                                                  
                           <c:out value="${data.r_address}">${data.r_address}</c:out>                                                                                             
                       </nobr>                                                                                                                                                      
                   	</div> 
                   	</td>
                   	 -->
					<td>
						<input type="button" value="상세" class="detailBtn white small btn">
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						</sec:authorize>
						
						<input type="hidden" class="b_id" value="${data.b_id }">
						<input type="hidden" class="r_id" value="${data.r_id }">
						<input type="hidden" class="r_type" value="${data.r_type}">
						<input type="hidden" class="s_id" value="${data.s_id }">
						<input type="hidden" class="r_crn" value="${data.r_crn }">
						<input type="hidden" class="r_name" value="${data.r_name }">
						<input type="hidden" class="r_address" value="${data.r_address }">
						<input type="hidden" class="location_x" value="${data.location_x }">
						<input type="hidden" class="location_y" value="${data.location_y }">
						<input type="hidden" class="last_location_update" value="${data.last_location_update }">
						<input type="hidden" class="r_tel1" value="${data.r_tel1}">
						<input type="hidden" class="login_id" value="${data.login_id }">
						<input type="hidden" class="login_passwd" value="${data.login_passwd }">
						<input type="hidden" class="active_status" value="${data.active_status }">
						<input type="hidden" class="r_balance" value="${data.r_balance }">
						<input type="hidden" class="card_keep_flag" value="${data.card_keep_flag }">
						<input type="hidden" class="card_id" value="${data.card_id }">
						<input type="hidden" class="max_call" value="${data.max_call }">
						<input type="hidden" class="current_call" value="${data.current_call}">
						<input type="hidden" class="callcatch_penalty_status" value="${data.callcatch_penalty_status }">
						<input type="hidden" class="callcatch_penalty_value" value="${data.callcatch_penalty_value }">
						<input type="hidden" class="calculate_peroid" value="${data.calculate_peroid }">
						<input type="hidden" class="contract_sdate" value="${data.contract_sdate }">
						<input type="hidden" class="contract_edate" value="${data.contract_edate }">
						<input type="hidden" class="insert_date" value="${data.insert_date }">
						<input type="hidden" class="service_start_date" value="${data.service_start_date }">
						<input type="hidden" class="update_date" value="${data.update_date}">
						<input type="hidden" class="r_op_id" value="${data.r_op_id }">
						<input type="hidden" class="u_op_id" value="${data.u_op_id }">
						<input type="hidden" class="r_addr_appendix" value="${data.r_addr_appendix }">
						<input type="hidden" class="r_city_code" value="${data.r_city_code }">
						<input type="hidden" class="r_gu_code" value="${data.r_gu_code }">
						<input type="hidden" class="r_dong_code" value="${data.r_dong_code }">
						<input type="hidden" class="r_town_code" value="${data.r_town_code }">
					</td>			
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></div>
			</sec:authorize>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="b_id" value="">
			<input type="hidden" name="r_id" value="">
			<input type="hidden" name="r_type" value="">
			<input type="hidden" name="s_id" value="">
			<input type="hidden" name="r_crn" value="">
			<input type="hidden" name="r_name" value="">
			<input type="hidden" name="r_address" value="">
			<input type="hidden" name="location_x" value="">
			<input type="hidden" name="location_y" value="">
			<input type="hidden" name="last_location_update" value="">
			<input type="hidden" name="r_tel1" value="">
			<input type="hidden" name="login_id" value="">
			<input type="hidden" name="login_passwd" value="">
			<input type="hidden" name="active_status" value="">
			<input type="hidden" name="r_balance" value="">
			<input type="hidden" name="card_keep_flag" value="">
			<input type="hidden" name="card_id" value="">
			<input type="hidden" name="max_call" value="">
			<input type="hidden" name="current_call" value="">
			<input type="hidden" name="callcatch_penalty_status" value="">
			<input type="hidden" name="callcatch_penalty_value" value="">
			<input type="hidden" name="calculate_peroid" value="">
			<input type="hidden" name="contract_sdate" value="">
			<input type="hidden" name="contract_edate" value="">
			<input type="hidden" name="insert_date" value="">
			<input type="hidden" name="service_start_date" value="">
			<input type="hidden" name="update_date" value="">
			<input type="hidden" name="r_op_id" value="">
			<input type="hidden" name="u_op_id" value="">
			<input type="hidden" name="r_addr_appendix" value="">
			<input type="hidden" name="r_city_code" value="">
			<input type="hidden" name="r_gu_code" value="">
			<input type="hidden" name="r_town_code" value="">
			<input type="hidden" name="r_dong_code" value="">
	</form>
	
		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/riderinsert_popup.jsp"%>
		</div>
		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/riderdetail_popup.jsp"%>
		</div>
		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/riderupdate_popup.jsp"%>
		</div>

		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/rideriddup_popup.jsp"%>
		</div>
		
</body>
</html>