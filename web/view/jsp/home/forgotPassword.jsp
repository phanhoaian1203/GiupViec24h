<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu - Giúp Việc 24h</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #fefefe 0%, #f8fafc 50%, #f1f5f9 100%);
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
                radial-gradient(circle at 20% 80%, rgba(218, 165, 32, 0.08) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(184, 134, 11, 0.06) 0%, transparent 50%),
                url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="%23daa520" opacity="0.06"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
            pointer-events: none;
        }

        .forgot-container {
            width: 100%;
            max-width: 1000px;
            display: flex;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.08);
            overflow: hidden;
            background-color: white;
            position: relative;
            z-index: 1;
            border: 1px solid #f1f5f9;
        }

        .forgot-sidebar {
            flex: 1;
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            padding: 3rem;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .forgot-sidebar::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle, rgba(218, 165, 32, 0.06) 0%, transparent 70%);
            pointer-events: none;
        }

        .sidebar-content {
            position: relative;
            z-index: 1;
        }

        .forgot-sidebar .icon-wrapper {
            text-align: center;
            margin-bottom: 2rem;
        }

        .forgot-sidebar .icon-wrapper i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #daa520;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }

        .forgot-sidebar h3 {
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 700;
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }

        .forgot-sidebar p {
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 2rem;
            opacity: 0.9;
            color: #e2e8f0;
        }

        .steps-list {
            list-style: none;
            margin-top: 1rem;
        }

        .steps-list li {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .steps-list .step-number {
            background-color: rgba(218, 165, 32, 0.25);
            border-radius: 50%;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.75rem;
            font-weight: bold;
            font-size: 12px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(218, 165, 32, 0.3);
        }

        .forgot-form {
            flex: 1;
            padding: 3rem;
            background-color: white;
        }

        .forgot-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .forgot-header .logo {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #daa520, #b8860b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: #ffffff;
            font-size: 1.5rem;
            text-shadow: 0 1px 2px rgba(0,0,0,0.2);
            box-shadow: 0 4px 15px rgba(218, 165, 32, 0.25);
        }

        .forgot-header h2 {
            color: #1a202c;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .forgot-header p {
            color: #718096;
            font-size: 0.95rem;
            line-height: 1.5;
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
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: #f8fafc;
            font-family: inherit;
        }

        .form-group input:focus {
            outline: none;
            border-color: #daa520;
            background: white;
            box-shadow: 0 0 0 3px rgba(218, 165, 32, 0.1);
        }

        .form-group input:focus + i {
            color: #daa520;
        }

        .note {
            padding: 0.875rem 1rem;
            background: linear-gradient(135deg, #fff8dc, #f5deb3);
            border-left: 3px solid #daa520;
            border-radius: 0 8px 8px 0;
            color: #8b7355;
            font-size: 0.85rem;
            line-height: 1.5;
            margin-top: 0.5rem;
            display: flex;
            align-items: flex-start;
            gap: 0.5rem;
        }

        .note i {
            color: #b8860b;
            margin-top: 0.1rem;
            flex-shrink: 0;
        }

        .btn-submit {
            width: 100%;
            padding: 0.875rem 1rem;
            background: linear-gradient(135deg, #daa520, #b8860b);
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
            box-shadow: 0 4px 15px rgba(218, 165, 32, 0.25);
            gap: 0.5rem;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #b8860b, #9a7209);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(218, 165, 32, 0.4);
        }

        .forgot-footer {
            text-align: center;
            margin-top: 2rem;
            font-size: 0.9rem;
            color: #718096;
        }

        .forgot-footer p {
            margin-bottom: 0.5rem;
        }

        .forgot-footer a {
            color: #daa520;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .forgot-footer a:hover {
            color: #b8860b;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .forgot-container {
                flex-direction: column;
                max-width: 400px;
            }

            .forgot-sidebar {
                padding: 2rem;
                text-align: center;
            }

            .forgot-sidebar h3 {
                font-size: 1.6rem;
            }

            .forgot-form {
                padding: 2rem;
            }

            .forgot-header h2 {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .forgot-container {
                margin: 0;
                border-radius: 0;
            }

            .forgot-form {
                padding: 1.5rem;
            }

            .forgot-sidebar {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="forgot-container">
        <div class="forgot-sidebar">
            <div class="sidebar-content">
                <div class="icon-wrapper">
                    <i class="fas fa-unlock-alt"></i>
                </div>
                <h3>Khôi phục mật khẩu</h3>
                <p>Đừng lo lắng! Việc quên mật khẩu có thể xảy ra với bất kỳ ai. Chúng tôi sẽ giúp bạn lấy lại quyền truy cập vào tài khoản của mình một cách nhanh chóng.</p>
                <ul class="steps-list">
                    <li><div class="step-number">1</div><div>Nhập email hoặc số điện thoại đã đăng ký</div></li>
                    <li><div class="step-number">2</div><div>Nhận mã OTP qua email hoặc tin nhắn</div></li>
                    <li><div class="step-number">3</div><div>Nhập mã OTP và đặt mật khẩu mới</div></li>
                    <li><div class="step-number">4</div><div>Đăng nhập với mật khẩu mới của bạn</div></li>
                </ul>
            </div>
        </div>

        <div class="forgot-form">
            <div class="forgot-header">
                <div class="logo">
                    <i class="fas fa-unlock-alt"></i>
                </div>
                <h2>Quên mật khẩu</h2>
                <p>Vui lòng cung cấp thông tin tài khoản của bạn để chúng tôi gửi mã xác thực OTP</p>
            </div>

            <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                <div class="form-group">
                    <label for="email">Email hoặc Số điện thoại:</label>
                    <div class="input-wrapper">
                        <input type="text" name="email" id="email" required 
                               placeholder="Nhập email hoặc số điện thoại đã đăng ký">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="note">
                        <i class="fas fa-info-circle"></i> 
                        <div>Chúng tôi sẽ gửi mã xác thực OTP đến thông tin liên hệ này. Mã có hiệu lực trong vòng 15 phút.</div>
                    </div>
                </div>

                <button type="submit" class="btn-submit">
                    <i class="fas fa-paper-plane"></i> 
                    Gửi mã xác thực
                </button>
            </form>

            <div class="forgot-footer">
                <p>Đã nhớ mật khẩu? <a href="login.jsp">Đăng nhập</a></p>
                <p>Chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add focus animations for inputs
            const inputs = document.querySelectorAll('input[type="text"], input[type="email"]');
            
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
                
                if (!email) {
                    e.preventDefault();
                    alert('Vui lòng nhập email hoặc số điện thoại');
                }
            });

            console.log('🔓 Forgot password page loaded successfully');
        });
    </script>
</body>
</html>