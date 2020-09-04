<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/main/main.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script> window.contextPath = "<c:url value="/"/>"</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/main/main.js"/>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="<c:url value="/resources/js/user/main/jquery.scrolltabs.js"/>"></script>
<!-- 리다이렉트로 값을 받아 alert문 안내 -->
<script>
	/* var result = '${msg}';
	
	if (result == 'success') {
		alert("로그인 성공\n네모내모에 어서오세요!");
	} else if (result=='idfail'){
		alert("아이디가 없습니다. \n회원가입 해주시길 바랍니다");
		$(function() {
			$('#loginModal').show();
		})
	} else if (result=='passwordfail'){
		alert("비밀번호가 틀렸습니다. \n다시 로그인해주세요.");
		$(function() {
			$('#loginModal').show();
		})
	} else if (result=='stop'){
		alert("정지된 아이디입니다.");
	} else if (result=='slogininfo'){
		alert("소셜로그인 처음 하셨습니다 .\n내계정에 가서 회원수정해주시길 바랍니다.");
	} else if (result=='logout'){
		alert("로그아웃 되셨습니다. \n안녕히가세요.");
	} */
</script>

</head>
<body>
	<% 
		/* 공통 Header */
	%>
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp"/>
	<% 
		/* 공통 Header */
	%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp"/>		
	</header>
	
	<%    
	String kakaonickname = request.getParameter("kakaonickname");
    session.setAttribute("kakaonickname", kakaonickname);
      	if (kakaonickname != null){
    %>
    
    <%=" (카카오톡) "+session.getAttribute("kakaonickname")%>님 방문을 환영합니다.
    
    <form action = "kakao_logout.do" method = "post">
    <button type = "submit" name = "submit">로그아웃</button></form>
    
    <%
        };
        
    %>
	
	<% 
		/* 각 페이지의 특성! */
	%>
	<section>
        <!-- banner -->
        <section class="banner">
            <div><img src="<c:url value="/resources/images/user/main/first_banner.png"/>" alt="배너1" width="1024" height="300"></div>
            <div><img src="<c:url value="/resources/images/user/main/second_banner.png"/>" alt="배너2" width="1024" height="300"></div>
            <div><img src="<c:url value="/resources/images/user/main/third_banner.png"/>" alt="배너3" width="1024" height="300"></div>
        </section>
        <!-- banner end -->

        <!-- contents 영역 -->
        <div class="second_content_back">
            <!--좌우 여백을 제외한 실질적인 contents 영역-->
            <div class="second_content">
                <!-- 추천상품 영역 -->
                <div class="main-recommend">
                    <div class="main-recommend-title"><h4>네모내모 추천 상품</h4></div><br>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                          <div class="swiper-slide">
                              <div class="bx_group">
                                  <div>
                                    <div class="main-recommend-box-pic">
                                        <img src="<c:url value="/resources/images/user/main/rec1.jpg"/>" alt="추천상품1"></div>
                                    <div class="main-recommend-box-title">갤럭시 버즈 (1번 사용)</div>
                                    <div class="main-recommend-box-price">- - - - - - - - - - - - - - - -  <br><b>60,000</b>원</div>
                                </div>
                                <div>
                                    <div class="main-recommend-box-pic">
                                        <img src="<c:url value="/resources/images/user/main/rec2.jpg"/>" alt="추천상품2"></div>
                                    <div class="main-recommend-box-title">중간 골프채</div>
                                    <div class="main-recommend-box-price">- - - - - - - - - - - - - - - -  <br><b>120,000</b>원</div>
                                </div>
                                <div>
                                    <div class="main-recommend-box-pic">
                                        <img src="<c:url value="/resources/images/user/main/rec3.jpg"/>" alt="추천상품3"></div>
                                    <div class="main-recommend-box-title">미스치프 티셔츠</div>
                                    <div class="main-recommend-box-price">- - - - - - - - - - - - - - - -   <br><b>30,000</b>원</div>
                                </div>
                                <div>
                                    <div class="main-recommend-box-pic">
                                        <img src="<c:url value="/resources/images/user/main/rec4.jpg"/>" alt="추천상품4"></div>
                                    <div class="main-recommend-box-title">최고급 낚싯대</div>
                                    <div class="main-recommend-box-price">- - - - - - - - - - - - - - - -  <br><b>300,000</b>원</div>
                                </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="bx_group">
                                    <div>box1</div>
                                    <div>box2</div>
                                    <div>box3</div>
                                    <div>box4</div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="bx_group">
                                    <div>box1</div>
                                    <div>box2</div>
                                </div>
                            </div>
                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
                <br>
                <!-- 추천상품 영역 끝-->
                <!--카테고리별 인기상품 영역-->
                <div class="main-popular">
                        <div class="main-popular-title"><h4>카테고리별 인기 상품</h4></div><br>
                        <div id="main-popular-scroll"> <span>패션잡화</span> <span>여성의류</span> <span>남성의류</span> 
                        <span>디지털/가전</span> <span>도서/티켓</span> <span>생활/문구</span> <span>유아동/출산</span> 
                        <span>스타/굿즈</span> <span>뷰티/미용</span> <span>스포츠/레저</span> <span>Another Tab</span> 
                        <span>Another Tab</span> <span>Another Tab</span> 
                    </div>
                    <div class="main-popular-gallery">
                        <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop1.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop1.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">아디다스 슬리퍼
                            <div class="desc-price"><b>20,000</b>원
                        </div>
                      </div>
                    </div>
                        <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop2.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop2.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">슈프림 백팩
                            <div class="desc-price"><b>50,000</b>원
                        </div>
                      </div>
                    </div>
                        <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/poo3.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop3.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">이지부스트
                            <div class="desc-price"><b>320,000</b>원
                        </div>
                      </div>
                    </div>
                        <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">샤넬백
                            <div class="desc-price"><b>260,000</b>원
                        </div>
                      </div>
                    </div>
                        <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop5.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop5.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">금팔찌 급처로 팝니다.
                            <div class="desc-price"><b>250,000</b>원
                            <!-- <div class="desc-time">2시간 전</div> -->
                        </div>
                      </div>
                    </div>
                        <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop5.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop5.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">금팔찌 급처..
                            <div class="desc-price"><b>연락요망</b>
                                <!-- <div class="desc-time">2시간 전</div> -->
                            </div>
                        </div>
                      </div>
                    </div>
                    <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">샤넬백
                            <div class="desc-price"><b>260,000</b>원
                        </div>
                      </div>
                    </div>
                    <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">샤넬백
                            <div class="desc-price"><b>260,000</b>원
                        </div>
                      </div>
                    </div>
                    <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">샤넬백
                            <div class="desc-price"><b>260,000</b>원
                        </div>
                      </div>
                    </div>
                    <div class="gallery">
                        <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                          <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                        </a>
                        <div class="desc">샤넬백
                            <div class="desc-price"><b>260,000</b>원
                        </div>
                      </div>
                    </div>
                </div> 
                <!--카테고리 탭-->
                
                <div class="main-popular">
                    <div class="main-popular-title"><h4>카테고리별 인기 상품</h4></div><br>
                
                <div class="main-popular-gallery">
                    <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop1.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop1.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">아디다스 슬리퍼
                        <div class="desc-price"><b>20,000</b>원
                    </div>
                  </div>
                </div>
                    <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop2.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop2.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">슈프림 백팩
                        <div class="desc-price"><b>50,000</b>원
                    </div>
                  </div>
                </div>
                    <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop3.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop3.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">이지부스트
                        <div class="desc-price"><b>320,000</b>원
                    </div>
                  </div>
                </div>
                    <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">샤넬백
                        <div class="desc-price"><b>260,000</b>원
                    </div>
                  </div>
                </div>
                    <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop5.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop5.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">금팔찌 급처로 팝니다.
                        <div class="desc-price"><b>250,000</b>원
                        <!-- <div class="desc-time">2시간 전</div> -->
                    </div>
                  </div>
                </div>
                    <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop5.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop5.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">금팔찌 급처..
                        <div class="desc-price"><b>연락요망</b>
                            <!-- <div class="desc-time">2시간 전</div> -->
                        </div>
                    </div>
                  </div>
                </div>
                <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">샤넬백
                        <div class="desc-price"><b>260,000</b>원
                    </div>
                  </div>
                </div>
                <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">샤넬백
                        <div class="desc-price"><b>260,000</b>원
                    </div>
                  </div>
                </div>
                <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">샤넬백
                        <div class="desc-price"><b>260,000</b>원
                    </div>
                  </div>
                </div>
                <div class="gallery2">
                    <a target="_blank" href="<c:url value="/resources/images/user/main/pop4.jpg"/>">
                      <img src="<c:url value="/resources/images/user/main/pop4.jpg"/>" alt="cat1" >
                    </a>
                    <div class="desc">샤넬백
                        <div class="desc-price"><b>260,000</b>원
                    </div>
                  </div>
                </div>
            </div> 
         </div>
       </div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>