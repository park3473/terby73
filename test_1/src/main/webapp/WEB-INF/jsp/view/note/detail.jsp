<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->
<div>
<c:if test="${session_login == 'ok'}">로그인 온</c:if>
<p>${session_email}</p>
</div>
<!--공통상단-->
<%@ include file="../include/header.jsp" %>
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff !important;
        text-decoration: none !important;
    }
    .test_div > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }

</style>
<div>
	<p>hello</p>
	<c:forEach var="i" begin="1" end="${model.Pagecount}" varStatus="count">
    	<p onclick="javascript:content(${count.index})">${count.index}</p>
	</c:forEach>
	<c:forEach var="item" items="${model.list}" varStatus="var">
		<ul>
			<li>${item.P_IDX }</li>
			<li id="N_IDX">${item.N_IDX }</li>
			<li>${item.CONTENT }</li>
		</ul>
	</c:forEach>
</div>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
/*
alert('${ip_session}');
if('${check}' == 'fail'){
	alert("실패");
}else{
	alert("성공")
}
*/
	function content(P_IDX){
		var N_IDX = $('#N_IDX').val();
		$.ajax({
			type : "POST",
			url : "/user/note/detail.do?",
			cache : false,
			data : ({
				P_IDX : P_IDX,
				N_IDX : N_IDX
			}),
			dataType : "json",
			success: function(data , status, xhr){
				console.log(data);
				}
		})
	}



</script>
<!-- js 끝 -->