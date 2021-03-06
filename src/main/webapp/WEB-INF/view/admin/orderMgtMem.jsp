<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

function submit(){
	var submitForm = document.paymentStateForm;
	submitForm.submit();
	alert("배송상태 변경완료");
};

</script>
<style>

section.adminSection {
    padding-top: 10px;
}

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
    width: 800px;
    text-align: center;
}

.btn_new {
    display: inline-block;
    width: 20%;
    text-align: right;
}

.pageNumber2 {
    display: inline-block;
    width: 98%;
    text-align: center;
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

button#remove_btn {
    display: block;
    width: 50%;
    margin-top: 7px;
}

td#td1 {
    width: 8%;
}

td#td2 {
    width: 8%;
}

td#td3 {
    width: 10%;
}

td#td4 {
    width: 14%;
}

td#td5 {
    width: 9%;
}

td#td6 {
    width: 6%;
}

td#td7 {
    width: 11%;
}

td#td8 {
    width: 11%;
}

td#td9 {
    width: 14%;
}

td#td10 {
    width: 12%;
}

.title_div {
    margin-left: 30px;
    margin-bottom: 20px;
}

</style>
</head>
<body >
<c:if test="${!empty authInfo2}">
	<section class="adminSection">
		        	<div class="title_div"><h1 class="mt-4">${param.keyword} 회원의 주문 내역</h1></div>
		        	
					<div class="search" id="search">
						<select name="searchType">
							<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>주문코드</option>
							<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>회원아이디</option>
							<option value="q"<c:out value="${scri.searchType eq 'q' ? 'selected' : ''}"/>>제품명</option>
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
					
					<div style="height: 550px; margin-left: 20px">		        	
		            <table style="width: 98%; text-align: center">
						<thead>
							<tr style="background-color: lightgrey; text-align: center">
								<td id="td1">주문번호</td>
								<td id="td2">회원아이디</td>
								<td id="td3">상품이미지</td>
								<td id="td4">상품명</td>
								<td id="td5">결제금액</td>
								<td id="td6">주문수량</td>
							 	<td id="td7">주문일</td>
							 	<td id="td8">배송상태</td>
							 	<td id="td9">송장번호</td>
							 	<td id="td10">구매확정여부</td>
							</tr>
						<thead>
						<tbody>
							<c:forEach items="${orderList}" var="orderList">
								<tr>
									<c:if test="${orderList.cancelState == false}">
										<td>
											<div>${orderList.orderCode} </div>
											<div><a href="${contextPath}/admin/orderDetail?orderCode=${orderList.orderCode}&memberId=${orderList.memberId}" onClick="window.open(this.href, '', 'width=780, height=700'); return false;">[상세보기]</a></div>
										</td>
										<td>${orderList.memberId}</td>
										<td><img src="${contextPath}/images/${orderList.productMainImage}" width="40" height="40"></td>
										<td>${orderList.productName}</td>
										<td>${orderList.paymentAmount}</td>			
										<td>${orderList.orderCount}</td>
										<td>${orderList.orderDate}</td>
											<c:choose>
													<c:when test="${orderList.paymentState == 1 && orderList.cancelState == false}">
														<td>
															<div>결제완료</div>
														</td>
													</c:when>
													<c:when test="${orderList.paymentState == 2 && orderList.cancelState == false}">
														<td>
															<div>배송준비중</div>
														</td>
													</c:when>
													<c:when test="${orderList.paymentState == 2 && orderList.cancelState == false}">
														<td>
															<div>배송준비중 </div>
															<br>
														</td>
													</c:when>
													<c:when test="${orderList.paymentState == 3 && orderList.cancelState == false}">
														<td>
															<div>배송중</div>
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
												<div>-</div>
											</c:if>										
											<c:if test="${orderList.deliveryCode eq null && orderList.paymentState == 2}">
												<div>-</div>
											</c:if>
											
											<c:if test="${orderList.deliveryCode ne null && orderList.paymentState == 2}">
												<div>${orderList.deliveryCode}</div>
											</c:if>
											
											<c:if test="${orderList.deliveryCode eq null && orderList.paymentState == 3}">
												<div>-</div>
											</c:if>
											
											<c:if test="${orderList.deliveryCode ne null && orderList.paymentState == 3}">
												<div>${orderList.deliveryCode}</div>
											</c:if>										
											
											<c:if test="${orderList.paymentState == 4}">
												<div>${orderList.deliveryCode}</div>
											</c:if>
										</td>
										<td>
											<c:choose>
												<c:when test="${orderList.buyConfirmState == true && orderList.paymentState == 4}">
													<div>구매확정</div>
												</c:when>
												<c:otherwise>
													<div>-</div>
												</c:otherwise>
											</c:choose>
										</td>
									</c:if>
									<c:if test="${orderList.cancelState == true}">										
										<td>
										<div>${orderList.orderCode}<div>
										<div><a href="${contextPath}/admin/orderDetail?orderCode=${orderList.orderCode}&memberId=${orderList.memberId}" onClick="window.open(this.href, '', 'width=780, height=700'); return false;">[상세보기]</a></div>
										</td>
										<td>${orderList.memberId}</td>
										<td><img src="${contextPath}/images/${orderList.productMainImage}" width="40" height="40"></td>
										<td>${orderList.productName}</td>
										<td>${orderList.paymentAmount}</td>			
										<td>${orderList.orderCount}</td>
										<td>${orderList.orderDate}</td>
										<td>주문취소일</td>
										<td>${orderList.cancelDate}</td>
										<td>주문취소</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
					<div class="pageNumber2">
						<ul class="pageNum2">
							<c:if test="${pageMaker.prev}">
						      <li id="page"><a href="${contextPath}/admin/orderMgtMem${pageMaker.makeSearch(pageMaker.startPage - 1)}">[이전]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.prev}">
						      <li id="page"><a style="color: #808080;">[이전]</a></li>
						    </c:if>
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						      <li id="page"><a href="${contextPath}/admin/orderMgtMem${pageMaker.makeSearch(idx)}" ${idx == param.page ? 'style="color: #DC143C;"' : ''}>[${idx}]</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						      <li id="page"><a href="${contextPath}/admin/orderMgtMem${pageMaker.makeSearch(pageMaker.endPage + 1)}">[다음]</a></li>
						    </c:if>
						    
						    <c:if test="${!pageMaker.next}">
						      <li id="page"><a style="color: #808080;">[다음]</a></li>
						    </c:if>
						</ul>
					</div>				
					
		        
	</section>
	</c:if>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
<script>
	
	$("#search").hide();
	$("#search2").hide();
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};
	
	var searchType = getParameterByName("searchType");
	
	if(searchType == "nc") {
    	document.getElementById('nc').style.color = "#DC143C";		
	};
	
	if(searchType == "cc") {
    	document.getElementById('cc').style.color = "#DC143C";		
	};
	
	if(searchType == "p1") {
    	document.getElementById('p1').style.color = "#DC143C";		
	};
	
	if(searchType == "p2") {
    	document.getElementById('p2').style.color = "#DC143C";		
	};
	
	if(searchType == "p3") {
    	document.getElementById('p3').style.color = "#DC143C";		
	};
	
	if(searchType == "p4") {
    	document.getElementById('p4').style.color = "#DC143C";		
	};


</script>
</html>