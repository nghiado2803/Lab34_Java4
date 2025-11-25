<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Video Yêu Thích Toàn Bộ</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        table { width: 80%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>

<h1>Danh Sách Tất Cả Video Được Yêu Thích</h1>

<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Video Title</th>
        <th>Người thích</th>
        <th>Ngày thích</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${not empty favorites}">
            <c:forEach var="fav" items="${favorites}" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>

                    <td>${fav.video.title}</td>

                    <td>${fav.user.fullname}</td>

                    <td>
                        <fmt:formatDate value="${fav.likeDate}" pattern="dd/MM/yyyy"/>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="4">Không có video nào được yêu thích.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

</body>
</html>