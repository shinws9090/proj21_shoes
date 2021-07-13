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
<!-- bootstrap -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>이런신발</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productRegist.css">
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
			
			
			<form action="${contextPath}/productQnARegist" method="post"> 
				<%-- ${member } --%>
		<!-- 문의하기  입력  -->
			<fieldset> 
				<c:if test="${commend=='insert'}">
				<legend>상품문의하기</legend>
				</c:if>
				<c:if test="${commend=='update'}">
				<legend>상품문의 수정</legend>
				<input type="hidden" name="boardCode"value="${boardCode}" />
				</c:if>
				<br>
				<!-- 해당컨트롤러로 이동 -->
					<div class="form-group row">
				      <label class="col-sm-2 col-form-label">회원 아이디  : </label>
				      <div class="col-sm-10">
				        <input type="text" readonly class="form-control-plaintext" value="${member.memberId.memberId }">
				      </div>
				    </div>
					<div class="form-group row">
				      <label class="col-sm-2 col-form-label">회원 이름  : </label>
				      <div class="col-sm-10">
				        <input type="text" readonly class="form-control-plaintext" value="${member.memberId.memberName }">
				      </div>
				    </div>
					<div class="form-group row">
				      <label class="col-sm-2 col-form-label">문의상품 코드  : </label>
				      <div class="col-sm-10">
				        <input type="text" readonly class="form-control-plaintext" value="${productCode}" name="productCode">
				      </div>
				    </div>
					<div class="form-group">
				      <label class="form-label mt-4">제목</label>
				      <input type="text" name="title" id="title" class="form-control">
				    </div>
					<div class="form-group">
				      <label class="form-label mt-4">내용</label>
				      <textarea class="form-control" rows="10" cols="50" id="content" name="content"></textarea>
				    </div>
				
				<input type="hidden" name="commend"value="${commend}" /><!--다음단계  -->
				<input class="btn btn-outline-primary btn-sm" 
					type="submit" value="작성하기" /><!--다음단계  -->
				<a class="btn btn-outline-danger btn-sm"
					href="javascript:window.history.back();">취소</a>
			</fieldset>
					
			</form> 
	
		</c:if>
	
	</section>
	
	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>