<%@page import="proj21_shoes.dto.Order"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<c:set var="order" value="<%=request.getSession().getAttribute(\"order\")%>" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>이런신발</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>

	<section>
		주문코드 = ${order.orderCode } <br>
		회원코드 = ${order.memberCode }<br>
		주문일 = ${order.orderDate }<br>
		결제금액 = ${order.paymentAmount }<br>
		결제여부 = ${order.paymentState }<br>
		배송코드 = ${order.deliveryCode }<br>
		구매확정여부 = ${order.buyConfirmState }<br>
		orderProduct = ${order.orderProduct }<br>
		address = ${order.address }<br>
		
		
			
	</section>
		
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>