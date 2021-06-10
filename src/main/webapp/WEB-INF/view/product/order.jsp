<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cartList.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	var contextPath = "${contextPath}"
	/*전채가격 설정*/
	function priceAll() {
		var priceAll = 0;
		$(".check:checked").parent().parent().children(".price").each(function() {
			priceAll += Number($(this).text());
		});
		$("#priceAll").text("전체가격:" + priceAll);
	}
	priceAll();
	
	
	$("#allCheck").click(function(){
		if($("#allCheck").prop("checked")){
			$(".check").prop("checked", true);
		}else{
			$(".check").prop("checked", false);
		}
		priceAll();
	});
	
	$(".check").click(function(){
		priceAll();
	});
	
	
	/* 수량 up,down DB연동 */
	function count(url , cartCode, t){
		var c = 0;
		$.ajax({
			url : contextPath + "/api/"+url+"/"+cartCode,
			type : 'put',
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			async: false,
			cache : false,
			success : function(json) {
				c= json.count;
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"
						+request.responseText+"\n"+"error:"+error);
			}
		});
		return c;
	}
	
	/* 수량 up */
	$(".countDown").click(function(){
		var cartCode = $(this).val();
		var res = count("countDown" ,cartCode)
		$(this).next().text(res);
		var price = res * $(this).parent().parent().children(".price").data("sellprice");
		$(this).parent().parent().children(".price").text(price);
		priceAll()
	});
	/* 수량 down */
	$(".countUp").click(function(){
		var cartCode = $(this).val();
		var res = count("countUp" ,cartCode);
		$(this).prev().text(res);
		var price = res * $(this).parent().parent().children(".price").data("sellprice");
		$(this).parent().parent().children(".price").text(price);
		priceAll()
	});
	
	
	
	/* 카트물품 삭제 */
	function cartDelete(cartCode){
		$.ajax({
			url : contextPath + "/api/delete/"+cartCode,
			type : 'delete',
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			async: false,
			cache : false,
			success : function() {
				$(".del").remove();
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"
						+request.responseText+"\n"+"error:"+error);
				
			}
		});
	}
	
	/* 개별삭제 */
	$(".delete").click(function(){
		$(this).parent().parent().addClass("del")
		var cartCode = $(this).val();
		cartDelete(cartCode)
		$(this).parent().parent().removeClass("del");
		priceAll();
	});
	/* 선택물품 삭제 */
	$("#checkBoxDelete").click(function(){
		$(".check:checked").parent().parent().children().children(".delete")
		.each(function() {
			$(this).parent().parent().addClass("del")
			cartDelete($(this).val());
			$(this).parent().parent().removeClass("del");
		});
		$("#allCheck").prop("checked", false);
		priceAll();
	});
	
	$("#order").click(function(){
		var codeArr = [];
		$(".check:checked").each(function(){
			codeArr.push($(this).val());
		});
		$.ajax({
			url : contextPath + "/order",
			type : 'post',
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			data: JSON.stringify(codeArr)
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
		${order }
		<%-- ${productList} --%>
			<table>
				<thead>
				<tr>
					<th>대표이미지 </th>
					<th>상품코드 </th>
					<th>상품명 </th>
					<th>스타일코드 </th>
					<th>사이즈 </th>
					<th>색상 </th>
					<th>가격 </th>
					<th>수량 </th>
				</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<ul>
				
			</ul>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>