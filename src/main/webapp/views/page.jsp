<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PolyOE - Hệ thống quản lý video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .welcome-card {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 600px;
        }
        h1 {
            color: #e53935;
            font-weight: 800;
            margin-bottom: 20px;
        }
        .btn-home {
            background: #e53935;
            color: white;
            padding: 12px 40px;
            border-radius: 50px;
            font-size: 1.2rem;
            margin-top: 20px;
        }
        .btn-home:hover {
            background: #c62828;
            color: white;
        }
    </style>
</head>
<body>

<div class="welcome-card">
    <h1>Xin chào!</h1>
    <p class="lead text-muted">Chào mừng bạn đến với <strong>PolyOE</strong> – Hệ thống quản lý video trực tuyến</p>
    <hr>
    <p>Bạn hiện tại đang truy cập: <strong>${pageContext.request.requestURI}</strong></p>

    <c:if test="${not empty sessionScope.currentUser}">
        <div class="alert alert-success mt-4">
            <strong>${sessionScope.currentUser.fullname}</strong> đã đăng nhập thành công!
        </div>
    </c:if>

    <a href="${pageContext.request.contextPath}/login" class="btn btn-home">
        <i class="fas fa-play-circle"></i> Xem danh sách video yêu thích
    </a>
</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>