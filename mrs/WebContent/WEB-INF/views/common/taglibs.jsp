<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src='<c:url value="/resources/js/jquery.bpopup.min.js"/>' ></script>
<script src='<c:url value="/resources/js/dgLib.js"/>' ></script>
<script src='<c:url value="/resources/js/default.js"/>' ></script>
<script src='<c:url value="/resources/js/jquery-1.7.2.min.js"/>' ></script>
<script src='<c:url value="/resources/js/jquery.poshytip.js"/>' ></script>
<script src='<c:url value="/resources/js/jquery.validate.js"/>' ></script>
<script src='<c:url value="/resources/js/jquery.validate.min.js"/>' ></script>
<script src='<c:url value="/resources/js/additional-methods.js"/>' ></script>
<script src='<c:url value="/resources/js/additional-methods.min.js"/>' ></script>
<script src='<c:url value="/resources/js/messages_ko.js"/>' ></script>
<script src='<c:url value="/resources/js/jquery.blockUI.js"/>' ></script>
<link href='<c:url value="/resources/css/dgLib.css"/>'  rel="stylesheet" type="text/css">


<link href='<c:url value="/resources/css/jquery-ui.css"/>'  rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/default.css"/>'  rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/paging.css"/>'  rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/button.css"/>'  rel="stylesheet" type="text/css">

<link href='<c:url value="/resources/css/office.css"/>'  rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/menu.css"/>'  rel="stylesheet" type="text/css">
<link href='<c:url value="/resources/css/popup.css"/>'  rel="stylesheet" type="text/css"> 
<script>
function trim(str) {
	return str.replace( /(^\s*)|(\s*$)/g, "" );
}
function makeWeekSelectOptions() {
	var year = $("#sh_year").val();
	var month = $("#sh_month").val();

	var today = new Date();

	var sdate = new Date(year, month-1, 01);
	var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth()+1, 0)).getDate();
	var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);

	var week = sdate.getDay();
	sdate.setDate(sdate.getDate() - week);
	var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());

	var obj = document.getElementById("sh_week");
	obj.options.length = 0;
	var seled = "";
	while(endDate.getTime() >= edate.getTime()) {

		var sYear = sdate.getFullYear();
		var sMonth = (sdate.getMonth()+1);
		var sDay = sdate.getDate();

		sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
		sDay = (sDay < 10) ? "0"+sDay : sDay;

		var stxt = sYear + sMonth + sDay;

		edate.setDate(sdate.getDate() + 6);

		var eYear = edate.getFullYear();
		var eMonth = (edate.getMonth()+1);
		var eDay = edate.getDate();

		eMonth = (eMonth < 10) ? "0"+eMonth : eMonth;
		eDay = (eDay < 10) ? "0"+eDay : eDay;

		var etxt = eYear + eMonth + eDay;

		if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
			seled = stxt+"|"+etxt;
		}

		obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);

		sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
		edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
	}

	if(seled) obj.value = seled;
}

$(document).ready(function(){
	
	$('.readonly').attr("readonly","readonly");
	$('.readonly').keydown(function() {
		if(event.keyCode==8) {event.keyCode=0;return false;}
	});
	
	$.ajaxSetup({
	 	headers: {
	        'X-CSRF-TOKEN': $('meta[name="${_csrf.parameterName}"]').attr('content')
	    }
	});
	
	$("#spring_loading").click(function(){
		 $('#loading').show();   
	});
	
	$("#insertBtn").click(function(){
		$('#Insertpopup').bPopup();
	});
	
	$("#act_cancel").click(function(){
		$('#Insertpopup').bPopup().close();
		
	});
	
	$("#act_cancel_up").click(function(){
		$('#Updatepopup').bPopup().close();
		//location.reload();
	});
	
	$("#act_cancel_rechrg").click(function(){
		$('#Rechrgpopup').bPopup().close();
		//location.reload();
	});
	
	
	
	$("#act_cancel_detail").click(function(){
		$('#Detailpopup').bPopup().close();
	});
	
	$("#addrupBtn").click(function(){
		$('#addr_ver_popup').bPopup();
	});
	
	$("#checkAll").click(function(){			
		if($(this).is(":checked")){			
			$('input:checkbox').not(this).prop('checked', this.checked);
			$("input[name=checkFlag]").each(function(){					
				$(this).parent().find("input[name=checkValue]").val("1");
			});
		}else{		
			$("input[name=checkFlag]").each(function(){					
				$(this).attr("checked",false);
				$(this).parent().find("input[name=checkValue]").val("0");
			});
		}
	});
	$("input[name=checkFlag]").click(function(){
		if($(this).is(":checked")){				
			$(this).parent().find("input[name=checkValue]").val("1");
		}else{				
			$(this).parent().find("input[name=checkValue]").val("0");
		}
		$("#checkAll").attr("checked",false);
	});

});


