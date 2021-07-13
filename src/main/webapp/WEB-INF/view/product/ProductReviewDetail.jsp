<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
   <c:set var="sessionMemberCode" value="${sessionMember.memberCode}" />
   <c:set var="reviewMemberCode" value="${reView.orderCode.memberCode.memberCode}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- bootstrap -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->
<title>이런신발</title>
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
		<c:set var="productCode" value="${product.productCode}"/>
	<section>
			<%-- ${sessionMember}
			${reView} --%>
			<article>
				<h4> 상품후기 상세보기</h4>
				<br>
				<table  class="table"> 
				<tr><th>${product.productName } </th></tr>
				<tr>
				<c:forEach var="image" items="${reView.reviewImages}">
					<td>
						<img style="max-width:20%; max-height: 20%; "
						src="${contextPath}/images/reView/${reView.boardCode}/${image.image }">
					</td>
				</c:forEach>
				</tr> 
			<%-- 	<tr> 
					<c:forEach var="image" items="${reView.reviewImages}">
					<td>${image.image } </td>
					</c:forEach>
				</tr> --%>		
				
				</table>
					<br>
				<table class="table">
				<tr>	
					<td>후기제목 : ${reView.title }   (${reView.registDate })</td>	
				</tr>
				<tr>
 				<td>후기내용 : ${reView.content }</td>		<!-- 내용 -->
				</tr>
				</table>
				<c:if test="${sessionMemberCode ==reviewMemberCode}">
					<a href="${contextPath}/ProductReviewInsertAndUpdateForm/${productCode },update,${reView.boardCode}">문의글 수정</a>
					<a href="${contextPath}/ProductReviewDelete/${reView.boardCode},${productCode }">삭제</a>
				</c:if>
			</article>
				
	
	</section>
	
	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>