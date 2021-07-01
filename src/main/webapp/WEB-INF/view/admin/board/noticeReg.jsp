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
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/admin/js/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: 'content',
		minHeight: 370,
		maxHeight: null,
		focus: true, 
		lang : 'ko-KR'
	});
});
</script>

<style>
	
td.notice_subject {
    width: 200px;
    text-align: right;
    padding-right: 30px;
}

.notice_btn {
    margin-left: 600px;
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
					<h1 class="mt-4">공지사항</h1>
					<form id="noticeRegForm" method="post" autocomplete="off" >
						<table style="width: 70%;">
							<tr>
								<td class="notice_subject"><a>직원 번호</a></td>
								<td class="notice_content"><input type="text" name="employee" id="employee" placeholder="직원번호" /></td>
							</tr>
										
							<tr>	
								<td class="notice_subject"><a>제목</a></td>
								<td class="notice_content"><input type="text" name="title" id="title" placeholder="제목" style="width:90%;" /></td>
							</tr>
							
							<tr>
								<td class="notice_subject"><a>내용</a></td>
					 			<td class="notice_content">
					 			<textarea name="content" id="summernote" ></textarea>
				 			</td>								
						</table>
						<div class="notice_btn">
						<button type="submit" id="new">작성</button>
						</div>
					</form>
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