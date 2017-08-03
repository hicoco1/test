<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<script>
$(function () {
    // count 정보 및 count 정보와 관련된 textarea/input 요소를 찾아내서 변수에 저장한다.
    var $maxcount = $('.maxcount');
    var $sms_mms = $('.sms_mms');
    var $count = $('.count');
    var $input = $("#announce_text_org");

    // .text()가 문자열을 반환하기에 이 문자를 숫자로 만들기 위해 1을 곱한다.
    var maximumByte = 600; //mms
    // update 함수는 keyup, paste, input 이벤트에서 호출한다.
    var update = function () {
    var before = $count.text() * 1;
    var str_len = $input.val().length;
    var cbyte = 0;
    var li_len = 0;
    for (i = 0; i < str_len; i++) {
    var ls_one_char = $input.val().charAt(i);
    if (escape(ls_one_char).length > 4) {
    cbyte += 3; //한글이면 3를 더한다
    } else {
    cbyte++; //한글아니면 1을 다한다
    }
    if (cbyte <= maximumByte) { 
        li_len = i + 1;
    }
    }
    // 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
    if (parseInt(cbyte) > parseInt(maximumByte)) {                                                                                                                                                                     
        var str = $input.val();                                                                                                                                                                                        
        var str2 = $input.val().substr(0, li_len);                                                                                                                                                                     
        $input.val(str2);                                                                                                                                                                                              
        var cbyte = 0;                                                                                                                                                                                                 
        for (i = 0; i < $input.val().length; i++) {                                                                                                                                                                    
            var ls_one_char = $input.val().charAt(i);                                                                                                                                                                  
            if (escape(ls_one_char).length > 4) {                                                                                                                                                                      
                cbyte += 3; //한글이면 3를 더한다                                                                                                                                                                      
            } else {                                                                                                                                                                                                   
                cbyte++; //한글아니면 1을 다한다                                                                                                                                                                       
            }                                                                                                                                                                                                          
        }                                                                                                                                                                                                              
    }                                                                                                                                                                                                                  
    /*                                                                                                                                                                                                                 
    if(parseInt(cbyte) ==  90){   //mms                                                                                                                                                                                
        alert("전송 타입 변경 : LMS\n\n===============================================\n문구의 길이가 90byte 초과되어 LMS로 전환되어 전송요청됩니다.\n===============================================");               
        return false;                                                                                                                                                                                                  
    }                                                                                                                                                                                                                  
    */                                                                                                                                                                                                                 
                                                                                                                                                                                                                       
    if(parseInt(cbyte) > 600 ){   //mms  
    	//$maxcount.text('2000'); 
    	alert("600byte까지만 입력가능합니다.");
    	return false;
                                                                                                                                                                                                                       
    }else{  //sms                                                                                                                                                                                                 
        $maxcount.text('600');                                                                                                                                                                        
    }                                                                                                                                                                                                                  
                                                                                                                                                                                                                       
    $count.text(cbyte);                                                                                                                                                                                                
    };                                                                                                                                                                                                                 
                                                                                                                                                                                                                       
    // input, keyup, paste 이벤트와 update 함수를 바인드한다                                                                                                                                                           
    $input.bind('input keyup keydown paste change', function () {                                                                                                                                                      
            setTimeout(update, 0)                                                                                                                                                                                      
            });                                                                                                                                                                                                        
    update();                                                                                                                                       
});  



$(document).ready(function(){
	$('input:radio[name=rs_flag]:input[value=${rs_flag}]').attr("checked", true);
	
	$('input[name="rs_flag"]').change(function(){
		if($(':radio[name="rs_flag"]:checked').val() == '1') {
			$("#branch_txt").css("display","none"); 
			$("#rider_txt").css("display","none"); 
			$("#store_txt").css("display",""); 
		}else if($(':radio[name="rs_flag"]:checked').val() == '2') {
			$("#branch_txt").css("display","none"); 
			$("#store_txt").css("display","none"); 
			$("#rider_txt").css("display",""); 
		}else {
			$("#branch_txt").css("display","none"); 
			$("#store_txt").css("display","none"); 
			$("#rider_txt").css("display","none"); 
			$("#branch_txt").css("display",""); 
		}
	});
	
	
	
	
	
	$("#searchBtn").click(function(){
    	$("#searchForm").submit();
    });
	
	
	$("#act_insert").click(function(){
		if(confirm("전송 하시겠습니까?")){
			var rs_flag = $(':radio[name="rs_flag"]:checked').val();
			var announce_text = $("#announce_text_org").val().replace("\n", " ");
			$("#InsertForm").find("input[name=rs_flag]").val(rs_flag);
			$("#InsertForm").find("input[name=announce_text]").val(announce_text);
			$("input[name=action]").val("SEND");
			$("#InsertForm").submit();
		}
	});
});

</script>

</head>
<body>	

