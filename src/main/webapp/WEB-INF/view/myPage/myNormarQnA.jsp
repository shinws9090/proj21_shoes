<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>마이페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/table.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id = "maPage">
		<%-- ${myNmQna } --%>
	<c:if test="${empty authInfo}"> 
				<p style="text-align: center;">로그인해주세요.</p> 
				<p></p>
				<li style="text-align: center;"><a href="${contextPath}/register/step1">회원가입</a></li>
				<li style="text-align: center;"><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
				
					<!-- 상단 등급 바 -->
				<table id="tbl_maGrade"> 
					<tr id="tr_myGrade">
						<td><h2>${member.memberName }[${member.memberId}]님의 멤버십 등급은 ${member.grade}입니다.	</h2>
							<article id="myGrade_detail">
								<a href="${contextPath}/grade/${member.memberId}">등급별 혜택 보기 〉</a>
								포인트 〉 <a id="myPoint"> ${member.point }점 </a>
							</article>
						</td>
					</tr>
				</table>
				<!-- 좌측메뉴 -->
			
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>
				<br>
				<h3>나의 쇼핑정보</h3>
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				</article>
	
				<h4>${authInfo.memberName }님의 최근 일반문의내역</h4>
				<br>
				<table class="tbl_type" border="1">
				<thead>
					<tr>
						<td>제목</td>						
						<td>작성일</td>
						<td>답변유무</td>
	
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${fn:length(myNmQna) > 0}">
				<c:forEach var="myNmQna" items="${myNmQna }">
				<tr>
			<%-- 	<td><a href="${contextPath}/myPage/myQnADetail/${authInfo.memberId}/${myQna.boardCode}">${myQna.boardCode }</a></td> <!-- 문의코드 --> --%>
			
			
				<td><a href="${contextPath}/myPage/myNormalQnADetail/${myNmQna.memberId}/${myNmQna.boardCode}">${myNmQna.title }</a></td>	<!-- 작성일 -->
				<td>${myNmQna.registDate }</td>	<!-- 작성일 -->
				<td>${myNmQna.resOX }</td>
				
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
							<tr>
								<td colspan="4">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
				</c:choose>
				</tbody>
	</table> 	
	<br>
	<br>
	<article id="myData_btn" >
	
			<a href="${contextPath}/myPage/normalQnARegist/1/${authInfo.memberId}">일반문의하러가기</a>
			
	</article>
			
				
			</c:if>
 <!--paginate -->
         <div class="paginate">
            <div class="paging" style="margin-left: 50%;">
               <a class="direction prev" href="javascript:void(0);"
                  onclick="movePage(1,${pagination2.cntPerPage},${pagination2.pageSize});">
                  &lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
                  onclick="movePage(${pagination2.currentPage}<c:if test="${pagination2.hasPreviousPage == true}">-1</c:if>,${pagination2.cntPerPage},${pagination2.pageSize});">
                  &lt; </a>

               <c:forEach begin="${pagination2.firstPage}"
                  end="${pagination2.lastPage}" var="idx">
                  <a
                     style="color:<c:out value="${pagination2.currentPage == idx ? '#gray; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                     href="javascript:void(0);"
                     onclick="movePage(${idx},${pagination2.cntPerPage},${pagination2.pageSize});"><c:out
                        value="${idx}" /></a>
               </c:forEach>
               <a class="direction next" href="javascript:void(0);"
                  onclick="movePage(${pagination2.currentPage}<c:if test="${pagination2.hasNextPage == true}">+1</c:if>,${pagination2.cntPerPage},${pagination2.pageSize});">
                  &gt; </a> <a class="direction next" href="javascript:void(0);"
                  onclick="movePage(${pagination2.totalRecordCount},${pagination2.cntPerPage},${pagination2.pageSize});">
                  &gt;&gt; </a>
            </div>
         </div>
         <!-- /paginate -->	
	
	
	</section>
</div>
	
	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
<script> 
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    
    var url = "${pageContext.request.contextPath}/myPage/myNormalQnA/${member.memberId}";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>
</html>