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
<title>회원가입</title>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	</header>
	
	<!-- end header -->
	
	<div class="step2">
	
		<div id="signUpForm">
	<section id = "signUpForm">
	<article id="title_h2">
	
	</article>
		<div id="insertForm" >
<h2 style="text-align:center; border-bottom: 1px solid #c0c0c0; width:100%; margin-top:5px; margin-left: -27%; padding-bottom: 10px; ">회원가입</h2>
		<form:form action="step3" modelAttribute="registerRequest">
		<form:errors/>
		<table id ="insertTable"  >
		<tr>
			<td><p>아이디 * </p></td>
			<td>
				<label> 
				<form:input  type="text" path="memberId" placeholder="아이디" id="member_id" />  
				<form:errors path="memberId"  style="color:red;"/>		
				</label>
				
			</td>
		
		<tr>
		<td><p>비밀번호 *</p></td>
			<td >
				<label for="memberPwd"> 
				<form:password  path="memberPwd" placeholder="비밀번호" id="member_pwd" />  
				<form:errors path="memberPwd"  style="color:red;"/>
				</label>
			</td>
		</tr>
		<tr>
		<td>
		<p>비밀번호 확인 * </p></td>
		<td >
			<label>
			<form:password id="confirmPassword" path="confirmPassword" placeholder="비밀번호 확인" />  
			<form:errors path="confirmPassword"  style="color:red;"/>
			</label>
			</td>
		
		<tr>
		<td><p>이름 *</p> </td>
		<td >
			<label for="memberName">
			<form:input path="memberName" placeholder="이름" id="member_name" />  
			<form:errors path="memberName" style="color:red;" />
			</label>
		</td>

 	<tr>
 		<td>
 		<p>성별 *</p></td>
		<td  style="padding-right: 500px;">
			<label for="gender" >			  
				<input type="radio"  id="gender" name="gender" value="false" checked style="width:12px;height:12px;border:1px;">남 			 
				<input type="radio" id="gender" name="gender" value="true" checked  style="width:12px;height:12px;border:1px;" >여
			</label>
		</td>
	</tr>
		<tr>
		<td>
		<p>생년월일 * </p></td>
		<td >
			<label for="birthday">
			<form:input path="birthday" type="date" id="birthday" placeholder="" />  
			<form:errors path="birthday"  style="color:red;"/>
			</label>
		</td>
		</tr>
		<tr>
		<td><p>이메일 * </p></td>
		<td>
			<label for="email">
			<form:input type="email" path="email" id="email" placeholder="이메일주소" />  
			<form:errors path="email" style="color:red;" />
			</label>
		</td>
		</tr>
		<tr>
		<tr>
		<td>
			<p>연락처 *</p></td>
			<td > 
			<label for="tel">
			<form:input type="tel" path="tel" id="tel" placeholder="연락처를 입력해주세요" />  
			<form:errors path="tel" style="color:red;" />
			</label>
		</td>
		</tr>
		<tr>
		<td>
		<p>우편번호 *</p></td>
		<td >
			<label for="zipCode"> 
			<form:input type="text" path="zipCode"  id="zipCode" readonly="true" placeholder="클릭해주세요 "   onclick="testDaumPostcode()"/>  
			<form:errors path="zipCode"  style="color:red;"/>
			</label>
		</td>
		</tr>
		<tr>
		<td>
		<p>주소 *</p>
		<td>
			<label for="address">
			<form:input  path="address" type="text"  id="address"  readonly="true" placeholder="우편번호 입력시 자동입력 "    />  
			<form:errors path="address" style="color:red;" />
			</label>
		</td>
		</tr>
		<tr>
		<td>
			<p>상세주소 *</p>
			<td>
			<label for="detailAddress">
			<form:input path="detailAddress"  id="detail_address" placeholder="상세주소 "  />  
			<form:errors path="detailAddress" style="color:red;" />
			</label>
		</td>
		</tr>
		
		
		</table>
		
<h2 style="text-align:center; border-bottom: 1px solid #c0c0c0; width:100%; margin-top:5px; margin-left: -27%; padding-bottom: 10px; "></h2>
</div>
	</section>
			<div id="btns" >
		<!-- <h2 style="margin-left: 0; margin-right: 0; width: 50%">  </h2> -->
			
			<button type="button,submit"  class="btn btn-secondary btn-lg "  style=" margin-right:30%;  margin-top:20px; width: 22%;  font-size: 15px; float:right;">가입하기 〉</button>
				<%--  <input type="submit" value="<spring:message code="next.btn"/>" /><!--다음단계  --> --%>
			</form>
			<form action="${contextPath}/index" method="get">
			<button type="button,submit"  class="btn btn-secondary btn-lg bottomBtn" id="cancel" style=" margin-left:25%; margin-top:20px; width: 22%; font-size: 15px;">〈 취소</button>
			</form>
			</div>
			
		</form:form>
		</div>
	
</div>
	
	
	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
	</footer>
</body>
</html>
