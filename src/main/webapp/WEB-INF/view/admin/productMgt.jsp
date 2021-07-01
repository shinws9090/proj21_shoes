<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
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
	$(function() {
		var contextPath = "${contextPath}";
		
		$('#new').on("click", function(e) {
			location.href="${contextPath}/admin/product/productReg";
		});		
		
		$.get(contextPath + "/api/productMgt", function(json) {
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				var i = dataLength -1
				for (i; i >= 0; i--) {
					sCont += "<tr>";
					sCont += "<td>" + json[i].productCode + "</td>";
					sCont += "<td>" + json[i].productName + "</a></td>";
					sCont += "<td>" + json[i].brand.brandName + "</td>";
					sCont += "<td>" + json[i].gender + "</td>";
					sCont += "<td>" + json[i].category.category + "</td>";
					sCont += "<td>" + json[i].costPrice + "</td>";
					sCont += "<td>" + json[i].sellPrice + "</td>";
					sCont += "<td>" + json[i].registDate + "</td>";
					sCont += "<td><button type='button'><a href='productDetailMgt?productCode=" + json[i].productCode + "'>상세관리</a></button></td>";
					sCont += "<td><button type='button'><a href='product/productOrderOption?productCode=" + json[i].productCode + "'>재고관리</a></button></td>";
					sCont += "</tr>";
				}
				$("#load:last-child").append(sCont);
			}
		});
	});
</script>

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
			<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
		            <table style="width:100%">
						<tr>
							<td colspan="7" class="td_title"><h1 class="mt-4">상품 목록</h1></td>
						</tr>
			
						<tr style="background-color: lightgrey; text-align: center">
							<td>번호</td>
							<td>상품명</td>
							<td>브랜드</td>				
							<td>성별</td>
							<td>카테고리</td>
							<td>원가</td>
							<td>판매가격</td>
							<td>등록일</td>
							<td>상세관리</td>
							<td>재고관리</td>
			
						</tr>
						<tr>
							<tbody id="load"/>				
						</tr>
					</table>
					
					<h1 class="mt-4">상품 추가</h1>
					<div class="btn_section">
						<button type="button" id="new">등록</button>
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
</html>