<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu - Giúp Việc 24h</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
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
        
        .forgot-container {
            width: 100%;
            max-width: 800px;
            display: flex;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            background-color: var(--white);
        }
        
        .forgot-sidebar {
            flex: 1;
            background-color: var(--primary-color);
            padding: 40px;
            color: var(--white);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .forgot-sidebar .icon-wrapper {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .forgot-sidebar .icon-wrapper i {
            font-size: 70px;
            margin-bottom: 20px;
        }
        
        .forgot-sidebar h3 {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 500;
        }
        
        .forgot-sidebar p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
            opacity: 0.9;
        }
        
        .steps-list {
            list-style: none;
            margin-top: 20px;
        }
        
        .steps-list li {
            margin-bottom: 15px;
            display: flex;
            align-items: flex-start;
        }
        
        .steps-list .step-number {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-weight: bold;
            font-size: 12px;
        }
        
        .forgot-form {
            flex: 1;
            padding: 40px;
            background-color: var(--white);
        }
        
        .forgot-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .forgot-header img {
            height: 100px;
            margin-bottom: 10px;
        }
        
        .forgot-header h2 {
            color: var(--primary-color);
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .forgot-header p {
            color: #666;
            font-size: 14px;
            line-height: 1.5;
        }
        
        .form-group {
            margin-bottom: 25px;
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
            padding: 14px 15px;
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
        
        .note {
            padding: 10px;
            background-color: var(--primary-light);
            border-left: 3px solid var(--primary-color);
            border-radius: 0 var(--border-radius) var(--border-radius) 0;
            color: #555;
            font-size: 13px;
            line-height: 1.5;
            margin-top: 8px;
        }
        
        .btn-submit {
            width: 100%;
            padding: 14px;
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: var(--border-radius);
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-submit i {
            margin-right: 8px;
        }
        
        .btn-submit:hover {
            background-color: var(--primary-dark);
        }
        
        .forgot-footer {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }
        
        .forgot-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .forgot-footer a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .forgot-container {
                flex-direction: column;
            }
            
            .forgot-sidebar {
                padding: 30px;
            }
            
            .forgot-form {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="forgot-container">
        <div class="forgot-sidebar">
            <div class="icon-wrapper">
                <i class="fas fa-unlock-alt"></i>
            </div>
            <h3>Khôi phục mật khẩu</h3>
            <p>Đừng lo lắng! Việc quên mật khẩu có thể xảy ra với bất kỳ ai. Chúng tôi sẽ giúp bạn lấy lại quyền truy cập vào tài khoản của mình một cách nhanh chóng.</p>
            
            <ul class="steps-list">
                <li>
                    <div class="step-number">1</div>
                    <div>Nhập email hoặc số điện thoại đã đăng ký</div>
                </li>
                <li>
                    <div class="step-number">2</div>
                    <div>Nhận mã OTP qua email hoặc tin nhắn</div>
                </li>
                <li>
                    <div class="step-number">3</div>
                    <div>Nhập mã OTP và đặt mật khẩu mới</div>
                </li>
                <li>
                    <div class="step-number">4</div>
                    <div>Đăng nhập với mật khẩu mới của bạn</div>
                </li>
            </ul>
        </div>
        
        <div class="forgot-form">
            <div class="forgot-header">
                 <img src="${pageContext.request.contextPath}/view/assets/home/img/logo/logo.png" alt="Giúp Việc 24h Logo" 
                    onerror="this.onerror=null; this.src='/api/placeholder/200/40'; this.alt='Giúp Việc 24h';">
                <h2>Quên mật khẩu</h2>
                <p>Vui lòng cung cấp thông tin tài khoản của bạn để chúng tôi gửi mã xác thực OTP</p>
            </div>
            
            <form action="ForgotPasswordServlet" method="post">
                <div class="form-group">
                    <label for="contact">Email hoặc Số điện thoại:</label>
                    <input type="text" name="contact" id="contact" required 
                           placeholder="Nhập email hoặc số điện thoại đã đăng ký">
                    <div class="note">
                        <i class="fas fa-info-circle"></i> Chúng tôi sẽ gửi mã xác thực OTP đến thông tin liên hệ này. 
                        Mã có hiệu lực trong vòng 15 phút.
                    </div>
                </div>
                
                <button type="submit" class="btn-submit">
                    <i class="fas fa-paper-plane"></i> Gửi mã xác thực
                </button>
            </form>
            
            <div class="forgot-footer">
                <p>Đã nhớ mật khẩu? <a href="login.jsp">Đăng nhập</a></p>
                <p style="margin-top: 10px;">Chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>
</body>
</html>