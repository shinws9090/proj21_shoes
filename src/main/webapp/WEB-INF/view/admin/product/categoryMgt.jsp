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
$(function(){
	$('#new_btn').on("click", function(e) {
		window.open("${contextPath}/admin/product/categoryReg", "PopupWin2", "width=500, height=350");
	});
	
	var jsonData = JSON.parse('${categoryList}');
	for(var i = jsonData.length -1; i >= 0; i--) {
		var sCont = "";
			sCont += "<tr>";
			sCont += "<td>" + jsonData[i].productCategoryCode + "</td>";
			sCont += "<td>" + jsonData[i].category + "</td>";
			sCont += "<td><button type='button'><a href='${contextPath}/admin/product/categoryMod?categoryCode=" + jsonData[i].productCategoryCode + "'>수정</a></button>" 
					+ "&nbsp" + "<button type='button'><a href='${contextPath}/admin/product/categoryDel?categoryCode=" + jsonData[i].productCategoryCode + "'>삭제</a></button></td>";
			sCont += "</tr>";		
		$("#load:last-child").append(sCont);	
	}
	
});
</script>
</head>
<body class="main-layout">

	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->
	
	<section>
		<div class="d-flex" id="wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />
		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
		            <div><h1 class="mt-4">카테고리 목록</h1></div>
		            
		            <div class="btn_new">
						<button type="button" id="new_btn">카테고리 추가</button>
					</div>
		            
		            <table style="width: 90%; text-align: center">
		            
						<tr style="background-color: lightgrey; text-align: center">
							<td>카테고리코드</td>
							<td>카테고리명</td>
							<td>관리</td>
						</tr>
						
						<tr>
							<tbody id="load"/>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>