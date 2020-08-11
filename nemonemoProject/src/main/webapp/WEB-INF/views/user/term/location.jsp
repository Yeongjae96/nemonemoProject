<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <link rel="shortcut icon" href="../images/favicon.ico">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<c:url value="/resources/css/user/term/location.css"/>">
  <title>네모내모 - 위치기반서비스 이용약관</title>
</head>

<body>
  <div class="location-container">
    <h2>위치기반서비스 이용약관</h2>
    <section class="location-section">
      <h3>안내문</h3>
      네모내모는 회원님의 권익을 보호하고 회원님들의 위치정보 보호에 만전을 기하고자 관계법령의 규정을 반영하여
      2011년 7월 1일부터 위치기반서비스 이용약관을 적용하고 있습니다.
      <br>
      
      ${termVO.termContent }
      
      
    </section>
  </div>


</body>

</html>