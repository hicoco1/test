<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<div id="Insertpopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="InsertForm" name="InsertForm" action="insertbranchoffice_addr" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
			<input type="hidden" name="addr_chk_flag"/>
				<table>
					<tr>
						<td id ="pop_header">지점 주소 정보 등록</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점이름(ID) : </td>
						<td><input type="hidden" name="idx" value="">
						<c:if test="${!empty list_bid}" >
							<select name="b_id" id="b_id" class="required" title="지점 ID를 선택해 주세요.">
								<option value="">선택</option>
								<c:forEach var="list_bid" items="${list_bid}" varStatus="i">
									<option value="${list_bid.b_id}">${list_bid.b_name}(${list_bid.b_id})</option>
								</c:forEach>
							</select>
						</c:if>
						</td>
					</tr>
					<tr>
					<td>주소 선택 : </td>
					<td>
						<input type="hidden" name="sample3_postcode" placeholder="우편번호">
						<input type="button" onclick="sample3_execDaumPostcode_in()" value="주소 찾기"><br>
						<div id="wrap_up2" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode_in()" alt="접기 버튼">
						</div>
					</td>
					</tr>
					
					<tr class="addr_old" style="display:none;">
						<td>주소 찾기로 선택한 지번 주소 : </td>
						<td>
							<input type="text" name="full_addr" style="width: 300px; border:none;" readonly="readonly">
						</td>
					</tr>
					
					<tr class="addr_old" style="display:none;">
						<td>주소 찾기로 선택한 도로명 주소 : </td>
						<td>
							<input type="text" name="full_addr_road" style="width: 300px; border:none;" readonly="readonly">
						</td>
					</tr>
					<input type="hidden" name="city_code" value="">
					<input type="hidden" name="gu_code" value="">
					<input type="hidden" name="road_codenum" value="">
					<input type="hidden" name="li_code" value="">
					<input type="hidden" name="dong_code" value="">
					<input type="hidden" name="town_code" value="">
					<input type="hidden" name="ji_bonbun" value="">
					<input type="hidden" name="ji_bubun" value="">
					<input type="hidden" name="road_code" value="">
					<input type="hidden" name="road_bonbun" value="">
					<input type="hidden" name="road_bubun" value="">
					<input type="hidden" name="san_flag" value="0" >
					<%--
					<tr>
						<td>주소 선택 : </td>
						<td>
							<select name="city_code" id="city_code" class="required" title="지점 시/도를 선택해 주세요.">
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
						<td><input type="text" name="dong_code"  value="" maxlength="20" style="width:300px;" class="required"></td>
					</tr>
					<tr class="addr_old">
						<td >지번 본번 : </td>
						<td><input type="text" name="ji_bonbun" value="" maxlength="5" style=" width:300px;" class="required"></td>
					</tr>
					<tr class="addr_old">
						<td >지번 부번 : </td>
						<td><input type="text" name="ji_bubun" value="" maxlength="5" style=" width:300px;"></td>
					</tr>
					 --%>
				

					<!-- <tr class="addr_new" style="display:none;">
						<td >도로명 코드 : </td>
						<td>
							<input type="text" name="road_codenum" value="" maxlength="15" style="width:300px;">
						</td>
					</tr> -->
					<%--
					<tr class="addr_new" style="display:none;">
						<td >도로명 : </td>
						<td><input type="text" name="road_code" value="" maxlength="50" style="width:300px;"></td>
					</tr>
					<tr class="addr_new" style="display:none;">
						<td >도로명 건물 본번 : </td>
						<td><input type="text" name="road_bonbun" value="" maxlength="15" style="width:300px;"></td>
					</tr>
					<tr class="addr_new" style="display:none;">
						<td >도로명 건물 부번 : </td>
						<td><input type="text" name="road_bubun" value="" maxlength="50" style="width:300px;"></td>
					</tr>
					 --%>
					<tr>
						<td>아파트/건물명 : </td>
						<td><input type="text" name="building_name" value="" maxlength="50" style="width:300px;" class="required"></td>
					</tr>
					<tr>
						<td>동/호수 : </td>
						<td><input type="text" name="building_dongho" value="" maxlength="50" style="width:300px;"></td>
					</tr>
						<input type="hidden" name="location_x" value="">
						<input type="hidden" name="location_y" value="">
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

<script>

    // 우편번호 찾기 찾기 화면을 넣을 element
    var wrap_up2 = document.getElementById('wrap_up2');

    function foldDaumPostcode_in() {
        // iframe을 넣은 element를 안보이게 한다.
        wrap_up2.style.display = 'none';
    }

    function sample3_execDaumPostcode_in() {
        // 현재 scroll 위치를 저장해놓는다.
        new daum.Postcode({
            oncomplete: function(data) {                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 				var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }else {
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
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#InsertForm").find("input[name=sample3_postcode]").val(data.zonecode);
                $("#InsertForm").find("input[name=full_addr_road]").val(fullRoadAddr);
                $("#InsertForm").find("input[name=full_addr]").val(data.jibunAddress);
                $("#InsertForm").find("input[name=building_name]").val(data.buildingName);
                $("#InsertForm").find("input[name=city_code]").val(data.sido);
                $("#InsertForm").find("input[name=gu_code]").val(data.sigungu);
                $("#InsertForm").find("input[name=road_codenum]").val(data.roadnameCode);
				
            	// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    if(data.jibunAddress == null || data.jibunAddress == '') {
                    	$("#InsertForm").find("input[name=full_addr]").val(expJibunAddr);
                    }else {
                    	$("#InsertForm").find("input[name=full_addr]").val(data.jibunAddress);
                    }

                } else {
                }
                
                $(".addr_old").css("display",""); 
                $("#InsertForm").find("input[name=addr_chk_flag]").val("1");
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                wrap_up2.style.display = 'none';
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
          
            width : '100%',
            height : '100%'
        }).embed(wrap_up2);
        // iframe을 넣은 element를 보이게 한다.
        wrap_up2.style.display = 'block';
    }
</script>