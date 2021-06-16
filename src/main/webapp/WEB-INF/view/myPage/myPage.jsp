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

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step1.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step2.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPage2.css"> 
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
	<section id = "maPage">
	
	<c:if test="${empty authInfo}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">회원가입</a></li>
				<li><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				
				<table style="
				border-collapse: collapse;   /* td간 선 없애기 */
				width: 100%;
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
						<td><h2>${member.memberName }[${member.memberId}]님의 멤버십 등급은 ${member.grade}입니다.		</h2></td><td ><a href="${contextPath}/grade/${member.memberId}">등급별 혜택 보기 〉</a></td><td> 포인트 〉 </td><td style="color: red;"> 0점 </td>
					</tr>
				
				<tr style="background-color:#e5e5e5 ; text-align:center;  padding-bottom: 20px;" >				
		
				</tr> 
				
				</table>
			
			
				<h3 style="margin-left: 300px;">나의 주문처리현황</h3>
				<table style=" margin-left:300px; 10px; margin-bottom: 30px; width: 60%; height:100px; border-style: solid gray; border: 1px; border-collapse: collapse;   /* td간 선 없애기 */" >
				
					<!-- <tr style="background-color:#e5e5e5; text-align: left;  ">
					<td></td><td></td><td></td><td><h3> 나의주문처리현황       (최근 3개월 기준)</h3></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
					</tr> -->
					
					<tr style="color: gray;">
						<td>결제대기 </td>
						<td>배송준비중</td>
						<td>배송중  </td>
						<td>배송완료</td>
						<td>취소 </td>
						<td>교환</td>
						<td>반품</td>
					
						
					</tr>
	
					<tr style="color: gray;">
						<td>0건</td>
						<td>0건</td>
						<td>0건</td>
						<td>0건</td>
						<td style="color: red;"> 0 </td><td style="color: red;"> 0  </td><td style="color: red; padding-right: 20px;"> 0 </td>
						
					
					</tr>
					
					
				</table>
			
			
				
				
				<table  style="margin-right: 90%;">
				
				<tr><td>회원정보<td></td></tr>
				<tr >
					<td><a href="${contextPath}/myPage/myPageSel/${authInfo.memberId}">-회원정보 조회 / 변경</a></td>
				</tr>
				</table>
	
			<table style="margin-right: 90%;">
				<tr><td>나의 쇼핑정보<td><tr>
				<tr>
					<td><a href="${contextPath}/myPage/changeMemberData">-주문내역</a></td>
				</tr>
				
					<tr>
					<td><a href="${contextPath}/myPage/qna/${authInfo.memberId}">-문의내역</a></td>
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