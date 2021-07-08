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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/Adminstyle.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

function submit(){
	var submitForm = document.categoryModForm;
	
	submitForm.submit();
	alert("카테고리 수정완료");
}

opener.location.reload();

</script>
</head>
<body>
	<section>
	<h1 class="mt-4">카테고리 수정</h1>
		<div>
			<form id="categoryModForm" name="categoryModForm" method="post" autocomplete="off">

				<div class="form_section">
					<div class="form_section_title">
						<label>카테고리 코드</label>
					</div>
					<div class="form_section_content">
						<input name="productCategoryCode" id="productCategoryCode" value="${categorys.productCategoryCode}" readonly>
					</div>
				</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>카테고리명</label>
					</div>
					<div class="form_section_content">
						<input name="category" id="category" value="${categorys.category}">
					</div>
				</div>
			</form>
			
			<div class="btn_section">
				<input type="button" id= "new_btn" onclick="submit()" value="수정">
			</div>
			
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>