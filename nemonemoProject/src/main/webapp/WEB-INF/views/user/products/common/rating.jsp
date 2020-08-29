<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="rating" value="${param.rating}"/>
<fmt:parseNumber var="light" value="${rating / 2}" integerOnly="true" />
<fmt:parseNumber var="zero" value="${(10 - rating) / 2 }" integerOnly="true"/>
<c:set var="half" value="${rating % 2 != 0}"/>
<c:forEach begin="1" end="${light}">
<img src="<c:url value="/resources/images/common/star/star.png"/>" width="15px" height="14px"/>
</c:forEach>
<c:if test="${half}">
<img src="<c:url value="/resources/images/common/star/halfstar.png"/>" width="15px" height="14px"/>
</c:if>
<c:forEach begin="1" end="${zero}">
<img src="<c:url value="/resources/images/common/star/zero.png"/>" width="15px" height="14px"/>
</c:forEach>