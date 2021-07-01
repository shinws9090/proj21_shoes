<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	var contextPath = "<%=request.getContextPath()%>";
	
	$('#cancel').on("click", function(e) {
		location.href="${contextPath}/admin/productMgt";
	});
		
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};
	
	var productCode = getParameterByName("productCode");
	$.get(contextPath + "/api/productMgt/"+productCode,
		function(jsonP) {
			var sCont = "";
				sCont += "<tr>";
				sCont += "<td productCode='productCode'>" + jsonP.productCode + "</td>";
				sCont += "<td>" + "<a href='${contextPath}/productDetail/" + jsonP.productCode + "'/a>" + jsonP.productName + "</td>";
				sCont += "<td>" + jsonP.brand.brandName + "</td>";
				sCont += "<td>" + jsonP.gender + "</td>";
				sCont += "<td>" + jsonP.category.category + "</td>";
				sCont += "<td>" + "<a href='${contextPath}/productDetail/" + jsonP.productCode + "'/a>" + "<img src='${contextPath}/images/" + jsonP.productPost.productMainImage + "' width='200'/>" + "</td>";
				sCont += "<td>" + jsonP.costPrice + "</td>";
				sCont += "<td>" + jsonP.sellPrice + "</td>";
				sCont += "<td>" + jsonP.registDate + "</td>";
				sCont += "<td>" + jsonP.cumulativeRegistCount + "</td>";
				sCont += "<td>" + jsonP.cumulativeSellCount + "</td>";
				sCont += "</tr>";
			$("#load1:last-child").append(sCont);
		});
	
	$.get(contextPath + "/api/orderOption/"+productCode,
		function(jsonO) {
			for(var i = 0; i < jsonO.length; i++){
				var sCont = "";
					sCont += "<tr>";
					sCont += "<td productCode='productCode'>" + jsonO[i].productCode + "</td>";
					sCont += "<td>" + jsonO[i].styleCode + "</td>";
					sCont += "<td>" + jsonO[i].color + "</td>";										
					sCont += "<td>" + jsonO[i].size + "</td>";
					sCont += "<td>" + jsonO[i].stock + "</td>";
					sCont += "<td>" + "<button type='button'><a href='${contextPath}/admin/product/productOrderOptionMod?productCode=" + jsonO[i].productCode + '&styleCode=' + jsonO[i].styleCode + '&color=' + jsonO[i].color + '&size='+ jsonO[i].size + '&nowStock='+ jsonO[i].stock + "'>재고수정</a></button>" + "</td>";
					sCont += "</tr>";
				$("#load2:last-child").append(sCont);
			}
			
			var lastData = jsonO.length - 1;
			document.getElementById("styleCode").value = jsonO[lastData].styleCode;
			document.getElementById("color").value = jsonO[lastData].color;
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
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />
		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
					<h1 class="mt-4">상품 정보</h1>
					<div>
						<table style="width: 90%; text-align: center">
	
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
								<tbody id="load1"/>
							</tr>
						</table>
					</div>
					
					<h1 class="mt-4">재고 목록</h1>
					<div>
						<table style="width: 90%; text-align: center">
	
							<tr style="background-color: lightgrey; text-align: center">
								<td>번호</td>
								<td>스타일코드</td>
								<td>색상</td>
								<td>사이즈</td>
								<td>현재재고</td>
								<td>재고수정</td>
							</tr>
							
							<tr>
								<tbody id="load2"/>
							</tr>						
						</table>
					</div>
		
					<h1 class="mt-4">재고 등록</h1>
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
										<label>재고수량</label>
									</div>
									<div class="form_section_content">
										<input name="stock" value="">
									</div>
								</div>
											
								<div class="btn_section">
									<button type="submit" id= "new">등록</button>
									<button type="button" id="cancel">취소</button>
								</div>
			
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>