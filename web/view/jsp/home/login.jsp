<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 50%, #f5f5f5 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(192, 169, 135, 0.08) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(166, 142, 110, 0.06) 0%, transparent 50%),
                url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="%23c0a987" opacity="0.06"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
            pointer-events: none;
        }
        
        .login-container {
            width: 100%;
            max-width: 1000px;
            display: flex;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.08);
            overflow: hidden;
            background-color: white;
            position: relative;
            z-index: 1;
            border: 1px solid #e0e0e0;
        }
        
        .login-sidebar {
            flex: 1;
            background: linear-gradient(135deg, #4a4a4a 0%, #c0a987 100%);
            padding: 3rem;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .login-sidebar::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle, rgba(192, 169, 135, 0.06) 0%, transparent 70%);
            pointer-events: none;
        }

        .sidebar-content {
            position: relative;
            z-index: 1;
        }
        
        .login-sidebar h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 800;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .login-sidebar h1 i {
            color: #c0a987;
            font-size: 1.8rem;
        }
        
        .login-sidebar p {
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 2rem;
            opacity: 0.9;
            color: #e0e0e0;
        }
        
        .feature-list {
            list-style: none;
        }
        
        .feature-list li {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            font-size: 0.95rem;
            line-height: 1.5;
        }
        
        .feature-list li i {
            color: #c0a987;
            margin-right: 0.75rem;
            width: 16px;
            text-align: center;
        }
        
        .login-form {
            flex: 1;
            padding: 3rem;
            background-color: white;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .login-header .logo {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #c0a987, #a68e6e);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: #ffffff;
            font-size: 1.5rem;
            text-shadow: 0 1px 2px rgba(0,0,0,0.2);
            box-shadow: 0 4px 15px rgba(192, 169, 135, 0.25);
        }
        
        .login-header h2 {
            color: #1a1a1a;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .login-header p {
            color: #4a4a4a;
            font-size: 0.95rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2d3748;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            font-size: 0.9rem;
        }
        
        .form-group input {
            width: 100%;
            padding: 0.875rem 1rem;
            padding-left: 2.5rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: #f5f5f5;
            font-family: inherit;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #c0a987;
            background: white;
            box-shadow: 0 0 0 3px rgba(192, 169, 135, 0.1);
        }

        .form-group input:focus + i {
            color: #c0a987;
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }

        .checkbox-wrapper {
            display: flex;
            align-items: center;
        }
        
        .checkbox-wrapper input {
            margin-right: 0.5rem;
            width: auto;
            padding: 0;
            background: none;
        }
        
        .checkbox-wrapper label {
            color: #4a4a4a;
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 0;
        }

        .forgot-link {
            color: #c0a987;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .forgot-link:hover {
            color: #a68e6e;
        }
        
        .error-message {
            background: #fff5f5;
            color: #c53030;
            padding: 0.875rem 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            border-left: 4px solid #e53e3e;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-submit {
            width: 100%;
            padding: 0.875rem 1rem;
            background: linear-gradient(135deg, #c0a987, #a68e6e);
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
    transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(192, 169, 135, 0.25);
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }
        
        .btn-submit:hover {
            background: linear-gradient(135deg, #a68e6e, #8f7860);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(192, 169, 135, 0.4);
        }

        .divider {
            text-align: center;
            margin: 1.5rem 0;
            position: relative;
        }

        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: #e0e0e0;
        }

        .divider span {
            background: white;
            padding: 0 1rem;
            color: #718096;
            font-size: 0.9rem;
        }

        .btn-google {
            width: 100%;
            padding: 0.875rem 1rem;
            background: white;
            color: #4a4a4a;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
        }

        .btn-google:hover {
            background: #f5f5f5;
            border-color: #d4d4d4;
            transform: translateY(-1px);
        }

        .google-icon {
            width: 18px;
            height: 18px;
        }
        
        .login-footer {
            text-align: center;
            font-size: 0.9rem;
            color: #718096;
        }
        
        .login-footer a {
            color: #c0a987;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        
        .login-footer a:hover {
            color: #a68e6e;
        }
        
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .login-container {
                flex-direction: column;
                max-width: 400px;
            }
            
            .login-sidebar {
                padding: 2rem;
                text-align: center;
            }

            .login-sidebar h1 {
                font-size: 1.6rem;
                justify-content: center;
            }
            
            .login-form {
                padding: 2rem;
            }

            .login-header h2 {
                font-size: 1.5rem;
            }

            .checkbox-group {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .login-container {
                margin: 0;
                border-radius: 0;
            }

            .login-form {
                padding: 1.5rem;
            }

            .login-sidebar {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-sidebar">
            <div class="sidebar-content">
                <h1>
                    <i class="fas fa-broom"></i>
                    Giúp Việc 24h
                </h1>
                <p>Nền tảng dịch vụ giúp việc chuyên nghiệp, an toàn và tiện lợi hàng đầu tại Đà Nẵng.</p>
                <ul class="feature-list">
                    <li>
                        <i class="fas fa-shield-check"></i>
                        Dịch vụ chuyên nghiệp, uy tín
                    </li>
                    <li>
                        <i class="fas fa-user-graduate"></i>
                        Người giúp việc được đào tạo bài bản
                    </li>
                    <li>
                        <i class="fas fa-credit-card"></i>
                        Thanh toán an toàn, minh bạch
                    </li>
                    <li>
                        <i class="fas fa-headset"></i>
                        Hỗ trợ khách hàng 24/7
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="login-form">
            <div class="login-header">
                <div class="logo">
                    <i class="fas fa-broom"></i>
                </div>
                <h2>Đăng nhập</h2>
                <p>Chào mừng bạn quay trở lại!</p>
            </div>
            
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <%= errorMessage %>
                </div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="form-group">
                    <label for="email">Địa chỉ email</label>
                    <div class="input-wrapper">
                        <input type="email" name="email" id="email" required placeholder="Nhập địa chỉ email của bạn">
                        <i class="fas fa-envelope"></i>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <div class="input-wrapper">
                        <input type="password" name="password" id="password" required placeholder="Nhập mật khẩu của bạn">
                        <i class="fas fa-lock"></i>
                    </div>
                </div>
                
                <div class="checkbox-group">
                    <div class="checkbox-wrapper">
                        <input type="checkbox" name="remember" id="remember">
                        <label for="remember">Ghi nhớ đăng nhập</label>
                    </div>
                    <a href="forgotPassword.jsp" class="forgot-link">Quên mật khẩu?</a>
                </div>
                
                <button type="submit" class="btn-submit">
                    Đăng nhập
                </button>
            </form>

            <div class="divider">
                <span>Hoặc</span>
            </div>

            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/GiupViec24h/LoginGoogleHandler&response_type=code&client_id=830575306764-jmuc68di78lroq5p8mmtt8qffitb1aqk.apps.googleusercontent.com&approval_prompt=force"
               class="btn-google">
                <svg class="google-icon" viewBox="0 0 24 24">
                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                </svg>
                Đăng nhập bằng Google
            </a>
            
            <div class="login-footer">
                <p>Bạn chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add focus animations for inputs
            const inputs = document.querySelectorAll('input[type="email"], input[type="password"]');
            
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    if (!this.value) {
                        this.parentElement.classList.remove('focused');
                    }
                });
            });

            // Form validation
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                const email = document.getElementById('email').value;
                const password = document.getElementById('password').value;
                
                if (!email || !password) {
                    e.preventDefault();
                    alert('Vui lòng điền đầy đủ thông tin');
                }
            });

            console.log('🔐 Login page loaded successfully');
        });
    </script>
</body>
</html>