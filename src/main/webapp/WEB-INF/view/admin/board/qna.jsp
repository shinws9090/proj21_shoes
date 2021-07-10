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

td {
    padding: 5px 5px;
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

	<section>
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
		    <jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
					<h1 class="mt-4">문의게시판</h1>
					<div style="height: 400px">
						<table style="width: 90%; text-align: center;">				
							<tr style="background-color: lightgrey; text-align: center">
								<td>문의번호</td>
								<td>문의상품코드</td>
								<td>문의상품명</td>
								<td>제목</td>						
								<td>아이디</td>
								<td>작성일</td>
								<td>답변유무</td>		
							</tr>
							<tr>
								<c:forEach items="${qnaList}" var="qnaList">
								<tr>
									<td>${qnaList.boardCode}</td>
									<td>${qnaList.productCode}</td>
									<td>${qnaList.productName}</td>
									<td><a href="${contextPath}/admin/board/qnaDetail?boardCode=${qnaList.boardCode}"><c:out value="${qnaList.title}" /></a></td>
									<td>${qnaList.memberId}</td>
									<td>${qnaList.registDate}</td>
									<td>${qnaList.resOX}</td>
								</tr>
								</c:forEach>
							</tr>
						</table>
					</div>
					<div>
						<ul class="pageNum">
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="${contextPath}/admin/board/qna${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if> 
							
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						    
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="${contextPath}/admin/board/qna${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="${contextPath}/admin/board/qna${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.next}">
						      <li id="page"><a style="color: #808080;">[다음]</a></li>
						    </c:if>
						</ul>
						
						<div class="search">
						    <select name="searchTypeN">
						      <option value="s"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>전체</option>
						      <option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>답변준비중</option>
						      <option value="nn"<c:out value="${scri.searchType eq 'nn' ? 'selected' : ''}"/>>답변완료</option>
						    </select>
						
						    <input type="hidden" name="keywordN" id="keywordInputN" value="${scri.keyword}"/>
						
						    <button id="searchBtnN" type="button">검색</button>
						    
						    <script  type="text/javascript">
						      $(function(){
						        $('#searchBtnN').click(function() {
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