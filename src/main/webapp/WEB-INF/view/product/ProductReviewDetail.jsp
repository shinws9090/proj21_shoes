<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
		<c:set var="productCode" value="${reView.orderCode.orderProduct[0].orderOption.productCode}"/>
	<section>
			${reView}
				<h4> 상품후기 상세보기</h4>
				<br>
				<table  class="tbl_type" border="1"> 
				<tr><td>상품코드 : ${productCode } </td></tr>
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
				<table class="tbl_type" border="1">
				<tr>	
					<td>후기제목 : ${reView.title }   (${reView.registDate })</td>	
				</tr>
				<tr>
 				<td>후기내용 : ${reView.content }</td>		<!-- 내용 -->
				</tr>
				</table>
				${reView.boardCode}
				<a href="${contextPath}/ProductReviewInsertAndUpdateForm/${productCode },update,${reView.boardCode}">문의글 수정</a>
				<a href="${contextPath}/ProductReviewDelete/${reView.boardCode},${productCode }">삭제</a>
				
	
	</section>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>