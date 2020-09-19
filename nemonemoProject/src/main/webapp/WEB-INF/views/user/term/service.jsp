<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="../images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/term/service.css"/>">
<link rel="shortcut icon"
	href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<title>네모내모 | 이용약관</title>
</head>

<body>
	<div class="service-container">
		<section class="service-section">${termVO.termContent}</section>
	</div>
</body>

</html>