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
	
	<div id="loginForm">
	<section id = "loginForm">
		<h2>로그인</h2><!-- 회원가입 -->
		<form:form action="/adminLoginSuccess"  modelAttribute="adminLoginCommend">
		<form:errors/>
	 	<fieldset id="loginCommand"> 
	 	<table>
		<tr>
			<td><p>회원 ID : </p></td>
			<td id="td_right">
				<label >
					<form:input path="empId" /> <form:errors path="empId" />
				</label>
			</td>
		</tr>
		<tr>
			<td><p>회원 PW:</p></td>
			<td id="td_right">
				<label> 
					<form:password path="empPwd" /> <form:errors path="empPwd" />
				</label>
			</td>
			</tr>
		<tr>
		<td><p>ID 저장:
				<label >
					<form:checkbox path="rememberId" /> 
				</label>
			 </p></td>
			 <td id="td_right">
			 <input type="submit" value="로그인하기"  size="100"/></td>
		</tr>
<!-- 		<article class="btn2">
		<tr>
		<td>
		<input type="submit" value="로그인하기"  size="100"/>
		</td>
		</tr>
		</article> -->
		
		
		<%-- <p><a href="<c:url value='${contextPath}/find/findIdPw'/>">아이디/비밀번호 찾기</a> --%>

		</table>
		<table>
		<article id = "findForm">
		
			<a href="<c:url value='${contextPath}/find/findId'/>">아이디 찾기</a> <a> | </a>		
			<a href="<c:url value='${contextPath}/find/findPw'/>">비밀번호 찾기</a>
			<a> | </a>		
			<a href="<c:url value='${contextPath}/adminLogin'/>">관리자 로그인</a>
		
		</article>
		</table>
		
 	</fieldset> 
	</form:form> 

	</section>
</div>


	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html> 