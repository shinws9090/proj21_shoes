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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}"
	
	function count(url , cartCode, t){
		var c = 0;
		$.ajax({
			url : contextPath + "/api/"+url+"/"+cartCode,
			type : 'put',
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			async: false,
			cache : false,
			success : function(json) {
				c= json.count;
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"
						+request.responseText+"\n"+"error:"+error);
			}
		});
		return c;
	}
	
	$(".countDown").click(function(){
		var cartCode = $(this).val();
		var res = count("countDown" ,cartCode)
		$(this).next().text(res);
		var price = res * $(this).parent().parent().children(".price").data("sellprice");
		$(this).parent().parent().children(".price").text(price);
		priceAll()
	});
	
	$(".countUp").click(function(){
		var cartCode = $(this).val();
		var res = count("countUp" ,cartCode);
		$(this).prev().text(res);
		var price = res * $(this).parent().parent().children(".price").data("sellprice");
		$(this).parent().parent().children(".price").text(price);
		priceAll()
	});
	
	$(".delete").click(function(){
		$(this).parent().parent().addClass("del")
		var cartCode = $(this).val();
		$.ajax({
			url : contextPath + "/api/delete/"+cartCode,
			type : 'delete',
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			async: false,
			cache : false,
			success : function() {
				$(".del").remove();
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"
						+request.responseText+"\n"+"error:"+error);
				
			}
		});
		$(this).parent().parent().removeClass("del")
	});
	
	function priceAll() {
		var priceAll = 0;
		$(".price").each(function() {
			priceAll += Number($(this).text());
		});
		$("#priceAll").text("전체가격:" + priceAll);
	}
	priceAll()
});
</script>
</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>

	<section>
		${cartList}
		<%-- ${productList} --%>
			<table>
				<thead>
				<tr>
					<th>상품코드 </th>
					<th>상품명 </th>
					<th>대표이미지 </th>
					<th>가격 </th>
					<th>색상 </th>
					<th>스타일코드 </th>
					<th>사이즈 </th>
					<th>수량 </th>
					<th>삭제 </th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="cart" items="${cartList}">
					<tr>
						<c:forEach var="p" items="${productList}">
							<c:if test="${cart.productCode == p.productCode}">
								<td>${p.productCode} </td>
								<td>${p.productName} </td>
								<td>${p.productPost.productMainImage} </td>
								<td class="price" data-sellprice="${p.sellPrice}">
									${p.sellPrice*cart.count}</td>
								
								<c:forEach var="o" items="${p.orderOptions}">
									<c:if test="${cart.styleCode==o.styleCode}">
										<td>${o.color}</td>
									</c:if>
								</c:forEach>
								
							</c:if>
						</c:forEach>
						
						<td>${cart.styleCode} </td>
						<td>${cart.size} </td>
						<td>
						<button class="countDown" value="${cart.cartCode}">◀</button>
						<span>${cart.count} </span>
						<button class="countUp" value="${cart.cartCode}">▶</button>
						</td>
						<td>
						<button class="delete" value="${cart.cartCode}">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul>
				<li id="priceAll">전체가격:</li>
				<li>구매하기</li>
			</ul>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>