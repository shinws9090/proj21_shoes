<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>이런신발</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	$(function() {
		var contextPath = "${contextPath}";
		
		
		$.get("${contextPath}/api/images",function(json){
			var sCont = "";
			for(i = 0; i < json.length; i++){
			sCont += "<li><img src='${contextPath}/images/slide/"+json[i]+"'></li>";
			}
			$(".slide_gallery").append(sCont);
		
			$('.slide_gallery').bxSlider({
				auto: true, 
				speed: 1000, 
				autoControls: false, 
				pager:true,
			});
		});
		
		
		$.get("${contextPath}/api/mainList/new",function(json){
			var sCont = "";
			for(i = 0; i < json.length; i++){
			sCont +="<div class='item' data-item='"+json[i].productCode+"'>";
			sCont +="<img src='${contextPath}/images/"+json[i].productPost.productMainImage+"'>";
			sCont +="<div class='title'>";
			sCont +="<h2>";
			sCont +="<em>"+json[i].productName+"</em>";
			sCont +="</h2>";
			sCont +="</div>";
			sCont +="</div>";
			}
			$("#new-product").append(sCont);
			$(".item").click(function(){
				var code = $(this).data("item");
				window.location.href = contextPath+"/productDetail/"+code;	
			});
		});
		
		$.get("${contextPath}/api/mainList/best",function(json){
			var sCont = "";
			for(i = 0; i < json.length; i++){
			sCont +="<div class='item' data-item='"+json[i].productCode+"'>";
			sCont +="<img src='${contextPath}/images/"+json[i].productPost.productMainImage+"'>";
			sCont +="<div class='title'>";
			sCont +="<h2>";
			sCont +="<em>"+json[i].productName+"</em>";
			sCont +="</h2>";
			sCont +="</div>";
			sCont +="</div>";
			}
			$("#best-product").append(sCont);
			$(".item").click(function(){
				var code = $(this).data("item");
				window.location.href = contextPath+"/productDetail/"+code;	
			});
		});
		
	});
</script>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->

	<section>
		<div id="gallery_wrap">
			<ul class="slide_gallery">
			</ul>
		</div>
		
		<div id="best-product">
			<p>Best</p>
		</div> 
		<div id="new-product">
			<p>New</p>
		</div> 
		
	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>