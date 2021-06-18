<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "${contextPath}";
		$.get(contextPath + "/api/productMgt", function(json) {
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					sCont += "<tr>";
					sCont += "<td>" + json[i].productCode + "</td>";
					sCont += "<td>" + json[i].productName + "</a></td>";
					sCont += "<td>" + json[i].brand.brandName + "</td>";
					sCont += "<td>" + json[i].gender + "</td>";
					sCont += "<td>" + json[i].category.category + "</td>";
					sCont += "<td>" + json[i].costPrice + "</td>";
					sCont += "<td>" + json[i].sellPrice + "</td>";
					sCont += "<td>" + json[i].registDate + "</td>";
					sCont += "<td>" + json[i].cumulativeRegistCount + "</td>";
					sCont += "<td>" + json[i].cumulativeSellCount + "</td>";
					sCont += "<td><a href='read?productCode=" + json[i].productCode + "'>" + "[상세보기]" + "</a></td>";
					/* sCont += "<td>" + "<a href='#'>[수정]</a>&nbsp;" + "<a href='#'>[삭제]</a>" + "</td>"; */
					sCont += "</tr>";
				}
				$("#load:last-child").append(sCont);
			}
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
				<td colspan="7" class="td_title">상품 목록</td>
				<td><a href="${contextPath}/admin/product/productReg">[상품추가]</a></td>
				<td><a href="${contextPath}/admin/product/productPostReg">[상품판매글등록]</a></td>
			</tr>

			<tr style="background-color: lightgrey; text-align: center">
				<td>번호</td>
				<td>상품명</td>
				<td>브랜드</td>				
				<td>성별</td>
				<td>카테고리</td>
				<td>원가</td>
				<td>판매가격</td>
				<td>등록일</td>
				<td>등록수량</td>
				<td>판매량</td>
				<td>상세보기</td>
				<td>기타</td>

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