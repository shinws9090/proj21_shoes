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
		var brandCode = getParameterByName("brandCode")
		location.href="${contextPath}/admin/product/brandDel?brandCode=" + brandCode;
	});
		
	var jsonData = JSON.parse('${brandList}');
	var productCode = jsonData[0].productCode
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
<script>
	//컨트롤러에서 브랜드 데이터 받기
	var jsonData = JSON.parse('${brandList}');
	console.log(jsonData);
	
	var brandArr = new Array();
	var brandObj = new Object();
	
	// 브랜드 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		brandObj = new Object();  //초기화
		brandObj.brandCode = jsonData[i].brandCode;
		brandObj.brandName = jsonData[i].brandName;
		brandArr.push(brandObj);	 
	}
	
	// 브랜드 셀렉트 박스에 데이터 삽입
	var brandSelect = $("select.brand")

	for(var i = 0; i < brandArr.length; i++) {
		brandSelect.append("<option value='" + brandArr[i].brandCode + "'>"
	      + brandArr[i].brandName + "</option>"); 
	}

	// 컨트롤러에서 카테고리 데이터 받기
	var jsonData = JSON.parse('${categoryList}');
	console.log(jsonData);
	
	var categoryArr = new Array();
	var categoryObj = new Object();
	
	// 카테고리 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		categoryObj = new Object();  //초기화
		categoryObj.productCategoryCode = jsonData[i].productCategoryCode;
		categoryObj.category = jsonData[i].category;
		categoryArr.push(categoryObj);	 
	}
	
	// 카테고리 셀렉트 박스에 데이터 삽입
	var categorySelect = $("select.category")

	for(var i = 0; i < categoryArr.length; i++) {
		categorySelect.append("<option value='" + categoryArr[i].productCategoryCode + "'>"
	      + categoryArr[i].category + "</option>"); 
	}
	
	// 컨트롤러에서 직원 데이터 받기
	var jsonData = JSON.parse('${employeeList}');
	console.log(jsonData);
	
	var employeeArr = new Array();
	var employeeObj = new Object();
	
	// 직원 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		employeeObj = new Object();  //초기화
		employeeObj.empNumber = jsonData[i].empNumber;
		employeeObj.empName = jsonData[i].empName;
		employeeArr.push(employeeObj);	 
	}
	
	// 직원 셀렉트 박스에 데이터 삽입
	var employeeSelect = $("select.employee")

	for(var i = 0; i < employeeArr.length; i++) {
		employeeSelect.append("<option value='" + employeeArr[i].empNumber + "'>" + employeeArr[i].empNumber + " : "
	      + employeeArr[i].empName + "</option>"); 
	}
</script>

</body>
</html>