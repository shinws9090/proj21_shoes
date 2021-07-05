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
	var contextPath = "<%=request.getContextPath()%>";
				
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};
		
 	var styleCode = getParameterByName("styleCode");
	var color = getParameterByName("color");
	var size = getParameterByName("size");
	var nowStock = getParameterByName("nowStock");
	
	document.getElementById("styleCode").value = styleCode;
	document.getElementById("color").value = color;
	document.getElementById("size").value = size;
	document.getElementById("nowStock").value = nowStock;
	
	$("#sel_productCode").text(productCode);
	$("#sel_styleCode").text(styleCode);
	$("#sel_color").text(color);
	$("#sel_size").text(size);
	$("#sel_stock").text(nowStock);

	$('#delete_btn').on("click", function(e) {
		if(!confirm("정말 삭제하시겠습니까?")) {
		} else {			
			location.href="${contextPath}/admin/product/productOrderOptionDel?productCode=" + productCode + "&styleCode=" + styleCode + "&color=" + color + "&size=" + size;
		}
	});
	
});

function submit(){
	var submitForm = document.productOrderOptionForm;
	
	submitForm.submit();
	alert("재고변경 완료");
}

opener.location.reload();

</script>
</head>
<body>
	<section>	
       	<h1 class="mt-4">재고 수정</h1>

			<div>
				<form id="productOrderOptionForm" name="productOrderOptionForm" method="post" autocomplete="off">

					<div class="form_section" hidden="true">
						<div class="form_section_title">
							<label>상품코드</label>
						</div>
						<div class="form_section_content">
							<input name="productCode" id="productCode" value="${products.productCode}" readonly>
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>스타일코드</label>
						</div >
						<div class="form_section_content">
							<input name="styleCode" id="styleCode" value="" readonly>
						</div>
					</div>					
					
					<div class="form_section">
						<div class="form_section_title">
							<label>색상</label>
						</div>
						<div class="form_section_content">
							<input name="color" id="color" value="" readonly>
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>사이즈</label>
						</div>
						<div class="form_section_content">
							<input name="size" id="size" value="" readonly>
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>현재재고</label>
						</div>
						<div class="form_section_content">
							<input name="nowStock" id="nowStock" value="" readonly>
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>변경재고</label>
						</div>
						<div class="form_section_content">
							<input name="stock" id="stock" value="">
						</div>
					</div>
					
				</form>
				<div class="btn_section">
					<input type="button" id= "new_btn" onclick="submit()" value="재고변경">
					<button type="button" id= "delete_btn">재고삭제</button>
				</div>
			</div>
	</section>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>