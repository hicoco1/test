<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@ page import="com.mrs.Cipher.Cipher"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs_CS.jsp"%>

<script>
$(document).ready(function(){
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	$('input:radio[name=san_flag]:input[value=${san_flag}]').attr("checked", true);
	
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var idx = $(this).parent().find(".idx").val();
			$("#mainForm").find("input[name=idx]").val(idx);
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deletebranchoffice_addr_CS").submit();	
		}
    });
	
	$("#act_insert").click(function(){
		var idx = $("#InsertForm").find("input[name=idx]").val("${maxIdx_Addr}");
		var b_id = $("#InsertForm").find("select[name=b_id]").val();
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
		
		if(b_id == '') {
			alert("지사 ID를 선택해 주세요.");
			return false;
		}
		
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
		
		$("input[name=action]").val("INSERT");
		$("#InsertForm").submit();
	});
	
	$("#act_update").click(function(){
		var idx = $("#UpdateForm").find("input[name=idx]").val();
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
		
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").submit();
	});
	
	$("#city_code").change(function(){
		var param = $(this).children("option:selected").text();
		fn_setGuAddr(param, this);
		
		var tmpVal = $(this).children("option:selected").val();
		$(this).next().next().next().val(tmpVal);
	});
	
	$("#gu_code").change(function(){
		var param = $(this).children("option:selected").text();
		fn_setTownAddr2(param, this);

		var tmpVal = $(this).children("option:selected").val();
		$(this).next().next().val(tmpVal);
	});
	
	$("#town_code").change(function(){
		var tmpVal = $(this).children("option:selected").val();
		$(this).next().val(tmpVal);
	});
});

function fn_setGuAddr(param,obj){
	$.ajax({
		type:"POST",
		url:"branchoffice_selectgu",
		cache:false,
		data:{
			js_sido:param
		},
		success:function(data, status){
			html="";
			for(var idx=0; idx<data.length; idx++) {
				html += "<option value="+data[idx].gu_code+">"+data[idx].gu_code+"</option>";
				$(obj).next().empty();
				$(obj).next().append(html);
		 	}
			fn_setTownAddr(data[0].gu_code,obj);
		},
		error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
		
	});
}

function fn_setTownAddr(param,obj){
	$.ajax({
		type:"POST",
		url:"branchoffice_selecttown",
		cache:false,
		data:{
			js_gugun:param
		},
		success:function(data, status){
			html="";
			for(var idx=0; idx<data.length; idx++) {
				html += "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
				$(obj).next().next().empty();
				$(obj).next().next().append(html);
		 	}
			if($("#town_code option").size() == 2) {
				$("select[name=town_code]").hide();
			}else {
				$("select[name=town_code]").show();
			}
		},
		error:function(request,status,error){
       		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}
	
function fn_setTownAddr2(param,obj){
	$.ajax({
		type:"POST",
		url:"branchoffice_selecttown",
		cache:false,
		data:{
			js_gugun:param
		},
		success:function(data, status){
			html="";
			for(var idx=0; idx<data.length; idx++) {
				html += "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
				$(obj).next().empty();
				$(obj).next().append(html);
		 	}
			if($("#town_code option").size() == 2) {
				$("select[name=town_code]").hide();
			}else {
				$("select[name=town_code]").show();
			}
		},
		error:function(request,status,error){
       		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	});
}

</script>

</head>
<body>	
<form action="BranchOffice_addr_CS" name="searchForm" id="searchForm" method="POST" >
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">지사/상점 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				지사 주소 관리</font>
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
					<%--
						<input type="hidden" name="pageNo" id="pageNo" value="1">
						<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
						<input type="hidden" name="searchFlag" id="searchFlag" value="1">
						<input type="hidden" name="searchContent" value="${searchContent}"> 
						<input type="hidden" name="san_flag" value="" >
					 --%>	
					 	<input type="hidden" name="b_id" id="b_id" value="nbRtE8Pu8TfLBmP0P2hAMw==">
						<input type="button" value="검색" class="blue small btn" id="searchBtn"><br /><br />
					</td>				
					<td></td>			
				</tr>	
			</table>
					
					
		</div>

	</form>
	
</body>
</html>