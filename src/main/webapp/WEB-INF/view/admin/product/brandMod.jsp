<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>lighten</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	var contextPath = "<%=request.getContextPath()%>";	
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}	
	
	$('#cancel').on("click", function(e) {
		location.href="${contextPath}/admin/product/brandReg";
	});

	
	$('#delete_btn').on("click", function(e) {
		if(!confirm("정말 삭제하시겠습니까?")) {
		} else {			
			var brandCode = getParameterByName("brandCode")
			location.href="${contextPath}/admin/product/brandDel?brandCode=" + brandCode;
		}
	});
		
	var jsonData = JSON.parse('${brandList}');
	for(var i = 0; i < jsonData.length; i++) {		
		if (getParameterByName("brandCode") == jsonData[i].brandCode){
			var sCont = "";
				sCont += "<tr>";
				sCont += "<td>" + jsonData[i].brandCode + "</td>";
				sCont += "<td>" + jsonData[i].brandName + "</td>";
				sCont += "<td>" + jsonData[i].brandEngName + "</td>";
				sCont += "</tr>";
			$("#load:last-child").append(sCont);
		}
	}	
	
	for(var i = 0; i < jsonData.length; i++) {		
		if (getParameterByName("brandCode") == jsonData[i].brandCode){
			document.getElementById("brandCode").value = jsonData[i].brandCode;
			document.getElementById("brandName").value = jsonData[i].brandName;
			document.getElementById("brandEngName").value = jsonData[i].brandEngName;
		}
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
		<jsp:include page="/WEB-INF/view/admin/include/adminMenu.jsp" />
		<jsp:include page="/WEB-INF/view/admin/include/productMenu.jsp" />
		
		<table style="width: 80%">
			<tr>
				<td colspan="7" class="td_title"><h2>브랜드 목록</h2></td>
			</tr>

			<tr style="background-color: lightgrey; text-align: center">
				<td>브랜드코드</td>
				<td>브랜드명</td>
				<td>브랜드영어명</td>
			</tr>
			<tr>
				<tbody id="load"/>
			</tr>
		</table>
		
		<h2>브랜드 수정</h2>
		<div class="admin_content_wrap">
			<div class="admin_content_main">
				<form id="productRegForm" method="post" autocomplete="off" enctype="multipart/form-data">

					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드 코드</label>
						</div>
						<div class="form_section_content">
							<input name="brandCode" id="brandCode" value="" readonly>
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드명</label>
						</div>
						<div class="form_section_content">
							<input name="brandName" id="brandName" value="">
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드영어명</label>
						</div>
						<div class="form_section_content">
							<input name="brandEngName" id="brandEngName" value="">
						</div>
					</div>
					
					<div class="btn_section">
						<button type="submit" id="new">수정</button>
						<button type="button" id="cancel">돌아가기</button>
						<button type="button" id="delete_btn">삭제</button>
					</div>

				</form>


			</div>
		</div>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>

</body>
</html>