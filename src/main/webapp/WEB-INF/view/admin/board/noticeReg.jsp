<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/css/styles.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- include summernote css/js-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/admin/js/summernote-ko-KR.js"></script>
<script>

$(function(){
	$('#cancel').on("click", function(e) {
		location.href="${contextPath}/admin/board/notice";
	});
});


function submit(){
	
	if ($("[name='employee']").val() == "" ){
		alert("직원번호 미입력");
	
	} else if($("[name='title']").val() == "" ) {
		alert("제목 미입력");
		
	} else if($("[name='content']").val() == "" ) {
		alert("내용 미입력");
		
	} else {
		var submitForm = document.noticeRegForm;
		submitForm.submit();
		alert("공지사항 작성완료");
	};
};

$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: 'content',
		minHeight: 370,
		maxHeight: null,
		focus: true, 
		lang : 'ko-KR'
	});
});

</script>

<style>
	
td.notice_subject {
    width: 200px;
    text-align: right;
    padding-right: 30px;
}

.notice_btn {
    margin-left: 600px;
}

</style>
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
			<jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
				<div class="container-fluid">
					<h1 class="mt-4">공지사항</h1>
					<form id="noticeRegForm" name="noticeRegForm" method="post" autocomplete="off" >
						<table style="width: 70%;">
							<tr>
								<td class="notice_subject"><a>직원 번호</a></td>
								<td class="notice_content">
									<select name="employee" class="employee" style="width:175px;">
										<option selected="selected" value="">등록사원을 선택해주세요</option>
									</select>
								</td>
							</tr>
										
							<tr>	
								<td class="notice_subject"><a>제목</a></td>
								<td class="notice_content"><input type="text" name="title" id="title" placeholder="제목" value="" style="width:90%;" /></td>
							</tr>
							
							<tr>
								<td class="notice_subject"><a>내용</a></td>
					 			<td class="notice_content"><textarea name="content" id="summernote" ></textarea></td>		
					 		</tr>						
						</table>
					</form>
				</div>				
				<div class="notice_btn">
					<input type="button" id= "new_btn" onclick="submit()" value="작성">
					<button type="button" id="cancel">취소</button>
				</div>
	        </div>
	    </div>		    
	</section>	
	
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
	
<script>
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