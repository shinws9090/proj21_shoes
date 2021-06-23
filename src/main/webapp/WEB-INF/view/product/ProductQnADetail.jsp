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
		<div id="myPage">
	<section id = "maPage">
			
				<h4> 상품문의내역 상세보기</h4>
				<br>
				<table  class="tbl_type" border="1"> 
				<tr><td>${myQnADetail.productName } </td></tr>
				<tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myQnADetail.productMainImage }"></td></tr>

				
				</table>
					<br>
				<table class="tbl_type" border="1">
				<tr>	
					<td>문의제목 : ${myQnADetail.title }   (${myQnADetail.registDate })</td>	
								
				</tr>
			
				<tr>
			
 			<td>문의내용 : ${myQnADetail.content }</td>		<!-- 내용 -->
				
				</tr>
				<tr>
				<td>답변 : ${myQnADetail.reply }</td>
				</tr>
				
			</table>
		
	
	</section>
</div>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>