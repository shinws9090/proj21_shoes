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
</head>
<style>
.noticeViewSub {
    text-align: center;
}

table.noticeTable {
	width: 1300px;
    margin: 0 auto;
    margin-top: 20px;
    border-collapse: collapse;
}

td {
    padding: 10px 10px;
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
    width: 20%;
}

section.pageNumSearch {
	padding: 10px;
    text-align: center;
    height: 300px;
}

</style>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<div class="noticeView">		 
		        <!-- Page content-->
		        <div class="noticeViewSub">
						
					<h1 class="mt-4">공지사항</h1>
								
					<table class="noticeTable">
						<thead>
							<tr style="background-color: lightgrey; text-align: center">
								<td class="noticetd1">번호</td>
								<td class="noticetd2">제목</td>						
								<td class="noticetd4">작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList}" var="noticeList">
							<tr>
								<td class="noticetd5">${noticeList.boardCode}</td>
								<td><a href="mainNoticeDetail?boardCode=${noticeList.boardCode}"><c:out value="${noticeList.title}" /></a></td>
								<td>${noticeList.registDate}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
		        </div>  		        
		    </div>		    
	</section>
	<section class="pageNumSearch">
		<div>
			<ul class="pageNum">
			    <c:if test="${pageMaker.prev}">
			      <li id="page"><a href="mainNotice${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
			    </c:if> 
			
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			      <li id="page"><a href="mainNotice${pageMaker.makeSearch(idx)}">[${idx}]</a></li>
			    </c:forEach>
			
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			      <li id="page"><a href="mainNotice${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
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
			    
			    <script  type="text/javascript">
			      $(function(){
			        $('#searchBtn').click(function() {
			          self.location = "mainNotice" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			        });
			      });   
			    </script>
			</div>						
		</div>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>