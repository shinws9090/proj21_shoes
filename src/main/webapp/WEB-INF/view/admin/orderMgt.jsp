<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
</script>

<style>

form#paymentStateForm {
    display: inline-block;
}

form#deliveryCodeForm {
    display: inline-block;
}


</style>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<c:if test="${empty authInfo2}"> 
			<jsp:include page="/WEB-INF/view/myPage/include/loginplz.jsp"/>
		</c:if>
	</header>
	<!-- end header -->
<c:if test="${!empty authInfo2}">
	<section>
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
		        <!-- Page content-->
		        <div class="container-fluid">
		        	<div><h1 class="mt-4">주문 목록</h1></div>
		        	${orderList}
					<div class="search">
						<select name="searchType">
							<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>구매확정여부</option>
							<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>제품명</option>
							<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>브랜드</option>
							<option value="q"<c:out value="${scri.searchType eq 'q' ? 'selected' : ''}"/>>카테고리</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>					    

					</div>
					
					<div class="pageNumer">
						<ul class="pageNum">
							<c:if test="${pageMaker.prev}">
						      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="productMgt${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="productMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.next}">
						      <li id="page"><a style="color: #808080;">[다음]</a></li>
						    </c:if>
						</ul>
					</div>
		        	
		            <table style="width: 90%; text-align: center">
						<thead>
							<tr style="background-color: lightgrey; text-align: center">
								<td>주문번호</td>
								<td>상품이미지</td>
								<td>상품명</td>
								<td>결제금액</td>
								<td>주문수량</td>
							 	<td>주문일</td>
							 	<td>결제여부</td>
							 	<td>송장번호</td>
							 	<td>구매확정여부</td>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${orderList}" var="orderList">
							<tr>
								<td>${orderList.orderCode}</td>
								<td><a href="${contextPath}/productDetail/${orderList.productCode}"><img src="${contextPath}/images/${orderList.productMainImage}" width="200"></a></td>
								<td><a href="${contextPath}/productDetail/${orderList.productCode}">${orderList.productName}</a></td>
								<td>${orderList.paymentAmount}</td>			
								<td>${orderList.orderCount}</td>
								<td>${orderList.orderDate}</td>
									<c:choose>
											<c:when test="${empty orderList.payOX && orderList.buyConfirmState == false}">
												<td>
													<div>입금확인중</div>
													<form id="paymentStateForm" name="paymentStateForm" method="post" autocomplete="off">
														<select name="paymentState" class="paymentState">
															<option selected="selected" value="1">입금완료</option>
															<option value="2">배송준비</option>
															<option value="3">배송중</option>
															<option value="4">배송완료</option>
														</select>
													</form>
													<input type="button" name="paymentState" onclick="summit()" value="변경">
													<br><br>
													<input type="button" name="paymentState" onclick="cancel()" value="주문취소">
												</td>
												<%-- <a href="${contextPath}/myOrderCancel/${myOrderList.orderCode}/${member.memberId}">[주문취소하기]</a> --%>
											</c:when>
											<c:when test="${!empty orderList.payOX && orderList.buyConfirmState == false}">
												<td>
													<div>입금완료</div>
													<select name="paymentState" class="paymentState">
														<option selected="selected" value="2">배송준비</option>
														<option value="3">배송중</option>
														<option value="4">배송완료</option>
													</select>
													
													<input type="button" name="paymentState" onclick="summit()" value="변경">
													<br><br>
													<input type="button" name="paymentState" onclick="cancel()" value="주문취소">
												</td>
											</c:when>
											<c:otherwise>
												<td>
													<div>입금완료</div>
													<select name="paymentState" class="paymentState">
															<option selected="selected" value="1">배송준비</option>
															<option value="2">배송중</option>
															<option value="3">배송완료</option>
													</select>
												</td>
											</c:otherwise>
										</c:choose>	
								<td>									
									<c:choose>
										<c:when test="${orderList.paymentState == 1 && (orderList.deliveryCode eq '' || orderList.deliveryCode eq null)}">
											<form id="deliveryCodeForm" name="deliveryCodeForm" method="post" autocomplete="off">
												<input type="text" placeholder="송장번호 입력" value="">
											</form>
											<input type="button" id="delivery_btn" onclick="summit1()" value="등록">
										</c:when>
										<c:when test="${  orderList.paymentState == 1 && (orderList.deliveryCode ne '' || orderList.deliveryCode ne null)}">
											<div>${orderList.deliveryCode}</div>
										</c:when>										
										<c:otherwise>
											<input type="text" value="" disabled='disabled'>
											<input type="button" id="disPaymentState_btn" value="등록" disabled='disabled'>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${orderList.buyConfirmState == false && orderList.paymentState == 1}">
											<input type="button" id="paymentState_btn" onclick="summit2()" value="구매확정">
										</c:when>
										<c:otherwise>
											<input type="button" id="disPaymentState_btn" value="구매확정" disabled='disabled'>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
		        </div>
		        
		    </div>		    
		</div>
	</section>
	</c:if>
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>