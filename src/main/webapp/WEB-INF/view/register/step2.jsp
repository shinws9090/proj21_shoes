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
<title>회원가입</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/signup.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
$(function(){
    var contextPath = "<%= request.getContextPath()%>";
    $('#cancel').on("click", function(e){
        window.location.href = contextPath + "/memberlist";
    });
    $('#new').on("click", function(e){
        var newMember = {  email: $('#email').val(), name: $('#name').val(), password: $('#password').val() };
        alert("data > " + newMember.email );
        $.ajax({
            url         : contextPath + "/api/members/",
            type        : "POST",
            contentType : "application/json; charset=utf-8",
            datatype    : "json",
            cache       : false,
            data        : JSON.stringify(newMember),
            success     : function(res) {
                alert(res);
                window.location.href = contextPath + "/memberlist";
            },
            error       : function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                window.location.href = contextPath + "/memberlist";
            }
        }); 
    });
});
</script>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
	
	<section id = "signUpForm">
	
		<h2>회원가입</h2><!-- 회원가입 -->
		
		
		<form action="step3" method = "post" enctype="multipart/form-data" name="signUpForm">
		<table>
		<tr>
		<td class="td_left"><label for="memberName">회원아이디</label></td>
		<td class="td_right"><input type="text" name="memberName" id="memberName" required /></td>
		</tr>
			<tr>
		<td class="td_left"><label for="memberPassword">비밀번호</label></td>
		<td class="td_right"><input type="password" name="memberPassword" id="memberPassword" required /></td>
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
		<td class="td_left"><label for="upload">파일첨부</label></td>
		<td class="td_right"><input type="file" name="upload" id="upload" required /></td>
		</tr>
		
	
		</table>
		</form>
		<article class="btn2">
				<form action="step3" method="post"> <!-- 일로 보내조 -->
				
				<input type="submit" value="<spring:message code="member.register"/>" /><!--다음단계  -->
				<input type="submit" value="<spring:message code="member.register.cancel"/>" /><!--취소  -->
				</form>
		</article>
	
	
	</section>

	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>