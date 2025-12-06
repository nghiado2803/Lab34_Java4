<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý - Người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>.admin-header{background:linear-gradient(135deg,#43a047,#2e7d32);color:white;}</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<div class="container mt-5 mb-5">
    <div class="card shadow-lg border-0">
        <div class="card-header admin-header text-center py-4">
            <h2 class="mb-0"><i class="fas fa-users"></i> QUẢN LÝ NGƯỜI DÙNG</h2>
        </div>
        <div class="card-body p-5">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-success">
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>Vai trò</th>
                        <th>Ngày đăng ký</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>admin</td>
                        <td>Nguyễn Văn Admin</td>
                        <td>admin@poly.edu.vn</td>
                        <td><span class="badge bg-danger">Quản trị viên</span></td>
                        <td>01/12/2025</td>
                        <td>
                            <button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
                            <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>user1</td>
                        <td>Lê Thị User</td>
                        <td>user1@poly.edu.vn</td>
                        <td><span class="badge bg-primary">Thành viên</span></td>
                        <td>02/12/2025</td>
                        <td><button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>