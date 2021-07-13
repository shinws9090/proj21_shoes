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
<title>아이디 찾기</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->	

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberBootstrap.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
</style>

</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
	
		<div id="loginForm" style="
		margin-bottom: 10px;
		margin-top: 20px;
		">
		
		
	<section id = "loginForm" >
		<form:form action="/findId" modelAttribute="memberDetail">
		<form:errors style="color:red; text-align: center;"/>
		
<section id="login_input" >
		<b><h1>아이디 찾기</h1></b><!-- 회원가입 -->
		
				
					<label for = "memberName" style=" margin-top:5px;  margin-bottom: 10px;  " >
						<form:input path="memberName" placeholder="회원명" /> 
						<form:errors path="memberName" />
					</label>
		
			
			
			<label for="email" style="margin-bottom: 10px; ">
			<form:input type="email" path="email" id="email" placeholder="이메일" />  
			<form:errors path="email" />
			</label>
			
		
		
		<article class="btnSearch" >
	
		
		<button type="button,submit" value="조회하기" class="btn btn-secondary btn-lg"  style="width: 100%; font-size: 15px; margin-bottom: 10px;">조회하기</button>
		
		<a href="${contextPath}/login/loginForm">로그인</a><a> | </a>
		<a href="${contextPath}/find/findPw">비밀번호 찾기</a>
	
		</article>
		
		</section>
		
		
	</form:form> 

	</section>
</div>



	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html> 