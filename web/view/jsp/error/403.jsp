<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Không có quyền truy cập - Giúp Việc 24H</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            color: #2d3748;
        }

        .error-container {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            max-width: 500px;
            width: 90%;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
        }

        .error-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            color: white;
            font-size: 3rem;
        }

        .error-code {
            font-size: 4rem;
            font-weight: 800;
            color: #ef4444;
            margin-bottom: 1rem;
        }

        .error-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .error-message {
            color: #64748b;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: #667eea;
            color: white;
        }

        .btn-primary:hover {
            background: #5a67d8;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: transparent;
            color: #64748b;
            border: 2px solid #e2e8f0;
        }

        .btn-secondary:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
        }

        .info-box {
            background: #f0f9ff;
            border: 2px solid #bae6fd;
            border-radius: 12px;
            padding: 1rem;
            margin-top: 2rem;
            text-align: left;
        }

        .info-box h4 {
            color: #0c4a6e;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .info-box p {
            color: #0369a1;
            font-size: 0.9rem;
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">
            <i class="fas fa-ban"></i>
        </div>
        
        <div class="error-code">403</div>
        <h1 class="error-title">Không có quyền truy cập</h1>
        
        <p class="error-message">
            <%= request.getAttribute("errorMessage") != null ? 
                request.getAttribute("errorMessage") : 
                "Bạn không có quyền truy cập vào trang này. Vui lòng liên hệ quản trị viên nếu bạn cho rằng đây là lỗi." %>
        </p>

        <div class="action-buttons">
            <a href="<%= request.getContextPath() %>/" class="btn btn-primary">
                <i class="fas fa-home"></i>
                Về trang chủ
            </a>
            <a href="javascript:history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i>
                Quay lại
            </a>
        </div>

        <div class="info-box">
            <h4>Thông tin hỗ trợ</h4>
            <p>
                Nếu bạn cần truy cập vào trang này để thực hiện công việc, vui lòng liên hệ:
                <br><strong>Email:</strong> admin@giupviec24h.com
                <br><strong>Hotline:</strong> 1900 xxxx
            </p>
        </div>
    </div>
</body>
</html>