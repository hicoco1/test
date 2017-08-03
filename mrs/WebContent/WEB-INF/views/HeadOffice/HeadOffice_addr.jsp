<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>
$(document).ready(function(){
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	$('input:radio[name=san_flag]:input[value=${san_flag}]').attr("checked", true);
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var seq = $(this).parent().find(".seq").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			$("#mainForm").find("input[name=seq]").val(seq);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deleteheadoffice_addr").submit();	
		}
    });
	
	$("#act_insert").click(function(){
		
		var san_flag = $("#InsertForm").find("input[name=san_flag]").val();
		var city_code = $("#InsertForm").find("input[name=city_code]").val();
		var gu_code = $("#InsertForm").find("input[name=gu_code]").val();
		var town_code = $("#InsertForm").find("input[name=town_code]").val();
		var dong_code = $("#InsertForm").find("input[name=dong_code]").val();
		var ji_bonbun = $("#InsertForm").find("input[name=ji_bonbun]").val();
		var ji_bubun = $("#InsertForm").find("input[name=ji_bubun]").val();
		var road_code = $("#InsertForm").find("input[name=road_code]").val();
		var road_bonbun = $("#InsertForm").find("input[name=road_bonbun]").val();
		var road_bubun = $("#InsertForm").find("input[name=road_bubun]").val();
		
		/*
		var oScript = document.createElement('script');
	    oScript.type ='text/javascript';
	    oScript.charset ='utf-8';          
	    oScript.src = 'http://apis.daum.net/local/geo/addr2coord?apikey=' + 52114cf54faf1d18e3cddbb888e2f672 + 
	                  '&q=' + '${gu_code+dong_code}'+'&output=xml&callback=addrSearch';
	    document.getElementsByTagName('head')[0].appendChild(oScript);
		*/
		
		var q = gu_code+dong_code+ji_bonbun+"-"+ji_bubun;
        var url ="http://apis.daum.net/local/geo/addr2coord?apikey=780b74dbe8ca7d669e9524afece6c1b0513b61b0&q="+q+"&output=json";
        $.getJSON(url+"&callback=?", function(data) {
          $('#list li').remove();
          $.each(data.channel.item, function(i,item) {
            //alert(state.newAddress);
            var lat = item.point_y ;
            var lng = item.point_x;
            $('#list').append('<li>'+item.title+'(위도:'+lat+' / 경도:'+lng+') 새주소 : '+item.newAddress);
         
		
		
		if(san_flag == 1) {
			if(ji_bubun == 0) {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " 산 " + ji_bonbun;
			}else {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " 산 " + ji_bonbun + "-" + ji_bubun;
			}
		}else {
			if(ji_bubun == 0) {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " " + ji_bonbun;
			}else {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " " + ji_bonbun + "-" + ji_bubun;
			}
		}
		
		if(road_bubun == 0) {
			var full_addr_road_in = city_code + " " + gu_code + " " + town_code + " " + road_code + " " + road_bonbun;
		}else {
			var full_addr_road_in = city_code + " " + gu_code + " " + town_code + " " + road_bonbun + "-" + road_bubun;
		}
		
		var full_addr = $("#InsertForm").find("input[name=full_addr]").val(full_addr_in);
		var full_addr_road = $("#InsertForm").find("input[name=full_addr_road]").val(full_addr_road_in);
		var location_x = $("#InsertForm").find("input[name=location_x]").val(lng);
		var location_y = $("#InsertForm").find("input[name=location_y]").val(lat);
		
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
	});
        });
    });
	
	$("#act_update").click(function(){
		var san_flag = $("#UpdateForm").find("input[name=san_flag]").val();
		var city_code = $("#UpdateForm").find("input[name=city_code]").val();
		var gu_code = $("#UpdateForm").find("input[name=gu_code]").val();
		var town_code = $("#UpdateForm").find("input[name=town_code]").val();
		var dong_code = $("#UpdateForm").find("input[name=dong_code]").val();
		var ji_bonbun = $("#UpdateForm").find("input[name=ji_bonbun]").val();
		var ji_bubun = $("#UpdateForm").find("input[name=ji_bubun]").val();
		var road_code = $("#UpdateForm").find("input[name=road_code]").val();
		var road_bonbun = $("#UpdateForm").find("input[name=road_bonbun]").val();
		var road_bubun = $("#UpdateForm").find("input[name=road_bubun]").val();
		
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		
		
		if(san_flag == 1) {
			if(ji_bubun == 0) {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " 산 " + ji_bonbun;
			}else {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " 산 " + ji_bonbun + "-" + ji_bubun;
			}
		}else {
			if(ji_bubun == 0) {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " " + ji_bonbun;
			}else {
				var full_addr_in = city_code + " " + gu_code + " " + town_code + " " + dong_code + " " + ji_bonbun + "-" + ji_bubun;
			}
		}
		
		if(road_bubun == 0) {
			var full_addr_road_in = city_code + " " + gu_code + " " + town_code + " " + road_code + " " + road_bonbun;
		}else {
			var full_addr_road_in = city_code + " " + gu_code + " " + town_code + " " + road_bonbun + "-" + road_bubun;
		}
		
		var full_addr = $("#UpdateForm").find("input[name=full_addr]").val(full_addr_in);
		var full_addr_road = $("#UpdateForm").find("input[name=full_addr_road]").val(full_addr_road_in);
		
		$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
		$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
		$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
		
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
	});
	
	/*
	function addAddress(){
    var oScript = document.createElement('script');
    oScript.type ='text/javascript';
    oScript.charset ='utf-8';          
    oScript.src = 'http://apis.daum.net/maps/coord2addr?apikey=' + apiKey + 
                  '&latitude=' + '${latitude}' + '&longitude=' + '${longitude}' +
                  '&output=json&callback=addrSearch';
    document.getElementsByTagName('head')[0].appendChild(oScript);
}
function addrSearch(data){
    var resultForm = document.getElementById("rvAddr");
    resultForm.innerHTML = data.fullName;
}
	*/

});

