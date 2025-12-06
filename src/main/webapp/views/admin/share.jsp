<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo - Video được chia sẻ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>.admin-header{background:linear-gradient(135deg,#1976d2,#1565c0);color:white;}</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<div class="container mt-5 mb-5">
    <div class="card shadow-lg border-0">
        <div class="card-header admin-header text-center py-4">
            <h2><i class="fas fa-share-alt"></i> BÁO CÁO VIDEO ĐƯỢC CHIA SẺ</h2>
        </div>
        <div class="card-body">
            <h4 class="text-primary mb-4">Thống kê chia sẻ gần đây</h4>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="table-primary">
                    <tr><th>Video</th><th>Người chia sẻ</th><th>Email nhận</th><th>Ngày chia sẻ</th></tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Lập trình Java Web</td>
                        <td>admin</td>
                        <td>friend1@gmail.com, friend2@gmail.com</td>
                        <td>06/12/2025 09:30</td>
                    </tr>
                    <tr>
                        <td>Giới thiệu SQL Server</td>
                        <td>user1</td>
                        <td>teacher@poly.edu.vn</td>
                        <td>06/12/2025 08:15</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>