<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
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
<script type="text/javascript">
$(function(){
	var contextPath = "<%=request.getContextPath()%>";
		$('#cancel').on("click", function(e) {
			window.location.href = contextPath + "/productMgt";
		});
		
		$('#new').on( "click", function(e) {
			var newProduct = {
					productCode : $("[name='productCode']").prop("value"),
					productName : $("[name='productName']").prop("value"),
					brand : $("[name='brand']").prop("value"),
					gender : $("[name='gender']").prop("value"),
					category : $("[name='category']").prop("value"),
					material : $("[name='material']").prop("value"),
					season : $("[name='season']").prop("value"),
					madeDate : $("[name='madeDate']").prop("value"),
					costPrice : $("[name='costPrice']").prop("value"),
					sellPrice : $("[name='sellPrice']").prop("value"),
					registDate : $("[name='registDate']").prop("value"),
					cumulativeRegistCount : $("[name='cumulativeRegistCount']").prop("value"),
					cumulativeSellCount : $("[name='cumulativeSellCount']").prop("value"),
					employee : $("[name='employee']").prop("value"),					
					productMainImage : $("[name='productMainImage']")[0],
					content : $("[name='content']").prop("value"),
					images : $("[name='images']").prop("value")
			};
			
			var productCode = $("[name='productCode']").prop("value");
			if(productCode == "" || productCode == null){
				alert("제품 코드를 입력하세요.")
				return false;
				
			} else {			
				alert("data > " + newProduct.productName);
				$.ajax({
					url : contextPath + "/productReg",
					type : "POST",
					processData : false,
			        contentType : false,
			        cache : false,
			        enctype : "multipart/form-data",
					data : JSON.stringify(newProduct),
					success : function(res) {
						alert(res);
						window.location.href = contextPath + "/productMgt";
					},
					error : function(request, status, error) {
						alert("에러" + "code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
						window.location.href = contextPath + "/productMgt";
					}
				});
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

		<div class="admin_content_wrap">
			<div class="admin_content_main">
				<form id="productRegForm" enctype="multipart/form-data">

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
							<input name="productName" value="신발">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드</label>
						</div>
						<div class="form_section_content">
							<input name="brand" value="1">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>성별</label>
						</div>
						<div class="form_section_content">
							<input name="gender" value="남">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>카테고리</label>
						</div>
						<div class="form_section_content">
							<input name="category" value="111">
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
							<input name="employee" value="303" />
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
							<input name="content" value="내용">
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>상품이미지들</label>
						</div>
						<div class="form_section_content">
							<input name="images">
						</div>
					</div>

				</form>

				<div class="btn_section">
					<button id="new">추가</button>
					<button id="cancel">취소</button>
				</div>

			</div>
		</div>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>

</body>
</html>