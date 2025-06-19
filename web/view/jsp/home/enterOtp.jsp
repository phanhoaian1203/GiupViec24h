<%-- 
    Document   : enterOtp
    Created on : Jun 16, 2025, 10:49:17 AM
    Author     : TGDD
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác minh OTP - Giúp Việc 24h</title>
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
        
        .otp-container {
            background-color: white;
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 450px;
            position: relative;
            z-index: 1;
            border: 1px solid #f1f5f9;
        }
        
        .otp-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .otp-header .logo {
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
        
        .otp-header h2 {
            color: #1a202c;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .otp-header p {
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
            text-align: center;
            font-weight: 600;
            letter-spacing: 0.5em;
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
            box-shadow: 0 4px 15px rgba(218, 165, 32, 0.25);
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-submit:hover {
            background: linear-gradient(135deg, #b8860b, #9a7209);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(218, 165, 32, 0.4);
        }
        
        .error-message {
            background: #fff5f5;
            color: #c53030;
            padding: 0.875rem 1rem;
            border-radius: 8px;
            margin-top: 1rem;
            font-size: 0.9rem;
            border-left: 4px solid #e53e3e;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .info-note {
            background: linear-gradient(135deg, #fff8dc, #f5deb3);
            color: #8b7355;
            padding: 0.875rem 1rem;
            border-radius: 8px;
            margin-top: 1rem;
            font-size: 0.85rem;
            text-align: center;
            border-left: 3px solid #daa520;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .resend-section {
            text-align: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid #e2e8f0;
        }

        .resend-text {
            color: #718096;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
        }

        .resend-link {
            color: #daa520;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
            font-size: 0.9rem;
        }

        .resend-link:hover {
            color: #b8860b;
        }

        .countdown {
            color: #9a7209;
            font-weight: 600;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: #718096;
            text-decoration: none;
            font-size: 0.9rem;
            margin-top: 1rem;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #daa520;
        }
        
        @media (max-width: 480px) {
            .otp-container {
                padding: 2rem 1.5rem;
                margin: 0;
                border-radius: 0;
            }

            .otp-header h2 {
                font-size: 1.5rem;
            }

            .form-group input {
                letter-spacing: 0.3em;
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <div class="otp-container">
        <div class="otp-header">
            <div class="logo">
                <i class="fas fa-shield-check"></i>
            </div>
            <h2>Xác minh OTP</h2>
            <p>Vui lòng nhập mã xác thực 6 chữ số được gửi đến email của bạn</p>
        </div>
        
        <form action="${pageContext.request.contextPath}/verify-otp" method="post">
            <div class="form-group">
                <label for="otp">Mã OTP:</label>
                <div class="input-wrapper">
                    <input type="text" id="otp" name="otp" placeholder="000000" required maxlength="6" pattern="[0-9]{6}">
                    <i class="fas fa-key"></i>
                </div>
            </div>
            
            <button type="submit" class="btn-submit">
                <i class="fas fa-check"></i>
                Xác nhận
            </button>
        </form>
        
        <c:if test="${not empty error}">
            <div class="error-message">
                <i class="fas fa-exclamation-triangle"></i>
                ${error}
            </div>
        </c:if>
        
        <div class="info-note">
            <i class="fas fa-info-circle"></i>
            Mã OTP có hiệu lực trong vòng 15 phút
        </div>

        <div class="resend-section">
            <p class="resend-text">Không nhận được mã?</p>
            <a href="#" class="resend-link" onclick="resendOTP()" id="resendLink">
                <i class="fas fa-redo"></i> Gửi lại mã OTP
            </a>
            <div id="countdown" class="countdown" style="display: none;"></div>
        </div>

        <a href="javascript:history.back()" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Quay lại
        </a>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const otpInput = document.getElementById('otp');
            
            // Auto-format OTP input
            otpInput.addEventListener('input', function() {
                let value = this.value.replace(/\D/g, '');
                if (value.length > 6) {
                    value = value.substring(0, 6);
                }
                this.value = value;
            });

            // Auto-submit when 6 digits entered
            otpInput.addEventListener('input', function() {
                if (this.value.length === 6) {
                    // Optional: auto-submit after a brief delay
                    setTimeout(() => {
                        this.form.submit();
                    }, 500);
                }
            });

            // Focus enhancement
            otpInput.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            otpInput.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });

            console.log('🔐 OTP verification page loaded successfully');
        });

        function resendOTP() {
            const resendLink = document.getElementById('resendLink');
            const countdown = document.getElementById('countdown');
            
            // Disable resend link and start countdown
            resendLink.style.display = 'none';
            countdown.style.display = 'block';
            
            let timeLeft = 60;
            countdown.textContent = `Gửi lại sau ${timeLeft}s`;
            
            const timer = setInterval(() => {
                timeLeft--;
                countdown.textContent = `Gửi lại sau ${timeLeft}s`;
                
                if (timeLeft <= 0) {
                    clearInterval(timer);
                    resendLink.style.display = 'inline-flex';
                    countdown.style.display = 'none';
                }
            }, 1000);
            
            // Here you would make an AJAX call to resend OTP
            // For now, just showing the countdown
            console.log('Resending OTP...');
        }
    </script>
</body>
</html>