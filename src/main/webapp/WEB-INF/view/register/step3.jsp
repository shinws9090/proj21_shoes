<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>회원가입</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/step1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/step2.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
<%-- $(function(){
    var contextPath = "<%= request.getContextPath()%>";
    $('#cancel').on("click", function(e){
        window.location.href = contextPath + "/memberlist";
    });
    $('#new').on("click", function(e){
        var newMember = {  email: $('#email').val(), name: $('#name').val(), password: $('#password').val() };
        alert("data > " + newMember.email );
        $.ajax({
            url         : contextPath + "/api/members/",
            type        : "POST",
            contentType : "application/json; charset=utf-8",
            datatype    : "json",
            cache       : false,
            data        : JSON.stringify(newMember),
            success     : function(res) {
                alert(res);
                window.location.href = contextPath + "/memberlist";
            },
            error       : function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                window.location.href = contextPath + "/memberlist";
            }
        }); 
    });
}); --%>
</script>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->
	<div id="signUpForm">
		<section id="signUpForm">

			<fieldset>
			<h2>회원가입이 완료되었습니다.</h2>
			<a>아이디 > ${newMember.memberId }</a>
			<a>이름 > ${newMember.memberName }</a>
			<a>이메일 > ${newMember.email }</a>
			
			</fieldset>
			<%-- <form action="step4" method="post">
				<!-- 일로 보내조 -->
				<input type="submit" value="다음단계" />
				<!--다음단계  -->

			</form> --%>
			<a href="${contextPath}/index">메인으로</a>
			
			
			<form action="../index" method="get">
				<input type="submit" value="메인으로" />
			</form>
	


		</section>
	</div>

	<section></section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>