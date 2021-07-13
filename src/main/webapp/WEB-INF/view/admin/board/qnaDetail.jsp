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
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};	
	
	$('#mod_btn').on("click", function(e) {
		location.href="${contextPath}/admin/board/qnaMod?searchType=" + getParameterByName("searchType") + "&boardCode=" + ${qnaView.boardCode};
	});
	
	$('#del_btn').on("click", function(e) {
		if(!confirm("정말 삭제하시겠습니까?")) {
		} else {			
			location.href="${contextPath}/admin/board/qnaDel?boardCode=" + ${qnaView.boardCode}
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
.qnaDetailView {
	margin-left: 230px;
    width: 1000px;
    padding-top: 10px;
    border-top: 1px solid;
}

.qnaReply {
	display: inline-block;
    width: 50%;
    text-align: right;
    padding-top: 15px;
}

.qnaTitle {
    display: inline-block;
    padding: 10px;
}

.qnaDate {
    display: inline-block;
    float: right;
    margin-right: 30px;
    padding: 10px;
}

.qnaContet {
    min-height: 400px;
    border-bottom: 1px solid;
    border-top: 1px solid lightgray;
    padding: 20px;
    margin-top: 10px;
}

.qna_btn {
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
	<section class="adminSection">
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
				<!-- Page content-->
		        <div class="container-fluid">
		        	<h1 class="mt-4">문의게시판</h1>
	        		
	        		<div class="qnaDetailView">
		        		
		        		<div class="qnaTitle">
		        			<h3>${qnaView.title } </h3>
		        			
		        			<a href="${contextPath}//admin/productMgt?page=1&perPageNum=10&searchType=t&keyword=${qnaView.productCode}">상품명 : ${qnaView.productName } </a>
		        			
		        		</div>
		        		
		        		<div class="qnaDate">
		        			등록일자 : ${qnaView.registDate }
		        			<br>
		        			회원아이디 : ${qnaView.memberId }
		        		</div>
		        
		        		<div class="qnaContet">
		        			<c:if test="${qnaView.productCode != 0}">
		        			<a href="${contextPath}//admin/productMgt?page=1&perPageNum=10&searchType=t&keyword=${qnaView.productCode}"><img src="${contextPath}/images/${qnaView.productMainImage}" width="200"></a>
		        			</c:if>
		        			<br>
		        			${qnaView.content }
		        			<br>
		        			<br>
		        			<h4>답변 : ${qnaView.reply }</h4>
		        		</div>
		        		
		        		<div class="qnaReply">
		        		
		        		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<c:choose>
								<c:when test="${param.resOX eq '답변준비중'}">
									<a href="${contextPath}/admin/board/qna/?page=1&perPageNum=10&searchType=n">[목록]</a>
								</c:when>
								<c:otherwise>
									<a href="${contextPath}/admin/board/qna/?page=1&perPageNum=10">[목록]</a>
								</c:otherwise>								
							</c:choose>
					    </c:forEach>
			        	</div>
		        		<div class="qna_btn">
		        			<h4>${qnaView.resOX }</h4>
		        			<c:choose>
		        				<c:when test="${qnaView.resOX eq '답변준비중'}">
		        					<button type="button" id="mod_btn">답변작성</button>
		        				</c:when>
		        				<c:otherwise>
		        					<button type="button" id="mod_btn">답변수정</button>
		        				</c:otherwise>
		        			</c:choose>
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