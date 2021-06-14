<%@page import="proj21_shoes.dto.Order"%>
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
	/*전채가격 설정*/
	function priceAll() {
		var priceAll = 0;
		$(".price").each(function() {
			priceAll += Number($(this).text());
		});
		$("#priceAll").text("결재가격:" + priceAll);
	}
	priceAll();
});
</script>
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
		<%-- ${productList} --%>
			<table>
				<thead>
				<tr>
					<th>상품코드 </th>
					<th>스타일코드 </th>
					<th>대표이미지 </th>
					<th>상품명 </th>
					<th>가격 </th>
					<th>수량 </th>
					<th>색상 </th>
					<th>사이즈 </th>
				</tr>
				</thead>
				<tbody>	
					<c:forEach var="orderProduct" items="${order.orderProduct}">
					<tr>
						<td>${orderProduct.orderOption.productCode} </td>
						<td>${orderProduct.orderOption.styleCode} </td>
						<c:forEach var="p" items="${productList}">
							<c:if test="${orderProduct.orderOption.productCode == p.productCode}">
								<td>${p.productPost.productMainImage} </td>
								<td>${p.productName} </td>
								<td class="price" data-sellprice="${p.sellPrice}">
									${p.sellPrice*orderProduct.orderCount}</td>
							</c:if>
						</c:forEach>
						<td>
							${orderProduct.orderCount} 
						</td>
						<td>${orderProduct.orderOption.color}</td>
						<td>${orderProduct.orderOption.size} </td>
					</tr>	
					</c:forEach>
				</tbody>
			</table>
			
			<ul>
				<li id="priceAll"></li>
			</ul>
			
			<table>
				<tr> 
					<td>배송지선택</td>
					<td> 
					<label><input type="radio" name="address-option" value="member">회원정보와 동일</label>
					<label><input type="radio" name="address-option" value="new">새로운 배송지</label>
					</td>
				</tr>
			</table>
	</section>
		
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>