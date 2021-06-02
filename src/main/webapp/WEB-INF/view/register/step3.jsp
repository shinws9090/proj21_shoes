<%@ page contentType="text/html; charset=utf-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html> 
<html> 
<head><title><spring:message code="member.register"/></title></head> 
<body> 

<spring:message code="register.done">

<%-- <spring:argument value="${registerRequest.name}" />
<spring:argument value="${registerRequest.email}" />  --%>
</spring:message>
<%-- <p><a href="<c:url value='../index'/>">[<spring:message code="go.index"/>]</a></p>  --%>
</body> 
</html>