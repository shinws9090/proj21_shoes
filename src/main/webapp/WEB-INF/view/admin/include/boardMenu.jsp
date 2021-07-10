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
		<div class="leftMenuProduct">
			<ul>
				<li><a href="${contextPath}/admin/board/notice/?page=1&perPageNum=10">공지사항 관리</a></li>				
				<li><a href="${contextPath}/admin/board/qna/?page=1&perPageNum=10">문의게시판 관리</a></li>
				<li><a href="${contextPath}/admin/board/review/?page=1&perPageNum=10">후기게시판 관리</a></li>				
			</ul>
		</div>
</body>
</html>