<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${pageVO ne null}">
	<!-- 페이징 부분 -->
	<div class="category-paging__area">
		<div class="category-paging__div">
			<c:if test="${pageVO.prev eq true}">
				<a class="category-paging__prev"
					href="${pageName}.do?pageNo=${pageVO.startGroupNo - pageVO.groupSize}">
					<i class="fas fa-chevron-left"></i>
				</a>
			</c:if>
			<c:forEach begin="${pageVO.startGroupNo}" end="${pageVO.endGroupNo}"
				varStatus="st">
				<c:if test="${param.pageNo eq pageVO.pageNo or pageVO.pageNo == 1}">
					<a class="category-paging__page--active"
						href="${pageName}.do?pageNo=${st.current}">${st.current}</a>
				</c:if>
				<c:if
					test="${param.pageNo ne pageVO.pageNo and pageVO.pageNo != 1}}">
					<a class="category-paging__page"
						href="${pageName}.do?pageNo=${st.current}">${st.current}</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageVO.next eq true}">
				<a class="category-paging__next"
					href="${pageName}.do?pageNo=${pageVO.startGroupNo + pageVO.groupSize}">
					<i class="fas fa-chevron-right"></i>
				</a>
			</c:if>
		</div>
	</div>
</c:if>