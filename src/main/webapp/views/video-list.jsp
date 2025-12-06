<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Danh sách Video</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<%@ include file="/views/common/header.jsp" %>
<div class="container mt-4">
    <h2 class="text-center mb-4">DANH SÁCH VIDEO</h2>
    <div class="row">
        <c:forEach var="v" items="${videos}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="${v.poster}" class="card-img-top" style="height:200px;object-fit:cover">
                    <div class="card-body">
                        <h5>${v.title}</h5>
                        <p>Lượt xem: ${v.views}</p>
                        <a href="${pageContext.request.contextPath}/video/detail?id=${v.id}" class="btn btn-primary">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body></html>