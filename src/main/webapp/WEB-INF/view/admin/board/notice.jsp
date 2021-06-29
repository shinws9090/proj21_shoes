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
			<jsp:include page="/WEB-INF/view/admin/include/sidebar.jsp" />		    
		    <!-- Page content wrapper-->
		    <div id="page-content-wrapper">
		    <jsp:include page="/WEB-INF/view/admin/include/boardMenu.jsp" />
		        
		        <!-- Page content-->
		        <div class="container-fluid">
					<table style="width:100%">
						<tr>
							<td colspan="7" class="td_title"><h1 class="mt-4">공지사항</h1></td>
						</tr>			
						<tr style="background-color: lightgrey; text-align: center">
							<td>번호</td>
							<td>제목</td>						
							<td>작성자</td>		
							<td>작성일</td>
						</tr>
						<tr>
							<tbody id="load"/>
						</tr>
					</table>
		        </div>
		        
		    </div>		    
		</div>
	</section>
	
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
	
	<jsp:include page="/WEB-INF/view/admin/include/script.jsp" />
</body>
</html>