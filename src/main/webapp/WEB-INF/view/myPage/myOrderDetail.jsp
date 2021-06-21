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
<title>마이페이지</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css">
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
				<p style="text-align: center;">로그인해주세요.</p> 
				<p></p>
				<li style="text-align: center;"><a href="${contextPath}/register/step1">회원가입</a></li>
				<li style="text-align: center;"><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				
						<!-- 상단 등급 바 -->
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
					<!-- 좌측메뉴 -->
			
				<section id="my_menu">
				<h3>회원정보</h3>
				<a  href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>
				<br>
				<h3>나의 쇼핑정보</h3>
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myQnA/${member.memberId}">-문의내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				</section>
	
			
				
				<!-- 최근 주문내역 테이블  -->
				<br>
				<h4>주문 상세내역</h4>
				<br>
				<table  class="tbl_type" border="1"> 
				<tr><td>${myOrderDetail.productName }</td></tr>
				<tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myOrderDetail.productMainImage }"></td></tr>

				
				</table>
				
				<br>
				<table  class="tbl_type" border="1"> 
			
					<tr>
						<td>주문번호</td>
					 	<td>주문일</td> 
					<!-- 	<td>상품사진</td> -->
						<td>상품명</td>
						<td>옵션1(색상)</td>
						<td>옵션2(사이즈)</td>
						<td>주문수량</td>
						<td>결제금액</td>
					</tr>
					
					<tr>
						<td>${myOrderDetail.orderCode }</td>
						<td>${myOrderDetail.orderDate }</td> 
				<%-- 		<td><img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myOrderDetail.productMainImage }"></td> --%>
						<td><a href="${contextPath}/productDetail/${myOrderDetail.productCode}">${myOrderDetail.productName }<br>[상품 주문페이지]</a></td>
						<td>${myOrderDetail.color }</td>
						<td>${myOrderDetail.size }</td>
						<td>${myOrderDetail.orderCount }</td>
						<td>${myOrderDetail.paymentAmount }</td>
		
						
					</tr>
				
				
				</table>
					<br>
					<br>
					<h4>배송지 입력정보</h4>
					<br>
				<table  class="tbl_type" border="1"> 
			
					<tr>
						<td>받는 사람</td>
						<td>연락처</td>
						<td>우편번호</td>
						<td>주소</td>
						<td>상세주소</td>
						<td>송장번호</td>
					</tr>
					
					<tr>
						<td>${myOrderDetail.recipient }</td>
						<td>${myOrderDetail.tel }</td>
						<td>${myOrderDetail.zipCode }</td>
						<td>${myOrderDetail.address }</td>
						 <td>${myOrderDetail.detailAddress }</td> 
						<td>${myOrderDetail.deliveryCode }</td>
						
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