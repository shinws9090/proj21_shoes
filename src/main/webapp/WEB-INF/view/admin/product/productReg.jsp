<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<jsp:include page="/WEB-INF/view/admin/include/adminMenu.jsp" />
		<form name="productFrm" action="product_process.jsp?flag=insert" enctype="multipart/form-data" method="post">
			<!-- form 타이틀 -->
		<div id="title">
			<h1>제품등록</h1>
		</div>
		<!-- form -->		
		<div id="point">
		</div>
			<div id="regForm">
				<div id="form">
					<label><span class="red">* </span>상품코드</label>
					<input type="text" name="productCode" class="text">
					<br>
					
					<label><span class="red">* </span>상품명</label>
					<input type="text" name="productName" class="text" placeholder=" >> 중복확인" value="상품명을 입력하세요." id="productName">
					<input type="button" value="중복확인" id="btnProductName">
					<br>					
					
					<label><span class="red">* </span>브랜드</label>
					<input type="text" name="brandCode" class="text" placeholder=" >> 브랜드 조회" value="브랜드명을  입력하세요." id="brandName">
					<input type="button" value="조 회" id="btnBrandName">
					<br>
					
					<label><span class="red">* </span>성별</label>
					<input type="text" name="gender" class="text">
					<br>
					
					
 					<label><span class="red">* </span>카테고리</label>
 					<input type="hidden" name="category" value="1">
					<select name="pcategory" class="text" id="pcategory">
						<option selected>선택해주세요</option>
						<option value=1>운동화</option>
						<option value=2>구두</option>
						<option value=3>슬리퍼</option>
						<option value=4>힐</option>
					</select>
					<br>
					
					<label><span class="red">* </span>소재</label>
					<input type="text" name="material" class="text">
					<br>
					
					<label><span class="red">* </span>계절</label>
					<input type="text" name="season" class="text">
					<br>
					
					<label><span class="red">* </span>제조일</label>
					<input type="date" name="madeDate" class="text" value='2021-01-01'>
					<br>
															
					<label><span class="red">* </span>공급가격 <span class="cnt">(1개당)</span></label>
					<input type="text" name="costPrice" class="text" value="440000">
					<br>
					
					<label><span class="red">* </span>판매가격 <span class="cnt">(1개당)</span></label>
					<input type="text" name="sellPrice" class="text" value="550000">
					<br>					
					
					<label><span class="red">* </span>등록일</label>
					<input type="date" name="registDate" class="text" value='2021-01-01'>
					<br>
					
					<label><span class="red">* </span>누적등록수량</label>
					<input type="text" name="cumulativeRegistCount" class="text" value="0">
					<br>
					
					<label><span class="red">* </span>누적판매수량</label>
					<input type="text" name="cumulativeSellCount" class="text" value="0">
					<br>
					
					<label><span class="red">* </span>등록사원정보</label>
					<input type="text" name="employee" class="text" value="0">
					<br>					
					
					<input type="file" name="pPic" value="" >
					<br>
					
				</div>
			</div>
			<div id="add">
				<input type="submit" value="등록" id="btnReg" style="cursor: pointer">
				<input type="button" value="취소" id="btnReset" style="cursor: pointer">			
			</div>
		</form>



	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>