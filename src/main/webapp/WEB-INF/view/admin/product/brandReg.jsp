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

function submit(){
	let targetObject = $(".brandReg");
	
	if (targetObject.find("[name='brandCode']").val() == "" ){
		alert("브랜드코드 미입력");
	
	} else if(targetObject.find("[name='brandName']").val() == "" ) {
		alert("브랜드명 미입력");
		
	} else if(targetObject.find("[name='brandEngName']").val() == "" ) {
		alert("브랜드영어명 미입력");
		
	} else if(targetObject.find("[name='brandImage']").val() == "" ) {
		alert("브랜드로고 미입력");
		
	} else {
		var submitForm = document.brandRegForm;
		submitForm.submit();
		alert("브랜드 추가완료");
	};
};

opener.location.reload();

</script>
<style>

.btn_section {
    margin-top: 5px;
}

.contentbrand{
	display: inline-block;
	margin-right: 10px;
}

.imagebrand{
	display: inline-block;
    vertical-align: top;
}

section.adminSection {
    margin-top: 60px;
}

</style>
</head>
<body>
	<section class="adminSection">
		<h1 class="mt-4">브랜드 추가</h1>
			<div class="brandReg">
			<form id="brandRegForm" name="brandRegForm" method="post" autocomplete="off" enctype="multipart/form-data">
				<div class="contentbrand">
					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드코드</label>
						</div>
						<div class="form_section_content">
							<input name="brandCode" value="">
						</div>
					</div>
	
					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드명</label>
						</div>
						<div class="form_section_content">
							<input name="brandName" value="">
						</div>
					</div>
					
					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드영어명</label>
						</div>
						<div class="form_section_content">
							<input name="brandEngName" value="">
						</div>
					</div>
				</div>
				
				<div class="imagebrand">
					<div class="form_section">
						<div class="form_section_title">
							<label>브랜드로고</label>
						</div>
						<div class="form_section_content">
							<input type="file" id="brandImage" name="brandImage" value="" />
							<div class="select_img"><img src="" /></div>
						</div>
					</div>
					
					<script>
						$("#brandImage").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src", data.target.result).width(200);        
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script>
				</div>
				<%-- <%=request.getRealPath("/") %> --%>
				
			</form>
					
			<div class="btn_section">
				<input type="button" id= "new_btn" onclick="submit()" value="추가">
			</div>
			
		</div>
	</section>

	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>