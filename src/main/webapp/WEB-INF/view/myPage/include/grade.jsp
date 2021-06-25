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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>로그인</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
#tbl_maGrade{/* 나의 등급 table 설정*/
border-collapse: collapse;   /* td간 선 없애기 */
width: 100%;
height: 100px;
margin-bottom: 20px;
padding-bottom: 30px;

	
}
#tr_myGrade{ /* 나의 등급 table안의 tr 설정 */
background-color:#4545460f;
/* #e5e5e5 ;  */
text-align: center; 
width: 500px; 
margin-bottom: 20px;
	
}

#tr_myGrade h2{
	padding-left: 10%;	
	color: #423838;
}


#myPoint{
	color: red;
}
#myGrade_detail{
	padding-top:10px;
	padding-bottom:10px;
	padding-left: 10%;
}
</style>
</head>
<body class="main-layout">
		<div id="myPage" style="margin-left:50%;">
	<section id = "maPage">
	<c:if test="${!empty authInfo}"> 
			<!-- 상단 등급 바 -->
			<div>
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
			</div>
			<div>
				<!-- 좌측메뉴 -->
				<div>
					<article id="my_menu">
						<h3>회원정보</h3>
						<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
						<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>
		
						<h3>나의 쇼핑정보</h3>			
						<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
						<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
						<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
						<a href="${contextPath}/cartList">-장바구니</a>
					</article>
				</div>
			</div>
			</c:if>
		</section>	
</div>
</body>

</html>