<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🧪 Ví Điện Tử - Test</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 2rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #eee;
        }
        .success {
            background: #d4edda;
            color: #155724;
            padding: 1rem;
            border-radius: 8px;
            margin: 1rem 0;
            border-left: 4px solid #28a745;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 1rem;
            border-radius: 8px;
            margin: 1rem 0;
            border-left: 4px solid #dc3545;
        }
        .btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            margin: 0.5rem;
            transition: all 0.3s ease;
            font-weight: 600;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .user-info {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 8px;
            margin: 1rem 0;
        }
        .test-section {
            background: #e3f2fd;
            padding: 1.5rem;
            border-radius: 8px;
            margin: 1rem 0;
        }
        .status {
            font-size: 1.2rem;
            font-weight: 600;
            margin: 1rem 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-wallet"></i> Ví Điện Tử Test</h1>
            <p>🧪 Trang test servlet WalletServlet</p>
        </div>

        <!-- Success/Error Messages -->
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
        <div class="success">
            <i class="fas fa-check-circle"></i>
            <strong>Thành công:</strong> <%= message %>
        </div>
        <% } %>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="error">
            <i class="fas fa-exclamation-circle"></i>
            <strong>Lỗi:</strong> <%= error %>
        </div>
        <% } %>

        <!-- User Info -->
        <% User user = (User) request.getAttribute("user"); %>
        <% if (user != null) { %>
        <div class="user-info">
            <h3><i class="fas fa-user"></i> Thông tin người dùng</h3>
            <p><strong>ID:</strong> <%= user.getUserId() %></p>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <p><strong>Họ tên:</strong> <%= user.getFullName() %></p>
            <p><strong>Role ID:</strong> <%= user.getRoleId() %></p>
            <p><strong>Trạng thái:</strong> <%= user.isActive() ? "Kích hoạt" : "Chưa kích hoạt" %></p>
        </div>
        <% } %>

        <!-- Status Check -->
        <div class="status">
            <i class="fas fa-check-circle" style="color: #28a745;"></i>
            <strong>Trạng thái:</strong> WalletServlet đã hoạt động thành công!
        </div>

        <!-- Test Section -->
        <div class="test-section">
            <h3><i class="fas fa-flask"></i> Test Functions</h3>
            <p>Các test cơ bản để đảm bảo servlet hoạt động:</p>
            
            <form action="<%= request.getContextPath() %>/wallet" method="post" style="display: inline;">
                <input type="hidden" name="action" value="test">
                <button type="submit" class="btn">
                    <i class="fas fa-play"></i>
                    Test POST Request
                </button>
            </form>
            
            <a href="<%= request.getContextPath() %>/wallet?test=1" class="btn">
                <i class="fas fa-link"></i>
                Test GET Request
            </a>
        </div>

        <!-- Next Steps -->
        <div style="text-align: center; margin-top: 2rem;">
            <h3>🚀 Bước tiếp theo</h3>
            <p>Sau khi servlet test thành công, bạn có thể:</p>
            <ul style="text-align: left; max-width: 500px; margin: 0 auto;">
                <li>✅ WalletServlet mapping hoạt động</li>
                <li>⏳ Thêm DAO classes từng bước</li>
                <li>⏳ Thêm VietQRService</li>
                <li>⏳ Hoàn thiện chức năng ví</li>
            </ul>
            
            <div style="margin-top: 2rem;">
                <a href="<%= request.getContextPath() %>/" class="btn">
                    <i class="fas fa-home"></i> Trang chủ
                </a>
                <a href="<%= request.getContextPath() %>/hire" class="btn">
                    <i class="fas fa-handshake"></i> Thuê dịch vụ
                </a>
                <% if (user != null) { %>
                <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn" style="background: #dc3545;">
                    <i class="fas fa-sign-out-alt"></i> Đăng xuất
                </a>
                <% } else { %>
                <a href="<%= request.getContextPath() %>/view/jsp/home/login.jsp" class="btn">
                    <i class="fas fa-sign-in-alt"></i> Đăng nhập
                </a>
                <% } %>
            </div>
        </div>

        <!-- Debug Info -->
        <div style="margin-top: 2rem; padding: 1rem; background: #f1f3f4; border-radius: 8px; font-family: monospace; font-size: 0.85rem;">
            <strong>🔍 Debug Info:</strong><br>
            Request URI: <%= request.getRequestURI() %><br>
            Context Path: <%= request.getContextPath() %><br>
            Session ID: <%= session.getId() %><br>
            Server Time: <%= new java.util.Date() %>
        </div>
    </div>
</body>
</html>