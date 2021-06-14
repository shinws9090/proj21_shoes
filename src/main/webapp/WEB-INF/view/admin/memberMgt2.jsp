<%@ page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}";
	$.get(contextPath+"/api/memberMgt",
		function(json) {
			var dataLength = json.length;
			if (dataLength >= 1) {
				var sCont = "";
				for (i = 0; i < dataLength; i++) {
					sCont += "<tr>";
					sCont += "<td>" + json[i].memberId + "</td>";
					sCont += "<td><a href='read?memberId="+json[i].memberId+"'>"
					+ json[i].memberName + "</a></td>";
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
		<jsp:include page="/WEB-INF/view/admin/include/adminMenu.jsp" />
		<%-- ${members} --%>

		<table style="width: 80%">
			<tr>
				<td colspan="7" class="td_title">회원 목록</td>
			</tr>

			<tr style="background-color: lightgrey; text-align: center">
				<td>아이디</td>
				<td>이름</td>
				<td>성별</td>
				<td>이메일</td>
				<td>연락처</td>
				<td>상세보기</td>
				<td>기타</td>

			</tr>

			<c:forEach var="memberDetail" items="${memList}">
				<tr>
					<td>${memberDetail.memberId }</td>
					<td>${memberDetail.memberName }</td>
					<td>${memberDetail.gender }</td>
					<td>${memberDetail.email }</td>
					<td>${memberDetail.tel }</td>
					<td><a href="#">[상세보기]</a></td>
					<td><a href="#">[수정]</a>&nbsp; <a href="#">[삭제]</a></td>
				</tr>
			</c:forEach>

		</table>



	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>