</script>

</head>
<body>	

<form action="HeadOffice_addr" name="searchForm" id="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">본사 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				전국 주소 관리</font>
			<hr color="#ff0059" />
			<table id="searchTable" style="background-color: #b8e2fc; margin-top: 20px;">
				<colgroup>
					<col width="1%">	
					<col width="*">
					<col width="1%">
				</colgroup>
				<tr>
					<td></td>
					<td><br /><input TYPE="IMAGE" src="resources/images/search_btn.PNG" width="15px" height="15px"  align="absmiddle">
					검색&nbsp; :&nbsp; 
						<select name="searchFlag">
							<option value="1">시도</option>
							<option value="2">시군구</option>
							<option value="3">읍면</option>
							<option value="4">행정동명</option>
							<option value="5">리</option>
							<option value="6">지번 본번</option>
							<option value="7">지번 부번</option>
							<option value="8">아파트/건물명</option>
							<option value="9">동/호수</option>
							<option value="10">도로명 코드</option>
							<option value="11">도로명</option>
							<option value="12">도로명 건물 본번</option>
							<option value="13">도로명 건물 부번</option>
						</select>
						<input type="text" name="searchContent" value="${searchContent}"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						산 여부  : 
						<input type="radio" name="san_flag" value="" checked>전체&nbsp;&nbsp;&nbsp;
						<input type="radio" name="san_flag" value="0">산 아님&nbsp;&nbsp;&nbsp;
						<input type="radio" name="san_flag" value="1">산&nbsp;&nbsp;&nbsp;
						<input type="button" value="검색" class="blue small btn" id="searchBtn"><br /><br />
					</td>				
					<td></td>			
				</tr>
				<div id="list"></div>	
			</table>
						<input type="hidden" name="pageNo" id="pageNo"   value="${pageno}">
						<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
						<input type="hidden" name="action"  id="action" value="">
		</div>

	</form>
	<form id="mainForm" name="mainForm" method="get">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden"   name="action"/>
		<div id="mainFrame">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
					<col width="8%">
					<col width="*%">
					<col width="10%">
					<col width="10%">	
					<col width="10%">	
					<col width="10%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>No</th>
					<th>시도</th>
					<th>시군구</th>
					<th>읍면</th>
					<th>행정동명</th>
					<th>리</th>
					<th>산 여부</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="9" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*10)+status.count-10}</td>
					<td>${data.city_code}</td>
					<td>${data.gu_code}</td>
					<td>${data.town_code}</td>
					<td>${data.dong_code}</td>
					<td>${data.li_code}</td>
					<td>
						<c:choose>
							<c:when test="${data.san_flag == 0}">산 아님</c:when>
							<c:otherwise>산</c:otherwise>
						</c:choose>
						 
					</td>	
					<td>
						<input type="button" value="상세" class="detailBtn white small btn">
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						
						<input type="hidden" class="seq" value="${data.seq }">
						<input type="hidden" class="city_code" value="${data.city_code }">
						<input type="hidden" class="gu_code" value="${data.gu_code }">
						<input type="hidden" class="town_code" value="${data.town_code }">
						<input type="hidden" class="dong_code" value="${data.dong_code }">
						<input type="hidden" class="li_code" value="${data.li_code }">
						<input type="hidden" class="san_flag" value="${data.san_flag }">
						<input type="hidden" class="ji_bonbun" value="${data.ji_bonbun }">
						<input type="hidden" class="ji_bubun" value="${data.ji_bubun }">
						<input type="hidden" class="building_name" value="${data.building_name }">
						<input type="hidden" class="building_dongho" value="${data.building_dongho }">
						<input type="hidden" class="road_codenum" value="${data.road_codenum }">
						<input type="hidden" class="road_code" value="${data.road_code }">
						<input type="hidden" class="road_bonbun" value="${data.road_bonbun }">
						<input type="hidden" class="road_bubun" value="${data.road_bubun }">
						<input type="hidden" class="full_addr" value="${data.full_addr }">
						<input type="hidden" class="full_addr_road" value="${data.full_addr_road }">
						<input type="hidden" class="location_x" value="${data.location_x }">
						<input type="hidden" class="location_y" value="${data.location_y }">
						
					</td>			
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></div>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="seq" value="">
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="pageNo" value="">
			<input type="hidden" name="city_code" value="">
			<input type="hidden" name="gu_code" value="">
			<input type="hidden" name="town_code" value="">
			<input type="hidden" name="dong_code" value="">
			<input type="hidden" name="li_code" value="">
			<input type="hidden" name="san_flag" value="">
			<input type="hidden" name="ji_bonbun" value="">
			<input type="hidden" name="ji_bubun" value="">
			<input type="hidden" name="building_name" value="">
			<input type="hidden" name="building_dongho" value="">
			<input type="hidden" name="road_codenum" value="">
			<input type="hidden" name="road_code" value="">
			<input type="hidden" name="road_bonbun" value="">
			<input type="hidden" name="road_bubun" value="">
			<input type="hidden" name="full_addr" value="">
			<input type="hidden" name="full_addr_road" value="">
			<input type="hidden" name="location_x" value="">
			<input type="hidden" name="location_y" value="">
	</form>
	
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/addrinsert_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/addrupdate_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/HeadOffice_Popup/addrdetail_popup.jsp"%>
		</div>
</body>
</html>