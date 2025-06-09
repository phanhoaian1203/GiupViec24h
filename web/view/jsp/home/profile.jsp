<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ Sơ Cá Nhân - Quản Lý Thông Tin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #1AB394 0%, #18a085 100%);
            min-height: 100vh;
            padding: 2rem 1rem;
            color: #2d3748;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
            color: white;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .profile-layout {
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: 2rem;
            align-items: start;
        }

        .profile-sidebar {
            background: white;
            border-radius: 24px;
            padding: 2rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            position: sticky;
            top: 2rem;
        }

        .profile-avatar {
            position: relative;
            width: 120px;
            height: 120px;
            margin: 0 auto 1.5rem;
            border-radius: 50%;
            background: linear-gradient(135deg, #1AB394, #18a085);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: white;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .profile-avatar:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(26, 179, 148, 0.3);
        }

        .profile-avatar .avatar-upload {
            position: absolute;
            bottom: 5px;
            right: 5px;
            width: 35px;
            height: 35px;
            background: #1f2937;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .profile-avatar .avatar-upload:hover {
            background: #374151;
            transform: scale(1.1);
        }

        .profile-name {
            text-align: center;
            margin-bottom: 2rem;
        }

        .profile-name h2 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            color: #1f2937;
        }

        .profile-name .status {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
            display: inline-block;
        }

        .profile-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .stat-item {
            text-align: center;
            padding: 1rem;
            background: #f8fafc;
            border-radius: 12px;
            transition: all 0.2s ease;
        }

        .stat-item:hover {
            background: #e2e8f0;
            transform: translateY(-2px);
        }

        .stat-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1AB394;
            display: block;
        }

        .stat-label {
            font-size: 0.875rem;
            color: #64748b;
            margin-top: 0.25rem;
        }

        .profile-actions {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }

        .action-btn {
            padding: 0.75rem 1rem;
            border-radius: 12px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            text-decoration: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, #1AB394, #18a085);
            color: white;
        }

        .btn-secondary {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #e2e8f0;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .main-content {
            background: white;
            border-radius: 24px;
            padding: 2.5rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .content-header {
            display: flex;
            justify-content: between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f1f5f9;
        }

        .content-title {
            font-size: 1.875rem;
            font-weight: 700;
            color: #1f2937;
        }

        .edit-toggle {
            background: linear-gradient(135deg, #f59e0b, #d97706);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .edit-toggle:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .form-group {
            position: relative;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .form-input {
            width: 100%;
            padding: 1rem 1.25rem;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.2s ease;
            background: #ffffff;
        }

        .form-input:focus {
            outline: none;
            border-color: #1AB394;
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.1);
        }

        .form-input:disabled {
            background: #f9fafb;
            color: #6b7280;
            cursor: not-allowed;
        }

        .input-group {
            position: relative;
        }

        .input-icon {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            cursor: pointer;
            transition: color 0.2s ease;
        }

        .input-icon:hover {
            color: #1AB394;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            padding-top: 2rem;
            border-top: 2px solid #f1f5f9;
        }

        .btn {
            padding: 1rem 2rem;
            border-radius: 12px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1rem;
        }

        .btn-save {
            background: linear-gradient(135deg, #1AB394, #18a085);
            color: white;
        }

        .btn-cancel {
            background: #f3f4f6;
            color: #374151;
            border: 1px solid #d1d5db;
        }

        .btn-delete {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .additional-info {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 2px solid #f1f5f9;
        }

        .info-section {
            margin-bottom: 2rem;
        }

        .info-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
        }

        .info-card {
            background: #f8fafc;
            padding: 1.5rem;
            border-radius: 12px;
            border-left: 4px solid #1AB394;
            transition: all 0.2s ease;
        }

        .info-card:hover {
            background: #e2e8f0;
            transform: translateX(4px);
        }

        .info-card-title {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .info-card-value {
            color: #6b7280;
            font-size: 0.875rem;
        }

        .notification {
            position: fixed;
            top: 2rem;
            right: 2rem;
            padding: 1rem 1.5rem;
            background: #1AB394;
            color: white;
            border-radius: 12px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            transform: translateX(400px);
            transition: transform 0.3s ease;
            z-index: 1000;
        }

        .notification.show {
            transform: translateX(0);
        }

        @media (max-width: 1024px) {
            .profile-layout {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .profile-sidebar {
                position: static;
                order: 2;
            }

            .main-content {
                order: 1;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem 0.5rem;
            }

            .header h1 {
                font-size: 2rem;
            }

            .profile-sidebar,
            .main-content {
                padding: 1.5rem;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                justify-content: center;
            }
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-user-circle"></i> Hồ Sơ Cá Nhân</h1>
            <p>Quản lý và cập nhật thông tin cá nhân của bạn</p>
        </div>

        <div class="profile-layout">
            <div class="profile-sidebar">
                <div class="profile-avatar" onclick="document.getElementById('avatar-upload').click()">
                    <span id="avatar-text">KH</span>
                    <div class="avatar-upload">
                        <i class="fas fa-camera fa-sm"></i>
                    </div>
                    <input type="file" id="avatar-upload" accept="image/*" style="display: none;">
                </div>

                <div class="profile-name">
                    <h2 id="sidebar-name">Khách Hàng</h2>
                    <span class="status">
                        <i class="fas fa-check-circle"></i> Đã xác minh
                    </span>
                </div>

                <div class="profile-stats">
                    <div class="stat-item">
                        <span class="stat-number">24</span>
                        <span class="stat-label">Lượt Thuê</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-number">5.0</span>
                        <span class="stat-label">Đánh giá</span>
                    </div>
                </div>

                <div class="profile-actions">
                    <button class="action-btn btn-primary">
                        <i class="fas fa-history"></i> Lịch sử đơn hàng
                    </button>
                    
                    <button class="action-btn btn-secondary">
                        <i class="fas fa-cog"></i> Cài đặt bảo mật
                    </button>
                </div>
            </div>

            <div class="main-content">
                <div class="content-header">
                    <h2 class="content-title">Thông Tin Cá Nhân</h2>
                    <button class="edit-toggle" onclick="toggleEdit()">
                        <i class="fas fa-edit"></i>
                        <span id="edit-text">Chỉnh sửa</span>
                    </button>
                </div>

                <form id="profile-form">
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label" for="fullName">
                                <i class="fas fa-user"></i> Họ và tên
                            </label>
                            <div class="input-group">
                                <input type="text" id="fullName" name="fullName" class="form-input" value="Nguyễn Văn An" disabled>
                                <i class="input-icon fas fa-user"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="email">
                                <i class="fas fa-envelope"></i> Email
                            </label>
                            <div class="input-group">
                                <input type="email" id="email" name="email" class="form-input" value="nguyenvanan@email.com" disabled>
                                <i class="input-icon fas fa-envelope"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="phone">
                                <i class="fas fa-phone"></i> Số điện thoại
                            </label>
                            <div class="input-group">
                                <input type="tel" id="phone" name="phone" class="form-input" value="0123456789" disabled>
                                <i class="input-icon fas fa-phone"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="birthDate">
                                <i class="fas fa-calendar"></i> Ngày sinh
                            </label>
                            <div class="input-group">
                                <input type="date" id="birthDate" name="birthDate" class="form-input" value="1990-01-01" disabled>
                                <i class="input-icon fas fa-calendar"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="gender">
                                <i class="fas fa-venus-mars"></i> Giới tính
                            </label>
                            <div class="input-group">
                                <select id="gender" name="gender" class="form-input" disabled>
                                    <option value="male" selected>Nam</option>
                                    <option value="female">Nữ</option>
                                    <option value="other">Khác</option>
                                </select>
                                <i class="input-icon fas fa-chevron-down"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="address">
                                <i class="fas fa-map-marker-alt"></i> Địa chỉ
                            </label>
                            <div class="input-group">
                                <input type="text" id="address" name="address" class="form-input" value="123 Đường ABC, TP.DN" disabled>
                                <i class="input-icon fas fa-map-marker-alt"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="bankAccount">
                                <i class="fas fa-university"></i> Số tài khoản
                            </label>
                            <div class="input-group">
                                <input type="text" id="bankAccount" name="bankAccount" class="form-input" value="1234567890" disabled>
                                <i class="input-icon fas fa-university"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label" for="bankName">
                                <i class="fas fa-building"></i> Tên ngân hàng
                            </label>
                            <div class="input-group">
                                <input type="text" id="bankName" name="bankName" class="form-input" value="Ngân hàng Techcombank" disabled>
                                <i class="input-icon fas fa-building"></i>
                            </div>
                        </div>

                        
                    </div>

                    <div class="form-actions hidden" id="form-actions">
                        <button type="button" class="btn btn-cancel" onclick="cancelEdit()">
                            <i class="fas fa-times"></i> Hủy
                        </button>
                        <button type="button" class="btn btn-delete" onclick="showDeleteConfirm()">
                            <i class="fas fa-trash"></i> Xóa tài khoản
                        </button>
                        <button type="submit" class="btn btn-save">
                            <i class="fas fa-save"></i> Lưu thay đổi
                        </button>
                    </div>
                </form>

                <div class="additional-info">
                    <div class="info-section">
                        <h3 class="info-title">
                            <i class="fas fa-info-circle"></i>
                            Thông tin bổ sung
                        </h3>
                        <div class="info-grid">
                            <div class="info-card">
                                <div class="info-card-title">Ngày tham gia</div>
                                <div class="info-card-value">15 tháng 3, 2023</div>
                            </div>
                            <div class="info-card">
                                <div class="info-card-title">Điểm tích lũy</div>
                                <div class="info-card-value">2,450 điểm</div>
                            </div>
                            <div class="info-card">
                                <div class="info-card-title">Cấp độ thành viên</div>
                                <div class="info-card-value">Vàng</div>
                            </div>
                            <div class="info-card">
                                <div class="info-card-title">Lần cuối truy cập</div>
                                <div class="info-card-value">Hôm nay, 14:30</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="notification" id="notification">
        <i class="fas fa-check-circle"></i>
        <span id="notification-text">Cập nhật thành công!</span>
    </div>

    <script>
        let isEditing = false;

        function toggleEdit() {
            isEditing = !isEditing;
            const inputs = document.querySelectorAll('.form-input');
            const editButton = document.querySelector('.edit-toggle');
            const editText = document.getElementById('edit-text');
            const formActions = document.getElementById('form-actions');

            if (isEditing) {
                inputs.forEach(input => {
                    input.disabled = false;
                });
                editText.textContent = 'Hủy chỉnh sửa';
                editButton.innerHTML = '<i class="fas fa-times"></i> <span id="edit-text">Hủy chỉnh sửa</span>';
                formActions.classList.remove('hidden');
            } else {
                inputs.forEach(input => {
                    input.disabled = true;
                });
                editText.textContent = 'Chỉnh sửa';
                editButton.innerHTML = '<i class="fas fa-edit"></i> <span id="edit-text">Chỉnh sửa</span>';
                formActions.classList.add('hidden');
            }
        }

        function cancelEdit() {
            // Reset form values to original
            document.getElementById('fullName').value = 'Nguyễn Văn An';
            document.getElementById('email').value = 'nguyenvanan@email.com';
            document.getElementById('phone').value = '0123456789';
            document.getElementById('birthDate').value = '1990-01-01';
            document.getElementById('gender').value = 'male';
            document.getElementById('address').value = '123 Đường ABC, Quận 1, TP.HCM';
            document.getElementById('bankAccount').value = '1234567890';
            document.getElementById('bankName').value = 'Ngân hàng Techcombank';
            document.getElementById('bankBranch').value = 'Chi nhánh TP.HCM';
            
            toggleEdit();
        }

        function showDeleteConfirm() {
            if (confirm('Bạn có chắc chắn muốn xóa tài khoản? Hành động này không thể hoàn tác!')) {
                showNotification('Tài khoản đã được xóa!', 'error');
                // Redirect or perform delete action here
            }
        }

        function showNotification(message, type = 'success') {
            const notification = document.getElementById('notification');
            const notificationText = document.getElementById('notification-text');
            
            notificationText.textContent = message;
            
            if (type === 'error') {
                notification.style.background = '#ef4444';
            } else {
                notification.style.background = '#1AB394';
            }
            
            notification.classList.add('show');
            
            setTimeout(() => {
                notification.classList.remove('show');
            }, 3000);
        }

        function updateSidebarName(name) {
            const sidebarName = document.getElementById('sidebar-name');
            const avatarText = document.getElementById('avatar-text');
            
            sidebarName.textContent = name;
            
            // Update avatar initials
            const initials = name.split(' ').map(word => word[0]).join('').toUpperCase().slice(0, 2);
            avatarText.textContent = initials;
        }

        // Form submission handler
        document.getElementById('profile-form').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const name = formData.get('fullName');
            
            // Update sidebar name
            updateSidebarName(name);
            
            // Show success notification
            showNotification('Thông tin đã được cập nhật thành công!');
            
            // Exit edit mode
            toggleEdit();
        });

        // Avatar upload handler
        document.getElementById('avatar-upload').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const avatar = document.querySelector('.profile-avatar');
                    avatar.style.backgroundImage = `url(${e.target.result})`;
                    avatar.style.backgroundSize = 'cover';
                    avatar.style.backgroundPosition = 'center';
                    avatar.querySelector('span').style.display = 'none';
                };
                reader.readAsDataURL(file);
                showNotification('Ảnh đại diện đã được cập nhật!');
            }
        });

        // Real-time name update in sidebar
        document.getElementById('fullName').addEventListener('input', function(e) {
            if (isEditing && e.target.value.trim()) {
                updateSidebarName(e.target.value);
            }
        });

        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            updateSidebarName('Nguyễn Văn An');
        });
    </script>
</body>
</html>