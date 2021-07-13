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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/table.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>

section {
    padding-top: 0px;
}

.tbl_type {
    margin-left: 5%;
}

#myPage {
    margin-bottom: 0px;
}

</style>
</head>
<body class="main-layout">
	<div id="myPage">
		<section id="maPage">
			<!-- 최근 주문내역 테이블  -->
			<br>
			<h4>주문 상세내역</h4>
			<br>
			<table class="tbl_type" border="1">
				<tr>
					<td>${orderDetail.productName }</td>
				</tr>
				<tr>
					<td><img style="max-width: 20%; max-height: 20%;" alt=""
						src="${contextPath}/images/${orderDetail.productMainImage }"></td>
				</tr>


			</table>

			<br>
			<table class="tbl_type" border="1">

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
					<td>${orderDetail.orderCode }</td>
					<!-- 주문일 -->
					<td>${orderDetail.orderDate }</td>
					<%-- 		<td><img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myOrderDetail.productMainImage }"></td> --%>
					<!-- 상품명 -->
					<td><a
						href="${contextPath}/productDetail/${orderDetail.productCode}">${orderDetail.productName }<br>[상품
							주문페이지]
					</a></td>
					<!-- 1개당 판매금액 -->
					<td>${orderDetail.selPrice }원</td>
					<!--  색상 -->
					<td>${orderDetail.color }</td>
					<!-- 사이즈 -->
					<td>${orderDetail.size }</td>
					<!-- 구매수량 -->
					<td>${orderDetail.orderCount }</td>


				</tr>


			</table>
			<br> <br>
			<h4>결제정보</h4>
			<table class="tbl_type" border="1">

				<tr>
					<td>구매금액</td>
					<td>등급할인금액</td>
					<td>포인트 사용금액</td>
					<td>최종결제금액</td>
					<td>적립금액</td>
				</tr>

				<tr>
					<!-- 총 구매금액 -->
					<td>${orderDetail.allSelPrice }원</td>
					<!-- 등급할인금액 -->
					<td>${orderDetail.gradeHal }원</td>
					<!-- 포인트 사용금액 -->
					<td>${orderDetail.point }원</td>
					<!-- 최종결제금액 -->
					<td>${orderDetail.lastPrice }원</td>
					<!-- 적립금액  -->
					<td>${pointDel }포인트</td>


				</tr>


			</table>



			<br> <br>
			<h4>배송지 입력정보</h4>
			<table class="tbl_type" border="1">

				<tr>
					<td>받는 사람</td>
					<td>연락처</td>
					<td>우편번호</td>
					<td>주소</td>
					<td>상세주소</td>
					<td>송장번호</td>
				</tr>

				<tr>
					<td>${orderDetail.recipient }</td>
					<td>${orderDetail.tel }</td>
					<td>${orderDetail.zipCode }</td>
					<td>${orderDetail.address }</td>
					<td>${orderDetail.detailAddress }</td>
					<td>${orderDetail.deliveryCode }</td>

				</tr>


			</table>

		</section>
	</div>
</body>
</html>