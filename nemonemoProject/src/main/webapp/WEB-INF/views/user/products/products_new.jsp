<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네 모든것 내 모든것!, 네모내모</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/products/products_new.css"/>">


<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/vendor/jquery/jquery.form.min.js"/>"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f60851ef3536c185d43dc653f4abb8d&libraries=services"></script>
<!-- 해당 페이지 JS파일 -->

<script> this.contextPath = "<c:url value="/"/>"</script>
<script src="<c:url value="/resources/js/user/products/menubar.js"/>"></script>
<script src="<c:url value="/resources/js/user/products/products_new.js"/>"></script>

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
		<form action="#" method="post" enctype="multipart/form-data" id="newForm">
			<!-- 상품등록 메인 컨텐츠 -->
			<div class="container-fluid d-flex justify-content-center">
				<main class="flex-container">
					<!-- 제목 -->
					<section class="flex-box">
						<h2 class="border-bottom-2p">
							기본정보<span class=""><sup>*</sup>필수항목</span>
						</h2>
						<!-- 전체 목록 -->
						<ul class="flex-container">
							<li class="products-main-item">
								<div class="products-title--div">
									상품이미지<span>*</span><small>(0/8)</small>
								</div>
								<div class="products-content--div">
									<ul class="image-registry__list" id="imageList">
										<li class="image-registry__item">이미지 등록
										<input type="file" multiple="multiple" id="inputFile" name="">
										</li>
									</ul>
									<div class="image-introduce">
										<b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b><br> - 이미지는 상품등록 시
										정사각형으로 짤려서 등록됩니다.<br> - 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br>
										- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br> - 큰 이미지일경우 이미지가
										깨지는 경우가 발생할 수 있습니다.<br> 최대 지원 사이즈인 640 X 640 으로 리사이즈 해서
										올려주세요.(개당 이미지 최대 10M)
									</div>
								</div>
							</li>
							<li class="products-main-item">
								<div class="products-title--div">
									제목<span>*</span>
								</div>
								<div class="products-content--div">
									<div class="products-title__div">
										<div class="products-content--div">
											<input type="text" placeholder="상품 제목을 입력해주세요."
												class="products-title__input" id="productsTitleInput" name="productName">
											<button type="button"
												class="products-title__cancel invisible"></button>
										</div>
										<div class="products-title__size">
											<span id="products-title--size">0</span>/40
										</div>
									</div>
								</div>
							</li>
							<!-- 카테고리 -->
							<li class="products-main-item">
								<div class="products-title--div">
									카테고리<span>*</span>
								</div>
								<div class="products-content--div">
									<div class="products-category__div1">
										<div class="products-category__div2">
											<ul class="products-category-list" id="lgCategory">
											<li class="products-category-nothing">대분류 선택</li>
											</ul>
										</div>
										<div class="products-category__div2">
											<ul class="products-category-list" id="mdCategory">
												<li class="products-category-nothing">중분류 선택</li>
											</ul>
										</div>
										<div class="products-category__div2">
											<ul class="products-category-list" id="smCategory">
												<li class="products-category-nothing">소분류 선택</li>
											</ul>
										</div>
									</div>
									<h3 class="products-category__guide" id="selectedCategory">
										선택한 카테고리 : <b></b>
									</h3>
								</div>
							</li>
							<!-- 거래지역 -->
							<li class="products-main-item">
								<div class="products-title--div">
									거래지역<span>*</span>
								</div>
								<div class="products-content--div">
									<div class="products-location--div">
										<button type="button" class="" id="myLocationBtn">내 위치</button>
										<button type="button" class="" id="myRecentBtn">최근 지역</button>
										<button type="button" class="">지하철 검색</button>
										<button type="button" class="">주소 검색</button>
									</div>
									<input readonly placeholder="선호 거래 지역을 검색해주세요."
										class="products-location--input" value="인천" id="myLocationInput" name="productDealArea">
								</div>
							</li>
							<!-- 상태 -->
							<li class="products-main-item">
								<div class="products-title--div">
									상태<span>*</span>
								</div>
								<div class="products-content--div d-flex align-items-end mt-2">
									<div class="products-status--div">
										<label for="중고상품" class="products-status--label"> <input
											id="중고상품" type="radio" value="N" name="productUsedSt">중고상품
										</label> <label for="새상품" class="products-status--label"> <input
											id="새상품" type="radio" value="Y" name="productUsedSt">새상품
										</label>
									</div>
								</div>
							</li>

							<!-- 교환 -->
							<li class="products-main-item">
								<div class="products-title--div">
									교환<span>*</span>
								</div>
								<div class="products-content--div d-flex align-items-end mt-2">
									<div class="products-status--div">
										<label for="교환불가" class="products-status--label"> <input
											id="교환불가" type="radio" value="N" name="productExchSt">교환불가
										</label> <label for="교환가능" class="products-status--label"> <input
											id="교환가능" type="radio" value="Y" name="productExchSt">교환가능
										</label>
									</div>
								</div>
							</li>

							<!-- 가격 -->
							<li class="products-main-item">
								<div class="products-title--div">
									가격<span>*</span>
								</div>
								<div class="products-content--div">
									<div class="products-price--div">
										<input type="text" placeholder="숫자만 입력해주세요."
											class="" id="priceInput" name="productPrice"> 원
									</div>
									<div id="price-validation-text" class="invisible">
										<i class="fas fa-ban"></i>
									100원 이상
										입력해주세요.</div>
									<div class="products-delivery-price--div">
										<div class="products-delivery-price--div2">
											<label for="freeShipping"
												class="products-delivery-price--label"> <input
												id="freeShipping" type="checkbox">무료배송
											</label>
										</div>
										<div class="sc-bAtgIc jaIdBw">
											<label for="contactHope"
												class="products-delivery-price--label"> <input
												id="contactHope" type="checkbox" name="">가격협의 가능
											</label>
										</div>
									</div>
								</div>
							</li>
							<!-- 상품 설명-->
							<li class="products-main-item">
								<div class="products-title--div">설명</div>
								<div class="products-content--div">
									<textarea placeholder="상품 설명을 입력해주세요." rows="6" id="contentInput" name="productInfo"></textarea>
									<div class="products-content--size"><span id="explainSize">0</span>/2000</div>
								</div>
							</li>
							<!-- 연관 태그 -->
							<li class="products-main-item">
								<div class="products-title--div">연관태그</div>
								<div class="products-content--div">
									<div class="products-tag--div">
										<div class="products-tag--div2">
											<!-- TAG INPUT태그 -->
											<div class="products-tag--div3">
												<input type="text" placeholder="연관태그를 입력해주세요. (최대 5개)"
													value="" id="tagInput">
											</div>
										</div>
									</div>
									<ul class="products-tag-comment-list">
										<li class="products-tag-comment-item">
											<p>태그는 띄어쓰기로 구분되며 최대 8자 까지 입력할 수 있습니다.</p>
										</li>
										<li class="products-tag-comment-item">
											<p>태그는 검색의 부가정보로 사용 되지만, 검색 결과 노출을 보장하지는 않습니다.</p>
										</li>
										<li class="products-tag-comment-item">
											<p>검색 광고는 태그정보를 기준으로 노출됩니다.</p>
										</li>
										<li class="products-tag-comment-item">
											<p>상품과 직접 관련이 없는 다른 상품명, 브랜드, 스팸성 키워드 등을 입력하면 노출이 중단되거나 상품이 삭제될 수 있습니다.</p>
										</li>
									</ul>
								</div>
							</li>


							<!-- 수량 -->
							<li class="products-main-item">
								<div class="products-title--div">수량</div>
								<div class="products-content--div">
									<div class="products-count--div">
										<input id= "quantityInput" type="text" class="products-count--input" name="productQty" placeholder="수량을 입력해주세요">개
									</div>
								</div>
							</li>
						</ul>
					</section>
					
					<!-- 최근거래 모달창 -->
					<div class="products-modal__recent">
						<section class="modal-recent__area">
							<header>
								최근지역
								<button type="button" class="modal-recent__close" id="recentModalClose">
									<i class="fas fa-times"></i>
								</button>
							</header>
							<!-- <ul>
								<li>
									예시 데이터
									<button class="modal-recent__btn">
										경기도 의정부시 
									</button>
								</li>
							</ul> -->
						</section>
					</div>
					
					
					<!-- 꼭 읽어주세요! 이용가이드 ... -->
					<h3 class="products-footer--h3">
						<span> <!-- 이미지가 들어가야할 부분 --></span> 꼭 읽어주세요 <a href="#"
							target="_blank" rel="noopener noreferrer">이용 가이드</a>
					</h3>
					<p class="products-footer--p">
						상품등록 시 <b>네모페이가 자동 적용</b>됩니다. 거래완료 후 등록된 계좌로 입금되며 <b>정산 확인은
							‘마이메뉴 < 구매/판매내역’</b>에서 가능합니다.
					</p>
					</p>
					<div id="products-footer">
						<div class="products-footer-div">
							<!-- jquery로 서브밋 걸기 -->
							<button id="productRegBtn" class="products-footer-btn">등록하기</button>
						</div>
					</div>

				</main>
			</div>

		</form>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp" />
</body>
</html>