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
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberBootstrap.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		<c:if test="${empty authInfo}"> 
			<jsp:include page="/WEB-INF/view/myPage/include/loginplz.jsp"/>
		</c:if>
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id = "maPage">
	
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
				<!-- 좌측 메뉴 -->
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>

				<h3>나의 쇼핑정보</h3>			
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myCancelOrder/${member.memberId}">-취소내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				<h3>나의 후기</h3>			
				<a href="${contextPath}/myPage/myReview/${member.memberId}">-작성완료 후기 내역</a><br>
				<a href="${contextPath}/myPage/myReviewPlz/${member.memberId}">-미작성 후기 내역</a><br>
			
				<h3>나의 문의</h3>
				<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
				
				
				</article>
	
			
				
				<!-- 최근 주문내역 테이블  -->
				<br>
				<h4 style="margin-left:15%;">주문 상세내역</h4>
				<br>
				<table  class="tbl_type detail" > 
				<tr><td>${myOrderDetail.productName }</td></tr>
				<tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myOrderDetail.productMainImage }"></td></tr>

				
				</table>
				
				<br>
				<table  class="tbl_type detail" > 
			
					<tr>
						<td>주문번호</td>
					 	<td>주문일</td> 
					<!-- 	<td>상품사진</td> -->
						<td>상품명</td>
						<td>상품가격</td>
						<td>옵션1(색상)</td>
						<td>옵션2(사이즈)</td>
						<td>주문수량</td>
						
					</tr>
					
					<tr>
						<!-- 주문번호 -->
						<td>${myOrderDetail.orderCode }</td>
						<!-- 주문일 -->
						<td>${myOrderDetail.orderDate }</td> 
				<%-- 		<td><img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myOrderDetail.productMainImage }"></td> --%>
						<!-- 상품명 -->
						<td><a href="${contextPath}/productDetail/${myOrderDetail.productCode}">${myOrderDetail.productName }<br>[상품 주문페이지]</a></td>
						<!-- 1개당 판매금액 -->
						<td>${myOrderDetail.selPrice } 원</td>
						<!--  색상 -->
						<td>${myOrderDetail.color }</td>
						<!-- 사이즈 -->
						<td>${myOrderDetail.size }</td>
						<!-- 구매수량 -->
						<td>${myOrderDetail.orderCount }</td>
		
						
					</tr>
				
				
				</table>
				<br>
					<br>
					<h4 style="margin-left:15%; margin-bottom: 10px; font-weight: bold;">결제정보</h4>
				<table  class="tbl_type detail"> 
			
					<tr>
						<td>구매금액</td>
					 	<td>등급할인금액</td> 
						<td>포인트 사용금액</td>
						<td>최종결제금액</td>
						<td>적립금액</td>
					</tr>
					
					<tr>
						<!-- 총 구매금액 -->
						<td>${myOrderDetail.allSelPrice } 원</td>
						<!-- 등급할인금액 -->
						<td>${myOrderDetail.gradeHal } 원</td> 
						<!-- 포인트 사용금액 -->
						<td>${myOrderDetail.point } 원</td>
						<!-- 최종결제금액 -->
						<td>${myOrderDetail.lastPrice } 원</td>
						<!-- 적립금액  -->
						<td>${pointDel } 포인트</td>
						
						
					</tr>
				
				
				</table>
				
				
				
					<br>
					<br>
					<h4 style="margin-left:15%; margin-bottom: 10px; font-weight: bold;">배송지 입력정보</h4>
				<table  class="tbl_type detail" > 
			
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