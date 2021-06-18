<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
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
<title>마이페이지</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step1.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step2.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPage2.css"> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
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
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id = "maPage">
	
	<c:if test="${empty authInfo}"> 
				<p style="text-align: center;">로그인해주세요.</p> 
				<p></p>
				<li style="text-align: center;"><a href="${contextPath}/register/step1">회원가입</a></li>
				<li style="text-align: center;"><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				
				<table style="
				border-collapse: collapse;   /* td간 선 없애기 */
				width: 90%;
				height: 100px;
				margin-bottom: 20px;
				padding-bottom: 30px;
				
				"> 
				
				
					<tr style="
					background-color:#e5e5e5 ; 
					text-align: center; 
					width: 500px; 
					margin-bottom: 20px;
					">
						<td><h2>${member.memberName }[${member.memberId}]님의 멤버십 등급은 ${member.grade}입니다.		</h2></td><td ><a href="${contextPath}/grade/${member.memberId}">등급별 혜택 보기 〉</a></td><td> 포인트 〉 </td><td style="color: red;"> ${member.point }점 </td>
					</tr>
				
				<tr style="background-color:#e5e5e5 ; text-align:center;  padding-bottom: 20px;" >				
		
				</tr> 
				
				</table>
				<h1>${authInfo.memberName }님의 문의내역</h1>

				
				<table class="tbl_type" border="1">
				<tr>
					<td>문의코드</td>
					<td>제목</td>
					<td>상품코드</td>
					<!-- <td>질문내용</td> -->
					
					<td>작성일</td>
					<td>답글</td>
				</tr>
				<c:forEach var="myQna" items="${myQnaList }">
				<tr>
				<td>${myQna.boardCode }</td> <!-- 문의코드 -->
				<td>${myQna.title }</td>	<!-- 제목 -->
				<td>${myQna.productCode }</td>	<!--상품코드  -->
	<%-- 			<td>${myQna.content }</td>		<!-- 내용 --> --%>
				<td>${myQna.registDate }</td>	<!-- 작성일 -->
				<td>${myQna.reply }</td>		<!-- 답글 -->
				
				</tr>
				</c:forEach>
	</table>
					<!-- 좌측목록 테이블 -->
				<table  style=" display:inline;  margin-left: 20px; margin-bottom: 20px; margin-top: 20px;">
			
				<tr><td>회원정보<td></td></tr>
				<tr >
					<td><a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a></td>
				</tr>
				<tr >
					<td><a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a></td>
					<td></td>
				</tr>
				
				</table>
		
				<h1></h1>
				<h1></h1>
				
		
				<h1></h1>
				<h1></h1>
			<table style=" display:inline; margin-left: 20px;  margin-top :20px; margin-bottom:  20px;">
				<tr><td>나의 쇼핑정보<td><tr>
				<tr>
					<td><a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a></td>
				</tr>
				
					<tr>
					<td><a href="${contextPath}/myPage/myQnA/${member.memberId}">-문의내역</a></td>
				</tr>
				<tr>
					<td><a href="${contextPath}/cartList">-장바구니</a></td>
				</tr>
			</table>
			
				
			
				
			</c:if>

	
	
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