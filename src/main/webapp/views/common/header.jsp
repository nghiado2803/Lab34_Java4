<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="bg-danger text-white py-3 shadow-sm">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <h4 class="mb-0">
                    <i class="fas fa-play-circle"></i> PolyOE – Hệ thống chia sẻ Video
                </h4>
            </div>
            <div class="col-auto text-end">
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <i class="fas fa-user-circle fa-lg me-2"></i>
                        <strong>${sessionScope.currentUser.fullname}</strong>
                        <small class="opacity-75">(${sessionScope.currentUser.admin ? 'Quản trị viên' : 'Thành viên'})</small>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline-light ms-3">
                            Đăng xuất
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-sm btn-outline-light">
                            Đăng nhập
                        </a>
                    </c:otherwise>
                </c:choose>
                <span class="badge bg-light text-dark ms-3 fs-6">
        <i class="fas fa-users"></i> Lượt truy cập: <strong>${applicationScope.visitors}</strong>
    </span>
            </div>
        </div>
    </div>
</div>