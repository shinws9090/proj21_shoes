<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<c:set var="session" value="<%=request.getSession()%>" />
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/productDetail.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "${contextPath}"
		/* tab기능 */
		$(".btn li").click(function() {
			$(this).addClass("active");
			$(this).siblings().removeClass("active");

			var tab = $(this).attr("data-alt");
			$(".tabs div").removeClass("active");
			$(".tabs div").eq($(this).index()).addClass("active");
		});
		
		/* 스타일코드에 맞는 사이드 출력 */
		$(".styleCode input").click(function(){
			$(".styleCode label").removeClass("active");
			$(".styleCode input").removeClass();
			$("#size .size").remove();
			$(this).parent().addClass("active");
			$(this).addClass("style-code-data");
			var styleCode = $(this).val();
			var code = ${product.productCode};
			
			$.get(contextPath + "/api/size?styleCode="+styleCode+"&code="+code, function(json) {
				var sCont = "";
				for(i = 0; i < json.length; i++){
				sCont += "<label class='size'> ";
				sCont += "<input name='size' type='radio' value="+json[i].size+" hidden='hidden'>"+json[i].size;
				sCont += "<span>(재고:"+json[i].stock+")</span>";
				sCont += "<input class='stock' type='hidden' value="+json[i].stock+">";
				sCont += "</label>";
				};
				$("#size").append(sCont);
				
				$("#size input").click(function(){
					$("#size label").removeClass("active")
					$("#size input").removeClass("size-data");
					$(this).parent().addClass("active");
					$(this).addClass("size-data");
				});
				
				
				$("#count").on("focusout",function(){
					var stock = $("#size .active .stock").val();
					var count = Number($(this).val());
					if(count > stock){
						$(this).val(stock);
					}
				});
				
				
			});
		}); 
		
		/* 장바구니 담기 */
		$("#cart").click(function(){
			var data = {
					productCode:${product.productCode},
					styleCode:$(".style-code-data").val(),
					size:$(".size-data").val(),
					count:$("#count").val()
			};
			$.ajax({
				url : contextPath + "/api/cartSave",
				type : 'post',
				contentType : "application/json; charset=utf-8",
				dataType : 'json',
				cache : false,
				data : JSON.stringify(data),
				success : function(json) {
					alert(json+"카트저장완료");
					var res = confirm('장바구니 화면으로 이동하시겠습니까?')
					if(res){
						location.href = contextPath +"/cartList";					
					}
				},
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"
							+request.responseText+"\n"+"error:"+error);
					if(request.status==404){
						alert("로그인 해주세요")
						location.href = contextPath +"/login/loginForm";
					}
					if(request.status==400){
						alert("옵션정보를 전부 선택하세요")
					}
				}
			});
			$("#size .size").remove();
			$(".styleCode label").removeClass("active");
		});
		
		
		
	});
</script>

</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<section>
		<p>${product}</p>

		<div class='main'>
			<div class='main-image'>
				<img src="${contextPath}/images/${product.productPost.productMainImage} ">
			</div>


			<ul class="btn">
				<li class="active">상세정보</li>
				<li>상품후기</li>
				<li>상품문의</li>
			</ul>

			<div class="tabs">
				<div class='product-content active'>
					<c:forEach var="image" items="${product.productPost.images}">
					<img src="${contextPath}/images/${image.productCode}/${image.image}">
					</c:forEach>
					<p>상품설명 : ${product.productPost.content}</p>
				</div>
				<div class='product-review'>상품후기</div>
				<div class='product-QnA'>상품문의</div>
			</div>
		</div>
		
		
		<div class="order-options">
			<strong>${product.productName}</strong>
			<p>
				<em>Brand : </em> <label>${product.brand.brandEngName }</label>
			</p>
			<form action="${contextPath}/addOrderOne" method="post">
			<div class="styleCode">
				<label>스타일코드(색상)</label>
				<c:forEach var="option" items="${product.orderOptions}" varStatus="status">
					<c:if test="${option.stock >0}">
					<c:choose>
						<c:when test="${status.first}">
							<label>
							 <input type="radio" name="styleCode" value="${option.styleCode}" hidden="hidden" required>
								(${option.styleCode},${option.color})
							</label>
						</c:when>
						<c:when test="${option.styleCode == product.orderOptions[status.index-1].styleCode}">
						</c:when>
						<c:otherwise>
							<label>
							<input type="radio" name="styleCode" value="${option.styleCode}" hidden="hidden" required>
								(${option.styleCode},${option.color})
							</label>
						</c:otherwise>
					</c:choose>
					</c:if>
				</c:forEach>
			</div>
			<div id="size">
				<label>size</label>
			</div>
			<p>${product.sellPrice}원</p>
			<input type="number" name="count" id="count" min="0" required>
			<div class='submitBtns'>
				<span id='cart'> 장바구니 </span>
				<input type="hidden" name="productCode" value="${product.productCode }">
				<input type='submit' value='구매하기' />
				<!--// mode : development or production-->
				<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"
				    data-client-id="{#_clientId}"
				    data-mode="{#_mode}"
				    data-merchant-user-key="{#_merchantUserKey}"
				    data-merchant-pay-key="{#_merchantPayKey}"
				    data-product-name="{#_productName}"
				    data-total-pay-amount="{#_totalPayAmount}"
				    data-tax-scope-amount="{#_taxScopeAmount}"
				    data-tax-ex-scope-amount="{#_taxExScopeAmount}"
				    data-return-url="{#_returnUrl}">
				</script>
			</div>
			</form>
		</div>
	</section>

	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>