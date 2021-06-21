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
	

	<script type="text/javascript">
	/* function genderview() {
		작동되게해야하는디 만약 기존값이 true면  여자에 true 두게 하고, false면 남자에 true 값으로 입력하게 하기!! 
		
	}*/
	</script>
	
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	<!-- end header -->
	<div id="myPage">
	<section id ="maPage">
	
	<c:if test="${empty authInfo}"> 
				<p>로그인해주세요.</p> 
				<p>
				<li><a href="${contextPath}/register/step1">회원가입</a></li>
				<li><a href="${contextPath}/login/loginForm">로그인</a></li>
				
			</c:if>
			<c:if test="${!empty authInfo}">
			
			<article id="my_menu">
				<h3>회원정보</h3>
				<a href="${contextPath}/myPage/myPageSel/${member.memberId}">-회원정보 조회 / 변경</a><br>
				<a href="${contextPath}/myPage/quitMember/${member.memberId}">-회원탈퇴</a>
				<br>
				<h3>나의 쇼핑정보</h3>
				<a href="${contextPath}/myPage/myOrder/${member.memberId}">-주문내역</a><br>
				<a href="${contextPath}/myPage/myQnA/${member.memberId}">-문의내역</a><br>
				<a href="${contextPath}/cartList">-장바구니</a>
			
				</article>
			
	
			<div id="myData_modify">
			
			<h4>회원정보 변경</h4>
			<form:form action="/myPage/modify/${member.memberId }" modelAttribute="memberDetailUpdateCommend"><!-- 보내는거? -->
				<table class="tbl_myData" border="1">
			<tr>
				<td id="myData_left_td"><label for="memberId">회원아이디</label></td>
				<td><form:input path="memberId" id="memberId" readonly="true" value="${member.memberId }" /></td>				
			</tr>
		
			<tr>
					<td id="myData_left_td"><label for="confirmPassword"></label>기존비밀번호 확인</td>		
					<td><form:password id="confirmPassword" path="confirmPassword" placeholder="기존 비밀번호 입력" /><form:errors path="confirmPassword" /></td>
			</tr>
			
		 	<tr>
				<td id="myData_left_td"><label for="memberPwd"></label>변경할비밀번호</td>		
				<td><form:password id="memberPwd" path="memberPwd" placeholder="변경할 비밀번호 입력" /></td>
			</tr>
			
			 <tr>
					<td id="myData_left_td"><label for="memberName"></label> 회원이름</td>		
				<td><form:input path="memberName" id="memberName" value="${member.memberName }"/></td>
			</tr>
			
		
			<%-- 	${member.gender }	 --%>
	
			<tr >
					<td id="myData_left_td"><label for="gender"></label>성별</td>
					<td><input type="radio" name="gender" value="false" checked>남
					<input type="radio" name="gender" value="true" checked>여</td>
			
				
				
			</tr>
			
			<tr>
				<td id="myData_left_td"><label for="birthday"></label>생년월일</td>		
				<td><form:input type="date" path="birthday" id="birthday" value="${member.birthday }"/></td>
			</tr>
			<tr>
					<td id="myData_left_td"><label for="email"></label>이메일</td>		
				<td><form:input type="email" path="email"  id="email" value="${member.email }"/><form:errors path="email" /></td>
			</tr>
			<tr>
				<td id="myData_left_td"><label for="tel"></label>연락처</td>		
				<td><form:input path="tel" id="tel" value="${member.tel }"/></td>
			</tr>
			<tr>
				<td id="myData_left_td"><label for="zipCode"></label>우편번호</td>		
				<td><form:input type="test" path="zipCode" id="zipCode" onclick="testDaumPostcode()" value="${member.zipCode }" /><form:errors path="zipCode" /></td>
				
			</tr>
			<tr >
					<td id="myData_left_td"><label for="address"></label>주소</td>		
				<td><form:input type="text" id="address" path="address" readonly="true" value="${member.address }"/><form:errors path="address"/></td>
			</tr>
			<tr>
				<td id="myData_left_td"><label for="detailAddress"></label>상세주소</td>		
				<td><form:input path="detailAddress" id="detail_address" value="${member.detailAddress }" /></td>
			
			</tr> 
			</table>
			
					<article id="save_btn">
				 	<form action="/myPage/modify/${member.memberId }" method="post">
							<input type="submit" value="저장" /><form:errors path="confirmPassword" />
						</form>
					</article>

			</form:form>
		</div>	


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