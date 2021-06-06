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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step1.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/step2.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
<%-- $(function(){
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
}); --%>
</script>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
		<div id="signUpForm">
	<section id = "signUpForm">

	
		<h2>회원가입</h2><!-- 회원가입 -->
	
		
		<form:form action="step3" modelAttribute="registerRequest">
		<table>
		<tr>
		
		<th scope="row"><label for="memberId"> 회원아이디</label></th><td><form:input path="memberId"/><form:errors path="memberId" /></td>
		
		<%-- <td class="td_left"><label >회원아이디 <form:input path="memberId" /> <form:errors path="memberId" /> </label></td> --%>
		</tr>
		<tr>
		<td class="td_left"><label >회원비밀번호 <form:input path="memberPwd" /> <form:errors path="memberPwd" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >비밀번호확인 <form:input path="confirmPassword" /> <form:errors path="confirmPassword" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >회원이름 <form:input path="memberName" /> <form:errors path="memberName" /></label></td>
		</tr>
		<tr>
		
		<td class="td_left"><label >성별</label>
		<td class="td_left"><label >남 <form:input path="gender"  name="gender" type="radio"  value="true"/></label></td>
		<%-- <td class="td_left"><label >여 <form:input path="gender" name="gender" type="radio"  value="false"/></label></td> --%>
		</tr>
		
		<tr>
		<td class="td_left"><label >생년월일 <form:input path="birthday" /> <form:errors path="birthday" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >이메일 <form:input path="email" /> <form:errors path="email" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >연락처 <form:input path="tel" /> <form:errors path="tel" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >우편번호 <form:input path="zipCode" /> <form:errors path="zipCode" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >주소 <form:input path="address" /> <form:errors path="address" /></label></td>
		</tr>
		<tr>
		<td class="td_left"><label >상세주소 <form:input path="detailAddress" /> <form:errors path="detailAddress" /></label></td>
		</tr>
		
		
			
		
	
		</table>
		</form:form>
		<article class="btn2">
		
				 <form action="step3" method="post"> <!-- 일로 보내조 -->
				<input type="submit" value="다음단계" /><!--다음단계  -->
				
				</form> 
				<form action="../index" method="get">
				<input type="submit" value="가입취소" />
				</form>
		</article>
	
	
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