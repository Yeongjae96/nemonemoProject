<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 사이드 배너 시작-->
        <div class="sidebanner-layout">
            <div class="sb-size">
                <div class="jjim">
                    <div class="jjim-text">찜한상품</div>
                    <div class="jjim-cnt">
                        <a class="to-favorites" href="<c:url value="/shop/${user.storeNo}/favorites.do"/>">
                            <img src="<c:url value="/resources/images/user/common/jjimheart.png"/>"
                                width="9" height="9" alt="찜 링크"><span>0</span></a>
                    </div>
                </div>
                <!--찜 바로가기 끝-->
                <div class="rec-prd">
                    <!-- 최근 본 상품 시작 -->
                    <div class="rec-prd-text">최근본상품</div>
                    <div class="rec-prd-outline">
                        <div class="rec-prd-cnt">1<span></span></div>
                    </div>
                    <div id="rec-prd-list">
                        <%-- <a class="rec-prd-img" href="#">
                            <img src=<c:url value="/resources/images/user/common/nike.jpeg"/> alt="상품 이미지">
                            <!-- 마우스 갖다 대면 상품 정보 간단히 보여줌 -->
                            <div class="prd-info">
                                <button class="delete-rec"> 
                                    <img src="<c:url value="/resources/images/user/common/delete_btn.png"/>" width="10" height="12" alt="삭제 버튼 이미지">
                                 </button>
                                <div class="rec-prd-title"></div>
                                <div class="rec-prd-price"><span>원</span></div>
                            </div>
                        </a> --%>
                    </div>
                    <div class="rec-prd-paging">
                        <!--페이징 처리-->
                        <button disabled="" class="paging-arrow">
                            <img src="<c:url value="/resources/images/user/common/leftarrow.png"/>"
                                width="5" height="9" alt="화살표 아이콘"></button>
                        <div class="paging-cnt">
                        	<span>1/1</span></div>
                        <button disabled="" class="paging-arrow"><img
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