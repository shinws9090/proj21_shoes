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

<title>에러</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/signup.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>

<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->
	<section class="error1">
	<a>에러가 발생했습니다 왜???</a>
	</section>
	

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>

