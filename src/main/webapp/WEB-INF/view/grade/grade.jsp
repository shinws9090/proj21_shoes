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
<title>마이페이지</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css">
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
		<div id="myGrade">
	<section id = "myGrade">
	
	<c:if test="${empty authInfo}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">회원가입</a></li>
				<li><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				
				<table id="tbl_maGrade"> 
						<tr id="tr_myGrade">
						<td>${member.memberName }[${member.memberId}]님의 멤버십 등급은 ${member.grade}입니다.</td>
						<td> 포인트 〉 </td><td id="myPoint"> ${member.point }점 </td>
						<tr>
				</table>
					${member.memberName }
				111
				
				<table  class="tbl_type" border="1"> 
				<tr>
					<td>VVIP</td>
					<td>매월 1일 10,000원 포인트 지급</td>
				</tr> 
				<tr>
					<td>VIP</td>
					<td>매월 1일 5,000원 포인트 지급</td>
				</tr> 
				<tr>
				
					<td>GOLD</td>
					<td>매월 1일 3,000원 포인트 지급</td>
				<tr>
				
					<td>SILVER</td>
					<td>매월 1일 2,000원 포인트 지급</td>
				</tr> 
				<tr>
				
					<td>FAMILY</td>
					<td>매월 1일 1,000원 포인트 지급</td>
				</tr> 
				
				</table>
				
			</c:if>

	
	
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