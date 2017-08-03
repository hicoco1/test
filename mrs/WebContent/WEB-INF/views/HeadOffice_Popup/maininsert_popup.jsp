<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="InsertForm" name="InsertForm" action="insertheadoffice" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">본사 정보 등록</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >아이디 : </td>
						<td><input type="text" name="login_id" value="" maxlength="45"></td>
					</tr>
					<tr>
						<td>비밀번호 : </td>
						<td><input type="password" name="login_passwd" value="" maxlength="45"></td>
					</tr>
					<tr>
						<td>웹 접근 구분 :</td>
						<td> 
							<select name="enabled">
								<option value="0">비활성화</option>
								<option value="1" selected>활성화</option>
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
						<td >전화번호1 : </td>
						<td><input type="text" name="tel1" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >전화번호2 : </td>
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
						<td><input type="button" value="등록" class="blue small btn" id="act_insert"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel"></td>
					</tr>
				</table>
					</form>
			</div>
		</div>