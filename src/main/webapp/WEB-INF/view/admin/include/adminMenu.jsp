<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>

<body>
		<div id="leftMenu">
			<ul>
				<li><a href="${contextPath}/admin/adminMain">관리자홈</a></li>
				<li><a href="${contextPath}/admin/memberMgt">회원관리</a></li>
				<li><a href="${contextPath}/admin/productMgt">상품관리</a></li>
				<li><a href="${contextPath}/admin/orderMgt">주문관리</a></li>
				<li><a href="${contextPath}/admin/adminMain">게시판관리</a></li>
			</ul>
		</div>
</body>
</html>