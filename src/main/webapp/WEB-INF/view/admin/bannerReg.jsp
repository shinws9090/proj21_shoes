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

<!-- include summernote css/js-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/admin/js/summernote-ko-KR.js"></script>

<script type="text/javascript">
function summit(){
	let targetObject = $(".pageContent");
	
	if (targetObject.find("[name='bannerImage']").val() == ""){
		alert("이미지 미입력");
	
	} else{	
		var val = targetObject.find("[name='bannerImage']").val();
		var realname = val.substring(12)
		var j = JSON.parse('${fileNames}');
		for(var i = 0; i < j.length; i++){
			if(realname == j[i]){
				return alert("이미지 이름 중복");
			};
		};
		
		var summitForm = document.bannerRegForm;
		summitForm.submit();
		alert("배너등록 완료");
		opener.location.reload();
	};
};

opener.location.reload();

</script>
</head>
<style>

h1.mt-4 {
    display: inline-block;
}

.btn_section {
    display: inline-block;
}

.from_RegSection1 {
    display: inline-block;
    vertical-align: top;
    margin-right: 50px;
}

.from_RegSection2 {
    display: inline-block;
    vertical-align: top;
    margin-right: 50px;
}

.from_RegSection3 {
	display: inline-block;
	vertical-align: top;
	margin-right: 50px;
}

.from_RegSection4 {
	display: inline-block;
	vertical-align: top;
	margin-right: 50px;
}

.pageContent-wrapper {
	margin-left: 50px;
}

</style>
<body>
	<section class="adminSection">
			<!-- Page content-->
			<h1 class="mt-4">배너 추가</h1>
			<div class="pageContent">
			<%-- <%=request.getRealPath("/") %> --%>
			<form id="bannerRegForm" name="bannerRegForm" method="post" autocomplete="off" enctype="multipart/form-data">
						<div class="form_section">
							<div class="form_section_title">
								<label>배너이미지</label>
							</div>
							<div class="form_section_content">
								<input type="file" id="bannerImage" name="bannerImage" value="" />
								<div class="select_img"><img src="" /></div>
							</div>
						</div>
						
						<script>
							$("#bannerImage").change(function(){
								if(this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_img img").attr("src", data.target.result).width(1000);        
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
						</script>
						<%-- <%=request.getRealPath("/") %> --%>
						
				</form>
				<div class="btn_section">
					<input type="button" id="new" onclick="summit()" value="추가">
				</div>
				</div>
	</section>

	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />

</body>
</html>