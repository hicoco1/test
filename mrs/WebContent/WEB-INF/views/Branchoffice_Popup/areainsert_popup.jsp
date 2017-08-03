<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
		<form id="InsertForm" name="InsertForm" action="insertbranchoffice_area" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">지점 관할지역 등록</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점 ID : </td>
						<td><input type="hidden" name="idx" value="">
						<c:if test="${!empty list_bid}" >
							<select name="b_id" id="b_id" style="width:80px;">
								<option value="">선택</option>
								<c:forEach var="list_bid" items="${list_bid}" varStatus="i">
									<option value="${list_bid.b_id}">${list_bid.b_id}</option>
								</c:forEach>
							</select>
						</c:if>
						</td>
					</tr>
					<tr>
						<td>COVER_FLAG :</td>
						<td> 
							<select name="cover_flag">
								<option value="" selected>선택</option>
								<option value="1">주 관할</option>
								<option value="2">인접 관할</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>관할 지역 : </td>
						<td>
							<select name="city_code" id="city_code">
								<option value="">-시/도 선택-</option>
								<c:forEach var="nation_data" items="${nation_list }" varStatus="status">
								<option value="${nation_data.city_code}">${nation_data.city_code}</option>
								</c:forEach>
							</select>
							<select name="gu_code" id="gu_code">
								<option value="">-시/군/구 선택-</option>
							</select>
							<select name="town_code" id="town_code">
								<option value="">-읍/면 선택-</option>
							</select>
						</td>
					</tr>
					</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="등록" class="blue small btn" id="act_insert"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel"></td>
					</tr>
				</table>
				<input type="hidden" name="gu_code" value="">
			</form>
	</div>
</div>