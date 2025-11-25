<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Video Yêu Thích</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background: #f9f9f9; }
        .container { max-width: 900px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); }
        h1 { color: #d32f2f; }
        .video-item { padding: 15px; border-bottom: 1px solid #eee; }
        .like-date { color: #666; font-style: italic; }
    </style>
</head>
<body>
<div class="container">
    <h1>${user.fullname}</h1>
    <p><strong>Tên người dùng:</strong> ${user.fullname}</p>

    <h2>Các video đã yêu thích:</h2>

    <c:choose>
        <c:when test="${not empty favorites}">
            <c:forEach var="fav" items="${favorites}" varStatus="stt">
                <div class="video-item">
                    <strong>${stt.count}. ${fav.video.title}</strong><br>
                    <span class="like-date">
                        Ngày thích:
                        <fmt:formatDate value="${fav.likeDate}" pattern="dd/MM/yyyy HH:mm" />
                    </span>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p><em>Chưa có video nào được yêu thích.</em></p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
