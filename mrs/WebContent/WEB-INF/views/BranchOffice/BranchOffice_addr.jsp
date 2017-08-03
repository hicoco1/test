<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="${_csrf.parameterName}" content="${_csrf.token}" />
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script>
$( window ).bind( 'scroll', function(){
    var srlTop  = $( this ).scrollTop();
    var srlLeft  = $( this ).scrollLeft();
    var divLeft  = $( '#alwaystop' ).offset().left;
    var ptrLeft  = divLeft - srlLeft;

    if( srlLeft < 10 )
    {
      $( '#alwaystop' ).css({ position :'fixed', bottom : '55px', left : ptrLeft+'px' });
    }
    else
    {
      $( '#alwaystop' ).css({ position :'relative', bottom : '15px', left : '0px' });
    }
  });
$(document).ready(function(){
	
	if("${searchFlag}" != null && "${searchFlag}" != '') $("select[name=searchFlag]").val("${searchFlag}").attr("selected","selected");
	if("${bidList}" != null && "${bidList}" != '') $("select[name=bidList]").val("${bidList}").attr("selected","selected");
	$('input:radio[name=san_flag]:input[value=${san_flag}]').attr("checked", true);
	
	$("#version_upBtn").click(function(){
		if(confirm("적용 하시겠습니까?")){
			$("#VerupForm").find("input[name=action]").val("SETTING");
			$("#VerupForm").attr("action","verupbranchoffice_addr").submit();	
		}
    });
	
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
    $("#checkall").click(function(){
       
        if($("#checkall").prop("checked")){
            $("input[name=chk]").prop("checked",true);
        }else{
            $("input[name=chk]").prop("checked",false);
        }
    })
    
	$(".ckdeleteBtn").click(function(){
		
		if( $(":checkbox[name='chk']:checked").length==0 ){
			alert("삭제할 항목을 하나 이상 체크해주세요.");
			return;
			}
		var cusid= "";
		var chk_check =false;		
		
		if(confirm("삭제 하시겠습니까?")){
			
			  var chked_val;
			  var b_id;
			  var idx;
			  $(":checkbox[name='chk']:checked").each(function(pi,po){
				  
				    	chked_val = po.value.split("|");
				    
				    	if(pi == 0){
				    		idx = chked_val[0];
					    	b_id = chked_val[1];
				    	 
				    	}else{
				    		idx += ","+chked_val[0];
					    	b_id += ","+chked_val[1];
				    	
				    	}   	
			  });

				var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
				var bidList = $("#searchForm").find("select[name=bidList]").val();
				var searchContent = $("#searchForm").find("input[name=searchContent]").val();
				var pageNo = $("#searchForm").find("input[name=pageNo]").val();
				
				$("#mainForm").find("input[name=idx]").val(idx);
				$("#mainForm").find("input[name=b_id]").val(b_id);
				$("#mainForm").find("input[name=action]").val("DELETE");
				$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
				$("#mainForm").find("input[name=bidList]").val(bidList);
				$("#mainForm").find("input[name=searchContent]").val(searchContent);
				$("#mainForm").find("input[name=pageNo]").val(pageNo);
				$("#mainForm").attr("action","ck_deletebranchoffice_addr").submit();	
			}
    });
    
	$(".deleteBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			var idx = $(this).parent().find(".idx").val();
			var b_id = $(this).parent().find(".b_id").val();
			
			var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
			var bidList = $("#searchForm").find("select[name=bidList]").val();
			var searchContent = $("#searchForm").find("input[name=searchContent]").val();
			var pageNo = $("#searchForm").find("input[name=pageNo]").val();
			
			$("#mainForm").find("input[name=idx]").val(idx);
			$("#mainForm").find("input[name=b_id]").val(b_id);
			$("#mainForm").find("input[name=action]").val("DELETE");
			
			$("#mainForm").find("input[name=searchFlag]").val(searchFlag);
			$("#mainForm").find("input[name=bidList]").val(bidList);
			$("#mainForm").find("input[name=searchContent]").val(searchContent);
			$("#mainForm").find("input[name=pageNo]").val(pageNo);
			
			$("#mainForm").attr("action","deletebranchoffice_addr").submit();	
		}
    });
	
	$("#act_insert").click(function(){
		var q,lat,lng,return_url,location_x,location_y;
		var idx = $("#InsertForm").find("input[name=idx]").val("${maxIdx_Addr}");
		var b_id = $("#InsertForm").find("select[name=b_id]").val();
		var b_name = $("#InsertForm").find("select[name=b_name]").val();
		var road_code = $("#InsertForm").find("input[name=road_code]").val();
		var road_bonbun = $("#InsertForm").find("input[name=road_bonbun]").val();
		var road_bubun = $("#InsertForm").find("input[name=road_bubun]").val();
    	
		var san_flag = $("#InsertForm").find("input[name=san_flag]").val();
		var city_code = $("#InsertForm").find("input[name=city_code]").val();
		var town_code = $("#InsertForm").find("input[name=town_code]").val();
		var dong_code = $("#InsertForm").find("input[name=dong_code]").val();
		var ji_bonbun = $("#InsertForm").find("input[name=ji_bonbun]").val();
		var ji_bubun = $("#InsertForm").find("input[name=ji_bubun]").val();
		var addr_flag 		= $("#InsertForm").find("input[name=addr_chk_flag]").val();
		q = $("#InsertForm").find("input[name=full_addr]").val();
		
		if(b_id == '' || b_id == null) {
			alert("지점 ID를 선택해 주세요.");
			return false;
		}
		
		if(addr_flag != '1') {
			alert("주소를 선택하여 주십시오.");
			return false;
		}

		var url ="http://apis.daum.net/local/geo/addr2coord?apikey=f8501504ca36b8914665e6d46fad1f0a&q="+encodeURIComponent(q)+"&output=json";
		
        $.getJSON(url+"&callback=?", function(data) {
        	var totalCount = data["channel"].totalCount;
        	if(totalCount == 0) {
        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
    			return false;
    		}
        	
        	if(totalCount > 1) {
        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 중복 수집).");
    			return false;
    		}
        	
          $('#list li').remove();
          $.each(data.channel.item, function(i,item) {
            lat = item.point_y;
            lng = item.point_x;
            $('#list').append('<li>'+item.title+'(위도:'+lat+' / 경도:'+lng+') 새주소 : '+item.newAddress);
            
        	location_x = $("#InsertForm").find("input[name=location_x]").val(lng);
    		location_y = $("#InsertForm").find("input[name=location_y]").val(lat);
    		
    		if((item.point_x == "" && item.point_y=="") ||(item.point_x == null && item.point_y==null)) {
    			alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
    			return false;
    		}
    		
    		if(item.localName_3 != null || item.localName_3 != '') {
    			var localname = item.localName_3.split(' ');
    			if(item.localName_3.indexOf(" ") != -1) {
    				$("#InsertForm").find("input[name=town_code]").val(localname[0]);
    				$("#InsertForm").find("input[name=li_code]").val(localname[1]);
    				$("#InsertForm").find("input[name=dong_code]").val("");
    			}else {
    				$("#InsertForm").find("input[name=town_code]").val("");
    				$("#InsertForm").find("input[name=li_code]").val("");
    				$("#InsertForm").find("input[name=dong_code]").val(item.localName_3);
    			}
    		}
    		
    		var url_return = "https://apis.daum.net/local/geo/coord2detailaddr?apikey=d4e2977331428caa9436ce9d118a9cf8&x="+item.point_x+"&y="+item.point_y+"&inputCoordSystem=WGS84&output=json"
   			 $.getJSON(url_return+"&callback=?", function(data) {
        		  	var new_name = data["new"].name;
        		  	var new_roadName = data["new"].roadName;
	            	var new_bunji = data["new"].bunji;
	            	var new_ho = data["new"].ho;
	            	if(new_ho == null || new_ho == '') {
	            		new_ho = "";
	            	}
	            	
	        		 $("#InsertForm").find("input[name=road_code]").val(new_roadName);
	        		 $("#InsertForm").find("input[name=road_bonbun]").val(new_bunji);
	        		 $("#InsertForm").find("input[name=road_bubun]").val(new_ho);
	            	
	            	var old_name = data["old"].name;
	            	var old_bunji = data["old"].bunji;
	            	var old_ho = data["old"].ho;  	
	            	var old_san = data["old"].san;
	            	
	            	if(old_ho == null || old_ho == '') {
	            		old_ho = "";
	            	}
	            	
	            	if(old_san == "Y")old_san=1;
	            	else old_san=0;
	            	
	            	var old_nameArray=old_name.split(' ');		
	            	/*
	            	if(old_nameArray.length == 4){
	            		dong_code = old_nameArray[2];
	            		$("#InsertForm").find("input[name=dong_code]").val(old_nameArray[2]);
	            	}else if(old_nameArray.length == 5){
	            		dong_code = old_nameArray[3];
	            		$("#InsertForm").find("input[name=dong_code]").val(old_nameArray[3]);
	            	}else{
	            		dong_code = $("#InsertForm").find("input[name=dong_code]").val();
	            	}
	        		
	        		 city_code = $("#InsertForm").find("input[name=city_code]").val();
	        		 gu_code = $("#InsertForm").find("input[name=gu_code]").val();
	        		 town_code = $("#InsertForm").find("input[name=town_code]").val();
	        		 */
	        		 
	        		 $("#InsertForm").find("input[name=san_flag]").val(old_san);
	        		 $("#InsertForm").find("input[name=ji_bonbun]").val(old_bunji);
	        		 $("#InsertForm").find("input[name=ji_bubun]").val(old_ho);
	        		
	    			
	    			$("input[name=action]").val("INSERT");
	    			$("#InsertForm").submit();
            }); 
          });  
        }) ;
    }); 
      

	
	$("#act_update").click(function(){
		var q,lat,lng,return_url,location_x,location_y;
		var idx = $("#UpdateForm").find("input[name=idx]").val();
		var b_id = $("#UpdateForm").find("select[name=b_id]").val();
		var b_name = $("#UpdateForm").find("select[name=b_name]").val();
		var searchFlag = $("#searchForm").find("select[name=searchFlag]").val();
		var bidList = $("#searchForm").find("select[name=bidList]").val();
		var searchContent = $("#searchForm").find("input[name=searchContent]").val();
		var pageNo = $("#searchForm").find("input[name=pageNo]").val();
		
		/*주소등록체계 변경 추가 2016.08.22*/
		var road_code = $("#UpdateForm").find("input[name=road_code]").val();
		var road_bonbun = $("#UpdateForm").find("input[name=road_bonbun]").val();
		var road_bubun = $("#UpdateForm").find("input[name=road_bubun]").val();
    	
		var san_flag = $("#UpdateForm").find("input[name=san_flag]").val();
		var city_code = $("#UpdateForm").find("input[name=city_code]").val();
		var town_code = $("#UpdateForm").find("input[name=town_code]").val();
		var dong_code = $("#UpdateForm").find("input[name=dong_code]").val();
		var ji_bonbun = $("#UpdateForm").find("input[name=ji_bonbun]").val();
		var ji_bubun = $("#UpdateForm").find("input[name=ji_bubun]").val();
		var addr_flag 		= $("#UpdateForm").find("input[name=addr_chk_flag]").val();
		q = $("#UpdateForm").find("input[name=full_addr_up]").val();
		var full_addr_road_up = $("#UpdateForm").find("input[name=full_addr_road_up]").val();
		$("#UpdateForm").find("input[name=full_addr_up]").val(q);
		$("#UpdateForm").find("input[name=full_addr_road_up]").val(full_addr_road_up);
		if(b_id == '' || b_id == null) {
			alert("지점 ID를 선택해 주세요.");
			return false;
		}
		
		if(addr_flag == '1') {
			q = $("#UpdateForm").find("input[name=full_addr]").val();
			var url ="http://apis.daum.net/local/geo/addr2coord?apikey=d4e2977331428caa9436ce9d118a9cf8&q="+encodeURIComponent(q)+"&output=json";
	        $.getJSON(url+"&callback=?", function(data) {
	        	var totalCount = data["channel"].totalCount;
	        	if(totalCount == 0) {
	        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
	    			return false;
	    		}
	        	
	        	if(totalCount > 1) {
	        		alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 중복 수집).");
	    			return false;
	    		}
	        	
	          $('#list li').remove();
	          $.each(data.channel.item, function(i,item) {
	            lat = item.point_y;
	            lng = item.point_x;
	            $('#list').append('<li>'+item.title+'(위도:'+lat+' / 경도:'+lng+') 새주소 : '+item.newAddress);
				
	        	location_x = $("#UpdateForm").find("input[name=location_x]").val(lng);
	    		location_y = $("#UpdateForm").find("input[name=location_y]").val(lat);
	    		
	    		if((item.point_x == "" && item.point_y=="") ||(item.point_x == null && item.point_y==null)) {
	    			alert("입력 된 지점 주소 정보를 확인해주세요(지점 위치 정보 수집 실패).");
	    			return false;
	    		}
	    		
	    		if(item.localName_3 != null || item.localName_3 != '') {
	    			var localname = item.localName_3.split(' ');
	    			if(item.localName_3.indexOf(" ") != -1) {
	    				$("#UpdateForm").find("input[name=town_code]").val(localname[0]);
	    				$("#UpdateForm").find("input[name=li_code]").val(localname[1]);
	    				$("#UpdateForm").find("input[name=dong_code]").val("");
	    			}else {
	    				$("#UpdateForm").find("input[name=town_code]").val("");
	    				$("#UpdateForm").find("input[name=li_code]").val("");
	    				$("#UpdateForm").find("input[name=dong_code]").val(item.localName_3);
	    			}
	    		}
	    		
	    		var url_return = "https://apis.daum.net/local/geo/coord2detailaddr?apikey=d4e2977331428caa9436ce9d118a9cf8&x="+item.point_x+"&y="+item.point_y+"&inputCoordSystem=WGS84&output=json"
	   			 $.getJSON(url_return+"&callback=?", function(data) {
	        		  	var new_name = data["new"].name;
	        		  	var new_roadName = data["new"].roadName;
		            	var new_bunji = data["new"].bunji;
		            	var new_ho = data["new"].ho;
		            	if(new_ho == null || new_ho == '') {
		            		new_ho = "";
		            	}
		            	
		        		road_code = $("#UpdateForm").find("input[name=road_code]").val(new_roadName);
		        		road_bonbun = $("#UpdateForm").find("input[name=road_bonbun]").val(new_bunji);
		        		road_bubun = $("#UpdateForm").find("input[name=road_bubun]").val(new_ho);
		            	
		            	var old_name = data["old"].name;
		            	var old_bunji = data["old"].bunji;
		            	var old_ho = data["old"].ho;  	
		            	var old_san = data["old"].san;
		            	
		            	if(old_san == "Y")old_san=1;
		            	else old_san=0;
		            	
		            	/*
		            	var old_nameArray=old_name.split(' ');		
		            	if(old_nameArray.length == 4){
		            		dong_code = $("#UpdateForm").find("input[name=dong_code]").val(old_nameArray[2]);
		            	}else if(old_nameArray.length == 5){
		            		dong_code = $("#UpdateForm").find("input[name=dong_code]").val(old_nameArray[3]);
		            	}else{
		            		dong_code = $("#UpdateForm").find("input[name=dong_code]").val();
		            	}
		        		*/
		        		
		        		san_flag = $("#UpdateForm").find("input[name=san_flag]").val(old_san);
		        		city_code = $("#UpdateForm").find("select[name=city_code]").val();
		        		gu_code = $("#UpdateForm").find("select[name=gu_code]").val();
		        		town_code = $("#UpdateForm").find("select[name=town_code]").val();
		        		ji_bonbun = $("#UpdateForm").find("input[name=ji_bonbun]").val(old_bunji);
		        		ji_bubun = $("#UpdateForm").find("input[name=ji_bubun]").val(old_ho);
		            	
		    			$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
		    			$("#UpdateForm").find("input[name=bidList]").val(bidList);
		    			$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
		    			$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
		    			$("input[name=action]").val("UPDATE");
		    			$("#UpdateForm").submit();
	            }); 
	          });  
	        }) ;
		}else {
			var full_addr_up = $("#UpdateForm").find("input[name=full_addr_up]").val();
			var full_addr_road_up = $("#UpdateForm").find("input[name=full_addr_road_up]").val();
			$("#UpdateForm").find("input[name=full_addr]").val(full_addr_up);
			$("#UpdateForm").find("input[name=full_addr_road]").val(full_addr_road_up);
			var location_x_up = $("#UpdateForm").find("input[name=location_x_up]").val();
			var location_y_up = $("#UpdateForm").find("input[name=location_y_up]").val();
			$("#UpdateForm").find("input[name=location_x]").val(location_x_up);
			$("#UpdateForm").find("input[name=location_y]").val(location_y_up);
		
			$("#UpdateForm").find("input[name=searchFlag]").val(searchFlag);
			$("#UpdateForm").find("input[name=bidList]").val(bidList);
			$("#UpdateForm").find("input[name=searchContent]").val(searchContent);
			$("#UpdateForm").find("input[name=pageNo]").val(pageNo);
			$("input[name=action]").val("UPDATE");
			$("#UpdateForm").submit();
		}
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
				if( idx==1)html = "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
				else html += "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
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
				
				if( idx==1)html = "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
				else html += "<option value="+data[idx].town_code+">"+data[idx].town_code+"</option>";
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

<form action="BranchOffice_addr" name="searchForm" id="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">지점 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				지점 주소 관리</font>
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
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지점이름(ID)&nbsp; :&nbsp; 
						<c:if test="${!empty list_bidlist}" >
							<select name="bidList" id="bidList">
								<option value="">선택</option>
								<c:forEach var="list_bid" items="${list_bidlist}" varStatus="i">
									<option value="${list_bid.b_id}">${list_bid.b_name}(${list_bid.b_id})</option>
								</c:forEach>
							</select>
						</c:if>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="searchFlag">
							<option value="1">시도</option>
							<option value="2">시군구</option>
							<option value="3">읍면</option>
							<option value="4">행정동명</option>
							<option value="5">리</option>
							<option value="6">지번 본번</option>
							<option value="7">지번 부번</option>
							<option value="8">아파트/건물명</option>
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
						<input type="button" value="검색" class="blue small btn" id="searchBtn">
						<input type="button" value="지점 주소 수정 적용" class="red small btn" id="addrupBtn" title="지점 주소 버전 업테이드(예 : 1.0.0.1 -> 1.0.0.2)">
						<br /><br />
						
				
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
	<input type="hidden"   name="action"/>
		<div id="mainFrame" style="overflow:auto; width: 100%">
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable" style="width:100%;">
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>	
					<col>	
					<col>
					<col>
					<col>
					<col>	
					<col>
					<col>
				</colgroup>
				<tr>
					<th><input type="checkbox" id="checkall" /></th>
					<th>No</th>
					<th>지점ID</th>
					<th>지점이름</th>
					<th>시도</th>
					<th>시군구</th>
					<th>읍면</th>
					<th>행정동명</th>
					<th>지번</th>
					<th>아파트/건물명</th>
					<th>도로명</th>
					<th>도로명<br />번지</th>
					<th>관리</th>
				</tr>
				
				<c:if test="${totalCount < 1 }">
				<tr>
					<td colspan="15" style="text-align:center;">검색된 글이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${totalCount > 0 }">
				<c:forEach var="data" items="${list }" varStatus="status">
				<tr class="datalist" style="cursor:pointer">
					<td><input type='checkbox' class='input_check' name="chk" value="${data.idx}|${data.b_id}" /></td>
					<td>${(pageInfo.current*50)+status.count-50}</td>
					<td>${data.b_id}</td>
					<td>${data.b_name}</td>
					<td>${data.city_code}</td>
					<td>${data.gu_code}</td>
					<td>${data.town_code}</td>
					<td>${data.dong_code}</td>
					<c:choose>
						<c:when test="${data.ji_bubun == ''}"><td>${data.ji_bonbun}</td></c:when>
						<c:otherwise><td>${data.ji_bonbun}-${data.ji_bubun}</td></c:otherwise>
					</c:choose>
					<td>${data.building_name}</td>
					<td>${data.road_code}</td>
					<c:choose>
						<c:when test="${data.road_bubun == ''}"><td>${data.road_bonbun}</td></c:when>
						<c:otherwise><td>${data.road_bonbun}-${data.road_bubun}</td></c:otherwise>
					</c:choose>
					<td>
					
						<input type="button" value="상세" class="detailBtn white small btn">
						<input type="button" value="수정" class="updateBtn white small btn">
						<input type="button" value="삭제" class="deleteBtn blue small btn">
						
						<input type="hidden" class="idx" value="${data.idx }">
						<input type="hidden" class="b_id" value="${data.b_id }">
						<input type="hidden" class="b_name" value="${data.b_name }">
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
			<div style="width:1450px;" >
               <table style="width: 98%;"> 
                  <tr>
                        <td align="left"><input type="button" value="선택삭제" class="ckdeleteBtn red big btn" id="ckdelBtn"></td>
                        <td align="center"><input type="button" value="등록" class="red big btn" id="insertBtn"></td>
                  </tr>
               </table>
            </div>   
      </div>
		
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="idx" value="">
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="bidList" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="pageNo" value="">
			<input type="hidden" name="b_id" value="">
			<input type="hidden" name="b_name" value="">
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
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/addr_version_popup.jsp"%>
		</div>
	
		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/addrinsert_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/addrupdate_popup.jsp"%>
		</div>
		
		<div>
			<%@ include file="/WEB-INF/views/Branchoffice_Popup/addrdetail_popup.jsp"%>
		</div>
</body>
</html>