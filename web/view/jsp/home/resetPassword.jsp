<%-- 
    Document   : resetpass
    Created on : Jun 16, 2025, 10:50:35 AM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0f7f4, #f9f9f9);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .reset-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
        }

        h2 {
            color: #1AB394;
            text-align: center;
            margin-bottom: 24px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
            margin-bottom: 16px;
            transition: all 0.3s ease;
        }

        input[type="password"]:focus {
            border-color: #1AB394;
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.2);
            outline: none;
        }

        .btn-submit {
            width: 100%;
            background-color: #1AB394;
            color: white;
            border: none;
            padding: 14px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #169f83;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-bottom: 12px;
        }
    </style>
</head>
<body>
    <div class="reset-container">
        <h2>Đặt lại mật khẩu</h2>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <c:if test="${not empty message}">
            <div class="success-message">${message}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/reset-password" method="post">
            <label for="newPassword">Mật khẩu mới:</label>
            <input type="password" id="newPassword" name="newPassword" required>

            <label for="confirmPassword">Nhập lại mật khẩu:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <button type="submit" class="btn-submit">Cập nhật mật khẩu</button>
        </form>
    </div>
</body>
</html>



