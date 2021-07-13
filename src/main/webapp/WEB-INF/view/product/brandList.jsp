<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productList.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}";
	$(".item").click(function(){
		var code = $(this).data("item");
		window.location.href = contextPath+"/brand/"+code;
	});
	
	$(".sel").click(function(){
		 var selStd = $(this).text();
		 $.ajax({
				url : contextPath + "/api/brandSel/"+selStd,
				type : 'get',
				contentType : "application/json; charset=utf-8",
				dataType : 'json',
				/* async: false, */
				cache : false,
				success : function(json) {
					var sCont = "";
					for(i = 0; i < json.length; i++){
					sCont +='<div class="item" data-item="'+json[i].brandCode+'">';
					sCont +='<img src="images/'+json[i].brandName+'logo.jpg">';
					sCont +='<div class="detail">';
					sCont +='<div class="title">';
					sCont +='<h2>';
					sCont +='<em> *'+json[i].brandName+'</em>';
					sCont +='</h2>';
					sCont +='<h5>';
					sCont +='<em>'+json[i].brandEngName+'</em>';
					sCont +='</h5>';
					sCont +='</div>';
					sCont +='</div>';
					sCont +='</div>';
					}
					$("#brands").html(sCont);
					
					$(".item").click(function(){
						var code = $(this).data("item");
						window.location.href = contextPath+"/brand/"+code;
					});
				},
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"
							+request.responseText+"\n"+"error:"+error);
				}
			});
	});
});
</script>
</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>

	<section>
		<%-- ${brand} --%>
		<div id="brand-select">
			<c:forTokens var="a" items="ALL,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" delims=",">
				&nbsp;&nbsp;<span class="sel">${a}</span>&nbsp;&nbsp;
			</c:forTokens>
		</div>
		<div id="brands">
			<c:forEach var="b" items="${brand}">
				<div class="item" data-item="${b.brandCode}">
					<img src="images/${b.brandName}logo.jpg">
					<div class="detail">
						<div class="title">
							<h2>
								<em> ＊ ${b.brandName}</em>
							</h2>
							<h5>
								<em>${b.brandEngName}</em>
							</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>