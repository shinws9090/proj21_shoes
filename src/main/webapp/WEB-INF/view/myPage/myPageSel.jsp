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
<title>회원가입</title>

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
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id ="maPage">
	
	<c:if test="${empty authInfo}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">회원가입</a></li>
				<li><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
						<!-- 상단 등급 바 -->
				<table id="tbl_maGrade"> 
					<tr id="tr_myGrade">
						<td><h2>${member.memberName }[${member.memberId}]님의 멤버십 등급은 ${member.grade}입니다.	</h2>
							<article id="myGrade_detail">
								<a href="${contextPath}/grade/${member.memberId}">등급별 혜택 보기 〉</a>
								포인트 〉 <a id="myPoint"> ${member.point }점 </a>
							</article>
						</td>
					</tr>
				</table>
			<!-- 좌측메뉴 -->
			
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>
				<br>
				<h3>나의 쇼핑정보</h3>
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myQnA/${member.memberId}">-문의내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				</article>
			
			
		
			<div id="myData">
				<h1>나의정보</h1>
				<form:form action="modify" modelAttribute="memberDetail">
				<form:errors/>
				<table  class="tbl_type" border="1">
					<tr>
						<td id="myData_left_td">회원아이디</td><td>${member.memberId }</td>				
					</tr>
					<tr>
						<td id="myData_left_td">비밀번호</td>		<td>********</td><%-- <td>${member.memberPwd }</td> --%>
					</tr>
				<tr>
						<td id="myData_left_td">회원이름</td>		<td>${member.memberName }</td>
					</tr>
					<tr>
						<td id="myData_left_td">성별</td>		<td>${member.gender }</td>
					</tr>
					<tr>
						<td id="myData_left_td">생년월일</td>		<td>${member.birthday }</td>
					</tr>
					<tr>
						<td id="myData_left_td">이메일</td>		<td>${member.email }</td>
					</tr>
					<tr>
						<td id="myData_left_td">연락처</td>		<td>${member.tel }</td>
					</tr>
					<tr>
						<td id="myData_left_td">우편번호</td>		<td>${member.zipCode }</td>
					</tr>
					<tr>
						<td id="myData_left_td">주소</td>		<td>${member.address }</td>
					</tr>
					<tr>
						<td id="myData_left_td">상세주소</td>		<td>${member.detailAddress }</td>
					</tr>
					<tr>
						<td id="myData_left_td">포인트</td>		<td>${member.point }</td>
					</tr>
					<tr>
						<td id="myData_left_td">누적구매금액</td>	<td>${member.cumulativeBuyAmount }</td>
					</tr>
					<tr>
						<td id="myData_left_td">등급</td>		<td>${member.grade }</td>
					</tr>
					<tr>
						<td id="myData_left_td">가입일</td>		<td><tf:formatDateTime value="${member.signUpDate }" pattern="yyyy-MM-dd:mm"/>
					</td>
				
						
		 <%-- 	<c:forEach var="MyPageSelectCommend" items="${MyPageSelectCommend}">  --%>
				
			
		<%--  	</c:forEach>  --%>
		
		</table>
			<article id="myData_btn">
				<a href="${contextPath}/myPage/${authInfo.memberId}">회원정보 변경</a>
				<a style="color: gray;">     |     </a>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">회원탈퇴</a>
			</article>
				</form:form>
				
				</div>
			
				
				
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