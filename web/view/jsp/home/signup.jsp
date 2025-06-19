<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Giúp Việc 24h</title>
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
            overflow-x: hidden;
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
        
        .signup-container {
            width: 100%;
            max-width: 1100px;
            display: flex;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.08);
            overflow: hidden;
            background-color: white;
            position: relative;
            z-index: 1;
            border: 1px solid #e0e0e0;
        }
        
        .signup-sidebar {
            flex: 2;
            background: linear-gradient(135deg, #4a4a4a 0%, #c0a987 100%);
            padding: 3rem;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .signup-sidebar::before {
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
        
        .signup-sidebar h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 800;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .signup-sidebar h1 i {
            color: #c0a987;
            font-size: 1.8rem;
        }
        
        .signup-sidebar p {
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 2rem;
            opacity: 0.9;
            color: #e0e0e0;
        }
        
        .benefits-list {
            list-style: none;
        }
        
        .benefits-list li {
            margin-bottom: 1rem;
            display: flex;
            align-items: flex-start;
            font-size: 0.95rem;
            line-height: 1.5;
        }
        
        .benefits-list i {
            color: #c0a987;
            margin-right: 0.75rem;
            margin-top: 0.2rem;
            width: 16px;
            text-align: center;
            flex-shrink: 0;
        }
        
        .signup-form {
            flex: 3;
            padding: 3rem;
            background-color: white;
            max-height: 95vh;
            overflow-y: auto;
        }
        
        .signup-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .signup-header .logo {
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
        
        .signup-header h2 {
            color: #1a1a1a;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .signup-header p {
            color: #4a4a4a;
            font-size: 0.95rem;
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }
        
        .form-grid .full-width {
            grid-column: span 2;
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

        .required {
            color: #e53e3e;
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
        
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: #f5f5f5;
            font-family: inherit;
        }

        .form-group input.with-icon {
            padding-left: 2.5rem;
        }
        
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #c0a987;
            background: white;
            box-shadow: 0 0 0 3px rgba(192, 169, 135, 0.1);
        }

        .form-group input:focus + i,
        .form-group select:focus + i {
            color: #c0a987;
        }
        
        .info-text {
            font-size: 0.8rem;
            color: #718096;
            margin-top: 0.5rem;
            font-style: italic;
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
            margin-top: 1rem;
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
        
        .signup-footer {
            text-align: center;
            font-size: 0.9rem;
            color: #718096;
        }
        
        .signup-footer a {
            color: #c0a987;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        
        .signup-footer a:hover {
            color: #a68e6e;
        }
        
        /* Custom scrollbar */
        .signup-form::-webkit-scrollbar {
            width: 6px;
        }

        .signup-form::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 3px;
        }

        .signup-form::-webkit-scrollbar-thumb {
            background: #c0a987;
            border-radius: 3px;
        }

        .signup-form::-webkit-scrollbar-thumb:hover {
            background: #a68e6e;
        }
        
        @media (max-width: 900px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .form-grid .full-width {
                grid-column: span 1;
            }
        }
        
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .signup-container {
                flex-direction: column;
                max-width: 500px;
            }
            
            .signup-sidebar {
                padding: 2rem;
                text-align: center;
            }

            .signup-sidebar h1 {
                font-size: 1.6rem;
                justify-content: center;
            }
            
            .signup-form {
                padding: 2rem;
                max-height: none;
            }

            .signup-header h2 {
                font-size: 1.5rem;
            }

            .form-grid {
                gap: 1rem;
            }
        }

        @media (max-width: 480px) {
            .signup-container {
                margin: 0;
                border-radius: 0;
            }

            .signup-form {
                padding: 1.5rem;
            }

            .signup-sidebar {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-sidebar">
            <div class="sidebar-content">
                <h1>
                    <i class="fas fa-broom"></i>
                    Giúp Việc 24h
                </h1>
                <p>Gia nhập nền tảng giúp việc hàng đầu tại Đà Nẵng. Chúng tôi kết nối những người giúp việc uy tín và những gia đình cần dịch vụ chất lượng.</p>
                
                <ul class="benefits-list">
                    <li>
                        <i class="fas fa-user-plus"></i>
                        Đăng ký dễ dàng, xác thực an toàn
                    </li>
                    <li>
                        <i class="fas fa-user-shield"></i>
                        Bảo mật thông tin cá nhân tuyệt đối
                    </li>
                    <li>
                        <i class="fas fa-clock"></i>
                        Dịch vụ linh hoạt theo giờ, ngày hoặc tháng
                    </li>
                    <li>
                        <i class="fas fa-money-check-alt"></i>
                        Giá cả minh bạch, không phí ẩn
                    </li>
                    <li>
                        <i class="fas fa-star"></i>
                        Đánh giá thực tế từ khách hàng
                    </li>
                    <li>
                        <i class="fas fa-headset"></i>
                        Hỗ trợ 24/7 cho mọi thắc mắc
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="signup-form">
            <div class="signup-header">
                <div class="logo">
                    <i class="fas fa-broom"></i>
                </div>
                <h2>Đăng ký tài khoản</h2>
                <p>Tạo tài khoản để bắt đầu sử dụng dịch vụ</p>
            </div>
            
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <%= errorMessage %>
                </div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/SignupServlet" method="post">
                <div class="form-grid">
                    <div class="form-group full-width">
                        <label for="fullName">Họ và tên <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="text" name="fullName" id="fullName" class="with-icon" required placeholder="Nhập họ và tên của bạn">
                            <i class="fas fa-user"></i>
                        </div>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="email">Địa chỉ email <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="email" name="email" id="email" class="with-icon" required placeholder="Nhập địa chỉ email của bạn">
                            <i class="fas fa-envelope"></i>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Mật khẩu <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="password" name="password" id="password" class="with-icon" required placeholder="Nhập mật khẩu">
                            <i class="fas fa-lock"></i>
                        </div>
                        <p class="info-text">Mật khẩu phải có ít nhất 6 ký tự</p>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Xác nhận mật khẩu <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="password" name="confirmPassword" id="confirmPassword" class="with-icon" required placeholder="Nhập lại mật khẩu">
                            <i class="fas fa-lock"></i>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="dob">Ngày sinh <span class="required">*</span></label>
                        <input type="date" name="dob" id="dob" required max="<%= LocalDate.now().toString() %>">
                    </div>
                    
                    <div class="form-group">
                        <label for="gender">Giới tính <span class="required">*</span></label>
                        <select name="gender" id="gender" required>
                            <option value="" selected disabled>Chọn giới tính</option>
                            <option value="male">Nam</option>
                            <option value="female">Nữ</option>
                            <option value="other">Khác</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Số điện thoại <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="text" name="phone" id="phone" class="with-icon" required placeholder="Nhập số điện thoại">
                            <i class="fas fa-phone"></i>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="area">Khu vực sống <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="text" name="area" id="area" class="with-icon" required placeholder="Thành phố/Quận/Huyện">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="role">Tôi đăng ký với tư cách <span class="required">*</span></label>
                        <select name="role" id="role" onchange="confirmRole(this)" required>
                            <option value="" selected disabled>Chọn vai trò của bạn</option>
                            <option value="customer">Khách hàng - Tôi cần tìm người giúp việc</option>
                            <option value="housekeeper">Người giúp việc - Tôi muốn đăng ký làm việc</option>
                        </select>
                    </div>
                    
                    <div class="form-group full-width">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-user-plus" style="margin-right: 0.5rem;"></i>
                            Đăng ký tài khoản
                        </button>
                    </div>
                </div>
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
                Đăng ký bằng Google
            </a>
            
            <div class="signup-footer">
                <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp">Đăng nhập ngay</a></p>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add focus animations for inputs
            const inputs = document.querySelectorAll('input[type="text"], input[type="email"], input[type="password"]');
            
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

            // Password confirmation validation
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');
            
            function validatePassword() {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity('Mật khẩu xác nhận không khớp');
                } else {
                    confirmPassword.setCustomValidity('');
                }
            }
            
            password.addEventListener('change', validatePassword);
            confirmPassword.addEventListener('keyup', validatePassword);

            // Phone number formatting
            const phoneInput = document.getElementById('phone');
            phoneInput.addEventListener('input', function() {
                let value = this.value.replace(/\D/g, '');
                if (value.length > 10) {
                    value = value.substring(0, 10);
                }
                this.value = value;
            });

            console.log('📝 Signup page loaded successfully');
        });

        function confirmRole(select) {
            if (select.value === "") return;
            
            const role = select.value;
            const message = (role === 'housekeeper') 
                ? "Bạn đang đăng ký với tư cách NGƯỜI GIÚP VIỆC. Bạn sẽ cần hoàn tất xác minh hồ sơ sau bước này. Xác nhận tiếp tục?"
                : "Bạn đang đăng ký với tư cách KHÁCH HÀNG. Xác nhận tiếp tục?";
                
            if (!confirm(message)) {
                select.value = "";
            }
        }
    </script>
</body>
</html>