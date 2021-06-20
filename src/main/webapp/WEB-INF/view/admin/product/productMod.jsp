<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<jsp:include page="/WEB-INF/view/admin/include/adminMenu.jsp" />

		<div class="admin_content_wrap">
			<div class="admin_content_main">
				<form id="productModForm" method="post" autocomplete="off">
				
					<div class="form_section">
						<div class="form_section_title">
						</div>
						<div class="form_section_content">
							<input type="hidden" name="productCode" value="${products.productCode}">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>상품명</label>
						</div>
						<div class="form_section_content">
							<input name="productName" value="${products.productName}">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드</label>
						</div>
						<div class="form_section_content">
							<select name="brand" class="brand">
								<option selected="selected" value="${products.brand.brandCode}">${products.brand.brandName}</option>
							</select>
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>성별</label>
						</div>
						
						<div class="form_section_content">
							<select name="gender" class="gender">
								<option selected="selected" value="${products.gender}">${products.gender}</option>
							</select>
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>카테고리</label>
						</div>
						<div class="form_section_content">
							<select name="category" class="category">
								<option selected="selected" value="${products.category.productCategoryCode}">${products.category.category}</option>
							</select>
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>소재</label>
						</div>
						<div class="form_section_content">
							<input name="material" value="소재">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>계절</label>
						</div>
						<div class="form_section_content">
							<input name="season" value="계절">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>제조일</label>
						</div>
						<div class="form_section_content">
							<input type="date" name="madeDate">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>공급가격</label>
						</div>
						<div class="form_section_content">
							<input name="costPrice" value="50000">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>판매가격</label>
						</div>
						<div class="form_section_content">
							<input name="sellPrice" value="60000">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>등록일</label>
						</div>
						<div class="form_section_content">
							<input type="date" name="registDate">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>누적등록수량</label>
						</div>
						<div class="form_section_content">
							<input name="cumulativeRegistCount" value="1">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>누적판매수량</label>
						</div>
						<div class="form_section_content">
							<input name="cumulativeSellCount" value="1">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>등록사원정보</label>
						</div>
						<div class="form_section_content">
							<select name="employee" class="employee">
								<option selected="selected" value="">등록사원을 선택해주세요</option>
							</select>
						</div>
					</div>
					
					<div class="btn_section">
						<button type="submit" id="new">추가</button>
						<button id="cancel">취소</button>
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
		employeeSelect.append("<option value='" + employeeArr[i].empNumber + "'>" + employeeArr[i].empNumber + " : "
	      + employeeArr[i].empName + "</option>"); 
	}
	
	// 성별 박스에 데이터 삽입
	var genderSelect = $("select.gender")
	
	genderArr = new Array();
	genderArr[0] = "WOMEN";
	genderArr[1] = "MEN";
	genderArr[2] = "ALL";
	genderArr[3] = "KIDS";
	
	for(var i = 0; i < genderArr.length; i++) {
		if('${products.gender}'.toUpperCase() !=  genderArr[i]) {
		genderSelect.append("<option value='" + genderArr[i] + "'>" + genderArr[i] + "</option>");			
		}	
	}	
	
</script>

</body>
</html>