<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo chia sẻ video</title>
    <style>
        body {font-family: Arial; margin:40px; background:#f4f4f4;}
        h2 {text-align:center; color:#333;}
        table {width:90%; margin:20px auto; border-collapse:collapse; background:white; box-shadow:0 0 10px rgba(0,0,0,0.1);}
        th, td {border:1px solid #4285F4; padding:12px; text-align:center;}
        th {background:#4285F4; color:white;}
    </style>
</head>
<body>

<h2>Báo cáo tổng hợp chia sẻ video</h2>

<table>
    <tr>
        <th>Tiêu đề video</th>
        <th>Số lượt chia sẻ</th>
        <th>Ngày chia sẻ đầu tiên</th>
        <th>Ngày chia sẻ cuối cùng</th>
    </tr>

    <c:forEach var="r" items="${report}">
        <tr>
            <td><c:out value="${r[0]}"/></td>
            <td><c:out value="${r[1]}"/></td>
            <td><c:out value="${r[2]}"/></td>
            <td><c:out value="${r[3]}"/></td>
        </tr>
    </c:forEach>
</table>

<c:if test="${empty report}">
    <p style="text-align:center; color:red; font-size:18px;">Không có dữ liệu chia sẻ!</p>
</c:if>

</body>
</html>