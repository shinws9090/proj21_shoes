<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<body>
	<div class="sns-menu">
		<ul>
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-instagram"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
		</ul>
	</div>
	<nav class="top-menu">
		<ul>
			<!-- 회원 또는 관리자 로그인 하지 않았을 때 보여지는 메뉴  -->
			<c:if test="${empty authInfo &&empty authInfo2}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">회원가입</a></li>
				<li><a href="${contextPath}/login/loginForm">로그인</a></li>			
			</c:if>
			
			<!-- 회원 로그인 했을 때 보여지는 메뉴 -->
			<c:if test="${!empty authInfo}">
				<p>${authInfo.memberName }님. 환영합니다</p>
				<p>
			
					<%-- <a href="<c:url value="/edit/changePassword"/>">[비밀번호 변경]</a> --%>
				</p>	
				<li><a href="${contextPath}/cartList">장바구니</a></li>		
				<li><a href="${contextPath}/myPageHome/${authInfo.memberId}">마이페이지</a></li>
				<li><a href="${contextPath}/logout"">로그아웃</a></li>
			</c:if>
				<!-- 관리자 로그인 했을 때 보여지는 메뉴 -->
			<c:if test="${!empty authInfo2}">
				<p>${authInfo2.empName } 관리자님. 환영합니다</p>
				<p>
			
			<%-- 	
				<li><a href="${contextPath}/cartList">장바구니</a></li>		
				<li><a href="${contextPath}/myPageHome/${authInfo.memberId}">마이페이지</a></li> --%>
				<li><a href="${contextPath}/logout"">로그아웃</a></li>
			</c:if>
			

			
			<li><a href="${contextPath}/admin/board/mainNotice">공지사항</a></li>

			<!-- 직원 아이디로 로그인 하고 권한 있을때 관리자 화면 표시 -->
			<%-- <c:if test="${employee.authority == 1}"> --%>
			<li><a href="${contextPath}/admin/adminMain">관리자 화면</a></li>
			<%-- </c:if> --%>

		</ul>
	</nav>
	<div class="logo">
	</div>
	<nav class="main-menu">
		<ul class="main-menu-sub">
			<li class="main-menu-sub"><a href="${contextPath}/index">Home</a></li>
			<li><a href="${contextPath}/productList?menu=brand">BRAND</a></li>
			<li><a href="${contextPath}/productList?menu=women">WOMEN</a></li>
			<li><a href="${contextPath}/productList?menu=men">MEN</a></li>
			<li><a href="${contextPath}/productList?menu=kids">KIDS</a></li>
			<li><a href="${contextPath}/productList?menu=free">FREE</a></li>
		</ul>
	</nav>
</body>
</html>