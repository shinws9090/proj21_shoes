<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
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
				<form action="productReg" method="post" id="productRegForm">
					
					<div class="form_section">
						<div class="form_section_title">
							<label>상품코드</label>
						</div>
						<div class="form_section_content">
							<input name="productCode" value="21">
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
							<input name="madeDate" value="20210101">
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
							<input name="registDate" value="20210101">
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
					
					<!-- <div class="form_section">
						<div class="form_section_title">
							<label>등록사원정보</label>
						</div>
						<div class="form_section_content">
							<input name="employee" value="1">
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
							<label>등록사원정보</label>
						</div>
						<div class="form_section_content">
							<input name="employee" value="1">
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>등록사원정보</label>
						</div>
						<div class="form_section_content">
							<input name="employee" value="1">
						</div>
					</div> -->
					
				</form>
			</div>
		</div>
		<div class="btn_section">
			<button id="btnReg" class="btnReg_btn" style="cursor: pointer">등록</button>
			<button id="btnReset" class="btnReset_btn" style="cursor: pointer">취소</button>
		</div>
			
			<script>
				/* 등록 버튼 */
				$("#btnReg").click(function() {
					$("#productRegForm").submit();
				});
			
				/* 취소 버튼 */
				$("#btnReset").click(function() {
					location.href = "/proj21_shoes/productMgt"
				});
			</script>



	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>



</body>
</html>