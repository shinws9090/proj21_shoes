<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productList.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}";
	$(".item").click(function(){
		var code = $(this).data("item");
		window.location.href = contextPath+"/productDetail/"+code;	
	});
	$(".category").click(function(){
		$(this).submit();
	});
	
	
});
</script>
</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>

	<section>
		<%-- ${products} --%>
		<nav class="category-menu">
			<ul>
				<li>
					<form:form class="category" modelAttribute="productSelectCommend" action="${contextPath}/productList">
						ALL
						<form:hidden path="gender" value="${products[0].gender}"/>
						<form:hidden path="brandCode"/>
					</form:form>
				</li>
				<c:forEach var="product" items="${products}">
					<li>
						<form:form class="category" modelAttribute="productSelectCommend" action="${contextPath}/productList">
							${product.category.category}
							<form:hidden path="gender" value="${products[0].gender}"/>
							<form:hidden path="brandCode"/>
							<form:hidden path="productCategoryCode" value="${product.category.productCategoryCode}"/>
						</form:form>
					</li>
				</c:forEach>
			</ul>
		</nav>
		<c:forEach var="product" items="${products}">
			<div class="item" data-item="${product.productCode}">
				<img src="images/women-myool-main.jpg">
				<div class="detail">
					<div class="title">
						<h2>
							<em>${product.productName}</em>
						</h2>
						<span class="price">${product.sellPrice}</span>
				</div>
				</div>
			</div>
		</c:forEach>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>