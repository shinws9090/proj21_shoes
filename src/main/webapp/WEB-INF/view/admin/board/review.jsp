<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>

h1.mt-4 {
    padding: 0 15px 15px 15px;
}

td {
    padding: 5px 5px;
}

td.td1 {
    width: 10%;
}

td.td2 {
    width: 10%;
}

td.td3 {
    width: 15%;
}

td.td4 {
    width: 45%;
}

td.td5 {
    width: 10%;
}

td.td6 {
    width: 10%;
}

ul.pageNum {
    width: 80%;
    text-align: center;
}

.search {
    width: 80%;
    text-align: center;
}

</style>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section class="adminSection">
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
		    <jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
		        	<h1 class="mt-4">리뷰게시판</h1>
		        	<div style="height: 400px">
						<table style="width: 90%; text-align: center">		
							<tr style="background-color: lightgrey; text-align: center">
								<td class="td1">리뷰번호</td>
								<td class="td2">리뷰상품코드</td>
								<td class="td3">리뷰상품명</td>
								<td class="td4">제목</td>					
								<td class="td5">아이디</td>					
								<td class="td6">작성일</td>
							</tr>
							<tr>
								<c:forEach items="${reviewList}" var="reviewList">
								<tr>
									<td>${reviewList.boardCode}</td>
									<td>${reviewList.productCode}</td>
									<td>${reviewList.productName}</td>
									<td><a href="${contextPath}/admin/board/reviewDetail?boardCode=${reviewList.boardCode}"><c:out value="${reviewList.title}" /></a></td>
									<td>${reviewList.memberId}</td>
									<td>${reviewList.registDate}</td>
								</tr>
								</c:forEach>
							</tr>
						</table>
					</div>
					<div>
						<ul class="pageNum">
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="${contextPath}/admin/board/review${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="${contextPath}/admin/board/review${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="${contextPath}/admin/board/review${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.next}">
						      <li id="page"><a style="color: #808080;">[다음]</a></li>
						    </c:if>
						</ul>
						
						<div class="search">
						    <select name="searchType">
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						       <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						    </select>
						
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						
						    <button id="searchBtn" type="button">검색</button>
						    
						    <script  type="text/javascript">
						      $(function(){
						        $('#searchBtn').click(function() {
						          self.location = '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
						        });
						      });   
						    </script>
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
</body>
</html>