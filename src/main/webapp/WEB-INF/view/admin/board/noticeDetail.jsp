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
    text-align: center;
}
.noticeDetailView {
    margin: 0 auto;
    width: 800px;
    padding-top: 30px;
    padding-bottom: 100px;
}
.noticeTitle {
    display: inline-block;
    padding-bottom: 50px;
}
.noticeDate {
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
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
				<!-- Page content-->
		        <div class="container-fluid">
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