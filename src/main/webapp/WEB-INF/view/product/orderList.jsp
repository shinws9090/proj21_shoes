<%@page import="proj21_shoes.dto.Order"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<c:set var="order" value="<%=request.getSession().getAttribute(\"order\")%>" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>이런신발</title>
<link rel="stylesheet" href="${contextPath}/css/style.css">
<link rel="stylesheet" href="${contextPath}/css/orderList.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}"
	
	/*전채가격 설정*/
	var priceHal = 0;
	var priceAll = 0;
	var priceEnd = 0;
	function priceAllmethod() {
		$(".price").each(function() {
			priceAll += Number($(this).text().trim().replace(",","").replace(",",""));
		});
		$("#priceAll").text(String(priceAll).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		priceHal = priceAll*Number("${order.memberCode.gradeCode.salePrice }");
		$("#priceHal").text(String(priceHal).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		priceEnd = priceAll-priceHal;
		$("#priceEnd").text(String(priceEnd).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#priceSel").val(priceEnd);
	}
	priceAllmethod();
	
	
	 /* 포인트 계산 */
	function pointSel(){
		var point = Number("${order.memberCode.point}");
		var inputPoint = Number($("#point").val());
		if(inputPoint > point){
			$("#point").val(point);
		}else if(inputPoint > priceEnd){
			$("#point").val(priceEnd);
		}
		var a = priceHal + Number($("#point").val());
		var b = priceAll - a;
		
		$("#priceHal").text(String(priceHal).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#pricePoint").text(String($("#point").val()).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#priceEnd").text(String(b).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#priceSel").val(b);
	}
	
	$("#point").on("change",function(){
		pointSel()
	});
	
	
	
	
	$("#pointAll").on("click",function(){
		var isChecked = $(this).is(":checked") ;
		if(isChecked){
			$("#point").val(Math.floor(Number("${order.memberCode.point}")/100)*100);
			pointSel()
		}else{
			$("#point").val(0);
			pointSel()
		}
	});
	
	
});

function testDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					var roadAddr = data.address; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					document.getElementById('zipCode').value = data.zonecode;  /* 우편번호 */
					document.getElementById("address").value = roadAddr+"("+data.jibunAddress+")" ;  /* 도로명주소 */
				}
			}).open();
}
function memberAddress() {
	$("#recipient").val("${order.memberCode.memberId.memberName}");
	$("#zipCode").val("${order.memberCode.memberId.zipCode}");
	$("#address").val("${order.memberCode.memberId.address}");
	$("#detail_address").val("${order.memberCode.memberId.detailAddress}");
	$("#tel").val("${order.memberCode.memberId.tel}");
}
function newAddress() {
	$("#recipient").val("");
	$("#zipCode").val("");
	$("#address").val("");
	$("#detail_address").val("");
	$("#tel").val("");
}
</script>
</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>

	<section>
	<%-- ${sessionMember}
		주문코드 = ${order.orderCode } <br>
		회원코드 = ${order.memberCode }<br>
		주문일 = ${order.orderDate }<br>
		결제금액 = ${order.paymentAmount }<br>
		결제여부 = ${order.paymentState }<br>
		배송코드 = ${order.deliveryCode }<br>
		구매확정여부 = ${order.buyConfirmState }<br>
		orderProduct = ${order.orderProduct }<br>
		address = ${order.address }<br> --%>
		<%-- ${productList} --%>
			<table>
				<thead>
				<tr>
					<th>상품코드 </th>
					<th>스타일코드 </th>
					<th>대표이미지 </th>
					<th>상품명 </th>
					<th>가격 </th>
					<th>수량 </th>
					<th>색상 </th>
					<th>사이즈 </th>
				</tr>
				</thead>
				<tbody>	
					<c:forEach var="orderProduct" items="${order.orderProduct}">
					<tr>
						<td>${orderProduct.orderOption.productCode} </td>
						<td>${orderProduct.orderOption.styleCode} </td>
						<c:forEach var="p" items="${productList}">
							<c:if test="${orderProduct.orderOption.productCode == p.productCode}">
								<td> <img src="${contextPath}/images/${p.productPost.productMainImage}"></td>
								<td>${p.productName} </td>
								<td class="price" data-sellprice="${p.sellPrice}">
									<fmt:formatNumber value="${p.sellPrice*orderProduct.orderCount}"/></td>
							</c:if>
						</c:forEach>
						<td>
							${orderProduct.orderCount} 
						</td>
						<td>${orderProduct.orderOption.color}</td>
						<td>${orderProduct.orderOption.size} </td>
					</tr>	
					</c:forEach>
				</tbody>
			</table>
		<form action="addOrder" method="post">
		<div>
			<table>
			<thead>
				<tr> 
					<th>총 주문 금액</th>
					<th>할인 금액</th>
					<th>포인트 적용 금액</th>
					<th>결제예정 금액</th>
				</tr>
			</thead>
				<tr> 
					<td id="priceAll"> </td>
					<td id="priceHal"> </td>
					<td id="pricePoint">0</td>
					<td id="priceEnd"> </td>
				</tr>
				<tr>
					<td> 포인트  : </td>
					<td colspan="3" style="text-align: left"> 
					<input id="point" name="point" type="number" min="0" max="${order.memberCode.point}" step="100"/>
					<span>사용가능 : <em>${order.memberCode.point}</em>P </span>
					<label><input type="checkbox" id="pointAll"> 전체사용  <em>(100Point 단위로 사용가능)</em></label>
					</td>
				</tr>
			</table>
		</div>
			<input type="hidden" id="priceSel" name="priceSel">
			<table id="address-table">
				<tr> 
					<th>배송지선택</th>
					<td> 
					<label><input type="radio" name="address-option" value="member" onclick="memberAddress()">회원정보와 동일</label>
					<label><input type="radio" name="address-option" value="new" onclick="newAddress()">새로운 배송지</label>
					</td>
				</tr>
				<tr> 
					<th>받으시는 분</th>
					<td>
					<input type="text" id="recipient" name="recipient">
					</td>
				</tr>
				<tr> 
					<th>주소</th>
					<td>
					<input type="text" id="zipCode" name="zipCode" readonly required> <span onclick="testDaumPostcode()">우편번호</span> <br>
					<input type="text" id="address" name="address" readonly required> <span>기본주소</span> <br>
					<input type="text" id="detail_address" name="detailAddress"> <span>상세주소</span>
					</td>
				</tr>
				<tr> 
					<th>연락처</th>
					<td>
					<input type="tel" id="tel" name="tel">
					</td>
				</tr>
			</table>
			<input type="submit" class="btn btn-outline-secondary" value="결재하기">
		</form>
	</section>
		
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>