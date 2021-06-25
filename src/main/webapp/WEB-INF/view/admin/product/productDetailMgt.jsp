<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "<%= request.getContextPath()%>";
		
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		var productCode = getParameterByName("productCode")
		
		$('#orderOption_btn').on("click", function(e) {
			location.href="${contextPath}/admin/product/productOrderOption?productCode=" + productCode;
		});
		
		$('#modify_btn').on("click", function(e) {
			location.href="${contextPath}/admin/product/productMod?productCode="+ productCode;
		});
		
		$('#delete_btn').on("click", function(e) {
			if(!confirm("정말 삭제하시겠습니까?")) {
			} else {
				location.href="${contextPath}/admin/product/productDel?productCode=" + productCode;
			}
		});
		
		$('#cancel').on("click", function(e) {
			location.href="${contextPath}/admin/productMgt";
		});
		
		var productCode = ${productCode};
		$.get(contextPath + "/api/productMgt/"+productCode,
			function(json) {
				var sCont = "";
					sCont += "<tr>";
					sCont += "<td productCode='productCode'>" + json.productCode + "</td>";
					sCont += "<td>" + json.productName + "</td>";
					sCont += "<td>" + json.brand.brandName + "</td>";
					sCont += "<td>" + json.gender + "</td>";
					sCont += "<td>" + json.category.category + "</td>";
					sCont += "<td>" + json.productPost.productMainImage + "</td>";					
					sCont += "<td>" + json.costPrice + "</td>";
					sCont += "<td>" + json.sellPrice + "</td>";
					sCont += "<td>" + json.registDate + "</td>";
					sCont += "<td>" + json.cumulativeRegistCount + "</td>";
					sCont += "<td>" + json.cumulativeSellCount + "</td>";
					sCont += "</tr>";
				$("#load:last-child").append(sCont);
		});
	});
</script>

</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<jsp:include page="/WEB-INF/view/admin/include/adminMenu.jsp" />
		<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		<table style="width: 80%">
			<tr>
				<td colspan="7" class="td_title"><h2>상품 정보</h2></td>
			</tr>

			<tr style="background-color: lightgrey; text-align: center">
				<td>번호</td>
				<td>상품명</td>
				<td>브랜드</td>
				<td>성별</td>
				<td>카테고리</td>
				<td>대표이미지</td>
				<td>원가</td>
				<td>판매가격</td>
				<td>등록일</td>
				<td>등록수량</td>
				<td>판매량</td>
			</tr>
			<tr>
				<tbody id="load"/>				
			</tr>
		</table>
		
		<div class="btn_section">
			<button type="button" id="orderOption_btn">재고관리</button>
			<button type="button" id="modify_btn">수정</button>
			<button type="button" id="delete_btn">삭제</button>
			<button type="button" id="cancel">돌아가기</button>
		</div>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>