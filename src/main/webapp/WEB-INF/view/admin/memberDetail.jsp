<%@ page import="java.time.LocalDateTime"%>
<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/memberBootstrap.css">

<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">

.step2 h2 {
	border-bottom: none;
}

section {
    padding-top: 1em;
    margin-left: 10%;
    margin-right: 10%;
}


element.style {
    border-bottom: 1px solid #c0c0c0;
    padding-bottom: 10px;
}

#myPage {
    margin-bottom: 0px;
}

#myPageForm {
    padding-top: 0px;
    margin-left: 0px;
    margin-right: 0px;
    font: 0.9em Verdana,Dotum,AppleGothic,sans-serif;
    padding-bottom: 20px;
    margin-bottom: 20px;
    border-bottom: 1px solid #c0c0c0;
    width: auto;
}


</style>

</head>
<body class="main-layout">

	<div id="myPage">
		<section id="maPage">

				<!-- ------------------------------회원정보 테이블   -------------------------------------------------- -->

				<h2 style="border-bottom: 1px solid #c0c0c0; width: auto; padding-bottom: 10px;">회원정보</h2>
				<br>
				<br>
				<div id="myPageForm">
						<table class="insertTable">
							<tr>
								<td>회원아이디</td>
								<td style="text-align: left;">${member.memberId }</td>
							</tr>
							<tr>
								<td>회원이름</td>
								<td>${member.memberName }</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>${member.gender }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${member.birthday }</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${member.email }</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>${member.tel }</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>${member.zipCode }</td>
							</tr>
							<tr>
								<td>주소</td>
								<td style="width: 81%">${member.address }</td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td>${member.detailAddress }</td>
							</tr>
							<tr>
								<td>포인트</td>
								<td>${member.point }</td>
							</tr>
							<tr>
								<td>누적구매금액</td>
								<td>${member.cumulativeBuyAmount }</td>
							</tr>
							<tr>
								<td>등급</td>
								<td>${member.grade }</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><tf:formatDateTime value="${member.signUpDate }"
										pattern="yyyy-MM-dd:mm" /></td>
						</table>
				</div>




		</section>
	</div>


</body>
</html>