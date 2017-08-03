<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/resources/js/jquery-1.11.0.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/date.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#pageSize").change(function(){	
		$("#searchForm").find("input[name=pageSize]").val($(this).val());
	});
	

	// 페이지 리스트카운트 설정.
	$("#searchForm").find("input[name=pageSize]").val("${pageInfo.rowsPerPage}");
	
	$("#pageSize").val("${pageInfo.rowsPerPage}").attr("selected","selected");
});

function changePage(pageNo){

	$('#action').val("search");	
	$('#pageNo').val(pageNo);	
	$('#searchForm').submit();
}	

</script>    
<style>
#number table{
	font-family: 나눔고딕,굴림,돋움,arial;
	font-size: 10pt;
	word-break:break-all;
}
</style>
<link rel="stylesheet" href="/resources/css/paging.css" type="text/css">
<!-- paging start -->
<div id="number">
	<table cellspacing="2" style="margin:0 auto">
		<tr class="numberList">
			<c:choose>
				<c:when test="${totalCount > 0 && pageInfo.min != 1}">
					<td class="numberIconLeft">
						<a href="javascript:changePage('1')">처음</a>
					</td>
					<td class="numberIconLeft">
						<a href="javascript:changePage('${pageInfo.min - 1}')">이전</a>
					</td>
				</c:when>
				<c:otherwise>
					<td class="numberIconLeft">
						<a href="javascript:">처음</a>
					</td>
					<td class="numberIconLeft">
						<a href="javascript:">이전</a>
					</td>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${totalCount > 0}">
					<c:forEach begin='${pageInfo.min}' end='${pageInfo.max}' varStatus='status'>
						<c:choose>
							<c:when test="${status.index == pageInfo.current}">
								<td><a href="javascript:" class="active">${status.index}</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="javascript:changePage('${status.index}')">${status.index}</a></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>				
				</c:when>
				<c:otherwise>
					<td>&nbsp; 1 &nbsp; </td>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${pageInfo.last != pageInfo.max}">
					<td class="numberIconRight">
						<a href="javascript:changePage('${pageInfo.max + 1}')">다음</a>
					</td>
					<td class="numberIconRight">
						<a href="javascript:changePage('${pageInfo.last}')">마지막</a>
					</td>
				</c:when>
				<c:otherwise>
					<td class="numberIconRight">
						<a href="javascript:">다음</a>
					</td>
					<td class="numberIconRight">
						<a href="javascript:">마지막</a>
					</td>
				</c:otherwise>
			</c:choose>	

		</tr>
	</table>
</div>
<!-- paging end -->