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
<c:set var="member" value='<%=request.getSession().getAttribute("sessionMember") %>' />

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
	<section>
	
		<c:if test="${empty authInfo}"> 
			<p style="text-align: center;">로그인해주세요.</p> 
			<p></p>
			<li style="text-align: center;"><a href="${contextPath}/register/step1">회원가입</a></li>
			<li style="text-align: center;"><a href="${contextPath}/login/loginForm">로그인</a></li>
		</c:if>
		<c:if test="${!empty authInfo}">
			
			
			<form action="${contextPath}/productReviewRegist" method="post"> 
		<!-- 문의하기  입력  -->
				<c:if test="${commend=='insert'}">
				<h4>리뷰등록</h4>
				</c:if>
				<c:if test="${commend=='update'}">
				<h4>리뷰 수정</h4>
				<input type="hidden" name="boardCode"value="${boardCode}" />
				</c:if>
				${member }
				<br>
				<!-- 해당컨트롤러로 이동 -->
				<div>
				<table>
					 <tr>
						<td><a>회원 아이디:</a></td>
						<td>
						<input type="text" placeholder="ID" value="${member.memberId.memberId }" readonly size="100"/>
						</td>
					</tr>
			
					<tr>
						<td><a>회원 이름:</a></td> 
						<td>
						<input value="${member.memberId.memberName }" readonly size="100"/> 
						</td>
					</tr>
					<tr>
						<td><a>상품 코드:</a></td> 
						<td>
						<input name="productCode" value="${productCode}" readonly size="100"/>  
						</td>
					<tr>
						<td>
						<a>제목:</a></td> 
						<td>
						<br> 
						<input name="title" type="text" id="title" placeholder="문의제목을 작성해주세요" size="100"/> 
						</td>
					</tr>
					<tr>
						<td><a>내용:</a></td> 
						<td>
						<textarea name="content" rows="10" cols="50"  id="content" style="width:98%; height:98%;" maxlength="1000" ></textarea>
						</td>
					</tr>
					<tr>
						<td><a>사진첨부:</a></td> 
						<td>
						<input type="file" >
						</td>
					</tr>
		
				</table>
					
				</div>
				
				<input type="hidden" name="commend"value="${commend}" /><!--다음단계  -->
				<input type="submit" value="작성하기" /><!--다음단계  -->
					
			</form> 
	
			<a href="javascript:window.history.back();">취소</a>
		</c:if>
	
	</section>
	
	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>