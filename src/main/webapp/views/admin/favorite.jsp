<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo - Video Yêu thích</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>.admin-header{background:linear-gradient(135deg,#fb8c00,#f57c00);}</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<div class="container mt-5 mb-5">
    <div class="card shadow-lg border-0">
        <div class="card-header admin-header text-white text-center py-4">
            <h2><i class="fas fa-heart text-white"></i> BÁO CÁO VIDEO YÊU THÍCH</h2>
        </div>
        <div class="card-body">
            <h4 class="text-danger mb-4">Top 5 Video được yêu thích nhất</h4>
            <ol class="list-group list-group-numbered">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Giới thiệu SQL Server
                    <span class="badge bg-danger rounded-pill">1,234 lượt thích</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Lập trình Java Web
                    <span class="badge bg-danger rounded-pill">987 lượt thích</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Kỹ năng thuyết trình
                    <span class="badge bg-danger rounded-pill">756 lượt thích</span>
                </li>
            </ol>
        </div>
    </div>
</div>
</body>
</html>