<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
document.oncontextmenu = new Function('return false'); 

function number_filter(str_value){
	return str_value.replace(/[^0-9]/gi, ""); 
}

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
                $("#InsertForm").find("input[name=r_addr_appendix]").val(data.buildingName);
                $("#InsertForm").find("input[name=r_city_code]").val(data.sido);
                $("#InsertForm").find("input[name=r_gu_code]").val(data.sigungu);
                //$("#InsertForm").find("input[name=r_dong_code]").val(data.bname);
                
                //사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
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
<form id="InsertForm" name="InsertForm" action="insertbranchoffice_rider" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action"/>
	<input type="hidden" name="addr_chk_flag"/>
	<table>
		<tr>
			<td id ="pop_header">기사 정보 등록</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(*)는 필수입력 항목입니다.</font></td>
		</tr>
	</table>
	<hr color="#87CEFA" />
	<table id ="pop_layout">
		<tr>
			<td><font color="red">(*)</font>소속 지점 ID(이름) : </td>
			<td><input type="hidden" name="idx" value="">
			<c:if test="${!empty list_bid}" >
				<select name="b_id" id="b_id">
					<option value="">선택</option>
					<c:forEach var="list_bid" items="${list_bid}" varStatus="i">
						<option value="${list_bid.b_id}">${list_bid.b_id}(${list_bid.b_name})</option>
					</c:forEach>
				</select>
			</c:if>
			</td>
		</tr>
		<tr>
			<td ><font color="red">(*)</font>기사 이름 : </td>
			<td><input type="text" name="r_name" value="" maxlength="20" style=" width:150px;"></td>
		</tr>
		<tr>
			<td ><font color="red">(*)</font>배달기사 소속 유형 : </td>
			<td>
				<select name="r_type">
					<option value="0" selected>지점 소속 기사</option>
					<option value="1">업소 소속 기사</option>
				</select>
			</td>
		</tr>
		<tr>
			<td >사업자번호 : </td>
			<td><input type="text" name="r_crn" id="r_crn" value="" maxlength="12" style=" width:150px;" onkeyup="this.value=number_filter(this.value);"></td>
		</tr>
		<tr>
			<td ><font color="red">(*)</font>전화번호 : </td>
			<td><input type="text" name="r_tel1" value="" maxlength="11" style=" width:150px;" onkeyup="this.value=number_filter(this.value);"></td>
		</tr>
		<tr>
			<td >동시배달가능콜수 : </td>
			<td>
				<select name="max_call">
					<option value="0">선택</option>
					<option value="5"selected>5개</option>
					<option value="10">10개</option>
					<option value="15">15개</option>
				</select>
			</td>
		</tr>
		<tr>
			<td ><font color="red">(*)</font>로그인 계정 : </td>
			<td><input type="text" name="login_id" value="" maxlength="20">
			<%--
			<input type="button" value="중복확인" class="blue small btn" id="act_dupchk">
			 --%>
			<input type="button" value="중복확인" class="dupBtn blue small btn">
			</td>
		</tr>
		<tr>
			<td ><font color="red">(*)</font>로그인 비밀번호 : </td>
			<td><input type="password" name="login_passwd" value="" maxlength="60"></td>
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
			<td><input type="text" name="r_addr_appendix" placeholder="상세주소"></td>
		</tr>
		<tr>
			<td>계약 시작 일자 : </td>
			<td><input type="text" name="contract_sdate" id="contract_sdate" value="" class="readonly"></td>
		</tr>
		<tr>
			<td>계약 종료 일자 : </td>
			<td><input type="text" name="contract_edate" id="contract_edate" value="" class="readonly"></td>
		</tr>
		<tr>
			<td >청약상태 : </td>
			<td>
				<select name="active_status">
					<option value="0" selected>정상</option>
					<option value="1">해지</option>
					<option value="2">중지(가상계좌 잔액부족)</option>
					<option value="3">중지(지각)</option>
					<option value="4">중지(콜거부)</option>
					<option value="5">중지(불성실)</option>
					<option value="R">청약(가등록)</option>
				</select>
			</td>
		</tr>
		<tr>
			<td >카드 단말기 보유 : </td>
			<td>
				<select name="card_keep_flag">
					<option value="1" selected>보유</option>
					<option value="0">미보유</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>카드 결제기 ID : </td>
			<td><input type="text" name="card_id" value="" maxlength="20"></td>
		</tr>
		<tr>
			<td>콜잡기 Delay : </td>
			<td><input type="text" name="callcatch_penalty_value" value="" onkeyup="this.value=number_filter(this.value);" maxlength="3">초</td>
		</tr>
		
		<tr>
			<td>서비스 시작 일자 : </td>
			<td><input type="text" name="service_start_date" id="service_start_date" value=""  class="readonly"></td>
		</tr>
			<input type="hidden" name="r_address" value="">
			<input type="hidden" name="r_city_code" value="">
			<input type="hidden" name="r_gu_code" value="">
			<input type="hidden" name="r_town_code" value="">
			<input type="hidden" name="r_dong_code" value="">
			<input type="hidden" name="location_x" value="">
			<input type="hidden" name="location_y" value="">
			<input type="hidden" name="insert_date" value="">
			<input type="hidden" name="update_date" value="">
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