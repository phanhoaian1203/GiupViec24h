<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang người dùng - Giúp Việc 24h</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 2rem;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #16a085;
        }
        .logout {
            margin-top: 1rem;
        }
        .logout a {
            color: #1abc9c;
            text-decoration: none;
            font-weight: bold;
        }
        .logout a:hover {
            color: #16a085;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Xin chào, <%= session.getAttribute("email") %>!</h1>
        <p>Chào mừng bạn đến với Giúp Việc 24h.</p>
        <p>Vai trò: <%= session.getAttribute("role") %></p>
        <div class="logout">
            <a href="LogoutServlet">Đăng xuất</a>
        </div>
    </div>
</body>
</html>