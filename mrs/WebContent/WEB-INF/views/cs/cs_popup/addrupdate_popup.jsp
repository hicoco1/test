<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs_CS.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

$(".updateBtn").click(function(){
	var idx = $(this).parent().find(".idx").val();
	var b_id = $(this).parent().find(".b_id").val();
	var b_name = $(this).parent().find(".b_name").val();
	var building_name = $(this).parent().find(".building_name").val();
	var building_dongho = $(this).parent().find(".building_dongho").val();
	var full_addr = $(this).parent().find(".full_addr").val();
	var full_addr_road = $(this).parent().find(".full_addr_road").val();
	var location_x = $(this).parent().find(".location_x").val();
	var location_y = $(this).parent().find(".location_y").val();
	var city_code = $(this).parent().find(".city_code").val();
	var gu_code = $(this).parent().find(".gu_code").val();
	var town_code = $(this).parent().find(".town_code").val();
	var li_code = $(this).parent().find(".li_code").val();
	var dong_code = $(this).parent().find(".dong_code").val();
	var ji_bonbun = $(this).parent().find(".ji_bonbun").val();
	var ji_bubun = $(this).parent().find(".ji_bubun").val();
	var road_codenum = $(this).parent().find(".road_codenum").val();
	var road_code = $(this).parent().find(".road_code").val();
	var road_bonbun = $(this).parent().find(".road_bonbun").val();
	var road_bubun = $(this).parent().find(".road_bubun").val();
	
	$("#UpdateForm").find("input[name=idx]").val(idx);
	$("#UpdateForm").find("input[name=b_id]").val(b_id);
	$("#UpdateForm").find("input[name=b_name]").val(b_name);
	$("#UpdateForm").find("input[name=building_name]").val(building_name);
	$("#UpdateForm").find("input[name=building_dongho]").val(building_dongho);
	$("#UpdateForm").find("input[name=full_addr_up]").val(full_addr);
	$("#UpdateForm").find("input[name=full_addr_road_up]").val(full_addr_road);
	$("#UpdateForm").find("input[name=location_x_up]").val(location_x);
	$("#UpdateForm").find("input[name=location_y_up]").val(location_y);
	$("#UpdateForm").find("input[name=city_code]").val(city_code);
	$("#UpdateForm").find("input[name=gu_code]").val(gu_code);
	$("#UpdateForm").find("input[name=town_code]").val(town_code);
	$("#UpdateForm").find("input[name=li_code]").val(li_code);
	$("#UpdateForm").find("input[name=dong_code]").val(dong_code);
	$("#UpdateForm").find("input[name=ji_bonbun]").val(ji_bonbun);
	$("#UpdateForm").find("input[name=ji_bubun]").val(ji_bubun);
	$("#UpdateForm").find("input[name=road_codenum]").val(road_codenum);
	$("#UpdateForm").find("input[name=road_code]").val(road_code);
	$("#UpdateForm").find("input[name=road_bonbun]").val(road_bonbun);
	$("#UpdateForm").find("input[name=road_bubun]").val(road_bubun);
	$('#Updatepopup').bPopup();
});
</script>
<div id="Updatepopup" class="Pstyle">
	<span class="b-close">X</span>
		<div class="content">
		<form id="UpdateForm" name="UpdateForm" action="updatebranchoffice_addr_CS" method="POST">
			<input type="hidden" name="action">
			<input type="hidden" name="addr_chk_flag"/>
				<table>
					<tr>
						<td id ="pop_header">지점 주소 정보 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점 ID : </td>
						<td><input type="hidden" name="idx" value="">
						<input type="text" name="b_id" value="" maxlength="20" style=" width:100px;" readonly="readonly"></td>
					</tr>
					<tr>
						<td>기존 지번 주소 : </td>
						<td><input type="text" name="full_addr_up" style="width: 300px; border:none;" readonly="readonly"></td>
					</tr>
					<tr>
						<td>기존 도로명 주소 : </td>
						<td><input type="text" name="full_addr_road_up" style="width: 300px; border:none;" readonly="readonly"></td>
					</tr>
					<tr>
					<td>변경 할 주소 선택 : </td>
					<td>
						<input type="hidden" name="sample3_postcode" placeholder="우편번호">
						<input type="button" onclick="sample3_execDaumPostcode_up()" value="주소 찾기"><br>
						<div id="wrap_up" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
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
					<input type="hidden" name="location_x_up" value="">
					<input type="hidden" name="location_y_up" value="">
					<tr>
						<td >아파트/건물명 : </td>
						<td><input type="text" name="building_name" value="" maxlength="50" style="width:300px;" class="required"></td>
					</tr>
					<tr>
						<td >동/호수 : </td>
						<td><input type="text" name="building_dongho" value="" maxlength="50" style="width:300px;"></td>
					</tr>
						<input type="hidden" name="location_x" value="">
						<input type="hidden" name="location_y" value="">
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
<script>

    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap_up');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode_up() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
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
                $("#UpdateForm").find("input[name=sample3_postcode]").val(data.zonecode);
                $("#UpdateForm").find("input[name=full_addr_road]").val(fullRoadAddr);
                $("#UpdateForm").find("input[name=full_addr]").val(data.jibunAddress);
                $("#UpdateForm").find("input[name=building_name]").val(data.buildingName);
                $("#UpdateForm").find("input[name=city_code]").val(data.sido);
                $("#UpdateForm").find("input[name=gu_code]").val(data.sigungu);
                $("#UpdateForm").find("input[name=road_codenum]").val(data.roadnameCode);
                
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    if(data.jibunAddress == null || data.jibunAddress == '') {
                    	$("#UpdateForm").find("input[name=full_addr]").val(expJibunAddr);
                    }else {
                    	$("#UpdateForm").find("input[name=full_addr]").val(data.jibunAddress);
                    }

                } else {
                }
                
                $(".addr_old").css("display",""); 
                $("#UpdateForm").find("input[name=addr_chk_flag]").val("1");
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
          
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>