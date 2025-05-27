<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập nhân viên</title>
</head>
<body>
    <h2>Đăng nhập nhân viên / quản trị</h2>
    <form action="AdminLoginServlet" method="post">
        Tài khoản: <input type="text" name="username" required><br><br>
        Mật khẩu: <input type="password" name="password" required><br><br>
        <input type="submit" value="Đăng nhập">
    </form>
</body>
</html>
