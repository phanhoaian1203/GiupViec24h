<%-- 
    Document   : verification
    Created on : May 31, 2025, 4:09:54 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác minh hồ sơ - Giúp Việc 24h</title>
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
            color: var(--text-dark);
        }
        
        .verification-container {
            width: 100%;
            max-width: 950px;
            display: flex;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            background-color: var(--white);
        }
        
        .verification-sidebar {
            flex: 2;
            background-color: var(--primary-color);
            padding: 40px;
            color: var(--white);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .verification-sidebar h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }
        
        .verification-sidebar p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
            opacity: 0.9;
        }
        
        .verification-form {
            flex: 3;
            padding: 40px;
            background-color: var(--white);
            max-height: 90vh;
            overflow-y: auto;
        }
        
        .verification-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .verification-header img {
            height: 40px;
            margin-bottom: 15px;
        }
        
        .verification-header h2 {
            color: var(--primary-color);
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
        
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--gray);
            border-radius: var(--border-radius);
            font-size: 15px;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.2);
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
        
        @media (max-width: 768px) {
            .verification-container {
                flex-direction: column;
            }
            
            .verification-sidebar {
                padding: 30px;
            }
            
            .verification-form {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <div class="verification-sidebar">
            <h1>Xác minh hồ sơ</h1>
            <p>Vui lòng cung cấp thông tin chi tiết và giấy tờ cần thiết để hoàn tất quá trình xác minh tài khoản người giúp việc. Hồ sơ của bạn sẽ được duyệt trong vòng 24-48 giờ.</p>
        </div>
        
        <div class="verification-form">
            <div class="verification-header">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Giúp Việc 24h Logo" 
                    onerror="this.onerror=null; this.src='/api/placeholder/200/40'; this.alt='Giúp Việc 24h';">
                <h2>Xác minh hồ sơ</h2>
            </div>
            
            <form action="VerifyServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="fullName">Họ và tên đầy đủ: <span style="color: #e74c3c;">*</span></label>
                    <input type="text" name="fullName" id="fullName" required placeholder="Nhập họ tên của bạn">
                </div>
                
                <div class="form-group">
                    <label for="experience">Kinh nghiệm làm việc:</label>
                    <textarea name="experience" id="experience" placeholder="Mô tả kinh nghiệm (tối đa 500 ký tự)"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="skills">Kỹ năng:</label>
                    <textarea name="skills" id="skills" placeholder="Liệt kê kỹ năng (tối đa 500 ký tự)"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="pricePerHour">Giá thỏa thuận: <span style="color: #e74c3c;">*</span></label>
                    <input type="number" name="pricePerHour" id="pricePerHour" required placeholder="Nhập giá dịch vụ">
                </div>
                
                <div class="form-group">
                    <label for="availableHours">Khung giờ làm việc:</label>
                    <textarea name="availableHours" id="availableHours" placeholder="Ví dụ: 8:00-12:00, 14:00-18:00"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="verificationDocs">Tải lên giấy tờ xác minh (CMND/CCCD): <span style="color: #e74c3c;">*</span></label>
                    <input type="file" name="verificationDocs" id="verificationDocs" required accept=".jpg,.png,.pdf">
                </div>
                
                <div class="form-group">
                    <label for="selfie">Selfie(hình ảnh mặt mộc của bạn): <span style="color: #e74c3c;">*</span></label>
                    <input type="file" name="selfie" id="selfie" required accept=".jpg,.png,.jpeg">
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn-submit">Gửi yêu cầu xác minh</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>



