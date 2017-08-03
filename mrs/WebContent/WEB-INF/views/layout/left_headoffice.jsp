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
		if(lasturl == 'HeadOffice_main' || lasturl == 'HeadOffice_addr' || lasturl == 'HeadOffice_citygu' || lasturl == 'HeadOffice_dong'
			 || lasturl == 'HeadOffice_bank' || lasturl == 'HeadOffice_config'){
			$("a").each(function(){			
				if($(this).attr("href") == 'HeadOffice_main' || $(this).attr("href") == 'HeadOffice_addr' || $(this).attr("href") == 'HeadOffice_citygu' 
						|| $(this).attr("href") == 'HeadOffice_dong' || $(this).attr("href") == 'HeadOffice_bank' || lasturl == 'HeadOffice_config'){
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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<hr color="#87CEFA" />
			<li><a href="HeadOffice_main"><span id="font_little">계정 관리</span></a></li>
			<hr color="#87CEFA" />
			<li><a href="HeadOffice_addr"><span id="font_little">전국 주소 관리</span></a></li>
			<li><a href="HeadOffice_citygu"><span id="font_little">전국 시/도 시군구 정보</span></a></li>
			<li><a href="HeadOffice_dong"><span id="font_little">전국 동코드 정보</span></a></li>
			<hr color="#87CEFA" />
			<li><a href="HeadOffice_bank"><span id="font_little">가상계좌 은행 관리</span></a></li>
			<li><a href="HeadOffice_config"><span id="font_little">모 계좌 은행 관리</span></a></li>
			<hr color="#87CEFA" />
			</sec:authorize>
		</ul>
	</div>
</div>

