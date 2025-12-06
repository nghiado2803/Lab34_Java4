<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>${video.title}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<%@ include file="/views/common/header.jsp" %>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-8">
            <div class="ratio ratio-16x9">
                <iframe src="https://www.youtube.com/embed/dQw4w9WgXcQ" allowfullscreen></iframe>
            </div>
            <h3 class="mt-3">${video.title}</h3>
            <p>${video.description}</p>
            <p>Lượt xem: ${video.views}</p>
            <c:if test="${not empty sessionScope.currentUser}">
                <a href="${pageContext.request.contextPath}/video/like?id=${video.id}" class="btn btn-danger">Like</a>
                <a href="${pageContext.request.contextPath}/video/share?id=${video.id}" class="btn btn-info ms-2">Share</a>
            </c:if>
        </div>
    </div>
</div>
</body></html>