var url = document.URL;
var urlArray = url.split("/");	
var lasturl = urlArray[urlArray.length-1];

if(lasturl.indexOf("?") >= 0){			
	var urlArray2 = lasturl.split("?");
	lasturl = urlArray2[0];			
}


if("${result}" == 1 && "${action}" == "fileupload") {
	if(window.location.hash == ""){
		alert("총 "+"${cnt}"+"건의 정보가 등록 되었습니다.");
	}
	opener.location.reload();
	window.close();
}else if("${result}" == -1 && "${action}" == "fileupload") {
	if(window.location.hash == ""){
		alert("파일 업로드를 실패하였습니다.");
	}
	opener.location.reload();
	window.close();
}

if("${result}" == 1 && "${action}" == "UPDATE") {
	if(window.location.hash == ""){
		var agent = navigator.userAgent.toLowerCase();
		alert("수정을 완료하였습니다.");
		window.location.hash = "#";
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
			location.reload();
		}
	}
	if(window.location.hash == "#") {
	}
}
   
if("${result}" == 0 && "${action}" == "UPDATE") {
	if(window.location.hash == ""){
		alert("수정을 실패하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

if("${result}" == 1 && "${action}" == "SETTING") {
	if(window.location.hash == ""){
		alert("적용을 완료하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

if("${result}" == 0 && "${action}" == "SETTING") {
	if(window.location.hash == ""){
		alert("적용을 실패하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}
       
if("${result}" == 1 && "${action}" == "INSERT") {
	if(window.location.hash == ""){
		alert("등록을 완료하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

if("${result}" == 2 && "${action}" == "INSERT") {
	if(window.location.hash == ""){
		alert("이미 등록된 정보 입니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

if("${result}" == 0 && "${action}" == "INSERT") {
	if(window.location.hash == ""){
		alert("등록을 실패하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}
       
if("${result}" == 1 && "${action}" == "DELETE") {
	if(window.location.hash == ""){
		alert("삭제를 완료하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}
       
if("${result}" == 0 && "${action}" == "DELETE") {
	if(window.location.hash == ""){
		alert("삭제를 실패하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

if("${result}" == 1 && "${action}" == "APPLY") {
	if(window.location.hash == ""){
		alert("적용을 완료하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}
       
if("${result}" == 0 && "${action}" == "APPLY") {
	if(window.location.hash == ""){
		alert("적용을 실패하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

if("${result}" == 1 && "${action}" == "RECHRG") {
	if(window.location.hash == ""){
		alert("충전을 완료하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}
       
if("${result}" == 0 && "${action}" == "RECHRG") {
	if(window.location.hash == ""){
		alert("충전을 실패하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

if("${result}" != 0 && "${action}" == "SEND") {
	if(window.location.hash == ""){
		alert("전송을 완료하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}
       
if("${result}" == 0 && "${action}" == "SEND") {
	if(window.location.hash == ""){
		alert("전송을 실패하였습니다.");
		window.location.hash = "#";
	}
	if(window.location.hash == "#") {
	}
}

$(function() {
    $(".input_click_init").focus(function() { 
      $(this).val('');
    }).blur(function() { 
      if($(this).val() == "") { $(this).val("0"); }
    });
 });
</script> 