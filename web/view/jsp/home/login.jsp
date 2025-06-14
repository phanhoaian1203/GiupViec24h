<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Giúp Việc 24h</title>
    <style>
        :root {
            --primary-color: #1AB394;
            --primary-dark: #18a085;
            --primary-light: #e8f8f5;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --gray: #e0e0e0;
            --text-dark: #333333;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            background-image: linear-gradient(to bottom right, rgba(26, 179, 148, 0.1), rgba(26, 179, 148, 0.05));
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .login-container {
            width: 100%;
            max-width: 900px;
            display: flex;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            background-color: var(--white);
        }
        
        .login-sidebar {
            flex: 1;
            background-color: var(--primary-color);
            padding: 40px;
            color: var(--white);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .login-sidebar h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        
        .login-sidebar p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
            opacity: 0.9;
        }
        
        .feature-list {
            list-style: none;
        }
        
        .feature-list li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        
        .feature-list li:before {
            content: "✓";
            margin-right: 10px;
            font-weight: bold;
        }
        
        .login-form {
            flex: 1;
            padding: 40px;
            background-color: var(--white);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header img {
            height: 100px;
            margin-bottom: 10px;
        }
        
        .login-header h2 {
            color: var(--text-dark);
            font-size: 24px;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-dark);
            font-weight: 500;
            font-size: 14px;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--gray);
            border-radius: var(--border-radius);
            font-size: 15px;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.2);
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .checkbox-group input {
            margin-right: 8px;
        }
        
        .checkbox-group label {
            color: var(--text-dark);
            font-size: 14px;
        }
        
        .error-message {
            background-color: #ffe6e6;
            color: #d63031;
            padding: 12px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            font-size: 14px;
            border-left: 4px solid #d63031;
        }
        
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: var(--border-radius);
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .btn-submit:hover {
            background-color: var(--primary-dark);
        }
        
        .login-footer {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }
        
        .login-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .login-footer a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            
            .login-sidebar {
                padding: 30px;
            }
            
            .login-form {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-sidebar">
            <h1>Giúp Việc 24h</h1>
            <p>Giúp việc theo giờ - An toàn - Tiện lợi - Đảm bảo chất lượng</p>
            <ul class="feature-list">
                <li>Dịch vụ chuyên nghiệp, uy tín</li>
                <li>Người giúp việc được đào tạo bài bản</li>
                <li>Thanh toán an toàn, minh bạch</li>
                <li>Hỗ trợ khách hàng 24/7</li>
            </ul>
        </div>
        
        <div class="login-form">
            <div class="login-header">
                <img src="${pageContext.request.contextPath}/view/assets/home/img/logo/logo.png" alt="Giúp Việc 24h Logo" 
                    onerror="this.onerror=null; this.src='/api/placeholder/200/40'; this.alt='Giúp Việc 24h';">
                <h2>Đăng nhập</h2>
            </div>
            
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <p class="error-message"><%= errorMessage %></p>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" required placeholder="Nhập địa chỉ email của bạn">
                </div>
                
                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" name="password" id="password" required placeholder="Nhập mật khẩu của bạn">
                </div>
                
                <div class="checkbox-group">
                    <input type="checkbox" name="remember" id="remember">
                    <label for="remember">Ghi nhớ đăng nhập</label>
                </div>
                
                <button type="submit" class="btn-submit">Đăng nhập</button>
            </form>
            
            <div class="login-footer">
                <p>Bạn chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a></p>
                <p style="margin-top: 10px;"><a href="forgotPassword.jsp">Quên mật khẩu?</a></p>
            </div>
        </div>
    </div>
</body>
</html>