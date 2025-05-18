<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu - Giúp Việc 24h</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        :root {
            --primary-color: #27ae60;
            --primary-dark: #219150;
            --light-bg: #f4fef7;
            --text-color: #2c3e50;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--light-bg);
            padding: 20px;
            color: var(--text-color);
        }

        .forgot-container {
            max-width: 500px;
            margin: 60px auto;
            background-color: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--primary-dark);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 0.7rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border-color 0.3s ease;
            font-size: 1rem;
        }

        input:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .note {
            font-size: 0.9rem;
            color: #777;
            margin-top: 0.4rem;
        }

        .btn-submit {
            width: 100%;
            padding: 0.9rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: var(--primary-dark);
        }

        .form-footer {
            text-align: center;
            margin-top: 1.5rem;
        }

        .form-footer a {
            color: var(--primary-dark);
            text-decoration: none;
            font-weight: 500;
        }

        .form-footer a:hover {
            color: var(--primary-color);
        }
    </style>
</head>
<body>

    <div class="forgot-container">
        <h2>Quên mật khẩu</h2>
        <form action="ForgotPasswordServlet" method="post">
            <div class="form-group">
                <label for="contact">Nhập Email hoặc Số điện thoại:</label>
                <input type="text" name="contact" id="contact" required placeholder="example@email.com hoặc 0987654321">
                <div class="note">Chúng tôi sẽ gửi mã OTP đến email hoặc điện thoại của bạn.</div>
            </div>
            <input type="submit" value="Gửi mã OTP" class="btn-submit">
        </form>

        <div class="form-footer">
            <p>Quay lại <a href="login.jsp">Đăng nhập</a></p>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
