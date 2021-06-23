<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p> <a href="${contextPath}/ProductQnAInsert/${product.productCode }">문의글 등록</a> </p>
	<table class="tbl_type" border="1">
				<tr>
					<td>문의상품</td>
					<td>상품사진</td>
					<td>제목</td>						
					<td>작성일</td>
					<td>답변유무</td>
				</tr>
			<c:forEach var="myQnAList" items="${myQnAList }">
				<tr>
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.productName }</a></td>	<!-- 상품명 -->
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">
				<img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myQnAList.productMainImage }"></a></td>				
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.title }</a></td>	<!-- 제목 -->
				<td>${myQnAList.registDate }</td>	<!-- 작성일 -->
				<td>${myQnAList.resOX }</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>