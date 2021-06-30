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
				<a href="${contextPath}/cartList">-장바구니</a>
			
				<h3>나의 후기</h3>			
				<a href="${contextPath}/myPage/myReview/${member.memberId}">-작성완료 후기 내역</a><br>
				<a href="${contextPath}/myPage/myReviewPlz/${member.memberId}">-미작성 후기 내역</a><br>
			
				<h3>나의 문의</h3>
				<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
				
				
				</article>
				
			
				<h4> 상품후기 상세보기</h4>
				<br>
		<%-- 		<table  class="tbl_type" border="1"> 
				<tr><td>${myReviewDetail.productName } </td></tr>
				<tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myReviewDetail.productMainImage }"></td></tr>

				
				</table> --%>
					<br>
				<table class="tbl_type" border="1">
				<tr>
					<td><a>상품명 : </a></td>
					<td>
						<input  type="text"   value="${myReviewDetail.productName }" readonly="true" size="100"/>  
					</td>
			
				</tr>
				<tr>
					<td><a>회원 아이디 : </a></td>
					<td>
						<input  type="text"   value="${member.memberId }" readonly="true" size="100"/>  
					</td>
			
				</tr>
				<tr>
					<td><a>회원 이름:</a></td> 
					<td>
						<input value="${member.memberName }" readonly="true" size="100"/>  
					</td>
			
				</tr>
				<tr>
					<td>첨부사진 : </td>
						<td>
							<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myReviewDetail.image }">
						</td>
				</tr>
				
				
				<tr>	
				<td>후기제목 :  </td>
				
				<td>
					<input type="text" size="100" readonly="true" value=" ${myReviewDetail.title }    (${myReviewDetail.registDate })"/>  
					</td>
				</tr>
			<tr>
			<td>후기내용</td>
			<td style="height: 200px">
 			<input hidden="hidden"/>
 			<textarea rows="" cols=""size="100" style=" resize: none; width:98%; height:98%;" maxlength="1000"; " readonly="true">${myReviewDetail.content }</textarea>
 		</td>
 		</tr>
			
				
				
			</table>
			<article id="myData_btn" >	
					<a href="${contextPath}/ProductReviewInsertAndUpdateForm/${member.memberId}/${myReviewDetail.productCode},update,${myReviewDetail.boardCode}">수정하러가기</a>
					
					<a href="${contextPath}/myProductReviewDelete/${myReviewDetail.boardCode},${productCode }/${member.memberId}">삭제</a>
		
			 </article>
			
				
			
				
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