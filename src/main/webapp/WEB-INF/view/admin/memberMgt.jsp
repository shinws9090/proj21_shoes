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
		$.get(contextPath + "/api/memberMgt", function(json) {
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					sCont += "<tr>";
					sCont += "<td>" + json[i].memberId + "</td>";
					sCont += "<td><a href='read?memberId=" + json[i].memberId
							+ "'>" + json[i].memberName + "</a></td>";
					sCont += "<td>" + json[i].email + "</td>";
					sCont += "<td>" + json[i].tel + "</td>";
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
		        
		        <!-- Page content-->
		        <div class="container-fluid">
		            <table style="width:100%">
						<tr>
							<td colspan="7" class="td_title"><h1 class="mt-4">회원 목록</h1></td>
						</tr>
									
						<tr style="background-color: lightgrey; text-align: center">
							<td>아이디</td>
							<td>이름</td>
							<td>이메일</td>
							<td>연락처</td>
							<td>상세보기</td>
							<td>기타</td>			
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