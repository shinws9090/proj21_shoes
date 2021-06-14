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
<title>아이디 찾기</title>

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
		<div id="loginForm">
	<section id = "loginForm">


		<h2>아이디 찾기</h2><!-- 회원가입 -->


		<form:form action="/findId" modelAttribute="memberDetail">
		<form:errors/>
	<!-- 	<fieldset id="loginCommand"> -->
		<p>
			<label for = "memberName">회원   이름 :  <form:input
					path="memberName" /> <form:errors path="memberName" /></label>
		</p>

		<p>
			<label for="email">이메일: 
			<form:input type="email" path="email" id="email" placeholder="E-mail" />  
			<form:errors path="email" />
			</label>
		</p>
		
		
		<input type="submit" value="아이디 찾기" />
		<p><a href="<c:url value='${contextPath}/login/findPw'/>">비밀번호 찾기</a>
		<%-- <p><a href="<c:url value='/account/searchPw'/>">비밀번호 찾기</a> --%>
		
		
<!-- 	</fieldset> -->
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