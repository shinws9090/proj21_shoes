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
<style>
	#topMenu ul  {
		list-style: none;
		margin-top: 20px;
		margin-left: 20px;
	}
	
	#topMenu ul li {
		background-color: #f8f9fa;
		border: 1px solid #d3d3d3;
		width: 120px;
		height: 43px;
		line-height: 40px;
		text-align: center;
		margin: 0;
	}
	
	#topMenu ul li {
		text-decoration: none;
		color: white;
	}

</style>
<body>
		<nav id="topMenu">
			<ul>
				<li><a class="menu" href="${contextPath}/admin/productMgt?page=1&perPageNum=10">상품 관리</a></li>				
				<li><a class="menu" href="${contextPath}/admin/product/brandMgt">브랜드 관리</a></li>
				<li><a class="menu" href="${contextPath}/admin/product/categoryMgt">카테고리 관리</a></li>
			</ul>
		</nav>
</body>
</html>