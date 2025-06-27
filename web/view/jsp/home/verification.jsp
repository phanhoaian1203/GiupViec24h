<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác minh hồ sơ - Giúp Việc 24h</title>
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
                radial-gradient(circle at 20% 80%, rgba(218, 165, 32, 0.08) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(184, 134, 11, 0.06) 0%, transparent 50%),
                url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="%23daa520" opacity="0.06"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
            pointer-events: none;
        }
        
        .verification-container {
            width: 100%;
            max-width: 1100px;
            display: flex;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.08);
            overflow: hidden;
            background-color: white;
            position: relative;
            z-index: 1;
            border: 1px solid #f1f5f9;
        }
        
        .verification-sidebar {
            flex: 2;
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            padding: 3rem;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .verification-sidebar::before {
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
        
        .verification-sidebar .icon-wrapper {
            text-align: center;
            margin-bottom: 2rem;
        }

        .verification-sidebar .icon-wrapper i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #daa520;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        
        .verification-sidebar h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 700;
            text-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }
        
        .verification-sidebar p {
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 2rem;
            opacity: 0.9;
            color: #e2e8f0;
        }

        .requirements-list {
            list-style: none;
            margin-top: 1rem;
        }

        .requirements-list li {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .requirements-list i {
            color: #daa520;
            margin-right: 0.75rem;
            width: 16px;
            text-align: center;
            flex-shrink: 0;
        }
        
        .verification-form {
            flex: 3;
            padding: 3rem;
            max-height: 95vh;
            overflow-y: auto;
        }
        
        .verification-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        
        .verification-header .logo {
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
        
        .verification-header h2 {
            color: #1a202c;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .verification-header p {
            color: #718096;
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
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: #f8fafc;
            font-family: inherit;
        }

        .form-group input.with-icon {
            padding-left: 2.5rem;
        }

        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: #daa520;
            background: white;
            box-shadow: 0 0 0 3px rgba(218, 165, 32, 0.1);
        }

        .form-group input:focus + i {
            color: #daa520;
        }

        .file-upload-group {
            display: flex;
            gap: 1rem;
            flex-direction: column;
        }

        .file-upload-wrapper {
            position: relative;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .file-upload {
            flex: 1;
        }

        .file-label {
            font-size: 0.85rem;
            color: #718096;
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

        .success-message {
            background: #f0fff4;
            color: #22543d;
            padding: 0.875rem 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            border-left: 4px solid #38a169;
            display: flex;
            align-items: center;
            gap: 0.5rem;
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

        .btn-secondary {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            background: transparent;
            color: #4a5568;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }

        .btn-secondary:hover {
            background: #f8fafc;
            border-color: #cbd5e0;
            color: #2d3748;
            transform: translateY(-1px);
        }

        /* Custom scrollbar */
        .verification-form::-webkit-scrollbar {
            width: 6px;
        }

        .verification-form::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 3px;
        }

        .verification-form::-webkit-scrollbar-thumb {
            background: #daa520;
            border-radius: 3px;
        }

        .verification-form::-webkit-scrollbar-thumb:hover {
            background: #b8860b;
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

            .verification-container {
                flex-direction: column;
                max-width: 500px;
            }
            
            .verification-sidebar {
                padding: 2rem;
                text-align: center;
            }
            
            .verification-form {
                padding: 2rem;
                max-height: none;
            }

            .verification-header h2 {
                font-size: 1.5rem;
            }

            .file-upload-group {
                gap: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .verification-container {
                margin: 0;
                border-radius: 0;
            }

            .verification-form {
                padding: 1.5rem;
            }

            .verification-sidebar {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <div class="verification-sidebar">
            <div class="sidebar-content">
                <div class="icon-wrapper">
                    <i class="fas fa-user-check"></i>
                </div>
                <h1>Xác minh hồ sơ</h1>
                <p>Vui lòng cung cấp thông tin chi tiết và giấy tờ cần thiết để hoàn tất quá trình xác minh tài khoản người giúp việc. Hồ sơ của bạn sẽ được duyệt trong vòng 24-48 giờ.</p>
                
                <ul class="requirements-list">
                    <li>
                        <i class="fas fa-id-card"></i>
                        CMND/CCCD còn hiệu lực
                    </li>
                    <li>
                        <i class="fas fa-camera"></i>
                        Hình ảnh selfie rõ nét
                    </li>
                    <li>
                        <i class="fas fa-file-alt"></i>
                        Thông tin kinh nghiệm làm việc
                    </li>
                    <li>
                        <i class="fas fa-shield-check"></i>
                        Xác minh trong 24-48 giờ
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="verification-form">
            <div class="verification-header">
                <div class="logo">
                    <i class="fas fa-user-check"></i>
                </div>
                <h2>Xác minh hồ sơ</h2>
                <p>Hoàn tất thông tin để trở thành người giúp việc uy tín</p>
            </div>
            
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                String successMessage = (String) request.getAttribute("successMessage");
            %>
            <% if (errorMessage != null) { %>
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <%= errorMessage %>
                </div>
            <% } %>
            <% if (successMessage != null) { %>
                <div class="success-message">
                    <i class="fas fa-check-circle"></i>
                    <%= successMessage %>
                </div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/VerifyServlet" method="post" enctype="multipart/form-data">
                <div class="form-grid">
                    <div class="form-group full-width">
                        <label for="fullName">Họ và tên đầy đủ <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="text" name="fullName" id="fullName" class="with-icon" required placeholder="Nhập họ tên của bạn">
                            <i class="fas fa-user"></i>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="experienceYears">Số năm kinh nghiệm <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="number" name="experienceYears" id="experienceYears" class="with-icon" min="0" required placeholder="Nhập số năm kinh nghiệm">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="hourlyRate">Giá thỏa thuận (theo giờ) <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="number" name="hourlyRate" id="hourlyRate" class="with-icon" step="1000" min="0" required placeholder="Ví dụ: 150000">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="workAreas">Khu vực làm việc <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <input type="text" name="workAreas" id="workAreas" class="with-icon" required placeholder="Ví dụ: Hai Chau, Ngu Hanh Son">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="skills">Kỹ năng <span class="required">*</span></label>
                        <textarea name="skills" id="skills" required placeholder="Liệt kê kỹ năng (tối đa 200 ký tự)" maxlength="200"></textarea>
                    </div>
                    
                    <div class="form-group full-width">
                        <label>Tải lên giấy tờ xác minh (CMND/CCCD) <span class="required">*</span></label>
                        <div class="file-upload-group">
                            <div class="file-upload-wrapper">
                                <input type="file" name="verificationDocFront" id="verificationDocFront" class="file-upload" required accept=".jpg,.png,.pdf">
                                <span class="file-label">Mặt trước CMND/CCCD</span>
                            </div>
                            <div class="file-upload-wrapper">
                                <input type="file" name="verificationDocBack" id="verificationDocBack" class="file-upload" required accept=".jpg,.png,.pdf">
                                <span class="file-label">Mặt sau CMND/CCCD</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="selfie">Selfie (hình ảnh mặt mộc) <span class="required">*</span></label>
                        <input type="file" name="selfie" id="selfie" required accept=".jpg,.png,.jpeg">
                    </div>
                    
                    <div class="form-group full-width">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-paper-plane"></i>
                            Gửi yêu cầu xác minh
                        </button>
                    </div>
                </div>
            </form>

            <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp" class="btn-secondary">
                <i class="fas fa-arrow-left"></i>
                Quay lại trang đăng nhập
            </a>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // File input validation
            const fileInputs = document.querySelectorAll('input[type="file"]');
            
            fileInputs.forEach(input => {
                input.addEventListener('change', function() {
                    const file = this.files[0];
                    if (file) {
                        const maxSize = 5 * 1024 * 1024; // 5MB
                        if (file.size > maxSize) {
                            alert('File quá lớn. Vui lòng chọn file dưới 5MB.');
                            this.value = '';
                            return;
                        }
                        
                        // Update label with filename
                        const label = this.parentElement.querySelector('.file-label');
                        if (label) {
                            label.textContent = file.name;
                            label.style.color = '#daa520';
                        }
                    }
                });
            });

            // Form validation
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                const requiredFields = form.querySelectorAll('input[required], textarea[required]');
                let isValid = true;
                
                requiredFields.forEach(field => {
                    if (!field.value.trim()) {
                        isValid = false;
                        field.style.borderColor = '#e53e3e';
                    } else {
                        field.style.borderColor = '#e2e8f0';
                    }
                });
                
                if (!isValid) {
                    e.preventDefault();
                    alert('Vui lòng điền đầy đủ thông tin bắt buộc');
                }
            });

            // Input focus enhancement
            const inputs = document.querySelectorAll('input, textarea');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.style.transform = 'scale(1)';
                });
            });

            console.log('✅ Profile verification page loaded successfully');
        });
    </script>
</body>
</html>