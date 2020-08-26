<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="notice-nav">
	<a class="notice-nav-not-selected" href="<c:url value="/customer/notice.do"/>">공지사항</a>
	<a class="notice-nav-not-selected" href="<c:url value="/customer/policy.do"/>">운영정책</a>
	<a class="notice-nav-not-selected" href="<c:url value="/customer/faq/start.do"/>">자주묻는 질문</a>
	<a class="notice-nav-not-selected" href="#">1:1문의</a>
</nav>