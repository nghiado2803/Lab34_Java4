<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo chia sẻ video</title>
    <style>
        body { font-family: Arial,sans-serif; }
        table { width: 90%; margin: 32px auto; border-collapse: collapse; }
        th, td { border:1px solid #bbb; padding:8px; }
        th { background: #4285F4; color:#fff; }
        tr:nth-child(even) { background: #f4f8fb; }
    </style>
</head>
<body>
<h2 style="text-align:center;">Báo cáo tổng hợp chia sẻ video</h2>
<table>
    <tr>
        <th>Tiêu đề video</th>
        <th>Số lượt chia sẻ</th>
        <th>Ngày chia sẻ đầu tiên</th>
        <th>Ngày chia sẻ cuối cùng</th>
    </tr>
    <c:forEach var="item" items="${report}">
        <tr>
            <td>${item.title}</td>
            <td>${item.shareCount}</td>
            <td><fmt:formatDate value="${item.firstShare}" pattern="dd/MM/yyyy"/></td>
            <td><fmt:formatDate value="${item.lastShare}" pattern="dd/MM/yyyy"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>