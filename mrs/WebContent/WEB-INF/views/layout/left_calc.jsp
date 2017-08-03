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
		if(lasturl == 'Calc_main' || lasturl == 'Calc_store' || lasturl == 'Calc_rider' || lasturl == 'Calc_storider' || lasturl == 'Calc_sol'){
			$("a").each(function(){			
				if($(this).attr("href") == 'Calc_main' || $(this).attr("href") == 'Calc_store' 
						|| $(this).attr("href") == 'Calc_rider' || $(this).attr("href") == 'Calc_storider' || $(this).attr("href") == 'Calc_sol'){
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
			<li><a href="Calc_main"><span id="font_little">지점별 정산</span></a></li>
			<li><a href="Calc_storider"><span id="font_little">업소별 정산</span></a></li>
			<li><a href="Calc_rider"><span id="font_little">기사별 정산</span></a></li>
			<li><a href="Calc_store"><span id="font_little">가맹비 정산</span></a></li>
			<li><a href="Calc_sol"><span id="font_little">솔루션사 정산</span></a></li>
			<hr color="#87CEFA" />
		</ul>
	</div>
</div>

