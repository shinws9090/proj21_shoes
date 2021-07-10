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
		location.href="${contextPath}/admin/board/noticeReg";
	});
	
	$('#searchBtn').click(function() {
		self.location = '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});  
});

</script>
<style>

.notice_title {
    display: inline-block;
    padding: 0 15px 15px 15px;
}

.btn_new {
    display: inline-block;
}

td.noticetd1 {
    width: 10%;
}

td.noticetd2 {
    width: 60%;
    
}

td.noticetd3 {
    width: 10%;
}

td.noticetd4 {
    width: 30%;
}


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
				<div class="container-fluid">
					<div class="notice_title">
						<h1 class="mt-4">공지사항</h1>
					</div>
					<div class="btn_new">
						<button type="button" id="new">글 작성</button>
					</div>
					<div style="height: 400px">
						<table style="width: 90%; text-align: center">
							<thead>
								<tr style="background-color: lightgrey; text-align: center">
									<td>게시판번호</td>
									<td>제목</td>						
									<td>작성자</td>		
									<td>작성일</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList}" var="noticeList">
								<tr>
									<td class="noticetd1">${noticeList.boardCode}</td>
									<td class="noticetd2"><a href="${contextPath}/admin/board/noticeDetail?boardCode=${noticeList.boardCode}"><c:out value="${noticeList.title}" /></a></td>
									<td class="noticetd3">${noticeList.employee.empName}</td>
									<td class="noticetd4">${noticeList.registDate}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div>
						<ul class="pageNum">
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="${contextPath}/admin/board/notice${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="${contextPath}/admin/board/notice${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="${contextPath}/admin/board/notice${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
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
						    </select>
						
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						
						    <button id="searchBtn" type="button">검색</button>
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