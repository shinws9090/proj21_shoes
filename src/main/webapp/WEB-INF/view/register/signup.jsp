<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title><spring:message code="member.register" /></title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/signup.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
	
	<section id = "writeForm">
	
		<h2><spring:message code="member.register" /></h2>
		<form action="boardWritePro.do" method = "post" enctype="multipart/form-data" name="boardform">
		<table>
		<tr>
		<td class="td_left"><label for="BOARD_NAME">회원아이디</label></td>
		<td class="td_right"><input type="text" name="BOARD_NAME" id="BOARD_NAME" required /></td>
		</tr>
			<tr>
		<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
		<td class="td_right"><input type="password" name="BOARD_PASS" id="BOARD_PASS" required /></td>
		</tr>
			<tr>
		<!-- <td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
		<td class="td_right"><input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT" required /></td>
		</tr>
		<tr>
		<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
		<td><textarea id ="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required></textarea></td>
		</tr> -->
		<tr>
		<td class="td_left"><label for="BOARD_FILE">파일첨부</label></td>
		<td class="td_right"><input type="file" name="BOARD_FILE" id="BOARD_FILE" required /></td>
		</tr>
		
		
		</table>
		
		
	<section id ="commandCell">
	<input type="submit" value="등록"/>&nbsp;&nbsp;
	<input type="reset" value="다시쓰기" />
	
	
	</section>
	</form>
	</section>
	
	<section>
		<article class="btn1">
				회원가입
		</article>
			<article class="btn2">
		       회원가입 취소
		</article>
	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>