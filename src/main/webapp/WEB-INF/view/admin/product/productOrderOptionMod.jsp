<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
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
$(function(){
	var contextPath = "<%=request.getContextPath()%>";
		$('#cancel').on("click", function(e) {
			history.back();
		});
		
	var contextPath = "<%= request.getContextPath()%>";
	
	var jsonData = JSON.parse('${orderOptionListByProductCode}');
	var productCode = jsonData[0].productCode
	for(var i = 0; i < jsonData.length; i++) {		
		var sCont = "";
			sCont += "<tr>";
			sCont += "<td>" + jsonData[i].productCode + "</td>";
			sCont += "<td>" + jsonData[i].styleCode + "</td>";
			sCont += "<td>" + jsonData[i].color + "</td>";										
			sCont += "<td>" + jsonData[i].size + "</td>";
			sCont += "<td>" + jsonData[i].stock + "</td>";
			sCont += "<td>" + jsonData[i].stock + "</td>";
			sCont += "</tr>";
		$("#load:last-child").append(sCont); 
	}
	
	var lastData = jsonData.length - 1;
	document.getElementById("styleCode").value = jsonData[lastData].styleCode;
	document.getElementById("color").value = jsonData[lastData].color;
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
				<td colspan="7" class="td_title"><h2>상품 재고 목록</h2></td>
			</tr>

			<tr style="background-color: lightgrey; text-align: center">
				<td>번호</td>
				<td>스타일코드</td>
				<td>색상</td>
				<td>사이즈</td>
				<td>재고</td>
			</tr>
			<tr>
				<tbody id="load"/>
			</tr>
		</table>
		
		<h2>재고 추가</h2>
		<div class="admin_content_wrap">
			<div class="admin_content_main">
				<form id="productOrderOptionForm" method="post" autocomplete="off">

					<div class="form_section" hidden="true">
						<div class="form_section_title">
							<label>상품코드</label>
						</div>
						<div class="form_section_content">
							<input name="productCode" id="productCode" value="${products.productCode}">
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>스타일코드</label>
						</div >
						<div class="form_section_content">
							<input name="styleCode" id="styleCode" value="">
						</div>
					</div>					
					
					<div class="form_section">
						<div class="form_section_title">
							<label>색상</label>
						</div>
						<div class="form_section_content">
							<input name="color" id="color" value="">
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>사이즈</label>
						</div>
						<div class="form_section_content">
							<input name="size" value="">
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>재고</label>
						</div>
						<div class="form_section_content">
							<input name="stock" value="">
						</div>
					</div>
								
					<div class="btn_section">
						<button type="submit" id= "new">추가</button>
						<button type="button" id="cancel">취소</button>
					</div>

				</form>
			</div>
		</div>

	</section>
	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>