<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Video - Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>
        .admin-header { background: linear-gradient(135deg, #e53935, #c62828); color: white; }
        .table thead { background-color: #f8f9fa; }
    </style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<div class="container mt-5 mb-5">
    <div class="card shadow-lg border-0">
        <div class="card-header admin-header text-center py-4">
            <h2 class="mb-0"><i class="fas fa-video"></i> QUẢN LÝ VIDEO</h2>
        </div>
        <div class="card-body p-5">
            <div class="text-end mb-4">
                <a href="#" class="btn btn-success btn-lg"><i class="fas fa-plus"></i> Thêm Video Mới</a>
            </div>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Poster</th>
                        <th>Lượt xem</th>
                        <th>Mô tả</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>V001</td>
                        <td>Giới thiệu SQL Server</td>
                        <td><img src="/poster/sql.jpg" width="80" class="rounded"></td>
                        <td>1,500</td>
                        <td>Bài giảng cơ bản về SQL Server...</td>
                        <td><span class="badge bg-success">Hoạt động</span></td>
                        <td>
                            <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</body>
</html>