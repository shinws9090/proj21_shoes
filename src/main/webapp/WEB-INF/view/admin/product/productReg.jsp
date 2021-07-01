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
			location.href="${contextPath}/admin/productMgt"
		});
		
		/* $('#new').on("click", function(e) {
			document.getElementById("productRegForm").submit();
		}); */
});
</script>
</head>
<style>

.mt-4 {
    padding-left: 600px;
    padding-bottom: 30px;
}

.from_RegSection1 {
    display: inline-block;
    padding-left: 400px;
    padding-bottom: 100px;
    position: absolute;
}

.from_RegSection2 {
    display: table;
    padding-left: 180px;
    padding-bottom: 100px;
    margin: 0 auto;
}

</style>
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
					<h1 class="mt-4">상품 등록</h1>
					<div class="admin_content_wrap">
						<div class="admin_content_main">
							<form id="productRegForm" method="post" autocomplete="off" enctype="multipart/form-data">
								<div class="from_RegSection1">
									<div class="form_section">
										<div class="form_section_title">
											<label>상품코드</label>
										</div>
										<div class="form_section_content">
											<input name="productCode" value="">
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>상품명</label>
										</div>
										<div class="form_section_content">
											<input name="productName" value="">
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>브랜드</label>
										</div>
										<div class="form_section_content">
											<select name="brand" class="brand">
												<option selected="selected" value="">브랜드를 선택해주세요</option>
											</select>
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>성별</label>
										</div>
										<div class="form_section_content">
											<select name="gender" class="form_select_option">
												<option selected="selected" value="">옵션을 선택해주세요</option>
												<option value="WOMEN">WOMEN</option>						
												<option value="MEN">MEN</option>						
												<option value="ALL">ALL</option>
												<option value="KIDS">KIDS</option>
											</select>
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>카테고리</label>
										</div>
										<div class="form_section_content">
											<select name="category" class="category">
												<option selected="selected" value="">카테고리를 선택해주세요</option>
											</select>
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>소재</label>
										</div>
										<div class="form_section_content">
											<input name="material" value="">
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>계절</label>
										</div>
										<div class="form_section_content">
											<input name="season" value="">
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
											<input name="costPrice" value="">
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>판매가격</label>
										</div>
										<div class="form_section_content">
											<input name="sellPrice" value="">
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>등록일</label>
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
											<label>누적등록수량</label>
										</div>
										<div class="form_section_content">
											<input name="cumulativeRegistCount" value="0">
										</div>
									</div>
				
									<div class="form_section">
										<div class="form_section_title">
											<label>누적판매수량</label>
										</div>
										<div class="form_section_content">
											<input name="cumulativeSellCount" value="0">
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
									
								</div>	
																
								<div class="from_RegSection2">
									<div class="form_section">
										<div class="form_section_title">
											<label>내용</label>
										</div>
										<div class="form_section_content">
											<textarea rows="5" cols="50"  name="content"></textarea>
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
									
									<div class="btn_section">
										<button type="submit" id="new">추가</button>
										<button type="button" id="cancel">취소</button>
									</div>
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