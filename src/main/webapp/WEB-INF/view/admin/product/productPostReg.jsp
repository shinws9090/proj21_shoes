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

		<div class="admin_content_wrap">
			<div class="admin_content_main">
				<form id="productPostRegForm" method="post" autocomplete="off" enctype="multipart/form-data">

					<div class="form_section">
						<div class="form_section_title">
							<label>상품코드</label>
						</div>
						<div class="form_section_content">
							<select name="productCode" class="productCode">
								<option selected="selected" value="">판매상품을 선택해주세요</option>
							</select>
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
							<label>내용</label>
						</div>
						<div class="form_section_content">
							<textarea rows="5" cols="50"  name="content"></textarea>
						</div>
					</div>

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
					
					<div class="btn_section">
						<button type="submit" id="new">추가</button>
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
	//컨트롤러에서 상품 데이터 받기
	var jsonData = JSON.parse('${productList}');
	console.log(jsonData);
	
	var productArr = new Array();
	var productObj = new Object();
	
	// 상품 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		productObj = new Object();  //초기화
		productObj.productCode = jsonData[i].productCode;
		productObj.productName = jsonData[i].productName;
		productArr.push(productObj);	 
	}
	
	// 상품 셀렉트 박스에 데이터 삽입
	var productSelect = $("select.productCode")

	for(var i = 0; i < productArr.length; i++) {
		productSelect.append("<option value='" + productArr[i].productCode + "'>" + productArr[i].productCode + " : " 
	      + productArr[i].productName + "</option>");
		
	}
</script>

</body>
</html>