<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>
$(document).ready(function(){
	
	if("${result}" == 999) {
		if(window.location.hash == ""){
			alert("암호가 일치하지 않습니다.");
			window.location.hash = "#";
		}
		if(window.location.hash == "#") {
		}
	}

	if("${result}" == 1) {
		if(window.location.hash == ""){
			alert("수정을 완료하였습니다.");
			window.location.hash = "#";
		}
		if(window.location.hash == "#") {
		}
	}
	
	$("#actBtn").click(function(){
		var developer_fee = $("#mainForm").find("input[name=developer_fee]").val();
		if(developer_fee.length == 0){
			alert("콜비 금액을 입력하여 주십시오.");
			return false;
		}
		
		if(confirm("수정 하시겠습니까?")){
			$("#UpdateForm").find("input[name=developer_fee]").val($("#mainForm").find("input[name=developer_fee]").val());
			$('#Updatepopup').bPopup();
		}
    });
	
	$("#act_update").click(function(){

		
		var pw = $("#UpdateForm").find("input[name=curr_passwd]").val();
	
		if(pw.length == 0){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
	});
	
});
</script>

</head>
<body>	
<div id="Updatepopup" class="Pstyle">
		<span class="b-close">X</span>
		<div class="content">
			<form id="UpdateForm" name="UpdateForm" action="developer_Fee_Config_act" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
			<input type="hidden" name="username" value="${username}">
			<input type="hidden" name="developer_fee" value="">
				<table>
					<tr>
						<td id ="pop_header">콜비 금액 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >비밀번호  : </td>
						<td><input type="password" name="curr_passwd" value="" required="required"></td>
					</tr>
				</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="확인" class="blue small btn" id="act_update"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_up"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>


<form action="developer_Fee_Config" id="mainForm" name="mainForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="action"  id="action" value="">
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">환경정보 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				콜비 정보 설정</font>
			<hr color="#ff0059" />
			<table id="searchTable" style="background-color: #b8e2fc; margin-top: 20px;">
				<colgroup>
					<col width="1%">	
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td></td>
					<td><b>콜비 정보 수정</b></td>				
					<td></td>
				</tr>	
			</table>
		</div>

		<br/>
		<table id="searchTable"  margin-top: 20px;">
				<colgroup>
					<col width="1%">	
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td></td>
					<td>
					<c:forEach var="data" items="${list }" varStatus="status">
						콜비 금액(콜당): <input type="text" name="developer_fee" value="${data.developer_fee}" size="20" maxlength="5"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="수정" class="blue small btn" id="actBtn"><br /><br />
					</c:forEach>
					</td>				
					<td></td>
				</tr>	
			</table>
</form>		
</body>
</html>
