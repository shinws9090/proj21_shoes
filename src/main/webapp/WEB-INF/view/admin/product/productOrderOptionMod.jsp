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
				
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};
	
	var productCode = getParameterByName("productCode");
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
	
 	var styleCode = getParameterByName("styleCode");
	var color = getParameterByName("color");
	var size = getParameterByName("size");
	var nowStock = getParameterByName("nowStock");
	
	document.getElementById("styleCode").value = styleCode;
	document.getElementById("color").value = color;
	document.getElementById("size").value = size;
	document.getElementById("nowStock").value = nowStock;
	
	$("#sel_productCode").text(productCode);
	$("#sel_styleCode").text(styleCode);
	$("#sel_color").text(color);
	$("#sel_size").text(size);
	$("#sel_stock").text(nowStock);
	
	$('#cancel').on("click", function(e) {
		location.href="${contextPath}/admin/product/productOrderOption?productCode=" + productCode
	});
	
	$('#delete_btn').on("click", function(e) {
		if(!confirm("정말 삭제하시겠습니까?")) {
		} else {			
			location.href="${contextPath}/admin/product/productOrderOptionDel?productCode=" + productCode + "&styleCode=" + styleCode + "&color=" + color + "&size=" + size;
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
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />
		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
		            <div>
						<table style="width: 90%; text-align: center">
							<tr>
								<td colspan="7" class="td_title"><h1 class="mt-4">상품 정보</h1></td>
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
							
							<tbody id="load"/>
						
						</table>
					</div>
					<div>
						<table style="width:100%">
							<tr>
								<td colspan="7" class="td_title"><h1 class="mt-4">재고 목록</h1></td>
							</tr>
	
							<tr style="background-color: lightgrey; text-align: center">
								<td>번호</td>
								<td>스타일코드</td>
								<td>색상</td>
								<td>사이즈</td>
								<td>현재재고</td>
							</tr>
														
							<tbody>
								<tr> 
									<td id="sel_productCode"></td>
									<td id="sel_styleCode"></td>
									<td id="sel_color"></td>
									<td id="sel_size"></td>
									<td id="sel_stock"></td>
								</tr>
							</tbody>
											
						</table>
					</div>
		
		
					<h1 class="mt-4">재고 수정</h1>					
					<div class="admin_content_wrap">
						<div class="admin_content_main">
							<form id="productOrderOptionForm" method="post" autocomplete="off">
			
								<div class="form_section" hidden="true">
									<div class="form_section_title">
										<label>상품코드</label>
									</div>
									<div class="form_section_content">
										<input name="productCode" id="productCode" value="${products.productCode}" readonly>
									</div>
								</div>
								
								<div class="form_section">
									<div class="form_section_title">
										<label>스타일코드</label>
									</div >
									<div class="form_section_content">
										<input name="styleCode" id="styleCode" value="" readonly>
									</div>
								</div>					
								
								<div class="form_section">
									<div class="form_section_title">
										<label>색상</label>
									</div>
									<div class="form_section_content">
										<input name="color" id="color" value="" readonly>
									</div>
								</div>
								
								<div class="form_section">
									<div class="form_section_title">
										<label>사이즈</label>
									</div>
									<div class="form_section_content">
										<input name="size" id="size" value="" readonly>
									</div>
								</div>
								
								<div class="form_section">
									<div class="form_section_title">
										<label>현재재고</label>
									</div>
									<div class="form_section_content">
										<input name="nowStock" id="nowStock" value="" readonly>
									</div>
								</div>
								
								<div class="form_section">
									<div class="form_section_title">
										<label>변경재고</label>
									</div>
									<div class="form_section_content">
										<input name="stock" id="stock" value="">
									</div>
								</div>
											
								<div class="btn_section">
									<button type="submit" id= "new">수정</button>
									<button type="button" id="cancel">취소</button>
									<button type="button" id= "delete_btn">재고삭제</button>
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