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
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberBootstrap.css">
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
	
	
	
	
			<c:if test="${!empty authInfo}">
			
			<!-- 상단 등급 바 -->
				<table id="tbl_maGrade"> 
					<tr id="tr_myGrade">
						<td><h2>${memberGrade.memberName }[${memberGrade.memberId}]님의 멤버십 등급은 ${memberGrade.grade}입니다.	</h2>
							<article id="myGrade_detail">
								<a href="${contextPath}/admin/board/mainNoticeDetail?boardCode=6">등급별 혜택 보기 〉</a>
								포인트 〉 <a id="myPoint"> ${memberGrade.point }점 </a>
							</article>
						</td>
					</tr>
				</table>
							
				
				
				<!-- 좌측메뉴 -->
			<!-- 좌측 메뉴 -->
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>

				<h3>나의 쇼핑정보</h3>			
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myCancelOrder/${member.memberId}">-취소내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				<h3>나의 후기</h3>			
				<a href="${contextPath}/myPage/myReview/${member.memberId}">-작성완료 후기 내역</a><br>
				<a href="${contextPath}/myPage/myReviewPlz/${member.memberId}">-미작성 후기 내역</a><br>
			
				<h3>나의 문의</h3>
				<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
				
				
				</article>
				
			<div id="modify_form">
	<section id ="modifyForm">

		<h3 style="margin-left: 22%;"> 회원탈퇴 </h3> 
		
		
			<div class="container my-3" style="font: 0.8em Verdana,Dotum,AppleGothic,sans-serif; margin-left: 20%">
			<form:form action="/myPage/quitMember/${member.memberId }" modelAttribute="memberDetailUpdateCommend"><!-- 보내는거? -->
			<form:errors />
			<table  class="modify_table">
			
			<tr>
				<article style="color: red; ">
								<form:errors  path="confirmPassword"  /><br>
								<form:errors path="memberPwd" /> 
				</article>
				
				<th>회원 아이디</th>
				<td id="td_right">
				<label for="memberId">
				<form:input path="memberId"  id="memberId" readonly="true" value="${member.memberId }" />
				</label>
				</td>				
			</tr>
			<form:errors  path="memberId"  />
			
		
			
			 <tr>
			<%-- 	<article style="color: red; ">
								<form:errors  path="confirmPassword"  /><br>
								<form:errors path="memberPwd" />
				</article> --%>
				
				<th>회원명</th>
				<td id="td_right">
				<label for="memberName">
				<form:input path="memberName"  id="memberName" readonly="true" value="${member.memberId }" />
				</label>
				</td>				
			</tr>
			<%-- <form:errors  path="memberName"  /> --%>
			
		
		
		
		
		
			<tr>
					<th>기존비밀번호 확인 </th>
					<td id="td_right">
					<label for="confirmPassword">	
					<form:password id="confirmPassword" path="confirmPassword" placeholder="기존 비밀번호 입력" />
					<%-- <form:errors path="confirmPassword" /> --%>
					</label>
					</td>	
			</tr>
		

		
			
		</table>

				<div id="btns" >
		<h2 style="margin-left: 0; margin-right: 0; width: 100%">  </h2>
			<button type="button,submit"  class="btn btn-secondary btn-lg "  style=" margin-top:20px; width: 72%; font-size: 15px; float:left;">탈퇴하기</button>
				<%--  <input type="submit" value="<spring:message code="next.btn"/>" /><!--다음단계  --> --%>
			</form>
			
			</div>
			</form:form>
			</div>
	</section>
</div>			


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