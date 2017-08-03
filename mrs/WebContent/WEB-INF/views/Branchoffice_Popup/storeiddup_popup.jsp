<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<script type="text/javascript">
$(".dupBtn").click(function(){
	var login_id = $("#InsertForm").find("input[name=login_id]").val();
	
	if(login_id == '') {
		alert("로그인 계정을 입력해주세요.");
		$("#InsertForm").find("input[name=login_id]").focus();
		return false;
	}
	
	$("#DupForm").find("input[name=login_id_chk]").val(login_id);
	
	$.ajax({
		type:"POST",
		url:"iddupchkbranchoffice_store",
		cache:false,
		data:{
			js_sido:login_id
		},
		success:function(data, status){
			if(data > 0) {
				$('#chk_text').text('이미 등록된 로그인 계정입니다.');
				$("#InsertForm").find("input[name=login_id]").val(login_id);
				$("#searchForm").find("input[name=dupchk_flag]").val("0");
				$("input[name=login_id]").attr("readonly",false);
				return false;
			}else {
				$('#chk_text').text('사용 가능한 로그인 계정입니다.');
				$("#InsertForm").find("input[name=login_id]").val(login_id);
				$("#searchForm").find("input[name=dupchk_flag]").val("1");
				$("input[name=login_id]").attr("readonly",true);
			}
		},
		error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
		
	});
	
	$('#Duppopup').bPopup();
});
</script>
<div id="Duppopup" class="Pstyle">
		<span class="b-close">X</span>
		<div class="content">
			<form id="DupForm" name="DupForm" action="iddupchkbranchoffice_store" method="POST">
			<input type="hidden"   name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="action"/>
				<table>
					<tr>
						<td id ="pop_header">로그인 계정 중복확인</td>
					</tr>
				</table>
				<hr color="#87CEFA" />
				<table id ="pop_layout">
					<tr>
						<td >로그인 계정: </td>
						<td><input type="text" name="login_id_chk" value=""></td>
					</tr>
					</table>
					<div id="chk_text" style="font-family:'Jeju Gothic',sans-serif; color: red; font-size: 14px; margin-top: 8px;"></div>
					<hr color="#87CEFA" />
					<table id ="pop_layout_btn">
					<tr>
						<td><input type="button" value="중복확인" class="blue small btn" id="act_dupchk"></td>
						<td><input type="button" value="취소" class="white small btn" id="act_cancel_dupchk"></td>
					</tr>
				</table>
				<input type="hidden" name="searchFlag" value="">
				<input type="hidden" name="searchContent" value="">
				<input type="hidden" name="pageNo" value="">
			</form>
		</div>
	</div>
	