<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "<%= request.getContextPath()%>";
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
					sCont += "<td>" + json.productMainImage + "</td>";					
					sCont += "<td>" + json.costPrice + "</td>";
					sCont += "<td>" + json.sellPrice + "</td>";
					sCont += "<td>" + json.registDate + "</td>";
					sCont += "<td>" + json.cumulativeRegistCount + "</td>";
					sCont += "<td>" + json.cumulativeSellCount + "</td>";
					sCont += "<td>" + "<a href='#'>[수정]</a>" + "</td>";
					sCont += "<td>" + "<a href='#'>[삭제]</a>" + "</td>";
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
		<table style="width: 80%">
			<tr>
				<td colspan="7" class="td_title">상품 목록</td>
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
				<td>수정</td>
				<td>삭제</td>

			</tr>
			<tr>
				<tbody id="load"/>				
			</tr>
		</table>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>