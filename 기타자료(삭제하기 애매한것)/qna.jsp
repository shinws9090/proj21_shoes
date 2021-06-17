<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %> --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>나의 상품문의</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step1.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step2.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPage.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
h4{
  
   text-align: center;
}

.tbl_type, .tbl_type th, .tbl_type td {
   border: 0;

}

.tbl_type {
/*    height : 460px; */
   width: 90%;
   margin: 0 auto;
   max-width:800px;
   border-top: 2px solid gray;
   border-bottom: 2px solid #dcdcdc;
   font-family: '돋움', dotum;
   font-size: 12px;
   text-align: center;
   border-collapse: collapse
}

.tbl_type caption {
   display: none
}

.tbl_type tfoot {
   background-color: #f5f7f9;
   font-weight: bold
}

.tbl_type thead {
   
   background-color: #f5f7f9;
   font-weight: bold
}

.tbl_type th {
   padding: 7px 0 4px;
   border-top: 2px solid #dcdcdc;
   border-right: 1px solid #dcdcdc;
   border-left: 1px solid #dcdcdc;
   background-color: #f5f7f9;
   color: #666;
   font-family: '돋움', dotum;
   font-size: 12px;
   font-weight: bold
}

.tbl_type td {
   padding: 6px 0 4px;
   border: 1px solid #e5e5e5;
   color: #4c4c4c
}

.tbl_type td.ranking {
   font-weight: bold
}

h2{
   text-align: center;
   text-decoration: underline;
}
span{
	color: red;
}

section#pageList{
	text-align: :center;
	width: auto;
}
</style>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
	<%-- 	<jsp:include page="/WEB-INF/view/include/header.jsp"/> --%>
	</header>
	<!-- end header -->
	
	<section id = "pageList">
<%-- 	
	${myQnaList }
	${myQnaList[0].boardCode }
	${myQnaList[0].memberCode }
	${myQnaList[0].productCode }
	${myQnaList[0].title }
	${myQnaList[0].content } 
	--%>
	<c:if test="${empty authInfo}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">회원가입</a></li>
				<li><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				
				<h1>${authInfo.memberName }님의 문의내역</h1>

				
				<table class="tbl_type" border="1">
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>상품코드</td>
					<td>질문내용</td>
					<td>회원코드</td>
					<td>작성일</td>
					<td>답글</td>
				</tr>
				<c:forEach var="myQna" items="${myQnaList }">
				<tr>
				<td>${myQna.boardCode }</td> <!-- 글번호 -->
				<td>${myQna.title }</td>	<!-- 제목 -->
				<td>${myQna.productCode }</td>	<!--상품코드  -->
				<td>${myQna.content }</td>		<!-- 내용 -->
				<td>${myQna.memberCode }</td>	<!--회원코드  -->
				<td>${myQna.registDate }</td>	<!-- 작성일 -->
				<td>${myQna.reply }</td>		<!-- 답글 -->
				
				</tr>
				</c:forEach>
	</table>
				
				<%-- <tr>
				<c:forEach var = "board" items="${myQnaList}">  <!-- 이거말고 세션  새로 넣어주기!! -->
				<td>${myQnaCommand.board_num}</td>
				<td>
				<c:if test="${empty myQnaCommand.reply }">
				
					&nbsp;
				
				
				</c:if>
				
				</td>
				
				
				</c:forEach>
				
				</tr> --%>
				
				
				
			</c:if>

	
	
	</section>

	
	<section>

	</section>

	<!-- end our product -->
	<footer>
<%-- 		<jsp:include page="/WEB-INF/view/include/footer.jsp"/> --%>
	</footer>
</body>
</html>