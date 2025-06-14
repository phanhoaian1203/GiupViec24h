
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Giúp Việc 24h</title>
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
            color: var(--text-dark);
        }
        
        .signup-container {
            width: 100%;
            max-width: 950px;
            display: flex;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            background-color: var(--white);
        }
        
        .signup-sidebar {
            flex: 2;
            background-color: var(--primary-color);
            padding: 40px;
            color: var(--white);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .signup-sidebar h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        
        .signup-sidebar p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
            opacity: 0.9;
        }
        
        .benefits-list {
            list-style: none;
        }
        
        .benefits-list li {
            margin-bottom: 15px;
            display: flex;
            align-items: flex-start;
            font-size: 15px;
        }
        
        .benefits-list i {
            margin-right: 10px;
            color: var(--white);
        }
        
        .signup-form {
            flex: 3;
            padding: 40px;
            background-color: var(--white);
            max-height: 90vh;
            overflow-y: auto;
        }
        
        .signup-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .signup-header img {
            height: 100px;
            margin-bottom: 10px;
        }
        
        .signup-header h2 {
            color: var(--primary-color);
            font-size: 24px;
            font-weight: 600;
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        
        .form-grid .full-width {
            grid-column: span 2;
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
        
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--gray);
            border-radius: var(--border-radius);
            font-size: 15px;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.2);
        }
        
        .info-text {
            font-size: 13px;
            color: #666;
            margin-top: 5px;
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
            margin-top: 10px;
        }
        
        .btn-submit:hover {
            background-color: var(--primary-dark);
        }
        
        .signup-footer {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }
        
        .signup-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
        
        .signup-footer a:hover {
            text-decoration: underline;
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
            .signup-container {
                flex-direction: column;
            }
            
            .signup-sidebar {
                padding: 30px;
            }
            
            .signup-form {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-sidebar">
            <h1>Giúp Việc 24h</h1>
            <p>Gia nhập nền tảng giúp việc hàng đầu Việt Nam. Chúng tôi kết nối những người giúp việc uy tín và những gia đình cần dịch vụ chất lượng.</p>
            
            <ul class="benefits-list">
                <li><i class="fas fa-check-circle"></i> Đăng ký dễ dàng, xác thực an toàn</li>
                <li><i class="fas fa-user-shield"></i> Bảo mật thông tin cá nhân</li>
                <li><i class="fas fa-clock"></i> Dịch vụ linh hoạt theo giờ, ngày hoặc tháng</li>
                <li><i class="fas fa-hand-holding-usd"></i> Giá cả minh bạch, không phí ẩn</li>
                <li><i class="fas fa-star"></i> Đánh giá thực tế từ khách hàng</li>
                <li><i class="fas fa-headset"></i> Hỗ trợ 24/7 cho mọi thắc mắc</li>
            </ul>
        </div>
        
        <div class="signup-form">
            <div class="signup-header">
                <img src="${pageContext.request.contextPath}/view/assets/home/img/logo/logo.png" alt="Giúp Việc 24h Logo" 
                    onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/view/assets/home/img/logoo/placeholder.png'; this.alt='Giúp Việc 24h';">
                <h2>Đăng ký tài khoản</h2>
            </div>
            
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <p style="color: #e74c3c; text-align: center;"><%= errorMessage %></p>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/SignupServlet" method="post">
                <div class="form-grid">
                    <div class="form-group full-width">
                        <label for="fullName">Họ và tên: <span style="color: #e74c3c;">*</span></label>
                        <input type="text" name="fullName" id="fullName" required placeholder="Nhập họ và tên của bạn">
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="email">Email: <span style="color: #e74c3c;">*</span></label>
                        <input type="email" name="email" id="email" required placeholder="Địa chỉ email của bạn">
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Mật khẩu: <span style="color: #e74c3c;">*</span></label>
                        <input type="password" name="password" id="password" required placeholder="Nhập mật khẩu">
                        <p class="info-text">Mật khẩu cần khớp với xác nhận mật khẩu</p>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Xác nhận mật khẩu: <span style="color: #e74c3c;">*</span></label>
                        <input type="password" name="confirmPassword" id="confirmPassword" required placeholder="Nhập lại mật khẩu">
                    </div>
                    
                    <div class="form-group">
                        <label for="dob">Ngày sinh: <span style="color: #e74c3c;">*</span></label>
                        <input type="date" name="dob" id="dob" required max="<%= LocalDate.now().toString() %>">
                    </div>
                    
                    <div class="form-group">
                        <label for="gender">Giới tính: <span style="color: #e74c3c;">*</span></label>
                        <select name="gender" id="gender" required>
                            <option value="" selected disabled>Chọn giới tính</option>
                            <option value="male">Nam</option>
                            <option value="female">Nữ</option>
                            <option value="other">Khác</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Số điện thoại: <span style="color: #e74c3c;">*</span></label>
                        <input type="text" name="phone" id="phone" required placeholder="Nhập số điện thoại của bạn">
                    </div>
                    
                    <div class="form-group">
                        <label for="area">Khu vực sống: <span style="color: #e74c3c;">*</span></label>
                        <input type="text" name="area" id="area" required placeholder="Thành phố/Quận/Huyện">
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="role">Tôi đăng ký với tư cách: <span style="color: #e74c3c;">*</span></label>
                        <select name="role" id="role" onchange="confirmRole(this)" required>
                            <option value="" selected disabled>Chọn vai trò của bạn</option>
                            <option value="customer">Khách hàng - Tôi cần tìm người giúp việc</option>
                            <option value="housekeeper">Người giúp việc - Tôi muốn đăng ký làm việc</option>
                        </select>
                    </div>
                    
                    <div class="form-group full-width">
                        <button type="submit" class="btn-submit">Đăng ký tài khoản</button>
                    </div>
                </div>
            </form>
            
            <div class="signup-footer">
                <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>
            </div>
        </div>
    </div>

    <script>
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