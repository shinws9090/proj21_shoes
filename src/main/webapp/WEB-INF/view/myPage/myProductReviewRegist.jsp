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
	<section>
	
	
		<c:if test="${!empty authInfo}">
			<!-- 상단 등급 바 -->
				<table id="tbl_maGrade"> 
					<tr id="tr_myGrade">
						<td><h2>${memberPageSelectComment.memberName }[${memberPageSelectComment.memberId}]님의 멤버십 등급은 ${memberPageSelectComment.grade}입니다.	</h2>
							<article id="myGrade_detail">
								<a href="${contextPath}/grade/${memberPageSelectComment.memberId}">등급별 혜택 보기 〉</a>
								포인트 〉 <a id="myPoint"> ${memberPageSelectComment.point }점 </a>
							</article>
						</td>
					</tr>
				</table>
				
				<!-- 좌측 메뉴 -->
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${memberPageSelectComment.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${memberPageSelectComment.memberId}">-회원탈퇴</a>

				<h3>나의 쇼핑정보</h3>			
				<a href="${contextPath}/myPage/myOrder/${memberPageSelectComment.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myCancelOrder/${member.memberId}">-취소내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				<h3>나의 후기</h3>			
				<a href="${contextPath}/myPage/myReview/${memberPageSelectComment.memberId}">-작성완료 후기 내역</a><br>
				<a href="${contextPath}/myPage/myReviewPlz/${memberPageSelectComment.memberId}">-미작성 후기 내역</a><br>
			
				<h3>나의 문의</h3>
				<a href="${contextPath}/myPage/myProductQnA/${memberPageSelectComment.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${memberPageSelectComment.memberId}">-일반문의내역</a><br>
				
				
				</article>
			
			<form action="${contextPath}/myProductReviewRegist" method="post" autocomplete="off" enctype="multipart/form-data"> 
		<!-- 문의하기  입력  -->
				<c:if test="${commend=='insert'}">
					
					<h4 style="margin-left: 50%;">리뷰등록</h4>
				</c:if>
				<c:if test="${commend=='update'}">
					<h4 style="margin-left: 50%;">리뷰 수정</h4>
					<input type="hidden" name="boardCode"value="${boardCode}" />
				</c:if>

				<br>
				<!-- 해당컨트롤러로 이동 -->
				<div>
				<table class="tbl_type" border="1">
					 <tr>
						<td><a>회원 아이디:</a></td>
						<td>
						<input type="text" placeholder="ID" value="${memberPageSelectComment.memberId }" readonly size="100"/>
						</td>
					</tr>
			
					<tr>
						<td><a>회원 이름:</a></td> 
						<td>
						<input value="${memberPageSelectComment.memberName }" readonly size="100"/> 
						</td>
					</tr>
					<tr>
						<td><a>주문 코드:</a></td> 
						<td>
						<input name="orderNum" value="${orderCode}" readonly size="100"/>  
						</td>
					<tr>
						<td>
						<a>제목:</a></td> 
						<td>
						<br> 
						<input name="title" type="text" id="title" value="${reView.title }" size="100"/> 
						</td>
					</tr>
					<tr>
						<td><a>내용:</a></td> 
						<td>
						<textarea name="content" rows="10" cols="50"  id="content" 
							style="width:98%; height:98%;" maxlength="1000" >${reView.content }</textarea>
						</td>
					</tr>
					<tr>
						<td><a>사진첨부:</a></td> 
						<td>
						 <input multiple="multiple" type="file" name="filename[]" />
						</td>
					</tr>
		
				</table>
					
				</div>
				<article style="margin-left:50%;">	
				<input type="hidden" name="commend" value="${commend}" /><!--다음단계  -->
				<input type="hidden" name="productCode" value="${productCode}" /><!--다음단계  -->
				<input type="submit" value="작성하기" /><!--다음단계  -->
					</article>
					
			</form> 
			<article style="margin-left:50%;">	
				<a href="javascript:window.history.back();">취소</a>
			</article>
		</c:if>
	
	</section>
	<br><br><br><br><br><br><br><br>
	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>