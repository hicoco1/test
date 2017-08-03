<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<link href='<c:url value="/resources/css/menu.css"/>'  rel="stylesheet" type="text/css">
<script type="text/javascript">

	$(document).ready(function(){
		
		var url = document.URL;
		var urlArray = url.split("/");		

		var lasturl = urlArray[urlArray.length-1];
		
		if(lasturl.indexOf("?") >= 0){			
			var urlArray2 = lasturl.split("?");
			lasturl = urlArray2[0];			
		}
		if(lasturl == 'BranchOfficeInfo_main' || lasturl == "Branchofficeinfo_cid" || lasturl == "BranchOfficeInfo_sw_ver"
			 || lasturl == "BranchOfficeInfo_s_sw_ver" || lasturl == "BranchOfficeInfo_cid_sw_ver"
			 || lasturl == "BranchOfficeInfo_b_sw_ver"  || lasturl == "BranchOfficeInfo_r_sw_ver" || lasturl == "BranchOfficeInfo_ann"){
			$("a").each(function(){			
				if($(this).attr("href") == 'BranchOfficeInfo_main' || $(this).attr("href") == 'Branchofficeinfo_cid'
					 || $(this).attr("href") == 'BranchOfficeInfo_sw_ver' || $(this).attr("href") == 'BranchOfficeInfo_s_sw_ver' 
					 || $(this).attr("href") == 'BranchOfficeInfo_cid_sw_ver' || $(this).attr("href") == 'BranchOfficeInfo_b_sw_ver'
					 || $(this).attr("href") == 'BranchOfficeInfo_r_sw_ver' || $(this).attr("href") == 'BranchOfficeInfo_ann'){
					$(this).addClass("currentActive");
				}				
			});		
		}
		
		$('#cssmenu > ul > li > a').click(function() {
			$('#cssmenu li').removeClass('active');
			$(this).closest('li').addClass('active');
			var checkElement = $(this).next();
			if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
				$(this).closest('li').removeClass('active');
				checkElement.slideUp('normal');
			}
			if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
				//$('#cssmenu ul ul:visible').slideUp('normal');
				checkElement.slideDown('normal');
			}
			if ($(this).closest('li').find('ul').children().length == 0) {
				return true;
			} else {
				return false;
			}
		});
		
	});
	
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>

<div class="leftMain">
	<div id='cssmenu'>
		<ul>
			<li class='active' style="cursor:default;"><a href='#' style="cursor:default;">
				<span >
					<br>
					<span id="font" style="color: #000000">${username}님 안녕하세요.</span>
					<br>
					<br>
					<div style="border:1px solid gray;cursor:pointer; text-align: center">
						<a href="javascript:formSubmit();"><span id="font_little"><font color="#00000">로그아웃</font></span></a>
					</div>
					<br>
				</span>
			</a></li>
			<hr color="#87CEFA" />
			<li><a href="BranchOfficeInfo_sw_ver"><span id="font_little">지점 CS S/W 관리</span></a></li>
			<li><a href="BranchOfficeInfo_s_sw_ver"><span id="font_little">업소 CS S/W 관리</span></a></li>
			<li><a href="BranchOfficeInfo_b_sw_ver"><span id="font_little">지점 APP S/W 관리</span></a></li>
			<li><a href="BranchOfficeInfo_sapp_sw_ver"><span id="font_little">업소 APP S/W 관리</span></a></li>
			<li><a href="BranchOfficeInfo_r_sw_ver"><span id="font_little">기사 APP S/W 관리</span></a></li>
			<li><a href="BranchOfficeInfo_cid_sw_ver"><span id="font_little">업소 CID S/W 관리</span></a></li>
			<hr color="#87CEFA" />
			<li><a href="BranchOfficeInfo_main"><span id="font_little">프린터 정보 관리</span></a></li>
			<li><a href="BranchOfficeInfo_cid"><span id="font_little">CID 정보 관리</span></a></li>
			<li><a href="developer_Fee_Config"><span id="font_little">콜비 정보 설정</span></a></li>
			<hr color="#87CEFA" />
			<li><a href="BranchOfficeInfo_ann"><span id="font_little">업데이트 공지</span></a></li>
			<hr color="#87CEFA" />
		</ul>
	</div>
</div>

