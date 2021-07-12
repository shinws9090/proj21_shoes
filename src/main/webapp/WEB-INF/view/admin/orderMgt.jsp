<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>

form#paymentStateForm {
    display: inline-block;
}

form#deliveryCodeForm {
    display: inline-block;
}

.search {
    display: inline-block;
    width: 20%;
}

.pageNumer {
    display: inline-block;
    width: 50%;
    text-align: center;
}

.btn_new {
    display: inline-block;
    width: 20%;
    text-align: right;
}

.pageNumber2 {
    display: inline-block;
    width: 90%;
    text-align: center;
    margin-bottom: 100px;
}

tbody tr:nth-child(2n) {
    background-color: #eaeaea;
}

tbody tr:nth-child(2n+1) {
    background-color: #f9f9f9;  
}

.orderTitle {
    margin-top: 20px;
     margin-bottom: 10px;
}

.orderTitle2 {
    margin-bottom: 20px;
}

.a1 {
    margin-right: 20px;
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
		        	<h1 class="mt-4">주문 목록</h1>
		        	<div class="orderTitle">
		        		<a class="a1" href="${contextPath}/admin/orderMgt?page=1&perPageNum=10">전체주문 : ${orderCount1 + orderCount2 + orderCount3 + orderCount4}건</a>
		        		<a class="a1" href="${contextPath}/admin/orderMgt?page=1&perPageNum=10&searchType=p1">결제완료 : ${orderCount1}건</a>
		        		<a class="a1" href="${contextPath}/admin/orderMgt?page=1&perPageNum=10&searchType=p2">배송준비중 : ${orderCount2}건</a>
		        		<a class="a1" href="${contextPath}/admin/orderMgt?page=1&perPageNum=10&searchType=p3">배송중 : ${orderCount3}건</a>
		        		<a class="a1" href="${contextPath}/admin/orderMgt?page=1&perPageNum=10&searchType=p4">배송완료 : ${orderCount4}건</a>
		        	</div>
		        	<div class="orderTitle2">
		        		<a class="a1" href="${contextPath}/admin/orderMgt?page=1&perPageNum=10">주문취소 : ${orderCount1 + orderCount2 + orderCount3 + orderCount4}건</a>
		        	</div>
					<div class="search">
						<select name="searchType">
							<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>구매확정여부</option>
							<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>제품명</option>
							<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>브랜드</option>
							<option value="q"<c:out value="${scri.searchType eq 'q' ? 'selected' : ''}"/>>카테고리</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button">검색</button>
					   
					    <script type="text/javascript">
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>				    

					</div>
					
					<div class="search2" id="search2">
						<select name="searchType2" id="searchType2">
							<option value="p1"<c:out value="${scri.searchType eq 'p1' ? 'selected' : ''}"/>>결제완료</option>
							<option value="p2"<c:out value="${scri.searchType eq 'p2' ? 'selected' : ''}"/>>배송준비중</option>
							<option value="p3"<c:out value="${scri.searchType eq 'p3' ? 'selected' : ''}"/>>배송중</option>
							<option value="p4"<c:out value="${scri.searchType eq 'p4' ? 'selected' : ''}"/>>배송완료</option>
					    </select>
					
					    <input type="hidden" name="keyword2" id="keywordInput2" value="${scri.keyword}"/>
					
					    <button id="searchBtn2" type="button">검색</button>		
					    
					    <script type="text/javascript">
					      $(function(){
					        $('#searchBtn2').click(function() {
					          self.location = '${pageMaker.makeQuery(1)}' + "&searchType=" + $("#searchType2 option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					</div>
					
					<div class="pageNumer">
						<ul class="pageNum">
							<c:if test="${pageMaker.prev}">
						      <li id="page"><a href="${contextPath}/admin/orderMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="${contextPath}/admin/orderMgt${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="${contextPath}/admin/orderMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
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
							 	<td>배송상태</td>
							 	<td>송장번호</td>
							 	<td>구매확정여부</td>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${orderList}" var="orderList">
							<tr>
								<td>${orderList.orderCode}</td>
								<td><a href="${contextPath}/productDetail/${orderList.productCode}"><img src="${contextPath}/images/${orderList.productMainImage}" width="200" height="200"></a></td>
								<td><a href="${contextPath}/productDetail/${orderList.productCode}">${orderList.productName}</a></td>
								<td>${orderList.paymentAmount}</td>			
								<td>${orderList.orderCount}</td>
								<td>${orderList.orderDate}</td>
									<c:choose>
											<c:when test="${orderList.paymentState == 1 && orderList.cancelState == false}">
												<td>
													<div>결제완료</div>
													<form id="paymentStateForm" name="paymentStateForm" method="post" autocomplete="off">
														<select name="paymentState" class="paymentState">
															<option selected="selected" value="2">배송준비중</option>
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
											<c:when test="${orderList.paymentState == 2 && orderList.cancelState == false}">
												<td>
													<div>배송준비중</div>
													<select name="paymentState" class="paymentState">
														<option selected="selected" value="3">배송중</option>
														<option value="4">배송완료</option>
													</select>
													
													<input type="button" name="paymentState" onclick="summit()" value="변경">
													<br><br>
													<input type="button" name="paymentState" onclick="cancel()" value="주문취소">
												</td>
											</c:when>
											<c:when test="${orderList.paymentState == 3 && orderList.cancelState == false}">
												<td>
													<div>배송중</div>
													<select name="paymentState" class="paymentState">
														<option selected="selected" value="4">배송완료</option>
													</select>
													
													<input type="button" name="paymentState" onclick="summit()" value="변경">
												</td>
											</c:when>
											<c:when test="${orderList.paymentState == 4 && orderList.cancelState == false}">
												<td>
													<div>배송완료</div>
												</td>
											</c:when>
										</c:choose>	
								<td>									
									<c:if test="${orderList.paymentState == 1}">
										<input type="text" value="" disabled='disabled'>
										<input type="button" value="등록" disabled='disabled'>
									</c:if>										
									<c:if test="${(orderList.deliveryCode eq '' || orderList.deliveryCode eq null) && orderList.paymentState == 2}">
										<form id="deliveryCodeForm" name="deliveryCodeForm" method="post" autocomplete="off">
											<input type="text" placeholder="송장번호 입력" value="">
										</form>
										<input type="button" id="delivery_btn" onclick="summit1()" value="등록">
									</c:if>
									
									<c:if test="${(orderList.deliveryCode ne '' || orderList.deliveryCode ne null) && orderList.paymentState == 2}">
										<div>${orderList.deliveryCode}</div>
									</c:if>
									
									<c:if test="${(orderList.deliveryCode eq '' || orderList.deliveryCode eq null) && orderList.paymentState == 3}">
										<form id="deliveryCodeForm" name="deliveryCodeForm" method="post" autocomplete="off">
											<input type="text" placeholder="송장번호 입력" value="">
										</form>
										<input type="button" id="delivery_btn" onclick="summit1()" value="등록">
									</c:if>
									
									<c:if test="${(orderList.deliveryCode ne '' || orderList.deliveryCode ne null) && orderList.paymentState == 3}">
										<div>${orderList.deliveryCode}</div>
									</c:if>										
									
									<c:if test="${orderList.paymentState == 4}">
										<div>${orderList.deliveryCode}</div>
									</c:if>
								</td>
								<td>
									<c:choose>
										<%-- <c:when test="${orderList.buyConfirmState == false && orderList.paymentState == 4}">
											<input type="button" id="paymentState_btn" onclick="summit2()" value="구매확정">
										</c:when> --%>
										<c:when test="${orderList.buyConfirmState == true && orderList.paymentState == 4}">
											<div>구매확정</div>
										</c:when>
										<c:otherwise>
											<div>-</div>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="pageNumber2">
						<ul class="pageNum2">
							<c:if test="${pageMaker.prev}">
						      <li id="page"><a href="${contextPath}/admin/orderMgt${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="${contextPath}/admin/orderMgt${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="${contextPath}/admin/orderMgt${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.next}">
						      <li id="page"><a style="color: #808080;">[다음]</a></li>
						    </c:if>
						</ul>
					</div>				
					
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
<script>

	$("#search2").hide();

</script>
</html>