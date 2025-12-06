<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Đổi mật khẩu</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<%@ include file="/views/common/header.jsp" %>
<div class="container mt-5">
    <h3>Đổi mật khẩu</h3>
    <c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
    <c:if test="${not empty message}"><div class="alert alert-success">${message}</div></c:if>
    <form action="${pageContext.request.contextPath}/account/change-password" method="post">
        <div class="mb-3"><label>Mật khẩu hiện tại</label><input type="password" name="current" class="form-control" required></div>
        <div class="mb-3"><label>Mật khẩu mới</label><input type="password" name="newpass" class="form-control" required></div>
        <div class="mb-3"><label>Xác nhận mật khẩu mới</label><input type="password" name="confirm" class="form-control" required></div>
        <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
    </form>
</div>
</body></html>