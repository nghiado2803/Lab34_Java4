<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tìm kiếm video theo từ khóa</title>
    <meta charset="UTF-8"/>
    <style>
        body { font-family:Arial,sans-serif;}
        .search-box { margin-bottom:20px; }
        input[type="text"] { padding:6px; width:300px; border:1px solid #fd7e14; border-radius:4px;}
        input[type="submit"] { padding:6px 12px; background:#fd7e14; color:#fff; border:none; border-radius:3px;}
        table { width:100%; border-collapse:collapse; margin-top:16px;}
        th, td { padding:8px; border:1px solid #ccc;}
        th { background:#4285F4; color:white;}
        .inactive { color:red; font-style:italic; }
        .active { color:green; font-style:italic;}
    </style>
</head>
<body>
<h3>Tìm kiếm video theo từ khóa</h3>
<div class="search-box">
    <form action="${pageContext.request.contextPath}/search-video" method="get">
        Từ khóa:
        <input type="text" name="keyword" value="${keyword != null ? keyword : ''}" />
        <input type="submit" value="Tìm kiếm"/>
    </form>
</div>
<div>
    <c:if test="${not empty videos}">
        <table>
            <thead>
            <tr>
                <th>Tiêu đề video</th>
                <th>Số lượt thích</th>
                <th>Còn hiệu lực</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="v" items="${videos}">
                <tr>
                    <td>${v.title}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty v.favorites}">
                                ${fn:length(v.favorites)}
                            </c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${v.active}"><span class="active">Có</span></c:when>
                            <c:otherwise><span class="inactive">Không</span></c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty videos && keyword != null}">
        <p>Không tìm thấy video nào chứa từ khóa "${keyword}".</p>
    </c:if>
</div>
</body>
</html>