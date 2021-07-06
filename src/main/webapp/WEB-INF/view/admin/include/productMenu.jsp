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
		<div class="MenuBoard">
			<ul>
				<li><a href="${contextPath}/admin/productMgt">상품 관리</a></li>				
				<li><a href="${contextPath}/admin/product/brandMgt">브랜드 관리</a></li>
				<li><a href="${contextPath}/admin/product/categoryMgt">카테고리 관리</a></li>
			</ul>
		</div>
</body>
</html>