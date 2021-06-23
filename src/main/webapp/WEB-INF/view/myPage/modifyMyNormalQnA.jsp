<%@ page import="java.time.LocalDateTime"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<c:if test="${empty authInfo}"> 
				<p style="text-align: center;">로그인해주세요.</p> 
				<p></p>
				<li style="text-align: center;"><a href="${contextPath}/register/step1">회원가입</a></li>
				<li style="text-align: center;"><a href="${contextPath}/login/loginForm">로그인</a></li>

			</c:if>
			<c:if test="${!empty authInfo}">
<!-----------------------------------------------------------일반문의시 보여지는곳 (상품코드 없으면)-----------------------------  -->
			
			 <c:if test="${empty productCode}">
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



	<!-- 문의하기  입력  -->
		<h4>일반문의 수정하기</h4>
		<br>
		<!-- 해당컨트롤러로 이동 -->
		<form:form action="/myPage/${myQnADetail.boardCode}/${myQnADetail.memberId}/modify/2" modelAttribute="modifyMyNormalQnA"   >
		<form:errors/>
		<div>
		<table class="tbl_type">
		 <tr>
			<td><a>회원 아이디:</a></td>
			<td><form:input  type="text" path="memberId" placeholder="ID" value="${member.memberId }" readonly="true" size="100"/>  
			</td>
			<form:errors path="memberId" />
		</tr>

		<tr>
			<td><a>회원 이름:</a></td> 
			<td><form:input path="memberName"  value="${member.memberName }" readonly="true" size="100"/>  
		</td>
			<form:errors path="memberName" />
		</tr>
		<tr>
			<td>
			<a>문의제목:</a></td> 
			<td>
			<input hidden="hidden"/>
			<form:errors path="title"  style="color:red;"/>
			<br>
			<form:input type="text" name="title" path="title" id="title"  value="${myQnADetail.title }"  placeholder="문의제목을 작성해주세요" size="100"/>  
			</td>
			</tr>
		<tr>
			<td><a>문의내용:</a></td>
			<td style="height: 500px">
			<input hidden="hidden"/>
			<form:errors path="content"  style="color:red;" />
			<br>
			 <textarea rows="10" cols="50"  name="content" id="content" placeholder="문의내용을 작성해주세요" style="width:98%; height:98%;" maxlength="1000" >${myQnADetail.content }
			 </textarea>
			</td>
		</tr>

		</table>

		</div>

			<article style="margin-left:50%;">	
				<form action="/myPage/${myQnADetail.boardCode}/${myQnADetail.memberId}/modify/2" method="post"> <!-- 일로 보내조 -->
				<input type="submit" value="작성하기" /><!--다음단계  -->

				</form> 

				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId }">취소</a>


		</article>

		</form:form>

</c:if>
<!-----------------------------------------------------------상품문의시 보여지는곳 (상품코드 있으면)-------------------------------------------  -->

<c:if test="${!empty productCode}">
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



	<!-- 문의하기  입력  -->
		<h4>상품문의 수정하기</h4>

		<br>
				<table  class="tbl_type" border="1"> 
				<tr><td>${myQnADetail.productName } </td></tr>
				<tr><td>	<img style="max-width:20%; max-height: 20%; "  alt="" src="${contextPath}/images/${myQnADetail.productMainImage }"></td></tr>

				
				</table>
					<br>
		<!-- 해당컨트롤러로 이동 -->
		<form:form action="/myPage/${myQnADetail.boardCode}/${myQnADetail.memberId}/modify/2" modelAttribute="modifyMyNormalQnA"   >
		<form:errors/>
		<div>
		<table class="tbl_type" >
		 <tr>
			<td><a>회원 아이디:</a></td>
			<td><form:input  type="text" path="memberId" placeholder="ID" value="${member.memberId }" readonly="true" size="100"/>  
			</td>
			<form:errors path="memberId" />
		</tr>

		<tr>
			<td><a>회원 이름:</a></td> 
			<td><form:input path="memberName"  value="${member.memberName }" readonly="true" size="100"/>  
		</td>
			<form:errors path="memberName" />
		</tr>
		<tr>
			<td>
			<a>문의제목:</a></td> 
			<td>
			<input hidden="hidden"/>
			<form:errors path="title"  style="color:red;"/>
			<br>
			<form:input type="text" name="title" path="title" id="title"  value="${myQnADetail.title }"  placeholder="문의제목을 작성해주세요" size="100"/>  
			</td>
			</tr>
		<tr>
			<td><a>문의내용:</a></td>
			<td style="height: 500px">
			<input hidden="hidden"/>
			<form:errors path="content"  style="color:red;" />
			<br>
			 <textarea rows="10" cols="50"  name="content" id="content" placeholder="문의내용을 작성해주세요" style="width:98%; height:98%;" maxlength="1000" >${myQnADetail.content }
			 </textarea>
			</td>
		</tr>

		</table>

		</div>

			<article style="margin-left:50%;">	
				<form action="/myPage/${myQnADetail.boardCode}/${myQnADetail.memberId}/modify/2" method="post"> <!-- 일로 보내조 -->
				<input type="submit" value="작성하기" /><!--다음단계  -->

				</form> 

				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId }">취소</a>


		</article>

		</form:form>

</c:if>
			</c:if>



	</section>
</div>

	<section>

	</section>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html> 