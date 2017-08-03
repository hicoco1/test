<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script>
$(document).ready(function(){	
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	if("${coverFlag}" != null && "${coverFlag}" != '') $("select[name=coverFlag]").val("${coverFlag}").attr("selected","selected");
	if("${areaFlag}" != null && "${areaFlag}" != '') $("select[name=areaFlag]").val("${areaFlag}").attr("selected","selected");
	
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var seq = $(this).parent().find(".seq").val();
			var b_id = $(this).parent().find(".b_id").val();
			var b_name = $(this).parent().find(".b_name").val();
			var city_code = $(this).parent().find(".city_code").val();
			var gu_code = $(this).parent().find(".gu_code").val();
			var town_code = $(this).parent().find(".town_code").val();
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var coverFlag = $("#searchForm").find("select[name=coverFlag]").val();
			var areaFlag = $("#areaFlag").find("select[name=areaFlag]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=coverFlag]").val(coverFlag);
			$("#mainForm").find("input[name=areaFlag]").val(areaFlag);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			
			$("#mainForm").find("input[name=seq]").val(seq);
			$("#mainForm").find("input[name=b_id]").val(b_id);
			$("#mainForm").find("input[name=b_name]").val(b_name);
			
			$("#mainForm").find("input[name=city_code]").val(city_code);
			$("#mainForm").find("input[name=gu_code]").val(gu_code);
			$("#mainForm").find("input[name=town_code]").val(town_code);
			
			$("#mainForm").find("input[name=action]").val("DELETE");
			$("#mainForm").attr("action","deletebranchoffice_area").submit();	
		}
    });
	
	$(".insertBtn").click(function(){
    });
	
	$("#act_insert").click(function(){
		$("input[name=action]").val("INSERT");
		var b = $("#gu_code option:selected").text();
		var gu_split = b.split(',');
		var gu_code = $("#InsertForm").find("input[name=gu_code]").val(gu_split);
		var b_id = $("#InsertForm").find("select[name=b_id]").val();
		var cover_flag = $("#InsertForm").find("select[name=cover_flag]").val();
		var city_code = $("#InsertForm").find("select[name=city_code]").val();
		var gu_code2 = $("#InsertForm").find("select[name=gu_code]").val();
		
		if(b_id == '') {
			alert("지점 ID를 선택하세요.");
			return false;
		}
		
		if(cover_flag == '') {
			alert("COVER_FLAG를 선택하세요.");
			return false;
		}
		
		if(city_code == '') {
			alert("시/도를 선택하세요.");
			return false;
		}
		/* 		
		if(gu_code2 == '') {
			alert("시/군/구를 선택하세요.");
			return false;
		}
		 */
		$("#InsertForm").submit();
	});
	
	$("#act_update").click(function(){
		var b = $("#gu_code2 option:selected").text();
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var coverFlag = $("#searchForm").find("select[name=coverFlag]").val();
		var areaFlag = $("#searchForm").find("select[name=areaFlag]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		var gu_split = b.split(',');
		var gu_code = $("#UpdateForm").find("input[name=gu_code]").val(gu_split);
		
		var b_id = $("#UpdateForm").find("select[name=b_id]").val();
		var cover_flag = $("#UpdateForm").find("select[name=cover_flag]").val();
		var city_code = $("#UpdateForm").find("select[name=city_code]").val();
		var gu_code2 = $("#UpdateForm").find("select[name=gu_code]").val();
		
		if(b_id == '') {
			alert("지점 ID를 선택하세요.");
			return false;
		}
		
		if(cover_flag == '') {
			alert("COVER_FLAG를 선택하세요.");
			return false;
		}
		
		if(city_code == '') {
			alert("시/도를 선택하세요.");
			return false;
		}
		
		/*
		if(gu_code2 == '') {
			alert("시/군/구를 선택하세요.");
			return false;
		}
		 */
		
		$("input[name=action]").val("UPDATE");
		$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
		$("#UpdateForm").find("input[name=coverFlag]").val(coverFlag);
		$("#UpdateForm").find("input[name=areaFlag]").val(areaFlag);
		$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
		$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
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
<form action="BranchOffice_area" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">지점 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				지점 관할지역 관리</font>
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
							<option value="2">지점이름</option>
							<option value="1">지점ID</option>
						</select>&nbsp; :&nbsp;
						<input type="text" name="searchContent" value="${searchContent}" size="20">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						COVER_FLAG&nbsp;:&nbsp;
						<select name="coverFlag">
							<option value="">전체</option>
							<option value="1">주관할</option>
							<option value="2">인접관할</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="areaFlag">
							<option value="1">시/도</option>
							<option value="2">구/군</option>
							<option value="3">읍/면</option>
						</select>&nbsp;:&nbsp;
						<input type="text" name="areaContent" value="${areaContent}" size="20"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="검색" class="blue small btn" id="searchBtn"><br /><br />
					</td>				
					<td></td>
				</tr>	
			</table>
		</div>
					<input type="hidden" name="pageNo" id="pageNo"   value="${pageno}">
					<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
					<input type="hidden" name="action"  id="action" value="">
	</form>
	<form id="mainForm" name="mainForm" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="login_id" value="${data.login_id }">
	<input type="hidden" name="action"/>
		<div id="mainFrame">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
					<col width="4%">
					<col width="15%">
					<col width="18%">
					<col width="18%">
					<col width="17%">
					<col width="10%">	
				</colgroup>
				<tr>
					<th>No</th>
					<th>지점ID(이름)</th>
					<th>COVER_FLAG</th>
					<th>시/도</th>
					<th>군/구</th>
					<th>읍/면</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="10" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				
				<tr class="datalist" style="cursor:pointer">
					<td>${(pageInfo.current*10)+status.count-10}</td>
					<td>${data.b_id}(${data.b_name})</td>
					<td>
						<c:choose>
							<c:when test="${data.cover_flag == 1}">주관할</c:when>
							<c:otherwise>인접관할</c:otherwise>
						</c:choose>
					</td>
					<td>${data.city_code}</td>	
					<td>${data.gu_code}</td>
					<td>${data.town_code}</td>
					<td>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						</sec:authorize>
						
						<input type="hidden" class="seq" value="${data.seq }">
						<input type="hidden" class="b_id" value="${data.b_id }">
						<input type="hidden" class="b_name" value="${data.b_name }">
						<input type="hidden" class="cover_flag" value="${data.cover_flag }">
						<input type="hidden" class="city_code" value="${data.city_code }">
						<input type="hidden" class="gu_code" value="${data.gu_code }">
						<input type="hidden" class="town_code" value="${data.town_code }">
					</td>			
				</tr>
				</c:forEach>
				</c:if>
			</table>
		
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<div style="float:right"><input type="button" value="등록" class="insertBtn red big btn" id="insertBtn"></div>
			</sec:authorize>
		</div>
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="seq" value="">
			<input type="hidden" name="b_id" value="">
			<input type="hidden" name="b_name" value="">
			<input type="hidden" name="cover_flag" value="">
			<input type="hidden" name="city_code" value="">
			<input type="hidden" name="gu_code" value="">
			<input type="hidden" name="town_code" value="">
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="coverFlag" value="">
			<input type="hidden" name="areaFlag" value="">
			<input type="hidden" name="pageNo" value="">
	</form>
	
	
	
		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/areainsert_popup.jsp"%>
		</div>

		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/areaupdate_popup.jsp"%>
		</div>

</body>
</html>