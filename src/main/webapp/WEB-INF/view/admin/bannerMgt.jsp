<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#new').on("click", function(e) {
			window.open("${contextPath}/admin/bannerReg", "PopupWin", "width=1020, height=520");
		});

	});
</script>

<style>

.title_div {
	margin-bottom: 15px;
	display: inline-block;
}

.btn_new {
    display: inline-block;
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
		        	<div class="title_div"><h1 class="mt-4">배너 목록</h1></div>
	        		<div class="btn_new">
						<button type="button" id="new">배너추가</button>
					</div>
		           
		        	<div>
		           	<c:forEach items="${fileNames}" var="fileNames">
						<li><img src="${contextPath}/images/slide/${fileNames}" style="width: 800px;"></li>
						<button type="button"><a href="${contextPath}/admin/bannerDel?fileName=${fileNames}" onClick="if(!confirm('삭제 하시겠습니까?')){return false;}">${fileNames} 삭제</a></button>
					</c:forEach>		           
		            </div>
					
					<script>
						$('#del_btn').click(function() {
							if(!confirm("정말 삭제하시겠습니까?")) {
							} else {			
								location.href="${contextPath}/admin/board/noticeDel?boardCode=" + ${noticeView.boardCode};
							}
						});
					</script>
					
					
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