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
<style>

.title_div {
	margin-bottom: 15px;
}

ul.pageNum {
    width: 95%;
    text-align: center;
}

.search {
    width: 95%;
    text-align: center;
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
		     	<!-- Page content-->
		        <div class="container-fluid">
		            <div class="title_div"><h1 class="mt-4">회원 목록</h1></div>
		            <div>
			            <table style="width: 95%; text-align: center">
										
							<tr style="background-color: lightgrey; text-align: center">
								<td>회원코드</td>
								<td>아이디</td>
								<td>이름</td>
								<td>연락처</td>
								<td>회원등급</td>
							</tr>						
							<tr>
								<c:forEach items="${memberList}" var="memberList">
								<tr>
									<td>
										<div>${memberList.memberCode} </div>
										<div><a href="${contextPath}/admin/memberDetail?memberCode=${memberList.memberCode}&memberId=${memberList.memberId.memberId}" onClick="window.open(this.href, '', 'width=700, height=480'); return false;">[상세보기]</a></div>
									</td>
									<td><a href="memberMgtDetail?memberCode=${memberList.memberCode}"><c:out value="${memberList.memberId.memberId}" /></a></td>
									<td>${memberList.memberId.memberName}</td>
									<td>${memberList.memberId.tel}</td>
									<td>${memberList.gradeCode.grade}</td>
								</tr>
								</c:forEach>
							</tr>
						</table>
					</div>
					<div>
						<ul class="pageNum">
						    <c:if test="${pageMaker.prev}">
						      <li id="page"><a href="memberMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="memberMgt${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="memberMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.next}">
						      <li id="page"><a style="color: #808080;">[다음]</a></li>
						    </c:if> 
						</ul>
						
						<div class="search">
						    <select name="searchType">
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>아이디+이름</option>
						    </select>
						
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						
						    <button id="searchBtn" type="button">검색</button>
						    
						    <script  type="text/javascript">
						      $(function(){
						        $('#searchBtn').click(function() {
						          self.location = "memberMgt" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
						        });
						      });   
						    </script>
						</div>
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