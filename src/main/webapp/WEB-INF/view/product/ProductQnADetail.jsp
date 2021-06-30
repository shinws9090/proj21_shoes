<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
   <c:set var="sessionMemberCode" value="${sessionMember.memberCode}" />
   <c:set var="qnaMemberCode" value="${myQnADetail.memberCode}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->	
	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ProductBroad.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
	<section>
		<article>
				<h4> 상품문의내역 상세보기</h4>
				<br>
				<table class="table"> 
				<tr><th scope="row">${myQnADetail.productName } </th></tr>
				<tr><td>	<img style="max-width:40%; max-height: 40%; "  alt="" src="${contextPath}/images/${myQnADetail.productMainImage }"></td></tr>

				
				</table>
				<br>
				<br>
				<table class="table" border="1">
				<tr>	
					<th scope="row">문의제목 : ${myQnADetail.title }   (${myQnADetail.registDate })</th>	
				</tr>
				<tr>
 				<td>문의내용 : ${myQnADetail.content }</td>		<!-- 내용 -->
				</tr>
				<tr>
				<td>- 답변 : ${myQnADetail.reply }</td>
				</tr>
				</table>
				<c:if test="${sessionMemberCode == qnaMemberCode }">
					<a href="${contextPath}/ProductQnAInsertAndUpdateForm/${myQnADetail.productCode},update,${myQnADetail.boardCode}"
							class="btn btn-outline-primary btn-sm">문의글 수정</a>
					<a href="${contextPath}/ProductQnADelete/${myQnADetail.boardCode},${myQnADetail.productCode}"
							class="btn btn-outline-danger btn-sm">삭제</a>
				</c:if>
		</article>
				
	
	</section>
	
	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>