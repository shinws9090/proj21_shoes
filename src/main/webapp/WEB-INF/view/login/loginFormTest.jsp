<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>로그인</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->	

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
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




 <!-----로그인 입력 폼 start --------------------------------------------------------------------------------------------  -->
	 

	 
	 <div id="login_form">
		<form:form action="loginSuccess" modelAttribute="loginCommand">
		<form:errors/>
	 	
	 		<div class="form-group" style="margin-left: 20%; margin-top: 30%;">
				<label for="formGroupExampleInput">회원 ID :
				</label>			
					<form:input path="memberId" /> <form:errors path="memberId" />
			</div>
		
		
			<div class="form-group" style="margin-left: 20%; ">
				<label  for="formGroupExampleInput"> 회원 PW:
				</label>
					<form:password path="memberPwd" /> <form:errors path="memberPwd" />
			
			</div>
			<div class="form-group form-check">
	
				<label  class="form-check-label" for="exampleCheck1" >ID 저장:
				</label>
					<form:checkbox path="rememberId"  class="form-check-input" id="exampleCheck1"/> 
			
			</div>
			 <input type="submit" value="로그인하기"  size="100"/></td>


		<article id = "findForm">
		
			<a href="${contextPath}/find/findId">아이디 찾기</a> <a> | </a>		
			<a href="${contextPath}/find/findPw">비밀번호 찾기</a>
		
		</article>
	</form:form> 
	</div>

 <!-----로그인 입력 폼 start --------------------------------------------------------------------------------------------  -->

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html> 