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
	}
	
	$('#cancel').on("click", function(e) {
		var productCode = getParameterByName("productCode");
		location.href="${contextPath}/admin/productDetailMgt?productCode=" + productCode;
	});
	
	var productCode = getParameterByName("productCode");
	$.get(contextPath + "/api/productMgt/"+productCode,
		function(json) {
			var sCont = "";
				sCont += "<tr>";
				sCont += "<td productCode='productCode'>" + json.productCode + "</td>";
				sCont += "<td>" + "<a href='${contextPath}/productDetail/" + json.productCode + "'/a>" + json.productName + "</td>";
				sCont += "<td>" + json.brand.brandName + "</td>";
				sCont += "<td>" + json.gender + "</td>";
				sCont += "<td>" + json.category.category + "</td>";
				sCont += "<td>" + "<a href='${contextPath}/productDetail/" + json.productCode + "'/a>" + "<img src='${contextPath}/images/" + json.productPost.productMainImage + "' width='200'/>" + "</td>";
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
<style>

.productMod {
    display: inline-block;
    padding-right: 5px;
}

.productImageMod {
    display: inline-block;
    padding-right: 5px;
}

.productModCancel {
    display: inline-block;
}


</style>
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
								<tbody id="load"/>
							</tr>
						</table>
					</div>
					
		        	<div class="productMod"><button><a href="${contextPath}/admin/product/productMod?productCode=${products.productCode}">상품 수정</a></button></div>
					<div class="productImageMod"><button><a href="${contextPath}/admin/product/productImageMod?productCode=${products.productCode}">이미지 수정</a></button></div>
					<div class="productModCancel"><button type="button" id="cancel">취소</button></div>
					
					<h1 class="mt-4">상품 이미지 수정</h1>
					<div class="admin_content_wrap">
						<div class="admin_content_main">
							<form id="productModForm" method="post" autocomplete="off" enctype="multipart/form-data">
								
								<div class="form_section">
									<div class="form_section_title">
									</div>
									<div class="form_section_content">
										<input type="hidden" name="productCode" value="${products.productCode}">
									</div>
								</div>
			
								<div class="form_section">
									<div class="form_section_title">
										<label>상품대표이미지</label>
									</div>
									<div class="form_section_content">
										<input type="file" id="productMainImage" name="productMainImage" />
										<div class="select_img"><img src="" /></div>
									</div>
								</div>
								
								<script>
									$("#productMainImage").change(function(){
										if(this.files && this.files[0]) {
											var reader = new FileReader;
											reader.onload = function(data) {
												$(".select_img img").attr("src", data.target.result).width(200);        
											}
											reader.readAsDataURL(this.files[0]);
										}
									});
								</script>
								
								<%-- <%=request.getRealPath("/") %> --%>
			
								<div class="form_section">
									<div class="form_section_title">
										<label>상품이미지들</label>
									</div>
									<div class="form_section_content">
										<input type="file" id="images" name="images" />
										<div class="select_imgs"><img src="" /></div>					
									</div>
								</div>					
								
								<script>
									$("#images").change(function(){
										if(this.files && this.files[0]) {
											var reader = new FileReader;
											reader.onload = function(data) {
												$(".select_imgs img").attr("src", data.target.result).width(200);        
											}
											reader.readAsDataURL(this.files[0]);
										}
									});
								</script>
			
								<div class="form_section">
									<div class="form_section_title">
										<label>수정일</label>
									</div>
									<div class="form_section_content">
										<c:set var="now" value="<%=LocalDateTime.now()%>" />
										<input type="date" name="registDate"
											value='<tf:formatDateTime value="${now}" pattern = "yyyy-MM-dd" />'
											readonly="readonly">
									</div>
								</div>
								
								<div class="form_section">
									<div class="form_section_title">
										<label>수정사원정보</label>
									</div>
									<div class="form_section_content">
										<select name="employee" class="employee">
											<option selected="selected" value="${products.employee.empNumber}">${products.employee.empNumber} : ${products.employee.empName}</option>
										</select>
									</div>
								</div>
								
								<div class="btn_section">
									<button type="submit" id="new">수정</button>
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

<script>
	//컨트롤러에서 브랜드 데이터 받기
	var jsonData = JSON.parse('${brandList}');
	console.log(jsonData);
	
	var brandArr = new Array();
	var brandObj = new Object();
	
	// 브랜드 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		brandObj = new Object();  //초기화
		brandObj.brandCode = jsonData[i].brandCode;
		brandObj.brandName = jsonData[i].brandName;
		brandArr.push(brandObj);	 
	}
	
	// 브랜드 셀렉트 박스에 데이터 삽입
	var brandSelect = $("select.brand")
	
	for(var i = 0; i < brandArr.length; i++) {
		if ('${products.brand.brandCode}' != brandArr[i].brandCode){			
			brandSelect.append("<option value='" + brandArr[i].brandCode + "'>"
		      + brandArr[i].brandName + "</option>"); 
		}		
	}

	
	// 컨트롤러에서 카테고리 데이터 받기
	var jsonData = JSON.parse('${categoryList}');
	console.log(jsonData);
	
	var categoryArr = new Array();
	var categoryObj = new Object();
	
	// 카테고리 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		categoryObj = new Object();  //초기화
		categoryObj.productCategoryCode = jsonData[i].productCategoryCode;
		categoryObj.category = jsonData[i].category;
		categoryArr.push(categoryObj);	 
	}
	
	// 카테고리 셀렉트 박스에 데이터 삽입
	var categorySelect = $("select.category")

	for(var i = 0; i < categoryArr.length; i++) {
		if('${products.category.productCategoryCode}' !=  categoryArr[i].productCategoryCode) {
			categorySelect.append("<option value='" + categoryArr[i].productCategoryCode + "'>"
		      + categoryArr[i].category + "</option>");
		}
	}
	
	// 컨트롤러에서 직원 데이터 받기
	var jsonData = JSON.parse('${employeeList}');
	console.log(jsonData);
	
	var employeeArr = new Array();
	var employeeObj = new Object();
	
	// 직원 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		employeeObj = new Object();  //초기화
		employeeObj.empNumber = jsonData[i].empNumber;
		employeeObj.empName = jsonData[i].empName;
		employeeArr.push(employeeObj);	 
	}
	
	// 직원 셀렉트 박스에 데이터 삽입
	var employeeSelect = $("select.employee")

	for(var i = 0; i < employeeArr.length; i++) {
		if ('${products.employee.empNumber}' != employeeArr[i].empNumber) {
		employeeSelect.append("<option value='" + employeeArr[i].empNumber + "'>" + employeeArr[i].empNumber + " : "
	      + employeeArr[i].empName + "</option>");
		}
		
	}
	
	// 성별 데이터 준비
	var genderSelect = $("select.gender")
	
	genderArr = new Array();
	genderArr[0] = "WOMEN";
	genderArr[1] = "MEN";
	genderArr[2] = "ALL";
	genderArr[3] = "KIDS";
	
	// 성별 데이터 박스에 삽입
	for(var i = 0; i < genderArr.length; i++) {
		if('${products.gender}'.toUpperCase() !=  genderArr[i]) {
		genderSelect.append("<option value='" + genderArr[i] + "'>" + genderArr[i] + "</option>");			
		}	
	}	
	
</script>

</body>
</html>