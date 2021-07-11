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
	$('#del_btn').on("click", function(e) {
		if(!confirm("정말 삭제하시겠습니까?")) {
		} else {			
			location.href="${contextPath}/admin/board/reviewDel?boardCode=" + ${reviewView.boardCode}
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
.reviewDetailView {
	margin-left: 230px;
    width: 1000px;
    padding-top: 10px;
    border-top: 1px solid;
}

.reviewReply {
	display: inline-block;
    width: 50%;
    text-align: right;
    padding-top: 15px;
}

.reviewTitle {
    display: inline-block;
    padding: 10px;
}

.reviewDate {
    display: inline-block;
    float: right;
    margin-right: 30px;
    padding: 10px;
}

.reviewContet {
    min-height: 400px;
    border-bottom: 1px solid;
    border-top: 1px solid lightgray;
    padding: 20px;
    margin-top: 10px;
}

.review_btn {
	display: inline-block;
    width: 45%;
    text-align: right;
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
		        	<h1 class="mt-4">후기게시판</h1>
	        		
	        		<div class="reviewDetailView">
		        		
		        		<div class="reviewTitle">
		        			<h3>${reviewView.title } </h3>
		        			<a href="${contextPath}//admin/productMgt?page=1&perPageNum=10&searchType=t&keyword=${reviewView.productCode}">상품명 : ${reviewView.productName } </a>
		        		</div>
		        		
		        		<div class="reviewDate">
		        			등록일자 : ${reviewView.registDate }
		        			<br>
		        			회원아이디 : ${reviewView.memberId }
		        		</div>
		        
		        		<div class="reviewContet">
		        			<a href="${contextPath}//admin/productMgt?page=1&perPageNum=10&searchType=t&keyword=${reviewView.productCode}"><img src="${contextPath}/images/${reviewView.productMainImage}" width="200"></a>
		        			<br>
		        			${reviewView.content }
		        		</div>
		        		
		        		<div class="reviewReply">
		        		
		        		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<a href="${contextPath}/admin/board/review/?page=1&perPageNum=10">[목록]</a>
					    </c:forEach>
			        	</div>
		        		
		        		<div class="review_btn">
		        			<button type="button" id="del_btn">삭제</button>
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