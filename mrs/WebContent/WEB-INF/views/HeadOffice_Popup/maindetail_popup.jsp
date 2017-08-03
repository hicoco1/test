<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(".detailBtn").click(function(){
	var login_id = $(this).parent().find(".login_id").val();
	var login_passwd = $(this).parent().find(".login_passwd").val();
	var enabled = $(this).parent().find(".enabled").val();
	var authority = $(this).parent().find(".authority").val();
	var e_mail = $(this).parent().find(".e_mail").val();
	var address = $(this).parent().find(".address").val();
	var tel1 = $(this).parent().find(".tel1").val();
	var tel2 = $(this).parent().find(".tel2").val();
	var position = $(this).parent().find(".position").val();
	var department = $(this).parent().find(".department").val();

	if(enabled == "") {
		enabled = "";
	}else if(enabled == "1") {
		enabled = "활성화";		
	}else {
		enabled = "비활성화";
	}
	
	if(authority == "") {
		authority = "";
	}else if(authority == "ROLE_ADMIN") {
		authority = "관리자";		
	}else if(authority == "ROLE_USER"){
		authority = "운영자";
	}else {
		authority = "모니터";
	}

	$("#DetailForm").find("input[name=login_id]").val(login_id);
	$("#DetailForm").find("input[name=login_passwd]").val(login_passwd);
	$("#DetailForm").find("input[name=enabled]").val(enabled);
	$("#DetailForm").find("input[name=authority]").val(authority);
	$("#DetailForm").find("input[name=e_mail]").val(e_mail);
	$("#DetailForm").find("input[name=address]").val(address);
	$("#DetailForm").find("input[name=tel1]").val(tel1);
	$("#DetailForm").find("input[name=tel2]").val(tel2);
	$("#DetailForm").find("input[name=position]").val(position);
	$("#DetailForm").find("input[name=department]").val(department);
	
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
						<td>아이디 : </td>
						<td><input type="text" name="login_id" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>웹 접근 구분 :</td>
						<td><input type="text" name="enabled" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>그룹 : </td>
						<td><input type="text" name="authority" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >E-MAIL : </td>
						<td><input type="text" name="e_mail" value="" maxlength="50" readonly="readonly"></td>
					</tr>
					<tr>
						<td >주소 : </td>
						<td><input type="text" name="address" value="" maxlength="100" readonly="readonly"></td>
					</tr>
					<tr>
						<td >연락처1 : </td>
						<td><input type="text" name="tel1" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >연락처2 : </td>
						<td><input type="text" name="tel2" value="" maxlength="20" readonly="readonly"></td>
					</tr>
					<tr>
						<td >직급 : </td>
						<td><input type="text" name="position" value="" maxlength="10" readonly="readonly"></td>
					</tr>
					<tr>
						<td >부서 : </td>
						<td><input type="text" name="department" value="" maxlength="20" readonly="readonly"></td>
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