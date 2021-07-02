<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<c:set var="session" value="<%=request.getSession()%>" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- bootstrap -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->
<title>lighten</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/productDetail.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		var responseMessage = "${message}";
        if(responseMessage != ""){
            alert(responseMessage)
        }

		var contextPath = "${contextPath}"
		/* tab기능 */
		$(".tab-btn li").click(function() {
			$(this).siblings().removeClass("active");
			$(".nav-link").removeClass("active");
			$(this).addClass("active");
			$(this).children().addClass("active");
			var tab = $(this).attr("data-alt");
			$(".tabs div").removeClass("active");
			$(".tabs div").eq($(this).index()).addClass("active");
		});
		
		/* 스타일코드에 맞는 사이즈 출력 */
		function sizeList(styleCode){
			if($.type(styleCode) == 'number'){
			var code = ${product.productCode};
			$.get(contextPath + "/api/size?styleCode="+styleCode+"&code="+code, function(json) {
				var sCont = "";
				for(i = 0; i < json.length; i++){
				sCont += "<option value="+json[i].size+" data-stock="+json[i].stock+">"+json[i].size;
				sCont += "<span>(재고:"+json[i].stock+")</span>";
				sCont += "</option>";
				};
				$("#sizeList").html(sCont);
				
				$("#count").on("focusout",function(){
					var stock = $("#size option:selected").data("stock");
					var count = Number($(this).val());
					if(count > stock){
						$(this).val(stock);
					}
				});
			});
			}
		}
		sizeList($(".styleCode option:selected").val());
		/* 스타일코드에 맞는 사이즈 출력 (클릭) */
		$(".styleCode").change(function(){
			var styleCode = Number($(this).val());
			sizeList(styleCode);
		}); 
		
		/* 장바구니 담기 */
		$("#cart").click(function(e){
			e.preventDefault();
			var data = {
					productCode:${product.productCode},
					styleCode:$(".styleCode").val(),
					size:$("#size").val(),
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
					alert("카트저장완료");
					var res = confirm('장바구니 화면으로 이동하시겠습니까?')
					if(res){
						location.href = contextPath +"/cartList";					
					}
				},
				error : function(request, status, error) {
					/* alert("code:"+request.status+"\n"+"message:"
							+request.responseText+"\n"+"error:"+error); */
					if(request.status==404){
						alert("로그인 해주세요")
						location.href = contextPath +"/login/loginForm";
					}
					if(request.status==400){
						alert("옵션정보를 전부 선택하세요")
					}
				}
			});
		});
		
		
		
	});
</script>

</head>
<body class="main-layout">
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<section>
		<%-- <p>${product}</p> --%>
${message}
		<div class='main'>
			<div class='main-image'>
				<img src="${contextPath}/images/${product.productPost.productMainImage} ">
			</div>


			<ul class="nav-tabs tab-btn">
				<li class="nav-item active"><a class="nav-link active">상세정보</a></li>
				<li class="nav-item "><a class="nav-link">상품후기</a></li>
				<li class="nav-item "><a class="nav-link">상품문의</a></li>
			</ul>

			<div class="tab-content tabs">
				<div class='tab-pane product-content active'>
					<c:forEach var="image" items="${product.productPost.images}">
					<img src="${contextPath}/images/${image.productCode}/${image.image}">
					</c:forEach>
					<p>상품설명 : ${product.productPost.content}</p>
				</div>
				<div class='tab-pane product-review'>
					<jsp:include page="/WEB-INF/view/include/product_review.jsp" />
				</div>
				<div class='tab-pane product-QnA'>
					<jsp:include page="/WEB-INF/view/include/product_QnA.jsp" />
				</div>
			</div>
		</div>
		
		
		<div class="order-options">
			<h2>${product.brand.brandEngName }</h2>
			<p>	${product.productName}</p>
			<form action="${contextPath}/addOrderOne" method="post">
			<br>
			<div>
				<p>색상(색상코드{스타일코드})</p>
			<select name="styleCode" class="styleCode" >
				<option>--색상 선택--</option>
				<optgroup label="color">
				<c:forEach var="option" items="${product.orderOptions}" varStatus="status">
					<c:if test="${option.stock >0}">
					<c:choose>
						<c:when test="${status.first}">
							 <option value="${option.styleCode}" >
								${option.color}(${option.styleCode})
							</option>
						</c:when>
						<c:when test="${option.styleCode == product.orderOptions[status.index-1].styleCode}">
						</c:when>
						<c:otherwise>
							<option value="${option.styleCode}" >
								${option.color}(${option.styleCode})
							</option>
						</c:otherwise>
					</c:choose>
					</c:if>
				</c:forEach>
				</optgroup>
			</select>
			</div>
			
			<div>
				<p>size</p>
				<select name='size' id="size">
					<option>--사이즈 선택--</option>
					<optgroup label="size" id="sizeList">
					</optgroup>
				</select>
			</div>
			<p><fmt:formatNumber value="${product.sellPrice}"/>원</p>
			<span>수량: </span>  <input type="number" name="count" id="count" min="0" required>
			<div class='submitBtns'>
				<button class='btn btn-secondary btn-sm' id="cart"> 장바구니 </button>
				<input type="hidden" name="productCode" value="${product.productCode }">
				<input class="btn btn-dark btn-sm" id="purchase" type='submit' value='구매하기' />
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