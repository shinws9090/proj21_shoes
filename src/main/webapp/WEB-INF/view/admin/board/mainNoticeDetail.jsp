<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
$(function() {
	
	var contextPath = "${contextPath}";
	$.get(contextPath + "/api/noticeBoard", function(json) {
		var dataLength = json.length;
		if (dataLength >= 1) {
			var sCont = "";
			var i = dataLength -1
			for (i; i >= 0; i--) {
				sCont += "<tr>";
				sCont += "<td>" + json[i].boardCode + "</td>";
				sCont += "<td>" + json[i].title + "</td>";
				sCont += "<td>" + "관리자" + "</td>";
				sCont += "<td>" + json[i].registDate + "</td>";
				sCont += "</tr>";
			}
			$("#load:last-child").append(sCont);
		}
	});	
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
		        
		        <!-- Page content-->
		        <div class="container-fluid">
					<form method="post">						
						<label>제목</label>
						<input type="text" name="title" value="${noticeView.title }" /><br />
						
						<label>작성자</label>
						<input type="text" name="writer" value="${noticeView.employee.empName }" /><br />
						
						<label>내용</label>
						<textarea cols="50" rows="5" name="content">${noticeView.content }</textarea><br />						
					</form>
					${noticeView}
		        </div>  		        
		    </div>		    
	</section>
		
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>