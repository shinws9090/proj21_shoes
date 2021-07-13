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
$(function(){

	$('#mod_btn').on("click", function(e) {
		location.href="${contextPath}/admin/board/noticeMod?boardCode=" + ${noticeView.boardCode};
	});
	
	$('#del_btn').on("click", function(e) {
		if(!confirm("정말 삭제하시겠습니까?")) {
		} else {			
			location.href="${contextPath}/admin/board/noticeDel?boardCode=" + ${noticeView.boardCode}
		}		
	});
	
});
</script>
</head>
<style>
h1.mt-4 {
	text-align: center;
    margin-right: 200px;
    margin-bottom: 20px;
}
.noticeDetailView {
	margin-left: 230px;
    width: 1000px;
    padding-top: 10px;
    border-top: 1px solid;
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

.notice_btn {
    width: 75%;
    text-align: right;
    padding-top: 10px;
    padding-bottom: 10px;
}

.noticeMove {
    width: 300px;
    text-align: center;
    margin-left: 560px;
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
	<section class="adminSection">
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
	        		<div class="notice_btn">
	        			<button type="button" id="mod_btn">수정</button>
	        			<button type="button" id="del_btn">삭제</button>
		        	</div>		        		
	        		
	        		<div class="noticeMove">
	        			<div class="noticePrev">
	        				<c:choose>
								<c:when test="${noticeView.prevCode != 0}">
									<a href="${contextPath}/admin/board/noticeDetail?boardCode=${noticeView.prevCode}">[이전글]</a>
								</c:when>
								<c:otherwise><a style="color: #808080;">[이전글]</a></c:otherwise>
							</c:choose>
		        		</div>
		        		<div class="noticeList">
		        			<a href="${contextPath}/admin/board/notice/?page=1&perPageNum=10">[목록]</a>
		        		</div>			        		
		        		<div class="noticeNext">
		        			<c:choose>
								<c:when test="${noticeView.nextCode != 0}">
									<a href="${contextPath}/admin/board/noticeDetail?boardCode=${noticeView.nextCode}">[다음글]</a>
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