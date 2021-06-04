<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
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
	href="<%=request.getContextPath()%>/css/productDetail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".btn li").click(function() {
			$(this).addClass("active");
			$(this).siblings().removeClass("active");

			var tab = $(this).attr("data-alt");
			$(".tabs div").removeClass("active");
			$(".tabs div").eq($(this).index()).addClass("active");
		});
		
			/* var options = "${product.orderOptions.color}"; */
		$(".size span").click(function(){
			alert("asd");
			$(".size span").removeClass();
			$(this).addClass("active");
			var c = ""
			/* for(var option in options){
			c += "<span>"+option.color+"</span>";
			} */
			/* $(".color").append(color); */
			
		});
		
		$(".color span").click(function(){
			/* $(".color span").removeClass(); */
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
		});
		
	});
</script>

</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<section>
		<p>${product}</p>

		<div class='main'>
			<div class='main-image'>
				${product.productPost.productMainImage} <img
					src="http://via.placeholder.com/300X300">
			</div>


			<ul class="btn">
				<li class="active">상새정보</li>
				<li>상품후기</li>
				<li>상품문의</li>
			</ul>

			<div class="tabs">
				<div class='product-content active'>
					<c:forEach var="image" items="${product.productPost.images}">
					${image.image} <img src="http://via.placeholder.com/300X300">
					</c:forEach>
					<p>상품설명 : ${product.productPost.content}</p>
				</div>
				<div class='product-review'>상품후기</div>
				<div class='product-QnA'>상품문의</div>
			</div>
		</div>
		<div class="order-options">
			<strong>${product.productName}</strong>
			<p>
				<em>Brand : </em> <label>${product.brand.brandEngName }</label>
			</p>
			<div class="size">
				<label>Sizes</label>
				<c:forEach var="option" items="${product.orderOptions}">
					<span class="active">${option.size}</span>
				</c:forEach>
			</div>
			<div class="color">
			</div>
			<p>${product.sellPrice}원</p>
			<input type="number">
			<div class='submitBtns'>
				<input type='submit' id='cart' value='장바구니' /> <input type='submit'
					id='purchase' value='구매하기' />
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>