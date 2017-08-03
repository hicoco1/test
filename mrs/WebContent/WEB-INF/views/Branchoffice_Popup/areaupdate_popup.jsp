<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script>
$(document).ready(function(){
	function fn_setGuAddr2(param,obj){
		$.ajax({
			type:"POST",
			url:"branchoffice_selectgu",
			cache:false,
			data:{
				js_sido:param
			},
			success:function(data, status){
				html="";
				
				if($("#UpdateForm").find("input[name=gu_flag]").val() == "1"){
					 $("#UpdateForm").find("input[name=gu]").val("");
				}
				for(var idx=0; idx<data.length; idx++) {	
			
					if($("#UpdateForm").find("input[name=gu]").val() == data[idx].gu_code){
						html += "<option value="+data[idx].gu_code+" selected>"+data[idx].gu_code+"</option>";
						
					}else{
						html += "<option value="+data[idx].gu_code+">"+data[idx].gu_code+"</option>";
					}
					
					$(obj).next().empty();
					$(obj).next().append(html);
			 	}
				
				if($("#UpdateForm").find("input[name=gu_flag]").val() == "1"){
					fn_setTownAddr(data[0].gu_code,obj);
				}else{
					fn_setTownAddr($("#UpdateForm").find("input[name=gu]").val(),obj);
				}
				
				
				
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
			
				if($("#town_code2 option").size() == 2) {
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
	
	


	
		
	$("#city_code2").change(function(){
		var param = $(this).children("option:selected").text();
		$("#UpdateForm").find("input[name=gu_flag]").val("1");
		fn_setGuAddr2(param, this);
		
		var tmpVal = $(this).children("option:selected").val();
	
		$(this).next().next().next().val(tmpVal);
	});
	
	$("#gu_code2").change(function(){
		var param = $(this).children("option:selected").text();
		
		fn_setTownAddr2(param, this);
	
		var tmpVal = $(this).children("option:selected").val();
		$(this).next().next().val(tmpVal);
	});
	
	$("#town_code2").change(function(){
		var tmpVal = $(this).children("option:selected").val();
		$(this).next().val(tmpVal);
	});
	
	$(".updateBtn").click(function(){
		var seq = $(this).parent().find(".seq").val();
		var b_id = $(this).parent().find(".b_id").val();
		var b_name = $(this).parent().find(".b_name").val();
		var cover_flag = $(this).parent().find(".cover_flag").val();
		var city_code = $(this).parent().find(".city_code").val();
		var gu_code = $(this).parent().find(".gu_code").val();
		var town_code = $(this).parent().find(".town_code").val();
		$("#UpdateForm").find("input[name=gu]").val(gu_code);
		$("#UpdateForm").find("input[name=town]").val(town_code);
	
			fn_setGuAddr2(city_code, $("#city_code2"));
			var tmpVal = $(this).children("option:selected").val();
			$(this).next().next().val(tmpVal);
			
	

		$("#UpdateForm").find("input[name=seq]").val(seq);
		$("#UpdateForm").find("input[name=b_id]").val(b_id);
		$("#UpdateForm").find("input[name=b_name]").val(b_name);
		if(cover_flag != null && cover_flag != '') $("select[name=cover_flag]").val(cover_flag).attr("selected","selected");
		if(city_code != null && city_code != '') $("select[name=city_code]").val(city_code).attr("selected","selected");
		if(gu_code != null && gu_code != '') $("select[name=gu_code]").val(gu_code).attr("selected","selected");
		if(town_code != null && town_code != '') $("select[name=town_code]").val(town_code).attr("selected","selected");
		
		$('#Updatepopup').bPopup();
		
	});
});
</script>
<div id="Updatepopup" class="Pstyle">
			<span class="b-close">X</span>
			<div class="content">
		<form id="UpdateForm" name="UpdateForm" action="updatebranchoffice_area" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action" />
			<input type="hidden" name="gu" />
			<input type="hidden" name="town" />
			<input type="hidden" name="gu_flag" value="0" />
			
			
				<table>
					<tr>
						<td id ="pop_header">지점 관할지역 수정</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >지점 ID : </td>
						<td><input type="hidden" name="seq" value="">
						<input type="text" name="b_id" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td >지점 이름 : </td>
						<td><input type="text" name="b_name" value="" readonly="readonly"></td>
					</tr>
					<tr>
						<td>COVER_FLAG :</td>
						<td> 
							<select name="cover_flag">
								<option value="">선택</option>
								<option value="1">주 관할</option>
								<option value="2">인접 관할</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>관할 지역 : </td>
						<td>
							<select name="city_code" id="city_code2">
								<option value="">-시/도 선택-</option>
								<c:forEach var="nation_data" items="${nation_list }" varStatus="status">
								<option value="${nation_data.city_code}">${nation_data.city_code}</option>
								</c:forEach>
							</select>
							<select name="gu_code" id="gu_code2">
								<option value="">-시/군/구 선택-</option>
							
							</select>
							<select name="town_code" id="town_code2">
								<option value="">-읍/면 선택-</option>
							</select>
						</td>
					</tr>
					</table>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="수정" class="blue small btn" id="act_update"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_up"></td>
					</tr>
				</table>
				<input type="hidden" name="gu_code" value="">
				<input type="hidden" name="searchFlag" value="">
				<input type="hidden" name="searchContent" value="">
				<input type="hidden" name="pageNo" value="">
			</form>
	</div>
</div>