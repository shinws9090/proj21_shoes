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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styleAdmin.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};
	
	var contextPath = "<%=request.getContextPath()%>";
	var productCode = getParameterByName("productCode");	
	
	$('#modify_btn').on("click", function(e) {
		location.href="${contextPath}/admin/product/productMod?productCode="+ productCode;
	});
	
	$('#delete_btn').on("click", function(e) {
		if(!confirm("정말 삭제하시겠습니까?")) {
		} else {
			location.href="${contextPath}/admin/product/productDel?productCode=" + productCode;
		}
	});		
	
	$.get(contextPath + "/api/productMgt/"+productCode,
		function(jsonP) {
			var sCont = "";
				sCont += "<tr>";
				sCont += "<td productCode='productCode'>" + jsonP.productCode + "</td>";
				sCont += "<td>" + "<a href='${contextPath}/productDetail/" + jsonP.productCode + "'/a>" + jsonP.productName + "</td>";
				sCont += "<td>" + jsonP.brand.brandName + "</td>";
				sCont += "<td>" + jsonP.gender + "</td>";
				sCont += "<td>" + jsonP.category.category + "</td>";
				sCont += "<td>" + "<a href='${contextPath}/productDetail/" + jsonP.productCode + "'/a>" + "<img src='${contextPath}/images/" + jsonP.productPost.productMainImage + "' width='200'/>" + "</td>";
				sCont += "<td>" + jsonP.costPrice + "</td>";
				sCont += "<td>" + jsonP.sellPrice + "</td>";
				sCont += "<td>" + jsonP.registDate + "</td>";
				sCont += "<td>" + jsonP.cumulativeRegistCount + "</td>";
				sCont += "<td>" + jsonP.cumulativeSellCount + "</td>";
				sCont += "</tr>";
			$("#load1:last-child").append(sCont);
		});
	
	$.get(contextPath + "/api/orderOption/"+productCode,
		function(jsonO) {
			for(var i = 0; i < jsonO.length; i++){
				var sCont = "";
					sCont += "<tr>";
					sCont += "<td productCode='productCode'>" + jsonO[i].productCode + "</td>";
					sCont += "<td>" + jsonO[i].styleCode + "</td>";
					sCont += "<td>" + jsonO[i].color + "</td>";										
					sCont += "<td>" + jsonO[i].size + "</td>";
					sCont += "<td>" + jsonO[i].stock + "</td>";
					sCont += "<td>" + "<button type='button'><a href='${contextPath}/admin/product/productOrderOptionMod?productCode=" + jsonO[i].productCode + '&styleCode=' + jsonO[i].styleCode + '&color=' + jsonO[i].color + '&size='+ jsonO[i].size + '&nowStock='+ jsonO[i].stock + "'>재고수정</a></button>" + "</td>";
					sCont += "</tr>";
				$("#load2:last-child").append(sCont);
			}
			
			var lastData = jsonO.length - 1;
			document.getElementById("styleCode").value = jsonO[lastData].styleCode;
			document.getElementById("color").value = jsonO[lastData].color;
		});	
});

function submit(){
	var submitForm = document.productOrderOptionForm;
	
	submitForm.submit();
	alert("재고등록 완료");
}

opener.location.reload();

</script>
</head>
<style>

</style>
<body>
	<section>		
		<h1 class="mt-4">재고 등록</h1>

		<div>
			<form id="productOrderOptionForm" name="productOrderOptionForm" method="post" autocomplete="off">

				<div class="form_section" hidden="true">
					<div class="form_section_title">
						<label>상품코드</label>
					</div>
					<div class="form_section_content">
						<input name="productCode" id="productCode" value="${products.productCode}">
					</div>
				</div>
				
				<div class="form_section">
					<div class="form_section_title">
						<label>스타일코드</label>
					</div >
					<div class="form_section_content">
						<input name="styleCode" id="styleCode" value="">
					</div>
				</div>					
				
				<div class="form_section">
					<div class="form_section_title">
						<label>색상</label>
					</div>
					<div class="form_section_content">
						<input name="color" id="color" value="">
					</div>
				</div>
				
				<div class="form_section">
					<div class="form_section_title">
						<label>사이즈</label>
					</div>
					<div class="form_section_content">
						<input name="size" value="">
					</div>
				</div>
				
				<div class="form_section">
					<div class="form_section_title">
						<label>재고수량</label>
					</div>
					<div class="form_section_content">
						<input name="stock" value="">
					</div>
				</div>
			</form>
			<div class="btn_section">
				<input type="button" id= "new_btn" onclick="submit()" value="재고등록">
			</div>
		</div>
	</section>

	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>