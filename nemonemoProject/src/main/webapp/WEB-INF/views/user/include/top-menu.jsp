<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${user == null}">
	<jsp:include page="/WEB-INF/views/user/include/top-menu--login.jsp"/>
</c:if>
<c:if test="${user != null}">
	<jsp:include page="/WEB-INF/views/user/include/top-menu--logout.jsp"/>
</c:if>

<script> console.log(user)</script>