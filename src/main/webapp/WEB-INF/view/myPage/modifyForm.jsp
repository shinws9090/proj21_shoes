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
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" 
		integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" 
		crossorigin="anonymous">
<link href="${contextPath}/css/buttons.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/css/reset.css">
<!-- bootstrap end -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/memberBootstrap.css">

<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script>
	function testDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						
						var roadAddr = data.address; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipCode').value = data.zonecode;  /* 우편번호 */
						document.getElementById("address").value = roadAddr+"("+data.jibunAddress+")" ;  /* 도로명주소 */
						//document.getElementById("detail_address").value = data.jibunAddress;/* 지번주소 */
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("detail_address").value = extraRoadAddr;
							} else {
								document.getElementById("detail_address").value = '';
							} 
						 	var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
					}
				}).open();
	}
	
	</script>

</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
		<c:if test="${empty authInfo}"> 
			<jsp:include page="/WEB-INF/view/myPage/include/loginplz.jsp"/>
		</c:if>
	</header>
	<!-- end header -->
		<div id="myPage">
	<section id = "maPage"> 
	
			<c:if test="${!empty authInfo}">
<!-- 상단 등급 바 -->
				<table id="tbl_maGrade"> 
					<tr id="tr_myGrade">
						<td><h2>${memberGrade.memberName }[${memberGrade.memberId}]님의 멤버십 등급은 ${memberGrade.grade}입니다.	</h2>
							<article id="myGrade_detail">
								<a href="${contextPath}/grade/${memberGrade.memberId}">등급별 혜택 보기 〉</a>
								포인트 〉 <a id="myPoint"> ${memberGrade.point }점 </a>
							</article>
						</td>
					</tr>
				</table>


			<!-- 좌측 메뉴 -->
				<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>

				<h3>나의 쇼핑정보</h3>			
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myCancelOrder/${member.memberId}">-취소내역</a><br>			
				<a href="${contextPath}/cartList">-장바구니</a>
			
				<h3>나의 후기</h3>			
				<a href="${contextPath}/myPage/myReview/${member.memberId}">-작성완료 후기 내역</a><br>
				<a href="${contextPath}/myPage/myReviewPlz/${member.memberId}">-미작성 후기 내역</a><br>
			
				<h3>나의 문의</h3>
				<a href="${contextPath}/myPage/myProductQnA/${member.memberId}">-상품문의내역</a><br>
				<a href="${contextPath}/myPage/myNormalQnA/${member.memberId}">-일반문의내역</a><br>
				
				
				</article>
			
	
	
				<h2 style="text-align:center; border-bottom: 1px solid #c0c0c0; width:48%; margin-left: 30%; padding-bottom: 10px; ">회원정보 변경</h2>
	<div id="modify_form">
	<section id ="modifyForm">

		
		<div class="container my-3" style="font: 1em Verdana,Dotum,AppleGothic,sans-serif; margin-left: 20%">
			<form:form action="${contextPath}/myPage/modify/${member.memberId }" modelAttribute="memberDetailUpdateCommend"><!-- 보내는거? -->
				<form:errors/>
				<table  class="modify_table">
			<tr >
				<article style="color: red; ">
								<form:errors  path="confirmPassword"  /><br>
								<form:errors path="memberPwd" />
				</article>
				
				<th>회원 아이디</th>
				<td id="td_right">
				<label for="memberId">
				<form:input path="memberId"  id="memberId" readonly="true" value="${member.memberId }" />
				</label>
				</td>				
			</tr>
			<form:errors  path="memberId"  />
			
		
			<tr>
					<th>기존비밀번호 확인 </th>
					<td id="td_right">
					<label for="confirmPassword">	
					<form:password id="confirmPassword" path="confirmPassword" placeholder="기존 비밀번호 입력" />
					<%-- <form:errors path="confirmPassword" /> --%>
					</label>
					</td>	
			</tr>
			
		 	<tr>
				<th>변경할비밀번호 </th>
			
				<td id="td_right">
				<label for="memberPwd">
				<form:password id="memberPwd" path="memberPwd" placeholder="변경할 비밀번호 입력" />
				</label>
				
				</td>
			</tr>
			
			 <tr>
					<th><a>회원 이름 </a></td>
					<td id="td_right">
					<label for="memberName">		
				<form:input path="memberName" id="memberName" value="${member.memberName }"/>
				</label>
				<form:errors  path="memberName"  />
				</td>
			</tr>
		
			<%-- 	${member.gender }	 --%>
	
			<tr >
			
					<th><a>성별 </a></th>
					<td id="td_right">
						<label for="gender">
							<input type="radio"  id="gender" name="gender" value="false" checked style="width:12px;height:12px;border:1px;">남 			 
							<input type="radio" id="gender" name="gender" value="true" checked  style="width:12px;height:12px;border:1px;" >여
						</label>
					</td>
					
				
				
			</tr>
			
			<tr>
				
				<th><a>생년월일  </a></th> 
				<td id="td_right">
				<label for="birthday">		
				<form:input type="date" path="birthday" id="birthday" value="${member.birthday }"/>
				</label>
			<form:errors  path="birthday"  />
				</td>
			
			</tr>
			<tr>
			
				<th><a>이메일  </a></th>
				<td id="td_right">
				<label for="email">	
				<form:input type="email" path="email"  id="email" value="${member.email }"/>
				</label>
			<form:errors  path="email"  />
				</td>
			</tr>
			<tr>
			<th><a>연락처  </a></th>
				<td id="td_right">
				<label for="tel">	
				<form:input path="tel" id="tel" value="${member.tel }"/>
				</label>
			<form:errors  path="tel"  />
				</td>
			</tr>
			
			<tr>
				
				<th><a>우편번호  </a></th>
				
				<td id="td_right">
				<label for="zipCode">	
				<form:input type="test" path="zipCode" id="zipCode" onclick="testDaumPostcode()" value="${member.zipCode }" />
			
				</label>
			<form:errors  path="zipCode"  />
				</td>
			</tr>
			<tr >
			<th><a>주소 </a></th>
			
				<td id="td_right">
				<label for="address">	
				<form:input type="text" id="address" path="address" readonly="true" value="${member.address }"/><form:errors path="address"/>
				</label>
			<form:errors  path="address"  />
				</td>
			</tr>
			<tr>
			<th><a>상세주소  </a></th>
				<td id="td_right">
				<label for="detailAddress">		
				<form:input path="detailAddress" id="detail_address" value="${member.detailAddress }" />
				</label>
			<form:errors  path="detailAddress"  />
				</td>
			
			</tr> 
		
			
			<%-- 		<article id="save_btn">
					<tr>
					<td></td>
					<td>
				 	<form action="${contextPath}/myPage/modify/${member.memberId }" method="post">
					<input type="submit" value="저장" /><form:errors path="confirmPassword" />
							
							
						</form>
						</td>
						</tr>
					</article> --%>
					</table>
					
<div id="btns" >
		<h2 style="margin-left: 0; margin-right: 0; width: 100%">  </h2>
				<h2 style="text-align:center; border-bottom: 1px solid #c0c0c0; width:138%; margin-top:40px; margin-left: -27%; padding-bottom: 10px; "></h2>
			<button type="button,submit"  class="btn btn-secondary btn-lg "  style=" margin-top:20px; width: 72%; font-size: 15px; float:left;">수정하기</button>
				<%--  <input type="submit" value="<spring:message code="next.btn"/>" /><!--다음단계  --> --%>
			</form>
			
			</div>
			</form:form>
			</div>
	</section>
</div>			
			
			
	



	<section>

	</section>
			</c:if>

	
	</section>
	</div>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>