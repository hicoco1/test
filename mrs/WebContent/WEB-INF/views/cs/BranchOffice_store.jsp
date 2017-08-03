<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs_CS.jsp"%>

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
			var b_id = $("#mainForm").find("input[id=b_id]").val();
			var s_id = $("#mainForm").find("input[id=s_id]").val();
			var v_bank = $("#mainForm").find("input[id=v_bank]").val();
			var v_account = $("#mainForm").find("input[id=v_account]").val();
			var v_name = $("#mainForm").find("input[id=v_name]").val();
			var s_representative = $("#mainForm").find("input[id=s_representative]").val();
			var contract_sdate = $("#mainForm").find("input[id=contract_sdate]").val();
			var contract_edate = $("#mainForm").find("input[id=contract_edate]").val();
			var org_v_name = $("#mainForm").find("input[id=org_v_name]").val();
			var org_contract_sdate = $("#mainForm").find("input[id=org_contract_sdate]").val();
			var org_contract_edate = $("#mainForm").find("input[id=org_contract_edate]").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);

			$("#mainForm").find("input[name=s_representative]").val(s_representative);
			$("#mainForm").find("input[name=b_id]").val(b_id);
			$("#mainForm").find("input[name=s_id]").val(s_id);
			$("#mainForm").find("input[name=v_bank]").val(v_bank);
			$("#mainForm").find("input[name=v_account]").val(v_account);
			$("#mainForm").find("input[name=v_name]").val(v_name);
			$("#mainForm").find("input[name=org_v_name]").val(org_v_name);
			$("#mainForm").find("input[name=contract_sdate]").val(contract_sdate);
			$("#mainForm").find("input[name=contract_edate]").val(contract_edate);
			$("#mainForm").find("input[name=org_contract_sdate]").val(org_contract_sdate);
			$("#mainForm").find("input[name=org_contract_edate]").val(org_contract_edate);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deletebranchoffice_store_CS").submit();	
		}
    });
	
	$("#act_insert").click(function(){
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
		//var s_id = $("#InsertForm").find("input[name=s_id]").val();
		var login_passwd = $("#InsertForm").find("input[name=login_passwd]").val();
		var login_id = $("#InsertForm").find("input[name=login_id]").val();
		var s_addr1 = $("#InsertForm").find("input[name=s_addr1]").val();
		var s_addr2 = $("#InsertForm").find("input[name=s_addr2]").val();
		var v_bank = $("#InsertForm").find("select[name=v_bank]").val();
		var last_recharge_date = $("#InsertForm").find("input[name=last_recharge_date]").val();
		/*
		var dupchk_flag = $("#searchForm").find("input[name=dupchk_flag]").val();
		
		if(dupchk_flag == '0') {
			alert("로그인 계정 중복확인을 해주세요.");
			return false;
		}
		*/
       	if(b_id == '') {
       		alert("소속지점ID를 선택해주세요.");
        	return false;
        }    
          
       	//if(login_id != '' && dupchk_flag != '0') {
       	if(login_id != '') {
			if(login_passwd == '') {
				alert("로그인 패스워드를 입력해주세요.");
				$("#InsertForm").find("input[name=login_passwd]").focus();
				return false;
			}
       	}
        
        
        if(v_bank == '') {
    		alert("가상계좌 은행을 선택해주세요.");
    		return false;
    	}
        
        if(contract_sdate > contract_edate) {
        	alert("계약 시작 일자가 계약 종료 일자보다 클 수 없습니다.");
        	return false;
        }
            
		var closetime = new String($("#InsertForm").find("select[name=close_time_h]").val()) + new String($("#InsertForm").find("select[name=close_time_m]").val());
		var close_time = $("#InsertForm").find("input[name=close_time]").val(closetime);
		
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
		
		if(contract_sdate > contract_edate) {
			alert("계약 종료 일자가 계약 시작 일자보다 작을 수 없습니다.");
			return false;
		}
		/*
		var location_x = $("#InsertForm").find("input[name=location_x]").val(lng);
		var location_y = $("#InsertForm").find("input[name=location_y]").val(lat);
		*/
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
	});
	
	$("#act_dupchk").click(function(){
		var param = $("#DupForm").find("input[name=login_id_chk]").val();
		fn_setGuAddr(param, this);
		
		var tmpVal =$("#DupForm").find("input[name=login_id_chk]").val();
		$(this).next().next().next().val(tmpVal);
		
	});
	
	$("#act_cancel_dupchk").click(function(){
		$('#Duppopup').bPopup().close();
	});
	
	$("#act_update").click(function(){
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
		var v_bank_org = $("#UpdateForm").find("input[name=v_bank_org]").val();
		var contract_edate = $("#UpdateForm").find("input[name=contract_edate]").val();
		var update_date = $("#UpdateForm").find("input[name=update_date]").val(today);
		var insert_date = $("#UpdateForm").find("input[name=insert_date]").val(today);
		var r_op_id = $("#UpdateForm").find("input[name=r_op_id]").val("${username}");
		var u_op_id = $("#UpdateForm").find("input[name=u_op_id]").val("${username}");
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		var v_bank = $("#UpdateForm").find("select[name=v_bank]").val();
		var last_recharge_date = $("#UpdateForm").find("input[name=last_recharge_date]").val();
		
       if(v_bank == '') {
    		alert("가상계좌 은행을 선택해주세요.");
    		return false;
    	}
   
        if(contract_sdate > contract_edate) {
        	alert("계약 시작 일자가 계약 종료 일자보다 클 수 없습니다.");
        	return false;
        }
		
		var closetime = new String($("#UpdateForm").find("select[name=close_time_h]").val()) + new String($("#UpdateForm").find("select[name=close_time_m]").val());
		var close_time = $("#UpdateForm").find("input[name=close_time]").val(closetime);
		
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
		
		$("#UpdateForm").find("input[name=v_bank_org]").val(v_bank_org);
		$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
		$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
		$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
	});
});

