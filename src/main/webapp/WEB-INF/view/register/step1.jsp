<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->
  <!-- 동의 -->

  <div id="signUpForm_agree">
 
	<section class="box1">
		<h2> 회원가입 (이용약관 동의)</h2>
			<article id="agree_content">
			<p>
				약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용약관내용
			</p>
			</article>
			
			<form action="step2" method="post">
				<label> <input type="checkbox" name="agree" value="true"><!-- 동의 -->
				<spring:message code="term.agree" /></label> <input type="submit" value="<spring:message code="next.btn"/>" /><!--다음단계  -->
			</form>
			
			<form action="../index" method="get">
			<label><input type="submit" value="가입취소(메인으로)"/> </label>
			</form>
	</section>
	</div>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>