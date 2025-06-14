<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác minh hồ sơ - Giúp Việc 24h</title>
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
        body {
            background-color: var(--gray-light);
            background-image: linear-gradient(to bottom right, rgba(26, 179, 148, 0.1), rgba(26, 179, 148, 0.05));
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: var(--text-dark);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
            max-height: 90vh;
            overflow-y: auto;
        }
        .verification-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .verification-header img {
            height: 100px;
            margin-bottom: 10px;
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
        }
        .btn-submit:hover {
            background-color: var(--primary-dark);
        }
        .message {
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: var(--border-radius);
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
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
                <img src="${pageContext.request.contextPath}/view/assets/home/img/logo/logo.png" alt="Giúp Việc 24h Logo" 
                    onerror="this.onerror=null; this.src='/api/placeholder/200/40'; this.alt='Giúp Việc 24h';">
                <h2>Xác minh hồ sơ</h2>
            </div>
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                String successMessage = (String) request.getAttribute("successMessage");
            %>
            <% if (errorMessage != null) { %>
                <div class="message error-message"><%= errorMessage %></div>
            <% } %>
            <% if (successMessage != null) { %>
                <div class="message success-message"><%= successMessage %></div>
            <% } %>
            <form action="${pageContext.request.contextPath}/VerifyServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="fullName">Họ và tên đầy đủ <span style="color: #e74c3c;">*</span></label>
                    <input type="text" name="fullName" id="fullName" required placeholder="Nhập họ tên của bạn">
                </div>
                <div class="form-group">
                    <label for="experienceYears">Số năm kinh nghiệm <span style="color: #e74c3c;">*</span></label>
                    <input type="number" name="experienceYears" id="experienceYears" min="0" required placeholder="Nhập số năm kinh nghiệm">
                </div>
                <div class="form-group">
                    <label for="skills">Kỹ năng <span style="color: #e74c3c;">*</span></label>
                    <textarea name="skills" id="skills" required placeholder="Liệt kê kỹ năng (tối đa 200 ký tự)" maxlength="200"></textarea>
                </div>
                <div class="form-group">
                    <label for="hourlyRate">Giá thỏa thuận (theo giờ) <span style="color: #e74c3c;">*</span></label>
                    <input type="number" name="hourlyRate" id="hourlyRate" step="1000" min="0" required placeholder="Ví dụ: 150000">
                </div>
                <div class="form-group">
                    <label for="workAreas">Khu vực làm việc <span style="color: #e74c3c;">*</span></label>
                    <input type="text" name="workAreas" id="workAreas" required placeholder="Ví dụ: Hai Chau, Ngu Hanh Son">
                </div>
                <div class="form-group">
                    <label>Tải lên giấy tờ xác minh (CMND/CCCD) <span style="color: #e74c3c;">*</span></label>
                    <div style="display: flex; gap: 10px; flex-direction: column;">
                        <input type="file" name="verificationDocFront" id="verificationDocFront" required accept=".jpg,.png,.pdf" placeholder="Mặt trước CMND/CCCD">
                        <input type="file" name="verificationDocBack" id="verificationDocBack" required accept=".jpg,.png,.pdf" placeholder="Mặt sau CMND/CCCD">
                    </div>
                </div>
                <div class="form-group">
                    <label for="selfie">Selfie (hình ảnh mặt mộc) <span style="color: #e74c3c;">*</span></label>
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