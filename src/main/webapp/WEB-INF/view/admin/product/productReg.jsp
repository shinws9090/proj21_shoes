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

$(function(){
	$("#prev").hide();
	$("#new").hide();
	$("#from_RegSection2").hide();
	$("#from_RegSection3").hide();
	
	
	$('#prev').on("click", function(e) {
		$("#new").hide();
		$("#prev").hide();
		$("#next").show();
		$("#from_RegSection1").show();
		$("#from_RegSection4").show();
		$("#from_RegSection2").hide();
		$("#from_RegSection3").hide();
	});
	
	$('#next').on("click", function(e) {
		$("#new").show();
		$("#prev").show();
		$("#next").hide();
		$("#from_RegSection1").hide();
		$("#from_RegSection4").hide();
		$("#from_RegSection2").show();
		$("#from_RegSection3").show();
	});
	
	
});

function reloadOpener(){
	window.opener.location.reload();
}

function summit(){
	let targetObject = $(".pageContent-wrapper");
	
	if (targetObject.find("[name='employee']").val() == "" ){
		alert("사원 미입력");
	
	} else if(targetObject.find("[name='productCode']").val() == "" ) {
		alert("제품코드 미입력");
		
	} else if(targetObject.find("[name='productName']").val() == "" ) {
		alert("제품명 미입력");
		
	} else if(targetObject.find("[name='brand']").val() == "" ) {
		alert("브랜드 미입력");
		
	} else if(targetObject.find("[name='gender']").val() == "" ) {
		alert("성별 미입력");
		
	} else if(targetObject.find("[name='category']").val() == "" ) {
		alert("카테고리 미입력");
		
	} else if(targetObject.find("[name='season']").val() == "" ) {
		alert("계절 미입력");
		
	} else if(targetObject.find("[name='madeDate']").val() == "" ) {
		alert("제조일 미입력");
		
	} else if(targetObject.find("[name='costPrice']").val() == "" ) {
		alert("공급가격 미입력");

	} else if(targetObject.find("[name='sellPrice']").val() == "" ) {
		alert("판매가격 미입력");
		
	} else if(targetObject.find("[name='content']").val() == "" ) {
		alert("내용 미입력");
		
	} else if(targetObject.find("[name='productMainImage']").val() == "" ) {
		alert("대표이미지 미입력");
		
	} else if(targetObject.find("[name='images']").val() == "" ) {
		alert("이미지 미입력");
		
	} else {	
		var summitForm = document.productRegForm;
		summitForm.submit();
		alert("상품추가 완료");
	};
	
};


$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: 'content',
		minHeight: 400,
		maxHeight: null,
		focus: true, 
		lang : 'ko-KR'
	});
});

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
	    <div class="pageContent-wrapper">		        
			<!-- Page content-->
			<h1 class="mt-4">상품 등록</h1>
			<div class="btn_section">
				<button type="button" id="prev">이전</button>
				<button type="button" id="next">다음</button>
				<input type="button" id="new" onclick="summit()" value="상품추가">
			</div>
			<form id="productRegForm" name="productRegForm" method="post" autocomplete="off" enctype="multipart/form-data">
					<div class="from_RegSection1" id="from_RegSection1">
						<div class="form_section">
							<div class="form_section_title">
								<label>등록사원정보</label>
							</div>
							<div class="form_section_content">
								<select name="employee" class="employee" style="width:175px;">
									<option selected="selected" value="">등록사원을 선택해주세요</option>
								</select>
							</div>
						</div>
						
						<div class="form_section">
							<div class="form_section_title">
								<label>상품코드</label>
							</div>
							<div class="form_section_content">
								<input name="productCode" value="">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>상품명</label>
							</div>
							<div class="form_section_content">
								<input name="productName" value="">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>브랜드</label>
							</div>
							<div class="form_section_content">
								<select name="brand" class="brand" style="width:175px;">
									<option selected="selected" value="">브랜드를 선택해주세요</option>
								</select>
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>성별</label>
							</div>
							<div class="form_section_content">
								<select name="gender" class="gender" style="width:175px;">
									<option selected="selected" value="" style="width:310px;">옵션을 선택해주세요</option>
								</select>
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>카테고리</label>
							</div>
							<div class="form_section_content">
								<select name="category" class="category" style="width:175px;">
									<option selected="selected" value="">카테고리를 선택해주세요</option>
								</select>
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>소재</label>
							</div>
							<div class="form_section_content">
								<input name="material" value="">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>계절</label>
							</div>
							<div class="form_section_content">
								<input name="season" value="">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>제조일</label>
							</div>
							<div class="form_section_content">
								<input type="date" name="madeDate" style="width:170px;">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>공급가격</label>
							</div>
							<div class="form_section_content">
								<input name="costPrice" value="">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_title">
								<label>판매가격</label>
							</div>
							<div class="form_section_content">
								<input name="sellPrice" value="">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_content">
								<c:set var="now" value="<%=LocalDateTime.now()%>" />
								<input type="hidden" type="date" name="registDate"
									value='<tf:formatDateTime value="${now}" pattern = "yyyy-MM-dd" />'
									readonly="readonly">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_content">
								<input type="hidden" name="cumulativeRegistCount" value="0">
							</div>
						</div>
	
						<div class="form_section">
							<div class="form_section_content">
								<input type="hidden" name="cumulativeSellCount" value="0">
							</div>
						</div>															
						
					</div>
					
					<div class="from_RegSection4" id="from_RegSection4">						
						<div class="form_section">
							<div class="form_section_title">
								<label>내용</label>
							</div>
							<div class="form_section_content">
								<textarea name="content" id="summernote" ></textarea>
							</div>
						</div>
					</div>
					
													
					<div class="from_RegSection2" id="from_RegSection2">
						<div class="form_section">
							<div class="form_section_title">
								<label>상품대표이미지</label>
							</div>
							<div class="form_section_content">
								<input type="file" id="productMainImage" name="productMainImage" />
								<div class="select_img"><img src="" /></div>
							</div>
						</div>
						
						<script>
							$("#productMainImage").change(function(){
								if(this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_img img").attr("src", data.target.result).width(400);        
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
						</script>						
						<%-- <%=request.getRealPath("/") %> --%>						
					</div>
					
					<div class="from_RegSection3" id="from_RegSection3">
						<div class="form_section">
							<div class="form_section_title">
								<label>상품이미지들</label>
							</div>
							<div class="form_section_content">
								<input type="file" id="images" name="images" />
								<div class="select_imgs"><img src="" /></div>					
							</div>
						</div>								
						
						<script>
							$("#images").change(function(){
								if(this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_imgs img").attr("src", data.target.result).width(400);        
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
						</script>
					</div>
				</form>
		</div>
		
	</section>

	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
	
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
	
	// 성별 데이터 준비
	var genderSelect = $("select.gender")
	
	genderArr = new Array();
	genderArr[0] = "WOMEN";
	genderArr[1] = "MEN";
	genderArr[2] = "KIDS";
	genderArr[3] = "FREE";
	
	// 성별 데이터 박스에 삽입
	for(var i = 0; i < genderArr.length; i++) {
		genderSelect.append("<option value='" + genderArr[i] + "'>" + genderArr[i] + "</option>");	
	}
</script>

</body>
</html>