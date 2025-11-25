<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8" />
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; }
        .login-box {
            width: 320px; margin: 80px auto;
            background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 2px 10px #aaa;
        }
        input[type=text], input[type=password] { width: 100%; margin: 6px 0 16px; padding: 10px; }
        input[type=submit] { padding: 10px 18px; border-radius: 5px; background: #d32f2f; border: none; color: #fff; }
        .error { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Đăng nhập</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <label for="idOrEmail">Tên đăng nhập hoặc Email:</label>
        <input type="text" name="idOrEmail" required />
        <label for="password">Mật khẩu:</label>
        <input type="password" name="password" required />
        <input type="submit" value="Đăng nhập" />
    </form>
</div>
</body>
</html>