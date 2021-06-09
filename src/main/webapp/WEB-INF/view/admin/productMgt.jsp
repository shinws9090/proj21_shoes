<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>lighten</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<jsp:include page="/WEB-INF/view/admin/include/adminMenu.jsp" />
	
		<table style="width: 80%">
			<tr>
				<td colspan="7" class="td_title">상품 목록</td>
			</tr>
			
			<tr style="background-color: lightgrey; text-align: center">
				<td>번호</td><td>상품명</td><td>가격</td><td>등록일</td><td>재고량</td><td>상세보기</td><td>기타</td>
				
			</tr>	
						
			<c:forEach var="product" items="${product}">
				<tr>
					<td>${product.productCode }</td>
					<td>${product.productName }</td>
					<td>${product.sellPrice }</td>
					<td>${product.registDate }</td>
					<td>${product.cumulativeRegistCount }</td>
					<td><a href="#">[상세보기]</a></td>	
					<td><a href="#">[수정]</a>&nbsp;
						<a href="#">[삭제]</a></td>
				</tr>
			</c:forEach>
						
			<tr>
				<td><a href="viewProductReg">[상품등록]</a></td>
			</tr>
		</table>
				
		${product}
	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>