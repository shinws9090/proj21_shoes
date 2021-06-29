<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/product_QnA.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function() {
	
	function pageShowHide(qnaPage){
		if(Number("${fn:length(qnaPages)}")==1){
			$(".qnaPagejun").hide();
			$(".qnaPageNext").hide();
		}else if(qnaPage<=1){
			$(".qnaPagejun").hide();
			$(".qnaPageNext").show();
		}else if(qnaPage>=Number("${fn:length(qnaPages)}")){
			$(".qnaPageNext").hide();
			$(".qnaPagejun").show();
		}else{
			$(".qnaPagejun").show();
			$(".qnaPageNext").show();
		}
	}
	function pageAticle(qnaPage){
		$(".qnaPageButton").each(function(){
			if(Number($(this).val())==qnaPage){
				$(this).attr("disabled", true);
			}else{
				$(this).attr("disabled", false);
			}
		});
	}
	function listDB(qnaPage){
		$.ajax({
			url : "${contextPath}/api/ProductQnAList/${product.productCode},"+qnaPage,
			type : 'get',
			contentType : "application/json; charset=utf-8",
			data:null,
			success : function(json) {
				var sCont = "";
				for(i = 0; i < json.length; i++){
					
					sCont +='<tr>';
					sCont +='<td><a href="${contextPath}/ProductQnADetail/'+json[i].boardCode+'">'+json[i].productName+'</a></td>';	<!-- 상품명 -->
					sCont +='<td><a href="${contextPath}/ProductQnADetail/'+json[i].boardCode+'">'+json[i].title+'</a></td>';	<!-- 제목 -->
					sCont +='<td>'+json[i].registDate +'</td>';	<!-- 작성일 -->
					sCont +='<td>'+json[i].resOX +'</td>';
					sCont +='</tr>';
					
				};
				$("#QnAList").html(sCont);
			},
			error : function(request, status, error) {
				/* alert("code:"+request.status+"\n"+"message:"
						+request.responseText+"\n"+"error:"+error); */
			}
		});
		pageShowHide(qnaPage);
		pageAticle(qnaPage);
	}
	
	
	var qnaPage=1;
	listDB(qnaPage);
	
	
	$(".qnaPageButton").click(function(){
		qnaPage=Number($(this).val());
		listDB(qnaPage);
	});
	$(".qnaPagejun").click(function(){
		if(qnaPage>1){
			qnaPage -=1;
			listDB(qnaPage);
		}
	});
	$(".qnaPageNext").click(function(){
		if(qnaPage<Number("${fn:length(qnaPages)}")){
			alert(qnaPage);
			qnaPage +=1;
			listDB(qnaPage);
		}
	});
});
</script>
</head>
<body>
	<p> <a href="${contextPath}/ProductQnAInsertAndUpdateForm/${product.productCode},insert,0">문의글 등록</a> </p>
	<table>
		<thead> 
		<tr>
			<td>문의상품</td>
			<!-- <td>상품사진</td> -->
			<td>제목</td>						
			<td>작성일</td>
			<td>답변유무</td>
		</tr>
		</thead>
		<tbody id="QnAList">
		<%-- <c:forEach var="myQnAList" items="${myQnAList }" begin="0" end="1">
			<tr>
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.productName }</a></td>	<!-- 상품명 -->
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">
				<img style="max-width:20%; max-height: 20%" alt="" src="${contextPath}/images/${myQnAList.productMainImage }"></a></td>				
				<td><a href="${contextPath}/ProductQnADetail/${myQnAList.boardCode}">${myQnAList.title }</a></td>	<!-- 제목 -->
				<td>${myQnAList.registDate }</td>	<!-- 작성일 -->
				<td>${myQnAList.resOX }</td>
			</tr>
		</c:forEach> --%>
		</tbody>
	</table>
		<button class="qnaPagejun">이전</button>
		<c:forEach var="qnaPage" items="${qnaPages}">
			<button class="qnaPageButton" value="${qnaPage}">${qnaPage}</button>
		</c:forEach>
		<button class="qnaPageNext">다음</button>
</body>
</html>