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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ProductQnADetail.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
	<section id = "maPage">
				<h4> 상품문의내역 상세보기</h4>
				<br>
				<table  class="tbl_type" border="1"> 
				<tr><td bgcolor = "#e7e7e7">${myQnADetail.productName } </td></tr>
				<tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myQnADetail.productMainImage }"></td></tr>

				
				</table>
					<br>
				<table class="tbl_type" border="1">
				<tr>	
					<td bgcolor = "#e7e7e7">문의제목 : ${myQnADetail.title }   (${myQnADetail.registDate })</td>	
				</tr>
				<tr>
 				<td align = left>문의내용 : ${myQnADetail.content }</td>		<!-- 내용 -->
				</tr>
				<tr>
				<td align = left>└ 답변 : ${myQnADetail.reply }</td>
				</tr>
				</table>
				<c:if test="${sessionMemberCode == qnaMemberCode }">
					<a href="${contextPath}/ProductQnAInsertAndUpdateForm/${myQnADetail.productCode},update,${myQnADetail.boardCode}">문의글 수정</a>
					<a href="${contextPath}/ProductQnADelete/${myQnADetail.boardCode},${myQnADetail.productCode}">삭제</a>
				</c:if>
				
	
	</section>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>