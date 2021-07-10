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
</head>
<style>

h1.mt-4 {
    margin-left: 50px;
}

.container-notice {
    margin: 0 auto;
}

.noticeDetailView {
	margin: 0 auto;
    width: 1100px;
    padding-top: 10px;
    border-top: 1px solid;
    margin-top: 20px;
    margin-bottom: 100px;
}

.noticeTitle {
    display: inline-block;
    padding: 10px;
}

.noticeDate {
    display: inline-block;
    float: right;
    margin-right: 30px;
    padding: 10px;
}

.noticeContet {
    min-height: 400px;
    border-bottom: 1px solid;
    border-top: 1px solid lightgray;
    padding: 20px;
    margin-top: 10px;
}   

.noticeMove {
    width: 300px;
    text-align: center;
    margin: 0 auto;
}

.noticePrev {
    display: inline-block;
    float: left;
}

.noticeList {
    display: inline-block;
}

.noticeNext {
    display: inline-block;
    float: right;
}

</style>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->

	<section>
		<div class="d-flex" id="wrapper">
		        
	        <!-- Page content-->
	        <div class="container-notice">
	        	<h1 class="mt-4">공지사항</h1>
        		<div class="noticeDetailView">
	        		<div class="noticeTitle">
	        			<h3>${noticeView.title } </h3>
	        		</div>
	        		
	        		<div class="noticeDate">
	        			${noticeView.registDate }
	        		</div>
	        		
	        		<div class="noticeContet">
	        			${noticeView.content }
	        		</div>
	  
	        		<div class="noticeMove">
	        			<div class="noticePrev">
	        				<c:choose>
								<c:when test="${noticeView.prevCode != 0}">
									<a href="${contextPath}/admin/board/mainNoticeDetail?boardCode=${noticeView.prevCode}">[이전글]</a>
								</c:when>
								<c:otherwise><a style="color: #808080;">[이전글]</a></c:otherwise>
							</c:choose>
		        		</div>
		        		<div class="noticeList">
		        			<a href="${contextPath}/admin/board/mainNotice/?page=1&perPageNum=10">[목록]</a>
		        		</div>			        		
		        		<div class="noticeNext">
		        			<c:choose>
								<c:when test="${noticeView.nextCode != 0}">
									<a href="${contextPath}/admin/board/mainNoticeDetail?boardCode=${noticeView.nextCode}">[다음글]</a>
								</c:when>
								<c:otherwise><a style="color: #808080;">[다음글]</a></c:otherwise>
							</c:choose>
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