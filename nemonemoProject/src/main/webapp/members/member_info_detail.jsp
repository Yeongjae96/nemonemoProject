<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>네모내모</title>
    <!-- Favicon-->
 
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/bootstrap/css/bootstrap.css"/>">
    
    <!-- Animation Css -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/animate-css/animate.css"/>">
	
    <!-- common CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/common/style.css"/>">
    
    <!--  테마 색상  -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/common/stylesheets/theme-red.css"/>">
	
	<!-- 개인 CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/members/member_info_detail.css"/>">
	
	
</head>
<body class="theme-red">

	<% 
		/* 공통 Header and Nav */
	%>
	<header>
		<jsp:include page="/WEB-INF/views/admin/include/header.jsp"/>
		<jsp:include page="/WEB-INF/views/admin/include/side-nav.jsp"/>		
	</header>

	<% 
		/* 각 페이지의 SECTION */
	%>
	
	   <!-------------------------------------------SECTION--------------------------------------------------->
        <section class="content">
            <div class="container-fluid">
                <div class="block-header">
                    
                </div>
                <div class="card">
                    <div class ="header">
                        <h1>
                            회원 상세보기
                        </h1>
                    </div>
                    <div class="row clearfix">
                        <div>
                            <div class="body">
                                <form id="form_validation" method="POST">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <div class ="mem-info">
                                            <thead> 기본정보 </thead>
                                            <button type="button" class="btn bg-teal waves-effect pull-right" >수정하기</button>
                                            </div>
                                            <tbody>
                                                <tr>
                                                    <th> 상점명
                                                    <td class ="col-md-5"><input type="text" readonly></td>
                                                    </th>
                                                    <th>이름
                                                    <td class ="col-md-4">길동이</td>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>비밀번호 변경
                                                    <td><input type="password" placeholder ="비밀번호">
                                                        <input type="password" placeholder ="비밀번호 확인"></td>
                                                    </th>
                                                    <th>이메일
                                                        <td><input type="text" id="mem-tel" readonly></td>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>총 주문건수
                                                    <td>
                                                        <label> 10 건 </label>
                                            
                                                        <button type="button"
                                                            class="btn bg-blue-grey waves-effect"  data-toggle="modal"
                                                            data-target="#registryModal">상세보기</button></td>
                                                    </th>
                                                    <th>연락처
                                                    <td><input type="text" id="mem-tel" readonly></td>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>주소
                                                    <td colspan="3" class = "addr-box">
                                                        <div class ="upd-postcode">
                                                        <button type="button"
                                                            class="btn bg-blue-grey waves-effect find-postcode">우편번호</button>
                                                            <input type="text"><br>
                                                        </div>
                                                        <div class = "upd-addr">
                                                        <label for="addr_1"></label><input type="text" id="addr_1">
                                                        <label for="addr_2"></label> <input type="text" id="addr_2">
                                                    
                                                        </div>
                                                    </td>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>등급
                                                    <td class ="col-md-4">
                                                        <div class="btn-group">
                                                            <button id = "grd-selected" type="button"
                                                                class="btn bg-blue-grey dropdown-toggle"
                                                                data-toggle="dropdown" aria-haspopup="true"
                                                                aria-expanded="false">
                                                                선택 <span class="caret"></span>
                                                            </button>
                                                           
                                                            <ul class="dropdown-menu">
                                                                <li><a href="javascript:void(0);">일반</a></li>
                                                                <li><a href="javascript:void(0);">VIP</a></li>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                    </th>
                                                    <th>선택약관 동의여부
                                                    <td colspan="4">
                                                        <div>
                                                            <input type="checkbox" name="" id="ch-loc-service"
                                                                class="custom-control-input">
                                                            <label class="custom-control-label"
                                                                for="ch-loc-service">위치서비스기반</label>
                                                            <input type="checkbox" name="" id="ch_privacy"
                                                                class="custom-control-input">
                                                            <label class="custom-control-label"
                                                                for="ch_privacy">개인정보보호</label>
                                                        </div>
                                                    </td>
                                                    </th>
                                                </tr>

                                            </tbody>

                                        </table>
                                        <table class="table">
                                            <thead>블랙리스트 설정</thead>
                                            <tbody>
                                                <tr>
                                                    <th>설정여부
                                                    <td>
                                                        <input type="radio" name="is-black" id="y-blacklist"
                                                            class="custom-control-input">
                                                        <label class="custom-control-label"
                                                            for="y-blacklist">설정함</label>

                                                        <input type="radio" name="is-black" id="n-blacklist"
                                                            class="custom-control-input">
                                                        <label class="custom-control-label"
                                                            for="n-blacklist">설정안함</label>
                                                    </td>
                                                    </th>
                                                    <th>차단방법
                                                    <td>
                                                        <input type="checkbox" name="" id="block-purchase"
                                                            class="custom-control-input">
                                                        <label class="custom-control-label"
                                                            for="block-purchase">구매차단</label>

                                                        <input type="checkbox" name="" id="block-login"
                                                            class="custom-control-input">
                                                        <label class="custom-control-label"
                                                            for="block-login">로그인차단</label>
                                                    </td>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>참고사항
                                                    <td class="memo_black" colspan="3"><textarea cols="80" rows="10"
                                                            required>
                                            </textarea></td>
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <div class="btn-layout">
                                            <button type="button" class="btn bg-teal btn-lg waves-effect">완 료</button>
                                        </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

             <!-- -----------------------------------------------------------------------------------------거래내역 상세보기 -->
             <div class="modal fade" id="registryModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                                <div class="header">
                                    <h2>
                                        거래내역 상세보기
                                    </h2>
                                </div>
                                <div class="body table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>거래 날짜</th>
                                                <th>카테고리</th>
                                                <th>상품</th>
                                                <th>거래 금액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>2020/07/23</td>
                                                <td>전자기기</td>
                                                <td>에어팟</td>
                                                <td>50000원</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                        <div class="modal-footer">
                            <div class="modal-flex--center">
                                <button type="button" class="btn btn-link waves-effect bg-red"
                                    data-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <!-------------------------------------------SECTION--------------------------------------------------->

	<!-- Jquery Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>

	<!-- Bootstrap Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>

	<!-- Slimscroll Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

	<!-- Waves Effect Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>

	<!-- Dateppicker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>

	<!-- 개인 JS -->
<%-- 	<script
		src="<c:url value ="/resources/js/admin/sites/site_coupon_list.js"/>"></script> --%>
	
	
</body>
</html>