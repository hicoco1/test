<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(".updateBtn").click(function(){
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
	
	$("#UpdateForm").find("input[name=login_id]").val(login_id);
	$("#UpdateForm").find("input[name=login_passwd]").val(login_passwd);
	if(enabled != null && enabled != '') $("select[name=enabled]").val(enabled).attr("selected","selected");
	if(authority != null && authority != '') $("select[name=authority]").val(authority).attr("selected","selected");
	$("#UpdateForm").find("input[name=e_mail]").val(e_mail);
	$("#UpdateForm").find("input[name=address]").val(address);
	$("#UpdateForm").find("input[name=tel1]").val(tel1);
	$("#UpdateForm").find("input[name=tel2]").val(tel2);
	$("#UpdateForm").find("input[name=position]").val(position);
	$("#UpdateForm").find("input[name=department]").val(department);
	
	$('#Updatepopup').bPopup();
});
</script>
<div id="Updatepopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="UpdateForm" name="UpdateForm" action="updateheadoffice" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action">
				<table>
					<tr>
						<td id ="pop_header">본사 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >아이디 : </td>
						<td><input type="text" name="login_id" value="" readonly="readonly" style="border: none;"></td>
					</tr>
					
					<tr>
						<td>비밀번호 : <br />(수정시에만 입력)</td>
						<td><input type="password" name="login_passwd" value=""></td>
					</tr>
					<tr>
						<td>웹 접근 구분 :</td>
						<td> 
							<select name="enabled">
								<option value="0">비활성화</option>
								<option value="1">활성화</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>그룹 : </td>
						<td>
							<select name="authority">
								<option value="ROLE_ADMIN">관리자</option>
								<option value="ROLE_USER">운영자</option>
								<option value="ROLE_TEST">모니터</option>
							</select>
						</td>
					</tr>
					<tr>
						<td >E-MAIL : </td>
						<td><input type="text" name="e_mail" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >주소 : </td>
						<td><input type="text" name="address" value="" maxlength="100" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >연락처1 : </td>
						<td><input type="text" name="tel1" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >연락처2 : </td>
						<td><input type="text" name="tel2" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >직급 : </td>
						<td><input type="text" name="position" value="" maxlength="10"></td>
					</tr>
					<tr>
						<td >부서 : </td>
						<td><input type="text" name="department" value="" maxlength="20"></td>
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
					</form>
			</div>
</div>