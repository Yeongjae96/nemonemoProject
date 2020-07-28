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
	
	<!-- Bootstrap Material Datetime Picker Css -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"/>">

    <!-- Bootstrap DatePicker Css -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css"/>">
	
	 <!-- Morris Chart Css-->
	 <link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/morrisjs/morris.css"/>">
    
    <!--  테마 색상  -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/common/stylesheets/theme-red.css"/>">
	
	
	<!-- 개인 CSS -->
<%-- 	<link rel="stylesheet" href="<c:url value="/resources/css/admin/sites/site_banner_list.css"/>"> --%>
	
	
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
                <div class="card">
                    <div class="header">
                        <h1>찜 순위</h1>
                    </div>
                    <div class="body">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 list__b"
                            style="margin-bottom: 25px; border-bottom: 1px solid #AAAAAA">
                            <button type="button" class="btn btn-success waves-effect">
                                <span>패션/잡화</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>디지털/가전</span>
                                </buttom>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>여성의류</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>남성의류</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>도서/티켓취미/애완</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>생활/문구/가구/식품</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>유아동/출산</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>스타굿즈</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>뷰티/미용</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>스포츠/레저</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>기타</span>
                            </button>
                            <button type="button" class="btn btn-danger waves-effect">
                                <span>재능</span>
                            </button>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  m-p-0">
                            <h4 class="col-lg-2 col-md-2 col-sm-2 col-xs-2">기간검색</h4>
                            <div class="m-b-0 col-lg-2 col-md-2 col-sm-2 col-xs-2 m-p-0">
                                <div class="input-group date" id="members_prev">
                                    <div class="form-line">
                                        <input type="text" class="form-control" placeholder="날짜를 입력해주세요">
                                    </div>
                                    <span class="input-group-addon">
                                        <i class="material-icons">date_range</i>
                                    </span>
                                </div>
                            </div>
                            <div class="col-xs-1 text-c m-p-0">
                                <span class="very-strong-word">-</span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 m-p-0">
                                <div class="input-group date" id="members_next">
                                    <div class="form-line">
                                        <input type="text" class="form-control" placeholder="날짜를 입력해주세요">
                                    </div>
                                    <span class="input-group-addon">
                                        <i class="material-icons">date_range</i>
                                    </span>
                                </div>
                            </div>
                            <button type="button" class="btn btn-danger waves-effect m-l-50">
                                <span>찾기</span>
                            </button>
                        </div>
                        
                        <div class="clearfix"></div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-p-0">
                            <h4 class="col-lg-2 col-md-2 col-sm2 col-xs-2">저장하기</h4>
                            <button class="btn waves-effect bg-pink" id="statics-image__btn">이미지 파일</button>
                            <button class="btn waves-effect bg-pink">CSV</button>
                            <button class="btn waves-effect bg-pink">엑셀 파일</button>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-p-0">
                            <h4 class="col-lg-2 col-md-2 col-sm2 col-xs-2">기간별로 보기</h4>
                            <button class="btn waves-effect bg-pink" id="statics-image__btn">연간</button>
                            <button class="btn waves-effect bg-pink">월간</button>
                            <button class="btn waves-effect bg-pink">주간</button>
                        </div>
                        <div></div>
                        <div class="clearfix"></div>
                        <div class="body">
                            <div class="table-responsive">
                                <div id="DataTables_Table_1_wrapper"
                                    class="dataTables_wrapper form-inline dt-bootstrap">
                                    <!-- <div class="dt-buttons"><a class="dt-button buttons-copy buttons-html5" tabindex="0"
                                            aria-controls="DataTables_Table_1" href="#"><span>Copy</span></a><a
                                            class="dt-button buttons-csv buttons-html5" tabindex="0"
                                            aria-controls="DataTables_Table_1" href="#"><span>CSV</span></a><a
                                            class="dt-button buttons-excel buttons-html5" tabindex="0"
                                            aria-controls="DataTables_Table_1" href="#"><span>Excel</span></a><a
                                            class="dt-button buttons-pdf buttons-html5" tabindex="0"
                                            aria-controls="DataTables_Table_1" href="#"><span>PDF</span></a><a
                                            class="dt-button buttons-print" tabindex="0"
                                            aria-controls="DataTables_Table_1" href="#"><span>Print</span></a></div> -->
                                    <div id="DataTables_Table_1_filter" class="dataTables_filter"><label>Search:<input
                                                type="search" class="form-control input-sm" placeholder=""
                                                aria-controls="DataTables_Table_1"></label></div>
                                    <table
                                        class="table table-bordered table-striped table-hover dataTable js-exportable"
                                        id="DataTables_Table_1" role="grid" aria-describedby="DataTables_Table_1_info">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_1"
                                                    rowspan="1" colspan="1" aria-sort="ascending"
                                                    aria-label="Name: activate to sort column descending"
                                                    style="width: 145px;">찜 순위</th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_1"
                                                    rowspan="1" colspan="1"
                                                    aria-label="Position: activate to sort column ascending"
                                                    style="width: 238px;">카테고리</th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_1"
                                                    rowspan="1" colspan="1"
                                                    aria-label="Office: activate to sort column ascending"
                                                    style="width: 105px;">상품명</th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_1"
                                                    rowspan="1" colspan="1"
                                                    aria-label="Age: activate to sort column ascending"
                                                    style="width: 47px;">찜 횟수</th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_1"
                                                    rowspan="1" colspan="1"
                                                    aria-label="Start date: activate to sort column ascending"
                                                    style="width: 99px;">게시일or판매자</th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_1"
                                                    rowspan="1" colspan="1"
                                                    aria-label="Salary: activate to sort column ascending"
                                                    style="width: 80px;">상품ㄹ 금액</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th rowspan="1" colspan="1">Name</th>
                                                <th rowspan="1" colspan="1">Position</th>
                                                <th rowspan="1" colspan="1">Office</th>
                                                <th rowspan="1" colspan="1">Age</th>
                                                <th rowspan="1" colspan="1">Start date</th>
                                                <th rowspan="1" colspan="1">Salary</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">Airi Satou</td>
                                                <td>Accountant</td>
                                                <td>Tokyo</td>
                                                <td>33</td>
                                                <td>2008/11/28</td>
                                                <td>$162,700</td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td class="sorting_1">Angelica Ramos</td>
                                                <td>Chief Executive Officer (CEO)</td>
                                                <td>London</td>
                                                <td>47</td>
                                                <td>2009/10/09</td>
                                                <td>$1,200,000</td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">Ashton Cox</td>
                                                <td>Junior Technical Author</td>
                                                <td>San Francisco</td>
                                                <td>66</td>
                                                <td>2009/01/12</td>
                                                <td>$86,000</td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td class="sorting_1">Bradley Greer</td>
                                                <td>Software Engineer</td>
                                                <td>London</td>
                                                <td>41</td>
                                                <td>2012/10/13</td>
                                                <td>$132,000</td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">Brenden Wagner</td>
                                                <td>Software Engineer</td>
                                                <td>San Francisco</td>
                                                <td>28</td>
                                                <td>2011/06/07</td>
                                                <td>$206,850</td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td class="sorting_1">Brielle Williamson</td>
                                                <td>Integration Specialist</td>
                                                <td>New York</td>
                                                <td>61</td>
                                                <td>2012/12/02</td>
                                                <td>$372,000</td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">Bruno Nash</td>
                                                <td>Software Engineer</td>
                                                <td>London</td>
                                                <td>38</td>
                                                <td>2011/05/03</td>
                                                <td>$163,500</td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td class="sorting_1">Caesar Vance</td>
                                                <td>Pre-Sales Support</td>
                                                <td>New York</td>
                                                <td>21</td>
                                                <td>2011/12/12</td>
                                                <td>$106,450</td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">Cara Stevens</td>
                                                <td>Sales Assistant</td>
                                                <td>New York</td>
                                                <td>46</td>
                                                <td>2011/12/06</td>
                                                <td>$145,600</td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td class="sorting_1">Cedric Kelly</td>
                                                <td>Senior Javascript Developer</td>
                                                <td>Edinburgh</td>
                                                <td>22</td>
                                                <td>2012/03/29</td>
                                                <td>$433,060</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="dataTables_info" id="DataTables_Table_1_info" role="status"
                                        aria-live="polite">Showing 1 to 10 of 57 entries</div>
                                    <div class="dataTables_paginate paging_simple_numbers"
                                        id="DataTables_Table_1_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button previous disabled"
                                                id="DataTables_Table_1_previous"><a href="#"
                                                    aria-controls="DataTables_Table_1" data-dt-idx="0"
                                                    tabindex="0">Previous</a></li>
                                            <li class="paginate_button active"><a href="#"
                                                    aria-controls="DataTables_Table_1" data-dt-idx="1"
                                                    tabindex="0">1</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="DataTables_Table_1"
                                                    data-dt-idx="2" tabindex="0">2</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="DataTables_Table_1"
                                                    data-dt-idx="3" tabindex="0">3</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="DataTables_Table_1"
                                                    data-dt-idx="4" tabindex="0">4</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="DataTables_Table_1"
                                                    data-dt-idx="5" tabindex="0">5</a></li>
                                            <li class="paginate_button "><a href="#" aria-controls="DataTables_Table_1"
                                                    data-dt-idx="6" tabindex="0">6</a></li>
                                            <li class="paginate_button next" id="DataTables_Table_1_next"><a href="#"
                                                    aria-controls="DataTables_Table_1" data-dt-idx="7"
                                                    tabindex="0">Next</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Line Chart -->
            </div>
        </section>
        <!-------------------------------------------SECTION--------------------------------------------------->
	
	
		<!-- Jquery Core Js -->
    	<script src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>
    		
    	<!-- Bootstrap Core Js -->
		<script src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>
			
		<!-- Select Plugin JS -->
		<script src="<c:url value ="/resources/vendor/plugins/bootstrap-select/js/bootstrap-select.js"/>"></script>
     

        <!-- Slimscroll Plugin Js -->
		<script src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

         <!-- Waves Effect Plugin Js -->
       	<script src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>
        
		<!-- Jquery CountTo Plugin Js -->
   		<script src="<c:url value ="/resources/vendor/plugins/jquery-countto/jquery.countTo.js"/>"></script>
     
        <!-- Custom Js -->
        <script src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>

        <!-- Demo Js -->
		<script src="<c:url value ="/resources/vendor/common/javascript/pages/demo.js"/>"></script>
        

        <!-- Morris Plugin Js -->
		<script src="<c:url value ="/resources/vendor/plugins/raphael/raphael.min.js"/>"></script>
		<script src="<c:url value ="/resources/vendor/plugins/morrisjs/morris.js"/>"></script>
        <script src="<c:url value ="/resources/vendor/plugins/momentjs/moment.js"/>"></script>
		
		
		<!-- Dateppicker bootstrap -->
    	<script src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>
    	
    
    	<!-- 해당 JS -->
		<script src="<c:url  value ="/resources/js/admin/statistics/stat_members_datepicker.js"/>"></script>
    	

	
	
</body>
</html>