<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${not empty param}">
	<c:forEach var="i" items="${param}" varStatus="st">
		<c:if test="${i.key != 'pageNo'}">
			<c:if test="${prevParam != null and not (st.first)}">
				<c:set var="prevParam" value="${prevParam}${i.key}=${i.value}&"/>
			</c:if>
			<c:if test="${prevParam == null}">
				<c:set var="prevParam" value="?${i.key}=${i.value}&"/>
			</c:if>
		</c:if>
	</c:forEach>
</c:if>
<c:if test="${empty param or (param.pageNo != null and fn:length(param) == 1)}">
	<c:set var="prevParam" value="?"/>
</c:if>

<c:if test="${empty param.pageNo}">
	<c:set var="currentPageNo" value="1"/>
</c:if>
<c:if test="${not empty param.pageNo}">
	<c:set var="currentPageNo" value="${param.pageNo}"/>
</c:if>
<c:if test="${pageVO ne null}">
	<!-- 페이징 부분 -->
	<div class="category-paging__area">
		<div class="category-paging__div">
			<c:if test="${pageVO.prev eq true}">
				<a class="category-paging__prev"
					href="${pageName}.do${prevParam}pageNo=${pageVO.startGroupNo - pageVO.groupSize}">
					<i class="fas fa-chevron-left"></i>
				</a>
			</c:if>
			<c:forEach begin="${pageVO.startGroupNo}" end="${pageVO.endGroupNo}"
				varStatus="st">
				
				<c:if test="${currentPageNo eq st.current}">
					<a class="category-paging__page--active"
						href="${pageName}.do${prevParam}pageNo=${st.current}">${st.current}</a>
				</c:if>
				<c:if
					test="${currentPageNo ne st.current}">
					<a class="category-paging__page"
						href="${pageName}.do${prevParam}pageNo=${st.current}">${st.current}</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageVO.next eq true}">
				<a class="category-paging__next"
					href="${pageName}.do${prevParam}pageNo=${pageVO.startGroupNo + pageVO.groupSize}">
					<i class="fas fa-chevron-right"></i>
				</a>
			</c:if>
		</div>
	</div>
</c:if>