<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <div class ="logoImage">
                	<a class="navbar-brand pt-5 pl-0 pr-0" href="<c:url value="/index.mdo"/>">
                 		<img alt="mainLogo" src="<c:url value="/resources/images/common/logo/mainLogo_w.png"/>">
                	</a>
                </div>
<%--                 <a class="navbar-brand" href="<c:url value="/index.mdo"/>"></a> --%>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
