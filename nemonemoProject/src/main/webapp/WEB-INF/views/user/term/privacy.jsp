<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <link rel="shortcut icon" href="../images/favicon.ico">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#000000">
  <meta name="description" content="번개장터 - 이용 약관">
  <link rel="stylesheet" href="<c:url value="/resources/css/user/term/privacy.css"/>">
  <title>네모내모 - 개인정보처리방침</title>
</head>

<body cz-shortcut-listen="true">
  <div class="privacy-container">
    <section class="privacy-section">
      ${termVO.termContent}
    </section>
  </div>


</body>

</html>