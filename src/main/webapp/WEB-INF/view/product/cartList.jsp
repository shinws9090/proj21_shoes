<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>lighten</title>
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<link rel="stylesheet" href="${contextPath}/css/style.css">
<link rel="stylesheet" href="${contextPath}/css/cartList.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}"
	/*전채가격 설정*/
	function priceAll() {
		var priceAll = 0;
		$(".check:checked").parent().parent().children(".price").each(function() {
			priceAll += Number($(this).text().trim().replace(",","").replace(",",""));
		});
		$("#priceAll").text("전체가격:" + priceAll);
	}
	priceAll();
	
	
	$("#allCheck").click(function(){
		if($("#allCheck").prop("checked")){
			$(".check").prop("checked", true);
		}else{
			$(".check").prop("checked", false);
		}
		priceAll();
	});
	
	$(".check").click(function(){
		priceAll();
	});
	
	
	/* 수량 up,down DB연동 */
	function countDB(url , cartCode){
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
	
	/* 수량 down */
	$(".countDown").click(function(){
		var cartCode = $(this).val();
		var count = $(this).next().text();
		if(count <=0){
			return
		}
		var res = countDB("countDown" ,cartCode)
		$(this).next().text(res);
		var price = res * $(this).parent().parent().children(".price").data("sellprice");
		$(this).parent().parent().children(".price").text(price);
		priceAll()
	});
	/* 수량 up */
	$(".countUp").click(function(){
		var cartCode = $(this).val();
		var count = $(this).prev().text();
		if(count >= $(this).next().val()){
			return
		}
		var res = countDB("countUp" ,cartCode);
		$(this).prev().text(res);
		var price = res * $(this).parent().parent().children(".price").data("sellprice");
		$(this).parent().parent().children(".price").text(price);
		priceAll()
	});
	
	
	
	/* 카트물품 삭제 */
	function cartDelete(cartCode){
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
	}
	
	/* 개별삭제 */
	$(".delete").click(function(){
		$(this).parent().parent().addClass("del")
		var cartCode = $(this).val();
		cartDelete(cartCode)
		$(this).parent().parent().removeClass("del");
		priceAll();
	});
	/* 선택물품 삭제 */
	$("#checkBoxDelete").click(function(){
		$(".check:checked").parent().parent().children().children(".delete")
		.each(function() {
			$(this).parent().parent().addClass("del")
			cartDelete($(this).val());
			$(this).parent().parent().removeClass("del");
		});
		$("#allCheck").prop("checked", false);
		priceAll();
	});
	/* 카트 구매하기 */
	$("#order").click(function(){
		var codeArr = [];
		$(".check:checked").each(function(){
			codeArr.push($(this).val());
		});
		$("#data").val(codeArr);
		$("#target").submit();
	});
	

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
					<th><input type="checkbox" id ="allCheck" name="allCheck"/></th>
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
					${cart } <br>
					<tr>
						<td>
        					<input type="checkbox" class="check" value="${cart.cartCode}"/>
        				</td>
						<c:forEach var="p" items="${productList}">
							${p.productCode} <br>
							<c:if test="${cart.productCode == p.productCode}">
							
							${p} <br>
								<td>${p.productCode} </td>
								<td>${p.productName} </td>
								<td><img src="${contextPath}/images/${p.productPost.productMainImage}"> </td>
								<td class="price" data-sellprice="${p.sellPrice}">
								<fmt:formatNumber value="${p.sellPrice*cart.count}"/></td>
								
								<c:forEach var="o" items="${p.orderOptions}">
									<c:if test="${cart.styleCode==o.styleCode && cart.size==o.size}">
										<td>${o.color}</td>
									</c:if>
									<c:if test="${cart.size==o.size}">
										<c:set var="stock" value="${o.stock}"/>
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
							<input type="hidden" value="${stock}">
						</td>
						<td>
							<button class="delete" value="${cart.cartCode}"><i class="fa fa-times" aria-hidden="true"></i></button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul>
				<li id="priceAll">전체가격:</li>
				<li><button id="order" class="btn btn-outline-secondary btn-xs">구매하기</button></li>
				<li><button id="checkBoxDelete" class="btn btn-outline-danger btn-xs">선택삭제</button></li>
			</ul>
			<form action="orderList" id="target" method="post">
				<input type="hidden" id="data" name="codeList">
			</form>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>