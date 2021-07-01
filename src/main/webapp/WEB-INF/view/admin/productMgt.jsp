<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script  type="text/javascript">

$(function(){
	$('#new').on("click", function(e) {
		location.href="${contextPath}/admin/product/productReg";
	});
	
	$('#searchBtn').click(function() {
		self.location = "productMgt" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
});

</script>
<style>

ul.pageNum {
    display: inline-block;
    margin-left: 350px;
}

ul.pageNum2 {
    display: inline-block;
    margin-left: 643px;
    margin-bottom: 100px;
}

.search {
    display: inline-block;
}

.btn_new {
    display: inline-block;
    margin-left: 650px;
}

</style>
</head>
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
					<h1 class="mt-4">상품 목록</h1>
					
					<div class="search">
						<select name="searchType">
							<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제품번호</option>
							<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>제품명</option>
							<option value="w"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>브랜드</option>
							<option value="q"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>카테고리</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>					    

					</div>
					
					<ul class="pageNum">
					    <c:if test="${pageMaker.prev}">
					      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					      <li id="page"><a href="productMgt${pageMaker.makeSearch(idx)}">[${idx}]</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
					    </c:if> 
					</ul>
					
					<div class="btn_new">
						<button type="button" id="new">상품등록</button>
					</div>
					
					<table style="width: 90%; text-align: center">
						<thead>									
							<tr style="background-color: lightgrey; text-align: center">
								<td>번호</td>
								<td>상품명</td>
								<td>브랜드</td>
								<td>카테고리</td>
								<td>대표이미지</td>
								<td>원가</td>
								<td>판매가격</td>
								<td>상세관리</td>
								<td>재고관리</td>				
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList}" var="productList">
							<tr>
								<td>${productList.productCode}</td>
								<td><a href="productDetailMgt?productCode=${productList.productCode}"><c:out value="${productList.productName}" /></a></td>
								<td>${productList.brand.brandName}</td>								
								<td>${productList.category.category}</td>
								<td><img src="${contextPath}/images/${productList.productPost.productMainImage}" width="200"></td>
								<td>${productList.costPrice}</td>
								<td>${productList.sellPrice}</td>
								<td><button type="button"><a href="productDetailMgt?productCode=${productList.productCode}">상세관리</a></button></td>
								<td><button type="button"><a href="product/productOrderOption?productCode=${productList.productCode}">재고관리</a></button></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div>
						<ul class="pageNum2">
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="productMgt${pageMaker.makeSearch(idx)}">[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if> 
						</ul>											
					</div>					
				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>