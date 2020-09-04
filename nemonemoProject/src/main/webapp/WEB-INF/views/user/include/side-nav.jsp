<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 사이드 배너 시작-->
        <div class="sidebanner-layout">
            <div class="sb-size">
                <div class="jjim">
                    <div class="jjim-text">찜한상품</div>
                    <div class="jjim-cnt">
                    	<input id= "userno" type = "hidden" data-userno ="${user.storeNo}">
                        <a id ="to-favorites" class="to-favorites" href="<c:url value="/shop/${user.storeNo}/favorites.do"/>">
                            <img id ="favimg" class="favimg" src="<c:url value="/resources/images/user/common/jjimheart.png"/>"
                                width="9" height="9" alt="찜 링크">
                         </a>
                    </div>
                </div>
                <!--찜 바로가기 끝-->
                <div class="rec-prd">
                    <!-- 최근 본 상품 시작 -->
                    <div class="rec-prd-text">최근본상품</div>
                    <div class="rec-prd-outline">
                        <div class="rec-prd-cnt"></div>
                    </div>
                    <div id="rec-prd-list">
                    		<!-- 최근 본 상품 컨텐츠 자리 -->
                    </div>
                    <div class="rec-prd-paging">
                        <!--페이징 처리-->
                        <button class="paging-arrow">
                            <img src="<c:url value="/resources/images/user/common/leftarrow.png"/>"
                                width="5" height="9" alt="화살표 아이콘"></button>
                        <div class="paging-cnt"></div>
                        <button class="paging-arrow"><img
                                src="<c:url value="/resources/images/user/common/rightarrow.png"/>"
                                width="5" height="9" alt="화살표 아이콘"></button>
                    </div>
                </div><!-- 최근 본 상품 끝 -->
                <div class="to-the-top">
                    <button class="text-top">TOP</button>
                </div>

            </div>

        </div>
        <!--사이드 배너 끝 -->