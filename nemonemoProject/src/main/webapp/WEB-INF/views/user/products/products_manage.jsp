<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="productList" value="${vo.productsManageVOList}"/>
<c:set var="pageVO" value="${vo.pageVO}" scope="request"/>
<c:set var="pageName" value="manage" scope="request"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모!</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/paging/paging.css"/>">
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/products/products_manage.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>window.contextPath = '<c:url value="/"/>';</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/products/menubar.js"/>"></script>
<script src="<c:url value="/resources/js/user/products/products_manage.js"/>"></script>


</head>
<body>


	<% 
		/* 공통 Header */
	%>	
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp" />
	<% 
		/* 공통 Header */
	%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp" />
	</header>
	<% 
		/* 각 페이지의 특성! */
	%>
	<section>
		<!-- 상품등록 메뉴바 -->
   <%@include file="/WEB-INF/views/user/products/common/menubar.jsp" %>
    <!-- 상품 관리 시작 -->
    <div class="products-manage__div">
        <main class="products-manage__main">
            <header class="products-manage__header">
                <form class="products-manage__form" action="manage.do" method="GET" name="titleSearchForm">
                    <input type="text" placeholder="상품명을 입력해주세요." name="q" value="${param.q}" id="titleSearchInput" autocomplete="off">
                    <button type="submit" class="products-manage__search-Btn" id="titleSearchBtn">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <div class="products-manage__cbox-div">
                    <div class="products-manage__cbox-div2">
                        <div class="products-manage__cbox-div3" id="countComBox">
                            <div class="products-manage__cbox-div4" >
								<c:set var="pageSize" value="${empty param.pageSize ? '10' : param.pageSize}"/>
	                                <div class="products-manage__cbox--item">${pageSize}개씩</div>
                            	
                                <input readonly tabindex="0" aria-autocomplete="list"
                                    class="products-manage__cbox--input" value="">
                            </div>
                            <div class="products-manage__cbox--icon" id="countArrow">
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="products-manage__count--list" id="countList">
                            	<c:forEach var="cnt" items="${cntList}">
                            		<c:if test="${cnt eq pageSize}">
		                               <div class="products-manage__count--item item--selected">${cnt}개씩</div>
                            		</c:if>
                            		<c:if test="${cnt ne pageSize}">
		                                <div class="products-manage__count--item">${cnt}개씩</div>
                            		</c:if>
                            	</c:forEach>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="products-manage__cbox-div">
                    <div class="products-manage__cbox-div2">
                        <div class="products-manage__cbox-div3" id="statusComBox">
                            <div class="products-manage__cbox-div4" >
                                <div class="products-manage__cbox--item">
                           		<c:set var="status" value="${empty param.status ? 'all' : param.status}"/>
                               			${allStList[status]}
                                </div>
                                <input readonly  aria-autocomplete="list"
                                    class="products-manage__cbox--input" value="">
                            </div>
                            <div class="products-manage__cbox--icon" id="statusArrow">
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="products-manage__st--list" id="statusList">
                            	<c:forEach var="allSt" items="${allStList}">
                            		<c:if test="${status == allSt.key}">
		                                <div class="products-manage__st--item item--selected">${allSt.value}</div>
                            		</c:if>
                            		<c:if test="${status != allSt.key}">
		                                <div class="products-manage__st--item">${allSt.value}</div>
                            		</c:if>
                            	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <table>
                <thead>
                    <tr>
                        <th>사진</th>
                        <th>판매상태</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>찜/댓글</th>
                        <th>최근수정일</th>
                        <th>기능</th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${productList != null}"> 
	                	<c:forEach var="p" items="${productList}">
		                    <tr>
		                        <td>
		                            <a href="<c:url value="/products/${p.productNo}.do"/>">
		                            <img src="<c:url value="/image/product/${p.productImgNo}.img"/>" alt="상품이미지"></a></td>
		                        <td>
		                            <div class="products-manage__cbox-div2 product-combo-box" id="productComBox">
		                                <div class="products-manage__cbox-div3">
		                                    <div class="products-manage__cbox-div4">
		                                        <c:if test="${p.productDispSt == 'P'}">
		                                        	<div class="products-manage__cbox--item" style="color:#EE5058;">
		                                        		판매중지
		                                        	</div>
		                                        </c:if>
		                                        <c:if test="${p.productDispSt != 'P'}">
			                                        <div class="products-manage__cbox--item" data-st="${p.productDispSt}" id="currSt">
														<c:choose>
															<c:when test="${p.productDispSt == 'S'}">
																판매중
															</c:when>
															<c:when test="${p.productDispSt == 'R'}">
																예약중
															</c:when>
															<c:when test="${p.productDispSt == 'F'}">
																판매완료
															</c:when>
														</c:choose>
													</div>
												</c:if>
		                                        <input readonly tabindex="0" aria-autocomplete="list" class="products-manage__cbox--input" value="">
		                                    </div>
		                                    <div class="products-manage__cbox--icon" id="productStArrow">
		                                        <i class="fas fa-chevron-down"></i>
		                                    </div>
		                                </div>
		                                <c:if test="${p.productDispSt != 'P'}">
			                                <div class="pd-status-list" id="productStList" data-no="${p.productNo}">
			                                	<c:forEach var="entity" items="${productStList }">
			                                		<c:if test="${entity.key == p.productDispSt}">
				                                		<div class="pd-status-item item--selected" data-st="${entity.key}">${entity.value}</div>
			                                		</c:if>
			                                		<c:if test="${entity.key != p.productDispSt}">
				                                		<div class="pd-status-item" data-st="${entity.key}">${entity.value}</div>
			                                		</c:if>
			                                	</c:forEach>
			                                </div>
		                                </c:if>
		                            </div>
		                        </td>
		                        <td><a href="<c:url value="/products/${p.productNo}.do"/>">${p.productName}</a></td>
		                        <td>${p.productPrice }</td>
		                        <td>${p.favoriteCnt}/${p.commentCnt}</td>
		                        <td>																					
		                        	<c:if test="${p.productEditDt == null}"><fmt:formatDate value="${p.productRegDt}" var="date" pattern="yyyy-MM-dd HH:mm"/></c:if>
		                        	<c:if test="${p.productEditDt != null}"><fmt:formatDate value="${p.productEditDt}" var="date" pattern="yyyy-MM-dd HH:mm"/></c:if>
									${date}
								</td>
		                        <td><!-- <button type="button" class="products-manage__up-btn">UP</button> -->
		                            <a class="products-manage__modify-link" href="<c:url value="/products/${p.productNo}/edit.do"/>">수정</a></td>
		                    </tr>
	                    </c:forEach>
                    </c:if>
                </tbody>
            </table>
                <c:if test="${empty productList}"> 
                   <div class="product--nothing">
                   		<i class="fas fa-file-alt"></i>
                   		등록된 상품이 없습니다
                   	</div> 	
                </c:if>
        </main>
        <div class="products-manage__footer">
            <jsp:include page="/WEB-INF/views/common/paging/paging.jsp"/>
        </div>

    </div>
    
    <div id="modal">
    	<div class="st-modal-area">
	    	<div class="st-modal-div">
	    		<div class="st-modal-content">
	    			<div class="st-modal-msg-area"><div class="st-modal-msg-text"><p>상태 변경되었습니다.</p></div></div>
	    			<div class="st-modal-btn-area">
	    				<button class="st-modal-btn">확인</button>
	    			</div>
	    			<div class="st-modal-bg"></div>
	    		</div>
	    	</div>
    	</div>
    </div>
    
	</section>
	
	
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp" />
</body>
</html>