function pop_excelUpload(tbl_name)
{
     window.open('store_csv_upload_CS','excel_upload', 'height=120,width=440,top=100,left=100,scrollbars=no,status=0, resizable=no, location=no, toolbar=no, menubar=no');
     BranchOffice_store.action = "store_csv_upload_CS";
     BranchOffice_store.target = "excel_upload";
     BranchOffice_store.submit();
}
/*
function fn_setGuAddr(param,obj){		
	$.ajax({
		type:"POST",
		url:"iddupchkbranchoffice_store",
		cache:false,
		data:{
			js_sido:param
		},
		success:function(data, status){
			if(data > 0) {
				alert("이미 등록된 로그인 계정입니다.");
				return false;
			}else {
				if(confirm("사용 가능한 로그인 계정입니다. 사용 하시겠습니까?")){
					$("#InsertForm").find("input[name=login_id]").val(param);
					$("#searchForm").find("input[name=dupchk_flag]").val("1");
					$('#Duppopup').bPopup().close();
				}
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

</script>

</head>
<body>	
<body oncontextmenu='return false'>	
<form action="BranchOffice_store_CS" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">지점/업소 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				업소 정보 관리</font>
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
							<%--
							<option value="2">가맹점 ID</option>
							--%>
							<option value="2">가맹점 이름</option>
							<option value="10">가맹점 ID</option>
							<option value="9">소속 지점 이름</option>
							<option value="1">소속 지점 ID</option>
							<option value="3">사업자 번호</option>
							<%--
							<option value="4">가맹점 이름</option>
							--%>
							<option value="5">연락처1</option>
							<option value="6">연락처2</option>
							<option value="7">로그인 계정</option>
							<option value="8">가맹점 상태</option>
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
					<input type="hidden" name="b_id" id="b_id" value="${b_id}">
		</div>
	</form>
	<form id="mainForm" name="mainForm" method="get">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action" />
		<div id="mainFrame">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
					<col width="4%">
					<col width="15%">
					<col width="10%">	
					<col width="*">
					<col width="8%">
					<col width="8%">	
					<col width="8%">
					<col width="10%">		
				</colgroup>
				<tr>
					<th>No</th>
					<th>가맹점 ID(이름)</th>
					<th>사업자 번호</th>
					<th>가맹점 주소1</th>
					<th>가맹점 주소2</th>
					<th>연락처1</th>
					<th>연락처2</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="10" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*10)+status.count-10}</td>
					<td>${data.s_id}(${data.s_name})</td>
					<td>${data.s_crn}</td>
					<%--	
					<td>
					<div style="width:200px; text-overflow:ellipsis; overflow:hidden;" >                                                                                              
                       <nobr title="<c:out value="${data.s_name}">${data.s_name}</c:out>">                                                                                  
                           <c:out value="${data.s_name}">${data.s_name}</c:out>                                                                                             
                       </nobr>                                                                                                                                                      
                   	</div> 
                   	</td>
                   	 --%>
					<td>
					<div style="width:650px; text-overflow:ellipsis; overflow:hidden;" >                                                                                              
                       <nobr title="<c:out value="${data.s_addr1}">${data.s_addr1}</c:out>">                                                                                  
                           <c:out value="${data.s_addr1}">${data.s_addr1}</c:out>                                                                                             
                       </nobr>                                                                                                                                                      
                   	</div> 
                   	</td>
					<td>${data.s_addr2}</td>
					<td>${data.s_tel1}</td>
					<td>${data.s_tel2}</td>	
					<td>
						<input type="button" value="상세" class="detailBtn white small btn">
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						</sec:authorize>
						
						<input type="hidden" class="b_id" id="b_id" value="${data.b_id }">
						<input type="hidden" class="b_name" id="b_name" value="${data.b_name }">
						<input type="hidden" class="s_id" id="s_id" value="${data.s_id }">
						<input type="hidden" class="s_crn" id="s_crn" value="${data.s_crn }">
						<input type="hidden" class="s_name" id="s_name" value="${data.s_name }">
						<input type="hidden" class="s_addr1" id="s_addr1" value="${data.s_addr1 }">
						<input type="hidden" class="s_addr2" id="s_addr2" value="${data.s_addr2 }">
						<input type="hidden" class="location_x" id="location_x" value="${data.location_x }">
						<input type="hidden" class="location_y" id="location_y" value="${data.location_y }">
						<input type="hidden" class="s_tel1" id="s_tel1" value="${data.s_tel1 }">
						<input type="hidden" class="s_tel2" id="s_tel2" value="${data.s_tel2 }">
						<input type="hidden" class="login_id" id="login_id" value="${data.login_id }">
						<input type="hidden" class="login_passwd" id="login_passwd" value="${data.login_passwd }">
						<input type="hidden" class="active_status" id="active_status" value="${data.active_status }">
						<input type="hidden" class="cook_time" id="cook_time" value="${data.cook_time }">
						<input type="hidden" class="terminal_type" id="terminal_type" value="${data.terminal_type }">
						<input type="hidden" class="cid_id" id="cid_id" value="${data.cid_id }">
						<input type="hidden" class="cid_connect_status" id="cid_connect_status" value="${data.cid_connect_status }">
						<input type="hidden" class="cid_port" id="cid_port" name="cid_port" value="${data.cid_port }">
						<input type="hidden" class="printer_id" id="printer_id" value="${data.printer_id }">
						<input type="hidden" class="printer_connect_status" id="printer_connect_status" value="${data.printer_connect_status }">
						<input type="hidden" class="printer_port" id="printer_port" value="${data.printer_port }">
						<input type="hidden" class="monthly_fee" id="monthly_fee" value="${data.monthly_fee }">
						<input type="hidden" class="basic_distance" id="basic_distance" value="${data.basic_distance }">
						<input type="hidden" class="basic_charge" id="basic_charge" value="${data.basic_charge }">
						<input type="hidden" class="add_distance" id="add_distance" value="${data.add_distance }">
						<input type="hidden" class="add_charge" id="add_charge" value="${data.add_charge }">
						<input type="hidden" class="service_type" id="service_type" value="${data.service_type }">
						<input type="hidden" class="charge_method" id="charge_method" value="${data.charge_method }">
						<input type="hidden" class="s_balance" id="s_balance" value="${data.s_balance }">
						<input type="hidden" class="rider_delay_duration" id="rider_delay_duration" value="${data.rider_delay_duration }">
						<input type="hidden" class="batch_extra_amount" id="batch_extra_amount" value="${data.batch_extra_amount }">
						<input type="hidden" class="last_recharge_amount" id="last_recharge_amount" value="${data.last_recharge_amount }">
						<input type="hidden" class="last_recharge_date" id="last_recharge_date" value="${data.last_recharge_date }">
						<input type="hidden" class="charge_type" id="charge_type" value="${data.charge_type }">
						<input type="hidden" class="charge_option" id="charge_option" value="${data.charge_option }">
						<input type="hidden" class="credit_used_flag" id="credit_used_flag" value="${data.credit_used_flag }">
						<input type="hidden" class="credit_member_id" id="credit_member_id" value="${data.credit_member_id }">
						<input type="hidden" class="noti_flag" id="noti_flag" value="${data.noti_flag }">
						<input type="hidden" class="noti_rider_assign" id="noti_rider_assign" value="${data.noti_rider_assign }">
						<input type="hidden" class="noti_card_pay" id="noti_card_pay" value="${data.noti_card_pay }">
						<input type="hidden" class="open_time" id="open_time" value="${data.open_time }">
						<input type="hidden" class="close_time" id="close_time" value="${data.close_time }">
						<input type="hidden" class="monthly_order_count" id="monthly_order_count" value="${data.monthly_order_count }">
						<input type="hidden" class="daily_order_count" id="daily_order_count" value="${data.daily_order_count }">
						<input type="hidden" class="cat_id" id="cat_id" value="${data.cat_id }">
						<input type="hidden" class="van_id" id="van_id" value="${data.van_id }">
						<input type="hidden" class="v_bank" id="v_bank" value="${data.v_bank }">
						<input type="hidden" class="v_bank_org" id="v_bank_org" value="${data.v_bank }">
						<input type="hidden" class="v_account" id="v_account" value="${data.v_account }">
						<input type="hidden" class="v_name" id="v_name" value="${data.v_name }">
						<input type="hidden" class="contract_sdate" id="contract_sdate" value="${data.contract_sdate }">
						<input type="hidden" class="contract_edate" id="contract_edate" value="${data.contract_edate }">
						<input type="hidden" class="service_start_date" id="service_start_date" value="${data.service_start_date }">
						<input type="hidden" class="update_date" id="update_date" value="${data.update_date }">
						<input type="hidden" class="r_op_id" id="r_op_id"  value="${data.r_op_id }">
						<input type="hidden" class="u_op_id" id="u_op_id" value="${data.u_op_id }">
						<input type="hidden" class="store_statement" id="store_statement" value="${data.store_statement }">
						<input type="hidden" class="kitchen_statement" id="kitchen_statement"  value="${data.kitchen_statement }">
						<input type="hidden" class="customer_statement" id="customer_statement" value="${data.customer_statement }">
						<input type="hidden" class="s_representative" id="s_representative" value="${data.s_representative}">
						<input type="hidden" class="store_type" value="${data.store_type}">
						
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
			<div style="float:right; margin-right: 10px;"><input type="button" value="일괄등록" class="red big btn" id="csvBtn" onclick="pop_excelUpload();"></div>
			</sec:authorize>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="b_id" value="">
			<input type="hidden" name="b_name" value="">
			<input type="hidden" name="s_id" value="">
			<input type="hidden" name="s_crn" value="">
			<input type="hidden" name="s_name" value="">
			<input type="hidden" name="s_addr1" value="">
			<input type="hidden" name="s_addr2" value="">
			<input type="hidden" name="location_x" value="">
			<input type="hidden" name="location_y" value="">
			<input type="hidden" name="s_tel1" value="">
			<input type="hidden" name="s_tel2" value="">
			<input type="hidden" name="login_id" value="">
			<input type="hidden" name="login_passwd" value="">
			<input type="hidden" name="active_status" value="">
			<input type="hidden" name="cook_time" value="">
			<input type="hidden" name="terminal_type" value="">
			<input type="hidden" name="cid_id" value="">
			<input type="hidden" name="cid_connect_status" value="">
			<input type="hidden" name="cid_port" value="">
			<input type="hidden" name="printer_id" value="">
			<input type="hidden" name="printer_connect_status" value="">
			<input type="hidden" name="printer_port" value="">
			<input type="hidden" name="monthly_fee" value="">
			<input type="hidden" name="basic_distance" value="">
			<input type="hidden" name="basic_charge" value="">
			<input type="hidden" name="add_distance" value="">
			<input type="hidden" name="add_charge" value="">
			<input type="hidden" name="service_type" value="">
			<input type="hidden" name="charge_method" value="">
			<input type="hidden" name="s_balance" value="">
			<input type="hidden" name="rider_delay_duration" value="">
			<input type="hidden" name="batch_extra_amount" value="">
			<input type="hidden" name="last_recharge_amount" value="">
			<input type="hidden" name="last_recharge_date" value="">
			<input type="hidden" name="charge_type" value="">
			<input type="hidden" name="charge_option" value="">
			<input type="hidden" name="credit_used_flag" value="">
			<input type="hidden" name="credit_member_id" value="">
			<input type="hidden" name="noti_flag" value="">
			<input type="hidden" name="noti_rider_assign" value="">
			<input type="hidden" name="noti_card_pay" value="">
			<input type="hidden" name="open_time" value="">
			<input type="hidden" name="close_time" value="">
			<input type="hidden" name="monthly_order_count" value="">
			<input type="hidden" name="daily_order_count" value="">
			<input type="hidden" name="cat_id" value="">
			<input type="hidden" name="van_id" value="">
			<input type="hidden" name="v_bank" value="">
			<input type="hidden" name="v_bank_org" value="">
			<input type="hidden" name="v_account" value="">
			<input type="hidden" name="v_name" value="">
			<input type="hidden" name="contract_sdate" value="">
			<input type="hidden" name="contract_edate" value="">
			<input type="hidden" name="service_start_date" value="">
			<input type="hidden" name="update_date" value="">
			<input type="hidden" name="r_op_id" value="">
			<input type="hidden" name="u_op_id" value="">
			<input type="hidden" name="store_statement" value="">
			<input type="hidden" name="kitchen_statement" value="">
			<input type="hidden" name="customer_statement" value="">
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="pageNo" value="">
			<input type="hidden" name="dupchk_flag" value="0">
			<input type="hidden" name="s_representative" value="">
			<input type="hidden" name="store_type" value="">
	</form>
	
		<div>
			<%@ include file="/WEB-INF/views/cs/cs_popup/storeinsert_popup.jsp"%>
		</div>

		<div>
			<%@ include file="/WEB-INF/views/cs/cs_popup/storeupdate_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/cs/cs_popup/storedetail_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/cs/cs_popup/storeiddup_popup.jsp"%>
		</div>
</body>
</html>