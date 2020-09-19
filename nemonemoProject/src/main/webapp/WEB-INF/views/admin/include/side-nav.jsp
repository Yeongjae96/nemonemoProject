<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- 어드민 정보 -->
            <div class="user-info">
                <%-- <div>
                						<!-- 로고 이미지 들어갈 곳  -->
                    <img src="<c:url value="/resources/images/common/logo/favicon.png"/>" alt="User" />
                </div> --%>
                <div class="info-container" >
                	 <i class="material-icons" id="adminIcon">person</i>
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<c:if test="${admin != null}">
							${admin.adminId}님 안녕하세요
						</c:if>
						<c:if test="${admin == null}">
							로그인 해주시길 바랍니다
						</c:if>
					</div>
                    <div class="btn-group user-helper-dropdown">
                        <i id="adminMenuArrow" class="material-icons" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="true">keyboard_arrow_down</i>
                        <ul id="adminMenu" class="dropdown-menu pull-right">
                            <%-- <li><a href="<c:url value="${pageContext.request.contextPath}/management/profile.mdo"/>"><i class="material-icons">person</i>직원관리</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<c:url value="${pageContext.request.contextPath}/management/signup.mdo"/>"><i class="material-icons">group</i>관리자추가</a></li>                  
                            <li role="separator" class="divider"></li> --%>
                            <li><a href="<c:url value="${pageContext.request.contextPath}/management/logout.mdo"/>"><i class="material-icons">input</i>로그아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #END# 어드민 정보 -->


            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="active">
                        <a href="<c:url value="/index.mdo"/>">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">widgets</i>
                            <span>회원관리</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="<c:url value="/members/list.mdo"/>">회원정보</a>
                            </li>
                            <li>
                                <a href="<c:url value="/members/qna/list.mdo"/>">1:1문의</a>
                            </li>
                            <%--  <li>
                                <a href="<c:url value=""/>">회원쿠폰</a>
                            </li> --%>
                            <li>
                                <a href="<c:url value="/members/report/list.mdo"/>">신고관리</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">assignment</i>
                            <span>사이트 관리</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="<c:url value="/sites/banner/list.mdo"/>">배너(광고) 관리</a>
                            </li>
                            <li>
                                <a href="<c:url value="/sites/notice/list.mdo"/>">공지사항 관리</a>
                            </li>
                            <li>
                                <a href="<c:url value="/sites/faq/list.mdo"/>">자주묻는질문 관리</a>
                            </li>
                            <li>
                                <a href="<c:url value="/sites/terms/list.mdo"/>">이용약관 관리</a>
                            </li>
                            <li>
                                <a href="<c:url value="/sites/coupon/list.mdo"/>">프로모션 관리</a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">swap_calls</i>
                            <span>상품 관리</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="<c:url value="/products/list.mdo"/>">상품관리</a>
                            </li>
                        </ul>
                    </li>
                   <li>
                        <a href="javascript:void(0);" class="menu-toggle waves-effect waves-block">
                            <i class="material-icons">attach_money</i>
                            <span>거래 관리</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="<c:url value="/transaction/orderList.mdo"/>" class=" waves-effect waves-block">주문 내역 관리</a>
                            </li>
                            <li>
                                <a href="<c:url value="/transaction/paymentList.mdo"/>" class=" waves-effect waves-block">결제 관리</a>

                            </li>
                        </ul>
                    </li>      
                   <%--  <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">trending_down</i>
                            <span>통계</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>회원현황</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="<c:url value="#"/>">총 회원 / 신규회원</a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="#"/>">성별 / 나이대</a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="#"/>">찜</a>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">
                                    <span>판매현황</span>
                                </a>
                                <ul class="ml-menu">
                                    <li>
                                        <a href="<c:url value="#"/>">총 매출</a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="#"/>">카테고리별 매출</a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="#"/>">지역별 매출</a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="#"/>">가격대별</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li> --%>

                </ul> <!-- 메인 메뉴 ul 끝-->
                
            </div>
            <!-- #Menu -->

        </aside>
        <!-- #END# Left Sidebar -->
      </section>

