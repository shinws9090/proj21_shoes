<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<form:form action="productReg" modelAttribute="product">
			<!-- form 타이틀 -->
		<div id="title">
			<h1>제품등록</h1>
		</div>
		<!-- form -->		
		<div id="point">
		</div>
					<label><span class="red">* </span>상품코드</label>
					<form:input type="text" path="productCode" id="product_code" value='10'/>
					<br>
					
					<label><span class="red">* </span>상품명</label>
					<form:input type="text" path="productName" id="product_name" value='신발임'/>
					<br>					
					
					<label><span class="red">* </span>브랜드</label>
					<input type="text" name="brandCode" id="brandCode" value='2'/>
					<br>
					
					<label><span class="red">* </span>성별</label>
					<form:input type="text" path="gender" id="gender" value='남'/>
					<br>
					
					
 					<label><span class="red">* </span>카테고리</label>
 					<form:input type="text" path="category" id="category" value='1'/>				
					<br>
					
					<label><span class="red">* </span>소재</label>
					<form:input type="text" path="material" value='가죽'/>
					<br>
					
					<label><span class="red">* </span>계절</label>
					<form:input type="text" path="season" value='겨울'/>
					<br>
					
					<label><span class="red">* </span>제조일</label>
					<form:input type="text" path="madeDate" value='20210101'/>
					<br>
															
					<label><span class="red">* </span>공급가격 <span class="cnt">(1개당)</span></label>
					<form:input type="text" path="costPrice" value="440000"/>
					<br>
					
					<label><span class="red">* </span>판매가격 <span class="cnt">(1개당)</span></label>
					<form:input type="text" path="sellPrice" value="550000"/>
					<br>					
					
					<label><span class="red">* </span>등록일</label>
					<form:input type="text" path="registDate" value='20210101'/>
					<br>
					
					<label><span class="red">* </span>누적등록수량</label>
					<form:input type="text" path="cumulativeRegistCount" value="1"/>
					<br>
					
					<label><span class="red">* </span>누적판매수량</label>
					<form:input type="text" path="cumulativeSellCount" value="1"/>
					<br>
					
					<label><span class="red">* </span>등록사원정보</label>
					<form:input type="text" path="employee" class="text" value="1"/>
					<br>
					
			<%-- </form:form> --%>
			<%-- <form:form action="productReg" modelAttribute="regProductpost">	
					
					<label><span class="red">* </span>상품대표이미지</label>
					<form:input type="text" path="productMainImage" class="text" value="1"/>
					<br>
					
					<label><span class="red">* </span>상품이미지</label>
					<form:input type="text" path="images" class="text" value="1"/>
					<br>
					
					<label><span class="red">* </span>내용</label>
					<form:textarea id="content" path="content" cols="40" rows="15"/>
					<br>				 --%>
					
					
			<div id="add">
				<input type="submit" value="등록" id="btnReg" style="cursor: pointer">
				<input type="button" value="취소" id="btnReset" style="cursor: pointer">			
			</div>
		</form:form>



	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>