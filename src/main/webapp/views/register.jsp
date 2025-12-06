<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>Đăng ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>body{background:linear-gradient(135deg,#667eea,#764ba2);min-height:100vh;display:flex;align-items:center}</style>
</head><body>
<div class="container"><div class="card mx-auto" style="max-width:500px">
    <h3 class="card-header text-center bg-primary text-white">Đăng ký tài khoản</h3>
    <div class="card-body">
        <c:if test="${not empty message}"><div class="alert alert-info">${message}</div></c:if>
        <c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="mb-3"><label class="form-label">Id</label><input name="id" class="form-control" required></div>
            <div class="mb-3"><label class="form-label">Họ tên</label><input name="fullname" class="form-control" required></div>
            <div class="mb-3"><label class="form-label">Email</label><input name="email" type="email" class="form-control" required></div>
            <div class="mb-3"><label class="form-label">Mật khẩu</label><input name="password" type="password" class="form-control" required></div>
            <div class="mb-3"><label class="form-label">Xác nhận mật khẩu</label><input name="confirm" type="password" class="form-control" required></div>
            <button type="submit" class="btn btn-success w-100">Đăng ký</button>
        </form>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login">Đã có tài khoản? Đăng nhập</a>
        </div>
    </div></div></div>
</body></html>