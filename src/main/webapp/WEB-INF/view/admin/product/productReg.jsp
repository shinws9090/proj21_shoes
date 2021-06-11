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
<script type="text/javascript">
	
		function productValidation() {
			var productCode = $("[name='productCode']").prop("value");
			if(productCode == "" || productCode == null){
				alert("제품 코드를 입력하세요.")
				return false;
				
			} else {
				$.ajax({				
					url : "/proj21_shoes/productReg",
					type:'POST',
					data : $('#productRegForm').serialize(),
												
						/* {
							productCode : productCode,
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
							employee : $("[name='employee']").prop("value")
							}, */
					
					success:function(data){
						console.log(data);
						alert("제품 등록이 완료되었습니다.");
						location.href= "<c:url value='/productMgt'/>";
					},error:function( e ){
						alert("제품 등록이 실패하였습니다.");
						console.log( e );
					}
					
				})
			}		
			
		}
	
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
				<form id="productRegForm">

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
							<input name="category" value="1">
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
							<input name="employee" value="1">
						</div>
					</div>
					
					
					<div class="form_section">
						<div class="form_section_title">
							<label>상품대표이미지</label>
						</div>
						<div class="form_section_content">
							<input name="productMainImage">
						</div>
					</div>
					
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
						<input type="button" value="등록" onclick="productValidation()" style="cursor: pointer" />
						<input type="button" value="취소" onclick="javascript:location.href='/proj21_shoes/productMgt'" style="cursor: pointer" />
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