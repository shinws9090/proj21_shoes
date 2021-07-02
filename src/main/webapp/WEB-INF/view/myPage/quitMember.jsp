<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>회원탈퇴</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		<c:if test="${empty authInfo}"> 
			<jsp:include page="/WEB-INF/view/myPage/include/loginplz.jsp"/>
		</c:if>
	</header>
	<!-- end header -->
	<div id="myPage">
	<section id ="maPage">
	
	<section id = "quitMember">
	
	
			<c:if test="${!empty authInfo}">
							<h1>회원 탈퇴</h1>
				
				
				<!-- 좌측메뉴 -->
			<!-- 좌측 메뉴 -->
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>

				<h3>나의 쇼핑정보</h3>			
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				<h3>나의 후기</h3>			
				<a href="${contextPath}/myPage/myReview/${member.memberId}">-작성완료 후기 내역</a><br>
				<a href="${contextPath}/myPage/myReviewPlz/${member.memberId}">-미작성 후기 내역</a><br>
			
				<h3>나의 문의</h3>
				<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
				
				
				</article>
				
			
				<table style="width: 80%">
			
			<!-- 어느 컨트롤러로? -->
			<form:form action="/myPage/quitMember/${member.memberId }" modelAttribute="memberDetailUpdateCommend"><!-- 보내는거? -->
			<tr>
			
				<th scope="row"><label for="memberId">회원아이디</label></th>
				<td><form:input path="memberId" id="memberId" readonly="true" value="${member.memberId }" /></td>				
			</tr>
			
			 <tr>
				<th scope="row"><label for="memberName"></label> 회원이름</th>		
				<td><form:input path="memberName" id="memberName" value="${member.memberName }" readonly="true"/></td>
			</tr>
			
		
		
		
		
			<tr>
				<th scope="row"><label for="confirmPassword"></label>기존비밀번호 확인</th>		
				<td><form:password id="confirmPassword" path="confirmPassword" placeholder="기존 비밀번호 입력" /></td>
			</tr>
			
		

		
			

					<div style="margin-left: 50%;">
				 	<form action="/myPage/quitMember/${member.memberId }" method="post">
					<input type="submit" value="탈퇴" />
					<form:errors path="confirmPassword" />
					</form>
					</div>
				
		</form:form>
		<br>
		</table>


				<%-- <p>회원정보</p>
				<li><a href="${contextPath}/myPage/changeMemberData">회원정보 변경</a></li>
				<li><a href="${contextPath}/myPage/">회원탈퇴</a></li> --%>
		
				
			</c:if>

	
</section>
	
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