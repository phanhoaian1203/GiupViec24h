<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - Giúp Việc 24h</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <!-- Style -->
    <style>
        :root {
            --primary-color: #1abc9c;
            --primary-dark: #16a085;
            --light-color: #ecf0f1;
            --text-color: #333;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: var(--text-color);
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 2rem;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        }

        .login-box {
            background-color: white;
            border-radius: 10px;
            padding: 2.5rem;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .login-box h2 {
            text-align: center;
            color: var(--primary-dark);
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.2rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .form-group input[type="email"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .checkbox-group {
            margin-bottom: 1rem;
        }

        .checkbox-group label {
            font-size: 0.95rem;
        }

        .btn-submit {
            width: 100%;
            padding: 0.8rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: var(--primary-dark);
        }

        .login-links {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.95rem;
        }

        .login-links a {
            color: var(--primary-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-links a:hover {
            color: var(--primary-dark);
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h2><i class="fas fa-sign-in-alt"></i> Đăng nhập</h2>
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" name="password" id="password" required>
                </div>

                <div class="checkbox-group">
                    <label><input type="checkbox" name="remember"> Ghi nhớ đăng nhập</label>
                </div>

                <button type="submit" class="btn-submit">Đăng nhập</button>
            </form>

            <div class="login-links">
                <p><a href="forgotPassword.jsp">Quên mật khẩu?</a></p>
                <p>Chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>
</body>
</html>
