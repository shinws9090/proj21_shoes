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
		<div id="productDetail">
	<section id = "productDetail">
			
				<h4> 상품후기</h4>
				<br>
				<table  class="tbl_type" border="1"> 
				<tr><td>${reviewRead.productName } </td></tr>
				<tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${reviewRead.productMainImage }"></td></tr>

				
				</table>
					<br>
				<table class="tbl_type" border="1">
				<tr>	
					<td>리뷰 제목 : ${reviewRead.title }   (${reviewRead.registDate })</td>	
								
				</tr>
			
				<tr>
			
 			<td>리뷰내용 : ${reviewRead.content }</td>		<!-- 내용 -->
				
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