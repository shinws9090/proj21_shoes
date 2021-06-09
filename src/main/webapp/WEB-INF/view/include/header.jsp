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
			<c:if test="${empty authInfo}"> 
				<p>환영합니다.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">JOIN</a></li>
			<li><a href="${contextPath}/login/loginForm">LOGIN</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				<p>${authInfo.memberName }님. 환영합니다</p>
				<p>
					<%-- <a href="<c:url value="/edit/changePassword"/>">[비밀번호 변경]</a> --%>
					
					<a href="<c:url value="/logout"/>">로그아웃</a>
					
				
				</p>
			
			</c:if>
			

			<li><a href="#">MYPAGE</a></li>
			<li><a href="#">BOARD</a></li>

			<!-- 직원 아이디로 로그인 하고 권한 있을때 관리자 화면 표시 -->
			<%-- <c:if test="${employee.authority == 1}"> --%>
			<li><a href="adminMain">관리자 화면</a></li>
			<%-- </c:if> --%>

		</ul>
	</nav>
	<div class="logo">
	</div>
	<nav class="main-menu">
		<ul>
			<li><a href="${contextPath}/index">Home</a></li>
			<li><a href="${contextPath}/productList?menu=brand">BRAND</a></li>
			<li><a href="${contextPath}/productList?menu=women">WOMEN</a></li>
			<li><a href="${contextPath}/productList?menu=men">MEN</a></li>
			<li><a href="${contextPath}/productList?menu=kids">KIDS</a></li>
			<li><a href="${contextPath}/productList?menu=all">FREE</a></li>
		</ul>
	</nav>
</body>
</html>