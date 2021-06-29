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
<script type="text/javascript">
$(function() {
	
	
});
</script>
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
					<section id="articleForm">
						<h2>글 내용 상세보기</h2>
						<section id="basicInfoArea">
							제 목 : ${article.board_subject}
						</section>
						<section id="fileForm">
							첨부파일 :
							<c:if test="${article.board_file ne null }">
								<a href="fileDownload.do?file_name=${article.board_file}">${article.board_file}</a>
							</c:if>			
						</section>
						<section id="articleContentArea">${article.board_content }</section>
					</section>
					<section id="commandList">
																		<!-- &page=${page} 없으면 목록에서 1번으로 돌아감 -->
						<a href="boardReplyForm.do?board_num=${article.board_num}&page=${page}">[답변]</a>
						<a href="boardModifyForm.do?board_num=${article.board_num}&page=${page}">[수정]</a>
						<a href="boardDeleteForm.do?board_num=${article.board_num}&page=${page}">[삭제]</a>
						<a href="boardList.do?page=${page}">[목록]</a>&nbsp;&nbsp;
					</section>
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