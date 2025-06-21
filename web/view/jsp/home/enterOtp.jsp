<%-- 
    Document   : enterOtp
    Created on : Jun 16, 2025, 10:49:17 AM
    Author     : TGDD
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác minh OTP</title>
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

        .otp-container {
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

        input[type="text"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 15px;
            margin-bottom: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
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
            margin-top: 12px;
            text-align: center;
        }

        .info-note {
            font-size: 13px;
            color: #666;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="otp-container">
        <h2>Xác minh mã OTP</h2>

        <form action="${pageContext.request.contextPath}/verify-otp" method="post">
            <!-- Hidden input để truyền email -->
            <input type="hidden" name="email" value="${email}" />

            <label for="otp">Nhập mã OTP đã gửi về email:</label>
            <input type="text" id="otp" name="otp" placeholder="Nhập 6 chữ số OTP" required>

            <button type="submit" class="btn-submit">Xác nhận</button>
        </form>


        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <div class="info-note">Mã OTP có hiệu lực trong vòng 15 phút.</div>
    </div>
</body>
</html>
