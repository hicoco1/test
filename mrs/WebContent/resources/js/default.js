// BackSpace 키 방지 이벤트
    $(document).keydown(function(e){ 
        if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"  ){  
           if(e.keyCode === 8){    
                   return false;
             }
        }else{
           if(document.activeElement.getAttribute("readonly") == "readonly"){
             if(e.keyCode === 8){    
                   return false;
             }
          }
        }
    });
    window.history.forward(0);

//숫자만 입력
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}


$(function() {
  $("#contract_sdate, #contract_edate, #service_start_date, #update_date").datepicker({
	  	//showOn: "both",
	  	//buttonText: "달력",
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        closeText: '닫기', 
        dateFormat: "yymmdd",
        changeMonth: true, 
        showButtonPanel: true,
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        yearRange: 'c-10:c+100',
        showMonthAfterYear: true, //년 뒤에 월 표시
        
  });
});

$(function() {
	  $("#contract_sdate_up, #contract_edate_up, #service_start_date_up, #update_date_up").datepicker({
		  	//showOn: "both",
		  	//buttonText: "달력",
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        closeText: '닫기', 
	        dateFormat: "yymmdd",
	        changeMonth: true, 
	        showButtonPanel: true,
	        changeYear: true,
	        nextText: '다음 달',
	        prevText: '이전 달',
	        yearRange: 'c-10:c+100',
	        showMonthAfterYear: true, //년 뒤에 월 표시
	        
	  });
	});

$(function() {
	  $("#lastrechg, #lastrechg_up").datepicker({
		  	//showOn: "both",
		  	//buttonText: "달력",
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        closeText: '닫기', 
	        dateFormat: "yymmdd",
	        changeMonth: true, 
	        showButtonPanel: true,
	        changeYear: true,
	        nextText: '다음 달',
	        prevText: '이전 달',
	        yearRange: 'c-10:c+100',
	        showMonthAfterYear: true, //년 뒤에 월 표시
	        
	  });
	});

//월달력
$(document).ready(function () {
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yymmdd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '',
		//showOn: 'both',
		//buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: 'c-10:c+100',
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	var datepicker_default = {
		//showOn: 'both',
		//buttonText: "달력",
		currentText: "이번달",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: 'c-10:c+100',
		showOtherMonths: true,
		selectOtherMonths: true
	}

	datepicker_default.closeText = "선택";
	datepicker_default.dateFormat = "yymm";
	datepicker_default.onClose = function (dateText, inst) {
		var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		$(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
		$(this).datepicker('setDate', new Date(year, month, 1));
	}

	datepicker_default.beforeShow = function () {
		var selectDate = $("#start_date").val().split("-");
		var year = Number(selectDate[0]);
		var month = Number(selectDate[1]) - 1;
		
		var selectDate_end = $("#end_date").val().split("-");
		var year = Number(selectDate_end[0]);
		var month = Number(selectDate_end[1]) - 1;
		
		$(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
	}
	$("#start_date").datepicker(datepicker_default);
	$("#end_date").datepicker(datepicker_default);
});

//년달력
$(document).ready(function () {
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yymmdd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '',
		//showOn: 'both',
		//buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: 'c-10:c+100',
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	var datepicker_default = {
		//showOn: 'both',
		//buttonText: "달력",
		currentText: "이번달",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: 'c-10:c+100',
		showOtherMonths: true,
		selectOtherMonths: true
	}

	datepicker_default.closeText = "선택";
	datepicker_default.dateFormat = "yy";
	datepicker_default.onClose = function (dateText, inst) {
		var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		$(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
		$(this).datepicker('setDate', new Date(year, month, 1));
	}

	datepicker_default.beforeShow = function () {
		var selectDate = $("#start_year").val().split("-");
		var year = Number(selectDate[0]);
		var month = Number(selectDate[1]) - 1;
		
		var selectDate_end = $("#end_year").val().split("-");
		var year = Number(selectDate_end[0]);
		var month = Number(selectDate_end[1]) - 1;
		
		$(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
	}
	$("#start_year").datepicker(datepicker_default);
	$("#end_year").datepicker(datepicker_default);
});