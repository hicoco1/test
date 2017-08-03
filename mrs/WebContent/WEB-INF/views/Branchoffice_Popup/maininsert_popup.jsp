<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /*
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                */
                $("#InsertForm").find("input[name=sample4_postcode]").val(data.zonecode);
                $("#InsertForm").find("input[name=sample4_roadAddress]").val(fullRoadAddr);
                $("#InsertForm").find("input[name=sample4_jibunAddress]").val(data.jibunAddress);
                $("#InsertForm").find("input[name=b_city_code]").val(data.sido);
                $("#InsertForm").find("input[name=b_gu_code]").val(data.sigungu);
                $("#InsertForm").find("input[name=b_addr_appendix]").val(data.buildingName);
               //$("#InsertForm").find("input[name=b_dong_code]").val(data.bname);
               
               // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    if(data.jibunAddress == null || data.jibunAddress == '') {
                    	$("#InsertForm").find("input[name=sample4_jibunAddress]").val(expJibunAddr);
                    }else {
                    	$("#InsertForm").find("input[name=sample4_jibunAddress]").val(data.jibunAddress);
                    }

                } else {
                }
                
                $(".addr_old").css("display",""); 
                $("#InsertForm").find("input[name=b_addr_appendix]").focus();
                $("#InsertForm").find("input[name=addr_chk_flag]").val("1");
            }
        }).open();
}

</script>

