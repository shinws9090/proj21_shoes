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
<title>마이페이지</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberBootstrap.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css"> --%>
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
<%-- 	${myOrderList} --%>
	
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
				<h4 style="text-align: center;">최근 취소주문 내역</h4>
				<br>
			
			<div class="container my-3">
				<table  class="table" > 
				<thead class="thead-dark">
					<tr>
						<td>주문번호</td>
						<td>상품사진</td>
						<td  id="max">상품명</td>
						<td>결제금액</td>
						<td>주문수량</td>
					 	<td>주문일</td>
					 	<td>결제/취소상태</td> 
					 	<td>환불여부</td> <!-- 추가 -->
					 	<td>취소일</td>  <!-- 추가  -->
					 
			
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${fn:length(myCancelOrderList) > 0}">
					<c:forEach var="myCancelOrderList" items="${myCancelOrderList}">
					<tr>
						<!-- 주문번호 -->
						<td><a href="${contextPath}/myPage/myOrder/orderDetail/${member.memberId }/${myCancelOrderList.orderCode}">${myCancelOrderList.orderCode }<br>[상세보기]</a></td>
						<!-- 상품사진 -->
						<td><a href="${contextPath}/myPage/myOrder/orderDetail/${member.memberId }/${myCancelOrderList.orderCode}"><img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myCancelOrderList.productMainImage }"></a></td>
						<!-- 상품명 -->
						<td><a href="${contextPath}/productDetail/${myCancelOrderList.productCode}">${myCancelOrderList.productName }<br>[상품 주문페이지]</a></td>
						<!-- 결제금액 -->
						<td>${myCancelOrderList.paymentAmount }</td>
						<!-- 주문수량 -->
						<td>${myCancelOrderList.orderCount }</td>
						<!-- 주문일 -->
						 <td>${myCancelOrderList.orderDate }</td> 	
						 <!-- 결제여부 -->
						 <c:if test="${empty myCancelOrderList.payOX && myCancelOrderList.cancelState == true}"><!--결제안했고 취소했으면  -->
						  <td>결제전 취소<br></td>			 
						 </c:if>				
						 <c:if test="${!empty myCancelOrderList.payOX && myCancelOrderList.cancelState == true}"><!--결제했고 취소헀으면  -->
						  <td>결제후 취소<br><!-- <a>[환불완료]</a> --></td>
						 </c:if>
						 <!--  -->								 
						 <c:if test="${empty myCancelOrderList.payOX}"><!-- 입금전일시 환불여부 비활성화 -->
						 <td> - </td>
						 </c:if>
						 <c:if test="${!empty myCancelOrderList.payOX}"><!-- 입금전일시 환불여부 비활성화 -->
						 <td> 환불완료 </td>
						 </c:if>
						
						<!-- 주문취소일 -->
						<td>${myCancelOrderList.cancelDate }</td>
					
						
						
						
					
					
					
					
					
					</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
							<tr>
								<td colspan="4">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				</table>
		</div>	
			</section> 
			
					
			
				
 <!--paginate -->
         <div class="paginate">
            <div class="paging" style="margin-left: 50%;">
               <a class="direction prev" href="javascript:void(0);"
                  onclick="movePage(1,${pagination3.cntPerPage},${pagination3.pageSize});">
                  &lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
                  onclick="movePage(${pagination3.currentPage}<c:if test="${pagination3.hasPreviousPage == true}">-1</c:if>,${pagination3.cntPerPage},${pagination3.pageSize});">
                  &lt; </a>

               <c:forEach begin="${pagination3.firstPage}"
                  end="${pagination3.lastPage}" var="idx">
                  <a
                     style="color:<c:out value="${pagination3.currentPage == idx ? '#gray; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                     href="javascript:void(0);"
                     onclick="movePage(${idx},${pagination3.cntPerPage},${pagination3.pageSize});"><c:out
                        value="${idx}" /></a>
               </c:forEach>
               <a class="direction next" href="javascript:void(0);"
                  onclick="movePage(${pagination3.currentPage}<c:if test="${pagination3.hasNextPage == true}">+1</c:if>,${pagination3.cntPerPage},${pagination3.pageSize});">
                  &gt; </a> <a class="direction next" href="javascript:void(0);"
                  onclick="movePage(${pagination3.totalRecordCount},${pagination3.cntPerPage},${pagination3.pageSize});">
                  &gt;&gt; </a>
            </div>
         </div>
         <!-- /paginate -->	
			</c:if>
				
	
	

</div>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
<script> 
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/myPage/myCancelOrder/${member.memberId}";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>
</html>