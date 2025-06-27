<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Có lỗi xảy ra - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #333;
        }

        .error-container {
            background: white;
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }

        .error-icon {
            font-size: 4rem;
            color: #e74c3c;
            margin-bottom: 1.5rem;
        }

        .error-title {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .error-message {
            font-size: 1.1rem;
            color: #7f8c8d;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .error-details {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            font-size: 0.9rem;
            color: #6c757d;
            border-left: 4px solid #e74c3c;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.8rem 2rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: #3498db;
            color: white;
        }

        .btn-primary:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: #95a5a6;
            color: white;
        }

        .btn-secondary:hover {
            background: #7f8c8d;
            transform: translateY(-2px);
        }

        .debug-info {
            margin-top: 2rem;
            padding: 1rem;
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            font-size: 0.85rem;
            color: #856404;
        }

        .debug-info h4 {
            margin-bottom: 0.5rem;
            color: #856404;
        }

        .debug-info ul {
            text-align: left;
            padding-left: 1.5rem;
        }

        .debug-info li {
            margin-bottom: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <i class="fas fa-exclamation-triangle error-icon"></i>
        
        <h1 class="error-title">Oops! Có lỗi xảy ra</h1>
        
        <p class="error-message">
            <c:choose>
                <c:when test="${not empty errorMessage}">
                    ${errorMessage}
                </c:when>
                <c:otherwise>
                    Đã xảy ra lỗi không mong muốn. Vui lòng thử lại sau hoặc liên hệ hỗ trợ.
                </c:otherwise>
            </c:choose>
        </p>

        <c:if test="${not empty param.debug && param.debug == 'true'}">
            <div class="error-details">
                <strong>Chi tiết lỗi:</strong><br>
                URI: ${pageContext.request.requestURI}<br>
                Method: ${pageContext.request.method}<br>
                Time: <%= new java.util.Date() %>
            </div>
        </c:if>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/hire" class="btn btn-primary">
                <i class="fas fa-home"></i>
                Về trang chủ
            </a>
            <a href="javascript:history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i>
                Quay lại
            </a>
        </div>

        <!-- Debug information for development -->
        <c:if test="${pageContext.request.serverName == 'localhost'}">
            <div class="debug-info">
                <h4><i class="fas fa-bug"></i> Thông tin Debug (chỉ hiện trong development):</h4>
                <ul>
                    <li><strong>Lỗi có thể do:</strong></li>
                    <li>Database không có dữ liệu housekeepers active</li>
                    <li>Kết nối database thất bại</li>
                    <li>Cấu hình servlet mapping không đúng</li>
                    <li>Missing JDBC driver</li>
                </ul>
                <p style="margin-top: 1rem;">
                    <strong>Giải pháp:</strong> Chạy SQL: <code>UPDATE users SET is_active = 1 WHERE user_id IN (6,7,8,11,12,13,14,15)</code>
                </p>
            </div>
        </c:if>
    </div>

    <script>
        // Auto-reload nếu là lỗi server tạm thời
        if (window.location.search.includes('autoretry=true')) {
            setTimeout(() => {
                window.location.href = '${pageContext.request.contextPath}/hire';
            }, 3000);
        }
    </script>
</body>
</html>