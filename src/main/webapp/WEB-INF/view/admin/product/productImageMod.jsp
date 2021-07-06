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

<!-- include summernote css/js-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/admin/js/summernote-ko-KR.js"></script>

<script type="text/javascript">

function summit(){
	var summitForm = document.productImageForm;
	summitForm.submit();
	opener.location.reload();
	
}

$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: 'content',
		minHeight: 400,
		maxHeight: null,
		focus: true, 
		lang : 'ko-KR'
	});
});

opener.location.reload();

</script>
</head>
<style>

h3.mt-4 {
    display: inline-block;
}

.btn_section {
    display: inline-block;
}

.from_RegSection1 {
    display: inline-block;
    vertical-align: top;
    margin-right: 50px;
}

.from_RegSection2 {
    display: inline-block;
    vertical-align: top;
    margin-right: 50px;
}

.from_RegSection3 {
	display: inline-block;
	vertical-align: top;
	margin-right: 50px;
}

.from_RegSection4 {
	display: inline-block;
	vertical-align: top;
	margin-right: 50px;
}

.pageContent-wrapper {
	margin-left: 50px;
}

</style>
<body>
	<section>
	    <div class="pageContent-wrapper">		        
			<!-- Page content-->
			<h3 class="mt-4" id="productInfo" style="cursor:pointer"><a href="${contextPath}/admin/product/productMod?productCode=${products.productCode}">[상품정보]</a></h3>
			<h3 class="mt-4" id="productImage" style="cursor:pointer"><a href="${contextPath}/admin/product/productImageMod?productCode=${products.productCode}">[상품이미지]</a></h3>
			<div class="btn_section">
				<input type="button" id="productImage_btn" onclick="summit()" value="변경">
			</div>			
				<form id="productImageForm" name="productImageForm" method="post" autocomplete="off" enctype="multipart/form-data">								
					<div class="from_RegSection2" id="from_RegSection2">
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
										$(".select_img img").attr("src", data.target.result).width(400);        
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
						</script>						
						<%-- <%=request.getRealPath("/") %> --%>						
					</div>
					
					<div class="from_RegSection3" id="from_RegSection3">
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
										$(".select_imgs img").attr("src", data.target.result).width(400);        
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
						</script>
					</div>
				</form>
		</div>
		
	</section>

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
		brandSelect.append("<option value='" + brandArr[i].brandCode + "'>"
	      + brandArr[i].brandName + "</option>"); 
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
		categorySelect.append("<option value='" + categoryArr[i].productCategoryCode + "'>"
	      + categoryArr[i].category + "</option>"); 
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
</script>

</body>
</html>