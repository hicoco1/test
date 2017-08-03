<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs_CS.jsp"%>
<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
		<form id="InsertForm" name="InsertForm" action="insertbranchoffice_store_CS" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action" />
				<table>
					<tr>
						<td id ="pop_header">업소 정보 등록</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td rowspan="18">업소 기본 정보</td>
					</tr>
					<tr>
						<td>소속 지점 ID(이름) : </td>
						<td><input type="hidden" name="idx" value="">
						<input type="text" name="b_id" value="${decText}" readonly>
						</td>
					</tr>
					<tr>
						<td>대표자 이름 : </td>
						<td><input type="text" name="s_representative" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td >가맹점 이름 : </td>
						<td><input type="text" name="s_name" value="" maxlength="50"></td>
					</tr>
					<tr>
						<td>가맹점 상태 :</td>
						<td> 
							<select name="active_status">
								<option value="">선택</option>
								<option value="0" selected>정상</option>
								<option value="1">해지</option>
								<option value="2">중지(가상계좌 잔액부족)</option>
								<option value="3">등록중인 상태(가등록)</option>
							</select>
						</td>
					</tr>
					<tr>
						<td >기사 도착 제한 시간(단위 : 분) : </td>
						<td><input type="text" name="cook_time"  class="input_click_init" value="15" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>가맹점 사용 수신단말 타입 :</td>
						<td> 
							<select name="terminal_type">
								<option value="">선택</option>
								<option value="0">미사용</option>
								<option value="1" selected>CID단말기</option>
								<option value="2">IP단말기</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td >서비스 타입 : </td>
						<td>
							<select name="service_type">
								<option value="">선택</option>
								<option value="1" selected>배달대행</option>
								<option value="2">심부름 대행</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>기사 도착 지연 시간(단위 : 분 / 예) 0: 지연 없음) : </td>
						<td><input type="text" name="rider_delay_duration" class="input_click_init" value="0" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					
					
					<tr>
						<td >사업자 번호 : </td>
						<td><input type="text" name="s_crn" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>연락처1 : </td>
						<td><input type="text" name="s_tel1" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>연락처2 : </td>
						<td><input type="text" name="s_tel2" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>로그인 계정 : </td>
						<td><input type="text" name="login_id" value="" maxlength="20">
						<%--
						<input type="button" value="중복확인" class="dupBtn blue small btn">
						 --%>
						</td>
					</tr>
					<tr>
						<td>로그인 패스워드 : </td>
						<td><input type="password" name="login_passwd" value="" maxlength="60"></td>
					</tr>
					<tr>
						<td>계약 시작 일자(YYYYMMDD) : </td>
						<td><input type="text" name="contract_sdate" id="contract_sdate" value="" class="readonly"></td>
					</tr>
					<tr>
						<td>계약 종료 일자(YYYYMMDD) : </td>
						<td><input type="text" name="contract_edate" id="contract_edate" value="" class="readonly"></td>
					</tr>
					<tr>
						<td>서비스 시작 일자(YYYYMMDD) : </td>
						<td><input type="text" name="service_start_date" id="service_start_date" value="" class="readonly"></td>
					</tr>
					<tr>
						<td >가맹점 유형 : </td>
						<td>
							<select name="store_type">
								<option value="">선택</option>
								<option value="0" selected>일반가맹점</option>
								<option value="1">프랜차이즈</option>
								<option value="2">지자체지정업소/맛집/멋집</option>
								<option value="3">외국브랜드업체</option>
								<option value="4">푸드코트</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<%-- 
					<tr>
						<td >가맹점 ID : </td>
						<td><input type="text" name="s_id" value="" maxlength="10"></td>
					</tr>
					--%>
					<tr>
						<td rowspan="3">주소</td>
					</tr>
					<tr>
						<td >가맹점 주소1 : </td>
						<td><input type="text" name="s_addr1" value="" maxlength="100" style=" width:300px;"></td>
					</tr>
					<tr>
						<td >가맹점 주소2 : </td>
						<td><input type="text" name="s_addr2" value="" maxlength="100" style=" width:300px;"></td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="3">업소 서비스 정보</td>
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
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>	
					
				<tr>
					<td rowspan="4"  style="border-right: 1px;">업소 카드 결제 정보 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
					<tr>
						<td>CAT_ID : </td>
						<td><input type="text" name="cat_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>VAN_ID : </td>
						<td><input type="text" name="van_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>가상계좌 은행 : </td>
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
					<%--
					<tr>
						<td>가상 계좌 계좌번호 : </td>
						<td><input type="text" name="v_account" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					 --%>
					 <%--
					<tr>
						<td>가상 계좌 예금주 : </td>
						<td><input type="text" name="v_name" value="" maxlength="20"></td>
					</tr>
					 --%>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					
					<tr>
						<td rowspan="15">업소 과금 정보</td>
					</tr>
					<tr>
						<td >금액 계산 방식 : </td>
						<td>
							<select name="charge_method">
								<option value="">선택</option>
								<option value="1" selected>거리금액</option>
								<option value="2">구간금액</option>
								<option value="3">지정요금제</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>잔액 : </td>
						<td><input type="text" name="s_balance"  class="input_click_init" value="0" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >월 납부 금액 : </td>
						<td><input type="text" name="monthly_fee" class="input_click_init" value="0" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >기준 거리(단위 : m) : </td>
						<td><input type="text" name="basic_distance" class="input_click_init" value="2500" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >기본 요금 : </td>
						<td><input type="text" name="basic_charge" class="input_click_init" value="100" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >추가 기준 거리(단위 : m) : </td>
						<td><input type="text" name="add_distance" class="input_click_init" value="100" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td >추가 요금 : </td>
						<td><input type="text" name="add_charge" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>일괄 할증 금액(예) 0:할증 없음) : </td>
						<td><input type="text" name="batch_extra_amount" class="input_click_init" value="0" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>마지막 충전 금액 : </td>
						<td><input type="text" name="last_recharge_amount" value=""  maxlength="6" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>마지막 충전 일자(YYYYMMDD) : </td>
						<td><input type="text" name="last_recharge_date" id="lastrechg" value="" class="readonly"></td>
					</tr>
					<tr>
						<td>요금 타입 : </td>
						<td>
							<select name="charge_type">
								<option value="">선택</option>
								<option value="1" selected>선불</option>
								<option value="2">후불</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>요금 옵션 : </td>
						<td>
							<select name="charge_option">
								<option value="">선택</option>
								<option value="1" selected>콜당 차감</option>
								<option value="2">일별 차감</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>신용카드 결제 사용 여부 : </td>
						<td>
							<select name="credit_used_flag">
								<option value="">선택</option>
								<option value="0" selected>미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
					<!-- 신용카드 결제 사용일때 -->
					<tr>
						<td>가맹점 결제 ID : </td>
						<td><input type="text" name="credit_member_id" value=""></td>
					</tr>
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="4">CID 정보</td>
					</tr>
					<tr>
						<td >CID단말기 코드 : </td>
						<td><input type="text" name="cid_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>CID Client 연결 상태 :</td>
						<td> 
							<select name="cid_connect_status">
								<option value="">선택</option>
								<option value="0" selected>미연결</option>
								<option value="1">연결</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>CID 연결 Port:</td>
						<td> 
							<select name="cid_port">
								<option value="">선택</option>
								<option value="1" selected>COM1</option>
								<option value="2">COM2</option>
								<option value="3">COM3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="7">전표 프린터 정보</td>
					</tr>
					<tr>
						<td >프린터 단말기 코드 : </td>
						<td><input type="text" name="printer_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td>프린터 Client 연결 상태 :</td>
						<td> 
							<select name="printer_connect_status">
								<option value="">선택</option>
								<option value="0" selected>미연결</option>
								<option value="1">연결</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>프린터 연결 Port:</td>
						<td> 
							<select name="printer_port">
								<option value="" selected>선택</option>
								<option value="1">COM1</option>
								<option value="2">COM2</option>
								<option value="3">COM3</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>매장용 전표 출력 여부 : </td>
						<td>
							<select name="store_statement">
								<option value="">선택</option>
								<option value="0" selected>미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>주방용 전표 출력 여부 : </td>
						<td>
							<select name="kitchen_statement">
								<option value="">선택</option>
								<option value="0" selected>미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>고객용 전표 출력 여부 : </td>
						<td>
							<select name="customer_statement">
								<option value="">선택</option>
								<option value="0" selected>미사용</option>
								<option value="1">사용</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="4">Noti</td>
					</tr>
					<tr>
						<td>Noti 전송 설정 여부 : </td>
						<td>
							<select name="noti_flag">
								<option value="">선택</option>
								<option value="0" selected>미전송</option>
								<option value="1">전송</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>배달기사 수배완료 시 Noti 전송 : </td>
						<td>
							<select name="noti_rider_assign">
								<option value="">선택</option>
								<option value="0" selected>미전송</option>
								<option value="1">전송</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>카드결제 시 Noti 전송 : </td>
						<td>
							<select name="noti_card_pay">
								<option value="">선택</option>
								<option value="0" selected>미전송</option>
								<option value="1">전송</option>
							</select>
						</td>
					</tr>
					
					
					
					
					
					
					
					
					
					
					<!-- 
					<tr>
						<td >가맹점 위치 X좌표 : </td>
						<td><input type="text" name="location_x" value=""></td>
					</tr>
					<tr>
						<td >가맹점 위치 Y좌표 : </td>
						<td><input type="text" name="location_y" value=""></td>
					</tr>
					 -->
					
					
					<tr>
						<td colspan="3"><br/><hr color="#87CEFA" /><br/></td>
					</tr>
					<tr>
						<td rowspan="3">주문/변경/취소 건수</td>
					</tr>
					<tr>
						<td>일 단위 주문 건수 : </td>
						<td><input type="text" name="daily_order_count" class="input_click_init" value="0" maxlength="6" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td>월 단위 주문 건수 : </td>
						<td><input type="text" name="monthly_order_count" class="input_click_init" value="0" maxlength="6" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
					</tr>
					<tr>
						<td><input type="hidden" name="update_date" id="update_date" value=""></td>
					</tr>
					<tr>
						<td><input type="hidden" name="insert_date" id="insert_date" value=""></td>
					</tr>
					<tr>
						<td><input type="hidden" name="r_op_id" value="" maxlength="20"></td>
					</tr>
					<tr>
						<td><input type="hidden" name="u_op_id" value="" maxlength="20"></td>
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