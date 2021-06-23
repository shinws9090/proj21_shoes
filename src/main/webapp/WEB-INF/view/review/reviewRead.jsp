<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/view.css">
<SCRIPT LANGUAGE="JavaScript">
$(document).ready(function(){ /* update 클릭 */ $('#update').on('click',function(){ }); 
/* 삭제 클릭 */ 
 */$('#delete').on('click',function(){ }); }); </script>
</head>


</head>

<body>
	<table class="review_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption style="background-color: #ccc">게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${list[0].DOCNUM }</td>
				<th scope="row">조회수</th>
				<td>${list[0].VIEWCOUNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${list[0].ADD_USR_NM }</td>
				<th scope="row">작성시간</th>
				<td>2016-10-21</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${list[0].TITLE }</td>
			</tr>
			<tr>
				<td colspan="4" style="border: 1px solid #ccc; height: 100px;">${listp[0].CONTENTS }</td>
			</tr>
		</tbody>
	</table>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
</body>
</html>