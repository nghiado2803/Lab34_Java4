<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Chia sẻ video</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<%@ include file="/views/common/header.jsp" %>
<div class="container mt-5">
    <h3>Chia sẻ video: ${video.title}</h3>
    <c:if test="${not empty message}"><div class="alert alert-success">${message}</div></c:if>
    <form action="${pageContext.request.contextPath}/video/share" method="post">
        <input type="hidden" name="videoId" value="${video.id}">
        <div class="mb-3"><label>Email người nhận (cách nhau bởi dấu phẩy)</label>
            <textarea name="emails" class="form-control" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-success">Gửi email chia sẻ</button>
        <a href="${pageContext.request.contextPath}/video/list" class="btn btn-secondary ms-2">Quay lại</a>
    </form>
</div>
</body></html>