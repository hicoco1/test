<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<div id="addr_ver_popup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="VerupForm" name="VerupForm" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table >
					<tr>
						<td id ="pop_header">지점 주소 버전 적용</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점이름(ID) : </td>
						<td width="100"><input type="hidden" name="idx" value="">
						<c:if test="${!empty list_bid}" >
							<select name="b_id" id="b_id">
								<option value="">선택</option>
								<c:forEach var="list_bid" items="${list_bid}" varStatus="i">
									<option value="${list_bid.b_id}">${list_bid.b_name}(${list_bid.b_id})</option>
								</c:forEach>
							</select>
						</c:if>
						</td>
					</tr>
					<tr>
					<div style="float:right"><input type="button" value="적용" class="version_upBtn blue big btn" id="version_upBtn"></div>
					</tr>
				</table>
					</form>
			</div>
</div>
