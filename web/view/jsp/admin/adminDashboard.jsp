<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý - Admin</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { color: #1abc9c; }
        a { margin-right: 15px; color: #16a085; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h2>Chào mừng, Admin!</h2>
    <p><a href="manageUsers.jsp">Quản lý Người dùng</a></p>
    <p><a href="manageServices.jsp">Quản lý Dịch vụ</a></p>
    <p><a href="/LoginServlet?logout=true">Đăng xuất</a></p>
</body>
</html>