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
		<div><a href="${contextPath}/admin/product/productMod?productCode=${products.productCode}">[상품 수정]</a></div>
		<div><a href="${contextPath}/admin/product/productImageMod?productCode=${products.productCode}">[이미지 수정]</a></div>
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
									$(".select_img img").attr("src", data.target.result).width(500);        
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script>
					
					<%=request.getRealPath("/") %>

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
									$(".select_imgs img").attr("src", data.target.result).width(500);        
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