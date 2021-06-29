<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
	</header>
	<!-- end header -->
  <!-- 동의 -->

  <div id="signUpForm_agree">
 
	<section class="box1">
		<h2> 회원가입 (이용약관 동의)</h2>
			<article id="agree_content">
			<fieldset>
			<p >
			<br>	'이런신발' 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.<br>
<br> '이런신발'는 여러분이 '이런신발' 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. <br>
다만, 여러분이 '이런신발' 서비스를 보다 안전하게 이용하고 '이런신발' 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. <br>
<br>여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 '이런신발' 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.<br>

<br>회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다.<br> 

회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요.<br><br>
자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다. <br>
아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한 내용은 계정 운영정책을 참고해 주시기 바랍니다.<br><br>
타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다.<br><br>
관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.<br><br>
자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.<br><br>
자동화된 수단을 활용하는 등 '이런신발' 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, '이런신발' 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 '이런신발' 서비스 이용에 불편을 초래하고 더 나아가 '이런신발'의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다.<br><br>
 기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.<br>
'이런신발'의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 '이런신발' 서비스 회원으로 가입을 시도 또는 가입하거나, '이런신발' 서비스에 로그인을 시도 또는 로그인하거나, '이런신발' 서비스 상에 게시물을 게재하거나, '이런신발' 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), '이런신발' 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, '이런신발' 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 '이런신발' 서비스의 제공 취지에 부합하지 않는 방식으로 '이런신발' 서비스를 이용하거나 이와 같은 '이런신발' 서비스에 대한 어뷰징(남용) 행위를 막기 위한 '이런신발'의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다.<br><br>
'이런신발'의 동의 없이 자동화된 수단에 의해 '이런신발' 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다. 또한, '이런신발' 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다. '이런신발' 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). 그 밖에 바이러스나 기타 악성 코드를 업로드하거나 '이런신발' 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.<br>
<br><br>
				
				
			</p>
			</fieldset>
			</article>
			
			
			<form action="step2" method="post">
				<label> <input type="checkbox" name="agree" value="true"><!-- 동의 -->
				<spring:message code="term.agree" /></label> <input type="submit" value="<spring:message code="next.btn"/>" /><!--다음단계  -->
			</form>
			
			<form action="${contextPath}/index" method="get">
			<label><input type="submit" value="가입취소(메인으로)"/> </label>
			</form>
	</section>
	</div>

	<!-- end our product -->
	<footer>
		<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</footer>
</body>
</html>