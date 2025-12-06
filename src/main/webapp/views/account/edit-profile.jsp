<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Sửa hồ sơ</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head><body>
<%@ include file="/views/common/header.jsp" %>
<div class="container mt-5">
    <h3>Sửa thông tin cá nhân</h3>
    <form action="${pageContext.request.contextPath}/account/edit-profile" method="post">
        <div class="mb-3"><label>Họ tên</label><input name="fullname" value="${sessionScope.currentUser.fullname}" class="form-control" required></div>
        <div class="mb-3"><label>Email</label><input name="email" value="${sessionScope.currentUser.email}" type="email" class="form-control" required></div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>
</body></html>