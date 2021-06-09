<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step1.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step2.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id = "maPage">
	
	<c:if test="${empty authInfo}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">JOIN</a></li>
			<li><a href="${contextPath}/login/loginForm">LOGIN</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				<p>${authInfo.memberName }님. 환영합니다</p>
				
				
				<p>나의 쇼핑정보</p>
				<li><a href="${contextPath}/myPage/changeMemberData">주문내역</a></li>
				
				
				<p>회원정보</p>
				<li><a href="${contextPath}/myPage/changeMemberData">회원정보 변경</a></li>
				<li><a href="${contextPath}/myPage/">회원탈퇴</a></li>
				
				
				
			</c:if>

		<form:form action="maPage" modelAttribute="loginCommand">
		<form:errors/>
		<fieldset id="loginCommand">
		<p>
			<label>회원ID :<br> <form:input
					path="memberId" /> <form:errors path="memberId" /></label>
		</p>
		<p>
			<label>회원 비밀번호: :<br> <form:password path="memberPwd" /> <form:errors path="memberPwd" /></label>
		</p>
		<p>
			<label>ID기억하기:<form:checkbox path="rememberId" /> </label>
		</p>
		<input type="submit" value="로그인하기" />
		</fieldset>
	</form:form> 
	
	</section>
</div>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>