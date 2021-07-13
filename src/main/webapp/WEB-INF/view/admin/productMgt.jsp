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
		window.open("${contextPath}/admin/product/productReg", "PopupWin", "width=1070, height=640");
	});
	
	$('#searchBtn').click(function() {
		self.location = "productMgt" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
	
	$('#delLink').click(function() {
		var con = confirm("삭제하시겠습니까?");
		if(con == true){
		} else {
		}
	});
});

</script>
<style>

.search {
    display: inline-block;
    width: 20%;
}

.pageNumer {
    display: inline-block;
    width: 50%;
    text-align: center;
}

.btn_new {
    display: inline-block;
    text-align: right;
    margin-left: 10px;
}

.title_div {
	display: inline-block;
	padding-left: 15px;
}

.pageNumber2 {
    display: inline-block;
    width: 90%;
    text-align: center;
    margin-bottom: 100px;
}

tbody tr:nth-child(2n) {
    background-color: #eaeaea;
}

tbody tr:nth-child(2n+1) {
    background-color: #f9f9f9;
}

</style>
</head>
<body class="main-layout">
	<!-- header -->
	
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<c:if test="${empty authInfo2}"> 
			<jsp:include page="/WEB-INF/view/myPage/include/loginplz.jsp"/>
		</c:if>
	</header>
	<!-- end header -->
<c:if test="${!empty authInfo2}">
	<section class="adminSection">
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />
		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		        <!-- Page content-->		        
		        
		        <div class="container-fluid">
					<div>
						<div class="title_div"><h1 class="mt-4">상품 목록</h1></div>
						
						<div class="btn_new">
							<button type="button" id="new">상품등록</button>
						</div>
					</div>
					<div>
						<div class="search">
							<select name="searchType">
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제품번호</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>제품명</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>브랜드</option>
								<option value="q"<c:out value="${scri.searchType eq 'q' ? 'selected' : ''}"/>>카테고리</option>
						    </select>
						
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						
						    <button id="searchBtn" type="button">검색</button>					    
	
						</div>
					
						<div class="pageNumer">
							<ul class="pageNum">
								<c:if test="${pageMaker.prev}">
							      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
							    </c:if>
							    
							    <c:if test="${!pageMaker.prev}">
							      <li id="page"><a style="color: #808080;">[이전]</a></li>
							    </c:if>
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							      <li id="page"><a href="productMgt${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
							    </c:if>
							    
							    <c:if test="${!pageMaker.next}">
							      <li id="page"><a style="color: #808080;">[다음]</a></li>
							    </c:if>
							</ul>
						</div>
					</div>
					
					
					<table style="width: 95%; text-align: center">
						<thead>
							<tr style="background-color: lightgrey; text-align: center">
								<td>번호</td>
								<td>상품명</td>
								<td>브랜드</td>
								<td>성별</td>
								<td>카테고리</td>
								<td>대표이미지</td>
								<td>원가</td>
								<td>판매가격</td>
								<td>등록일</td>
								<td>누적등록수량</td>
								<td>누적판매수량</td>
								<td>재고관리</td>
								<td>상품관리</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList}" var="productList">
							<tr>
								<td>${productList.productCode}</td>
								<td><a href="${contextPath}/productDetail/${productList.productCode}"><c:out value="${productList.productName}" /></a></td>
								<td>${productList.brand.brandName}</td>			
								<td>${productList.gender}</td>		
								<td>${productList.category.category}</td>
								<td><a href="${contextPath}/productDetail/${productList.productCode}"><img src="${contextPath}/images/${productList.productPost.productMainImage}" width="150" height="150"></a></td>
								<td>${productList.costPrice}</td>
								<td>${productList.sellPrice}</td>
								<td>${productList.registDate}</td>
								<td>${productList.cumulativeRegistCount}</td>
								<td>${productList.cumulativeSellCount}</td>
								<td><button type="button"><a href="${contextPath}/admin/product/productDetailMgt?productCode=${productList.productCode}&page=1&perPageNum=10" onClick="window.open(this.href, '', 'width=1210, height=760'); return false;">재고관리</a></button></td>
								<td>
									<button type="button"><a href="${contextPath}/admin/product/productMod?productCode=${productList.productCode}" onClick="window.open(this.href, '', 'width=1070, height=640'); return false;">상품수정</a></button>
									<button type="button"><a href="${contextPath}/admin/product/productDel?productCode=${productList.productCode}" onClick="if(!confirm('삭제 하시겠습니까?')){return false;}">상품삭제</a></button>
									
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="pageNumber2">
						<ul class="pageNum2">
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="${contextPath}/adminproductMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="${contextPath}/adminproductMgt${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="${contextPath}/adminproductMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.next}">
						      <li id="page"><a style="color: #808080;">[다음]</a></li>
						    </c:if>
						</ul>											
					</div>					
				</div>
			</div>
		</div>
	</section>
</c:if>
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>