<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid d-flex justify-content-center border-bottom">
	<!-- 메뉴 nav -->
	<nav class="flex-box products-nav">
		<div class="product-nav-item">
			<a href="<c:url value="/products/new.do"/>" class="product-nav-link" data-set="new">상품등록</a>
		</div>
		<div class="product-nav-item">
			<a href="<c:url value="/products/manage.do"/>" class="product-nav-link" data-set="manage">상품관리</a>
		</div>
		<div class="product-nav-item">
			<a href="<c:url value="/products/new.do"/>" class="product-nav-link" data-set="buy">구매/판매
				내역</a>
		</div>
	</nav>
</div>