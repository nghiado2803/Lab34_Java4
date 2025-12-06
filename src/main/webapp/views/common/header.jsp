<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>
        .dropdown-menu { min-width: 200px; }
        .navbar-nav .dropdown-toggle::after { vertical-align: middle; }
    </style>
</head>
<body>

<!-- HEADER ĐỎ ĐẸP -->
<div class="bg-danger text-white py-3 shadow-sm sticky-top">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <h4 class="mb-0 fw-bold">
                    <i class="fas fa-play-circle"></i> PolyOE – Hệ thống chia sẻ Video
                </h4>
            </div>
            <div class="col-auto text-end">

                <!-- ĐÃ ĐĂNG NHẬP -->
                <c:if test="${not empty sessionScope.currentUser}">
                    <div class="btn-group me-3">
                        <button type="button" class="btn btn-outline-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user-circle fa-lg"></i>
                            <strong>${sessionScope.currentUser.fullname}</strong>
                            <small class="ms-1">(${sessionScope.currentUser.admin ? 'Quản trị viên' : 'Thành viên'})</small>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end shadow">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account/edit-profile">
                                <i class="fas fa-user-edit"></i> Sửa hồ sơ</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account/change-password">
                                <i class="fas fa-key"></i> Đổi mật khẩu</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
                                <i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                        </ul>
                    </div>
                </c:if>

                <!-- CHƯA ĐĂNG NHẬP -->
                <c:if test="${empty sessionScope.currentUser}">
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2">
                        <i class="fas fa-sign-in-alt"></i> Đăng nhập
                    </a>
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-light text-danger">
                        <i class="fas fa-user-plus"></i> Đăng ký
                    </a>
                </c:if>

                <!-- LƯỢT TRUY CẬP -->
                <span class="badge bg-light text-dark ms-4 fs-6">
                    <i class="fas fa-users"></i>
                    Lượt truy cập: <strong>${applicationScope.visitors != null ? applicationScope.visitors : 0}</strong>
                </span>
            </div>
        </div>
    </div>
</div>

<!-- MENU ĐIỀU HƯỚNG DƯỚI -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainMenu">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/video/list">
                        <i class="fas fa-home"></i> Trang chủ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/favorites">
                        <i class="fas fa-heart"></i> Video yêu thích
                    </a>
                </li>

                <!-- MENU QUẢN TRỊ – CHỈ ADMIN THẤY -->
                <c:if test="${sessionScope.currentUser != null && sessionScope.currentUser.admin}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-cog"></i> Quản trị
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/video">
                                <i class="fas fa-video"></i> Quản lý Video</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user">
                                <i class="fas fa-users"></i> Quản lý Người dùng</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/favorite">
                                <i class="fas fa-heart"></i> Báo cáo Yêu thích</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/share">
                                <i class="fas fa-share-alt"></i> Báo cáo Chia sẻ</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>

            <!-- TÌM KIẾM (có thể làm sau) -->
            <form class="d-flex" action="${pageContext.request.contextPath}/search-video" method="get">
                <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm video..." aria-label="Tìm kiếm">
                <button class="btn btn-outline-light" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>
    </div>
</nav>

<!-- BOOTSTRAP JS – BẮT BUỘC ĐỂ DROPDOWN HOẠT ĐỘNG -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>