<form action="BranchOfficeInfo_ann" id="searchForm" name="searchForm" method="POST" >
<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div id="searchFrame">
			<hr color=#ff0059 />
				<font id="font_little">환경정보 관리
				<input TYPE="IMAGE" src="resources/images/arrow.PNG" width="15px" height="15px"  align="absmiddle">
				업데이트 공지</font>
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
						전송 대상 구분&nbsp;:&nbsp;
						<input type="radio" name="rs_flag" value="3" checked="checked">지점공지&nbsp;&nbsp;&nbsp;
						<input type="radio" name="rs_flag" value="1">업소공지&nbsp;&nbsp;&nbsp;
						<input type="radio" name="rs_flag" value="2">기사공지&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
					</td>				
					<td></td>
				</tr>	
			</table>
					<input type="hidden" name="pageNo" id="pageNo"   value="${pageno}">
					<input type="hidden" name="pageSize"  id="pageSize" value="${pageInfo.CURRENT}">
					<input type="hidden" name="action"  id="action" value="">
		</div>
	</form>
	
	<form id="InsertForm" name="InsertForm" action="insertbranchofficeinfo_ann" method="POST">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action"/>
		<div id="mainFrame">
			<div id="branch_txt"><font id="font">지점  공지사항</font><br/><br/></div>
			<div id="store_txt" style="display: none;"><font id="font">업소  공지사항</font><br/><br/></div>
			<div id="rider_txt" style="display: none;"><font id="font">기사 공지사항</font><br/><br/></div>
				<textarea name="announce_text_org" style="overflow=auto" rows="7" cols="136" id="announce_text_org" onKeyUp="bytecheck();"></textarea>
				<span class="count">0</span>/<span class="maxcount">600</span>byte<span class="sms_mms"></span>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<div style="float:right; margin-right: 573px;">
			<input type="button" value="전송하기" class="blue small btn" id="act_insert"></div>
			</sec:authorize><br/><br/>
			<input type="hidden" name="rs_flag" id="rs_flag" value="">
			<input type="hidden" name="announce_text" id="announce_text" value="">
		</div>
		</form>
	
	
	<form id="mainForm" name="mainForm" method="get">
	<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="action"/>
	
	<div id="mainFrame">
			<div align="center"><font id="font_little">공지사항 전송 이력</font></div>
			<div><font id="font_little">Total: ${totalCount }</font></div>
			<table id="mainTable">
				<colgroup>
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
					<th>No</th>
					<th>발송 ID</th>
					<th>발송 이름</th>
					<th>전송대상구분</th>
					<th>전송대상ID</th>
					<th>전송대상이름</th>
					<th>내용</th>
					<th>등록일자</th>
					<th>전송결과</th>
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
					<td>${data.org_id}</td>
					<td>${data.org_name}</td>	
					<td>
					<c:choose>
						<c:when test="${data.rs_flag == 1}">가맹점</c:when>
						<c:when test="${data.rs_flag == 2}">배달기사</c:when>
						<c:otherwise>지점</c:otherwise>
					</c:choose>
					</td>
					<td>${data.dest_id}</td>
					<td>${data.dest_name}</td>
					<td style="width: 150px;">
					<div
						style="text-overflow: ellipsis; overflow: hidden; width: 400px;">
						<nobr
							title="<c:out value="${data.announce_text}">${data.announce_text}</c:out>">
							<c:out value="${data.announce_text}">${data.announce_text}</c:out>
						</nobr>
					</div>
					</td>
					<td><fmt:parseDate value="${data.up_date}" var="dateFmt" pattern="yyyyMMddHHmmss"/>
     				<fmt:formatDate value="${dateFmt}"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<c:choose>
							<c:when test="${data.send_result == 2}"><font color="#008100">전송완료</font></c:when>
							<c:otherwise>전송대기</c:otherwise>
						</c:choose>
					</td>
				</tr>
					<input type="hidden" class="org_id" value="${data.org_id }">
					<input type="hidden" class="seq" value="${data.seq }">
					<input type="hidden" class="org_name" value="${data.org_name }">
					<input type="hidden" class="send_time" value="${data.send_time }">
					<input type="hidden" class="announce_type" value="${data.announce_type }">
					<input type="hidden" class="announce_flag" value="${data.announce_flag }">
					<input type="hidden" class="reserved_time" value="${data.reserved_time }">
					<input type="hidden" class="rs_flag" value="${data.rs_flag }">
					<input type="hidden" class="dest_id" value="${data.dest_id }">
					<input type="hidden" class="dest_name" value="${data.dest_name }">
					<input type="hidden" class="announce_text" value="${data.announce_text }">
					<input type="hidden" class="up_op" value="${data.up_op }">
					<input type="hidden" class="up_date" value="${data.up_date }">
					<input type="hidden" class="send_result" value="${data.send_result }">
					<input type="hidden" class="reason" value="${data.reason }">
				</c:forEach>
				</c:if>
			</table>
			<div style="clear:both;height:5px;"></div>
			<div style="clear:both;"></div>
			<div style="clear:both;height:20px;"></div>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<!-- div style="float:right"><input type="button" value="등록" class="red big btn" id="insertBtn"></d -->
			</sec:authorize>
		</div>
		
		<%-- paging --%>
		<div style="width:100%;text-align:center">
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>	
			<input type="hidden" name="searchFlag" value="">
			<input type="hidden" name="searchContent" value="">
			<input type="hidden" name="pageNo" value="">
	</form>
</body>
</html>