<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content">
<form id="InsertForm" name="InsertForm" action="insertbranchoffice" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action"/>
	<input type="hidden" name="addr_chk_flag"/>
	<table>
		<tr>
			<td id ="pop_header">지점 정보 등록</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(*)는 필수입력 항목입니다.</font></td>
		</tr>
	</table>
	<hr color="#87CEFA" />
	<table id ="pop_layout">
	<tr>
	<td></td>
	</tr>
	
	<%--
		<tr>
			<td >지점 ID : </td>
			<td><input type="text" name="b_id" value="" maxlength="5"></td>
		</tr>
		 --%>
		 <tr>
			<td ><font color="red">(*)</font>지점 이름 : </td>
			<td><input type="text" name="b_name" value="" maxlength="50" style=" width:300px;"></td>
		</tr>
		<tr>
			<td>지점 구분 :</td>
			<td> 
				<select name="bid_flag">
					<option value="">선택</option>
					<option value="1" selected>본사 직영</option>
					<option value="2">유치된 지점</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td><font color="red">(*)</font>주소 선택 : </td>
			<td><input type="hidden" id="sample4_postcode" name="sample4_postcode" placeholder="우편번호" readonly="readonly">
				<input type="button" onclick="sample4_execDaumPostcode()" value="주소찾기"><br>
				<span id="guide" style="color:#999"></span>
			</td>
		</tr>
		
		<tr class="addr_old" style="display:none;">
			<td>주소찾기로 검색한 도로명 주소 : </td>
			<td><input type="text" class="required" name="sample4_roadAddress" placeholder="도로명주소" readonly="readonly" style=" width:300px; border:none;"></td>
		</tr>
		<tr class="addr_old" style="display:none;">
			<td>주소찾기로 검색한 지번 주소 : </td>
			<td><input type="text" class="required" name="sample4_jibunAddress" placeholder="지번주소" readonly="readonly" style=" width:300px; border:none;">
		</tr>
		
		<tr class="addr_old" style="display:none;">
			<td>상세(추가)주소 정보 입력 : </td>
			<td><input type="text" name="b_addr_appendix" placeholder="상세주소"></td>
		</tr>
		<%--
		<tr>
						<td>주소 선택 : </td>
						<td>
							<select name="b_city_code" id="b_city_code" class="required" title="지점 시/도를 선택해 주세요.">
								<option value="">-시/도 선택-</option>
								<c:forEach var="nation_data" items="${nation_list }" varStatus="status">
								<option value="${nation_data.city_code}">${nation_data.city_code}</option>
								</c:forEach>
							</select>
							<select name="b_gu_code" id="b_gu_code">
								<option value="">-시/군/구 선택-</option>
							</select>
							<select name="b_town_code" id="b_town_code">
								<option value="">-읍/면 선택-</option>
							</select>
						</td>
					</tr>
				
				<!-- 	<tr>
						<td >리 : </td>
						<td><input type="text" name="li_code" value="" maxlength="20" style=" width:300px;"></td>
					</tr> --><input type="hidden" name="li_code" value="" >
							<input type="hidden" name="san_flag" value="0" >
				
					<tr>
						<td>나머지 주소 입력 :</td>
						<td> 
							<input type="radio" name="addr_flag" value="1" checked >구주소
							<input type="radio" name="addr_flag" value="2">신주소
							
						</td>
					</tr>
					
					
					<tr class="addr_old">
						<td>행정동/리 : </td>
						<td><input type="text" name="b_dong_code"  value="" maxlength="20" style="width:300px;" class="required"></td>
					</tr>
					<tr class="addr_old">
						<td >지번 본번 : </td>
						<td><input type="text" name="b_ji_bonbun" value="" maxlength="5" style=" width:300px;" class="required" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr class="addr_old">
						<td >지번 부번 : </td>
						<td><input type="text" name="b_ji_bubun" value="" maxlength="5" style=" width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
				

					<!-- <tr class="addr_new" style="display:none;">
						<td >도로명 코드 : </td>
						<td>
							<input type="text" name="road_codenum" value="" maxlength="15" style="width:300px;">
						</td>
					</tr> --><input type="hidden" name="road_codenum" value="">
					<tr class="addr_new" style="display:none;">
						<td >도로명 : </td>
						<td><input type="text" name="b_road_code" value="" maxlength="50" style="width:300px;"></td>
					</tr>
					<tr class="addr_new" style="display:none;">
						<td >도로명 건물 본번 : </td>
						<td><input type="text" name="b_road_bonbun" value="" maxlength="15" style="width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr class="addr_new" style="display:none;">
						<td >도로명 건물 부번 : </td>
						<td><input type="text" name="b_road_bubun" value="" maxlength="50" style="width:300px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<td >추가 주소 정보 : </td>
						<td><input type="text" name="b_addr_appendix" value="" maxlength="50" style=" width:300px;"></td>
					</tr>
		 --%>
		
	
		<tr>
			<td >지점 잔액 : </td>
			<td><input type="text" name="b_balance" value="" maxlength="10" style=" width:100px; ime-mode:disabled;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
			</td>
		</tr>
		<tr>
			<td >사업자 번호 : </td>
			<td><input type="text" name="b_crn" id="b_crn" value="" maxlength="12" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; width:150px;'></td>
		</tr>
		<tr>
			<td >연락처1 : </td>
			<td><input type="text" name="b_tel1" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; width:150px;'></td>
		</tr>
		<tr>
			<td >연락처2 : </td>
			<td><input type="text" name="b_tel2" value="" maxlength="20" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled; width:150px;'></td>
		</tr>
		<tr>
			<td ><font color="red">(*)</font>로그인 계정 : </td>
			<td><input type="text" name="login_id" value="" maxlength="20">
			<input type="button" value="중복확인" class="dupBtn blue small btn" >
			</td>
		</tr>
		<tr>
			<td ><font color="red">(*)</font>로그인 비밀번호 : </td>
			<td><input type="password" name="login_passwd" value="" maxlength="60"></td>
		</tr>
		<tr>
			<td >지점 상태 : </td>
			<td>
				<select name="active_status">
					<option value="">선택</option>
					<option value="0" selected>정상</option>
					<option value="1">해지</option>
					<option value="2">중지(가상계좌 잔액부족)</option>
					<option value="R">등록중인 상태(가등록)</option>
				</select>
			</td>
		</tr>
		<tr>
			<td >배차 방식 : </td>
			<td>
				<select name="bc_type">
					<option value="">선택</option>
					<option value="0" selected>전투 배차</option>
					<option value="1">강제 배차</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Warning_Amount : </td>
			<td><input type="text" name="warning_amount" class="input_click_init" value="0" maxlength="10" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
		</tr>
		<tr>
			<td>Suspend_Amount : </td>
			<td><input type="text" name="suspend_amount"  class="input_click_init" value="0" maxlength="10" datetimeonly="true" style='ime-mode:disabled;'></td>
		</tr>
		<tr>
			<td>라이더별 동시 배달 가능 콜수 : </td>
			<td><input type="text" name="max_call" class="input_click_init" value="3" maxlength="1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
		</tr>
		<tr>
			<td>배달기사 콜 잡기 지연 패널티 값 : </td>
			<td><input type="text" name="callcatch_penalty_value" class="input_click_init" value="0" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>&nbsp;초</td>
		</tr>
		<tr>
			<td>일괄 기사 도착 지연 설정 : </td>
			<td>
				<select name="rider_delay_set">
					<option value="">선택</option>
					<option value="0" selected>기사 도착 지연 없음</option>
					<option value="1">기사 도착 지연 발생함</option>
					<option value="2">무한정 지연</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>일괄 기사 도착 지연 시간 : </td>
			<td><input type="text" name="rider_delay_duration" class="input_click_init" value="0" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>&nbsp;분</td>
		</tr>
		<tr>
			<td>배달 기사 도착 임박 시간 : </td>
			<td><input type="text" name="alarm_limit_duration" class="input_click_init" value="0" maxlength="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>&nbsp;분</td>
		</tr>
		<tr>
			<td>기사 카드결제 금액 수정 여부 : </td>
			<td>
				<select name="ridercard_flag">
					<option value="1" selected>카드결제금액 수정 가능</option>
					<option value="2">카드결제금액 수정 불가능</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>일괄 할증 설정 : </td>
			<td>
				<select name="batch_extra_flag">
					<option value="">선택</option>
					<option value="0" selected>미설정</option>
					<option value="1">설정</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>일괄 할증 금액 : </td>
			<td><input type="text" name="batch_extra_amount"  class="input_click_init" value="0" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
		</tr>
		<tr>
			<td>서비스 타입 : </td>
			<td>
				<select name="service_type">
					<option value="">선택</option>
					<option value="1" selected="selected">배달 대행</option>
					<option value="2">심부름 대행</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>금액 계산 방식 : </td>
			<td>
				<select name="charge_method">
					<option value="">선택</option>
					<option value="1" selected="selected">거리금액</option>
					<option value="2">구간금액</option>
					<option value="3">지정요금제</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">(*)</font>기준거리 : </td>
			<td><input type="text" name="basic_distance" value="" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>&nbsp;m</td>
		</tr>
		<tr>
			<td>기본 요금 : </td>
			<td><input type="text" name="basic_charge"  class="input_click_init" value="2500" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
		</tr>
		<tr>
			<td>추가 기준거리 : </td>
			<td><input type="text" name="add_distance"  class="input_click_init" value="100" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>&nbsp;m</td>
		</tr>
		<tr>
			<td>추가 요금 : </td>
			<td><input type="text" name="add_charge" class="input_click_init" value="100" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
		</tr>
		<tr>
			<td>지점 콜비금액 : </td>
			<td><input type="text" name="calculatepercall" class="input_click_init" value="0" maxlength="5" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
		</tr>
		<tr>
			<td>영업 시작 시간 : </td>
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
			<td>영업 종료 시간 : </td>
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
			<td>가상계좌/실계좌 사용구분: </td>
			<td>
				<select name="account_flag" id="account_flag">
					<option value="1" selected="selected">가상계좌</option>
					<option value="2">실계좌</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">(*)</font>가상계좌 은행 : </td>
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
		<!-- 
		<tr class="addr_old2" style="display:none;">
			<td><font color="red">(*)</font>실계좌 은행 : </td>
			<td><input type="text" name="b_bank" value="" maxlength="50" style="border: none;"></td>
		</tr>
		 -->
		<%--
		<tr>
			<td>가맹비 계좌 번호 : </td>
			<td>
			<select name="v_account" id="v_account">
				<option value="">가맹비 계좌 번호</option>
			</select>
			</td>
		</tr>
		 --%>
		 <tr>
			<td><font color="red">(*)</font>대표자 이름 : </td>
			<td><input type="text" name="b_representative" value="" maxlength="50"></td>
		</tr>
		<!-- 
		<tr>
         <td>예금주 : </td>
         <td>
            <c:if test="${!empty list_bank}" >
            <c:forEach var="list_config" items="${list_config}" varStatus="i">
               <input type="text" name="v_name" value="${list_config.h_name}" maxlength="20" class="readonly" style="border: none;">
               </c:forEach>
            </c:if>
         </td>
      </tr>
       -->
		<!-- 
		<tr>
			<td>s_sequence : </td>
			<td><input type="text" name="s_sequence" value="" maxlength="10"></td>
		</tr>
		<tr>
			<td>r_sequence : </td>
			<td><input type="text" name="r_sequence" value="" maxlength="10"></td>
		</tr>
		 --> 
		<tr>
			<td>계약 시작 일자 : </td>
			<td><input type="text" name="contract_sdate" id="contract_sdate" value="" class="readonly"></td>
		</tr>
		<tr>
			<td>계약 종료 일자 : </td>
			<td><input type="text" name="contract_edate" id="contract_edate" value="" class="readonly"></td>
		</tr>
		
		<tr>
			<td><input type="hidden" name="insert_date" value=""></td>
		</tr>
		
		<tr>
			<td>서비스 시작 일자 : </td>
			<td><input type="text" name="service_start_date" id="service_start_date" value=""  class="readonly"></td>
		</tr>
		
		<tr>
			<td><input type="hidden" name="update_date" value=""></td>
		</tr>
		<tr>
			<td><input type="hidden" name="r_op_id" value=""></td>
		</tr>
		<tr>
			<td><input type="hidden" name="u_op_id" value=""></td>
		</tr>
		<tr>
			<td><input type="hidden" name="b_id" value=""></td>
		</tr>
		<tr>
			<td>정산 주기 : </td>
			<td>
				<select name="calculate_period">
					<option value="">선택</option>
					<option value="1">일단위 정산</option>
					<option value="2" selected>주단위 정산</option>
					<option value="3">월단위 정산</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>정산 날짜 : </td>
			<td>
				<select name="calculate_date">
					<option value="">선택</option>
					<option value="1">일단위</option>
					<option value="2" selected>주단위</option>
					<option value="3">월단위</option>
				</select>
			</td>
		</tr>
			<input type="hidden" name="b_address" value="">
			<input type="hidden" name="location_x" value="">
			<input type="hidden" name="location_y" value="">
			<input type="hidden" name="b_city_code" value="">
			<input type="hidden" name="b_gu_code" value="">
			<input type="hidden" name="b_dong_code" value="">
			<input type="hidden" name="b_town_code" value="">
		</table>
		<hr color="#87CEFA" />
		<table id ="pop_layout_btn">
		<tr>
			<td><input type="button" value="등록" class="blue small btn" id="act_insert"></td>
			<td><input type="button" value="취소" class="white small btn" id="act_cancel"></td>
		</tr>
	</table>
	<input type="hidden" name="v_account" value="">
	<!-- 
	<input type="hidden" name="gu_code" value="">
	 -->
		</form>
	</div>
</div>