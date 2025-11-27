<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Kiếm Video Theo Từ Khóa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; font-family: 'Segoe UI', sans-serif; }
        .search-container { background: white; border-radius: 20px; box-shadow: 0 15px 35px rgba(0,0,0,0.2); overflow: hidden; margin-top: 50px; }
        .search-header { background: linear-gradient(135deg, #fd7e14, #e91e63); color: white; padding: 30px; text-align: center; }
        .search-box input[type="text"] { border-radius: 50px; padding: 12px 20px; border: 2px solid #fd7e14; font-size: 1.1rem; }
        .search-box button { border-radius: 50px; padding: 12px 30px; background: #fd7e14; font-weight: bold; color: white; }
        .table thead { background: #4285F4; color: white; }
        .badge-like { background: #e91e63; font-size: 1rem; }
        .status-active { color: #2e7d32; font-weight: bold; }
        .status-inactive { color: #c62828; font-weight: bold; }
        .no-result { text-align: center; padding: 80px 20px; color: #6c757d; }
        .no-result i { font-size: 5rem; opacity: 0.3; }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="search-container">

                <div class="search-header">
                    <h2 class="mb-3"><i class="fas fa-search fa-lg"></i> Tìm Kiếm Video</h2>
                    <form action="${pageContext.request.contextPath}/search-video" method="get" class="d-inline-flex gap-2">
                        <input type="text" name="keyword" value="${fn:escapeXml(keyword)}"
                               placeholder="Nhập từ khóa..." class="form-control" autofocus>
                        <button type="submit" class="btn"><i class="fas fa-search"></i> Tìm</button>
                    </form>
                    <c:if test="${not empty keyword}">
                        <p class="mt-3 mb-0">Kết quả cho: <strong class="text-warning">"${fn:escapeXml(keyword)}"</strong></p>
                    </c:if>
                </div>

                <div class="p-4">
                    <c:choose>
                        <c:when test="${not empty videos}">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tiêu Đề Video</th>
                                        <th>Số Lượt Thích</th>
                                        <th>Trạng Thái</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="v" items="${videos}" varStatus="stt">
                                        <tr>
                                            <td class="text-center fw-bold">${stt.count}</td>
                                            <td>
                                                <strong>${fn:escapeXml(v.title)}</strong>
                                                <br><small class="text-muted">ID: ${v.id}</small>
                                            </td>
                                            <td class="text-center">
                                                    <span class="badge badge-like">
                                                        <i class="fas fa-heart"></i>
                                                        ${v.favoriteCount}
                                                    </span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${v.active}">
                                                        <span class="status-active"><i class="fas fa-check-circle"></i> Còn hiệu lực</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status-inactive"><i class="fas fa-times-circle"></i> Đã ẩn</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="text-center mt-3">
                                <strong class="text-success fs-4">Tìm thấy ${videos.size()} video</strong>
                            </div>
                        </c:when>
                        <c:when test="${empty videos && keyword != null}">
                            <div class="no-result">
                                <i class="fas fa-search-minus"></i>
                                <h3>Không tìm thấy video nào</h3>
                                <p class="lead">Từ khóa "<strong>${fn:escapeXml(keyword)}</strong>" không khớp.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5 text-muted">
                                <i class="fas fa-film fa-5x mb-4 opacity-50"></i>
                                <h4>Nhập từ khóa để tìm kiếm video</h4>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>