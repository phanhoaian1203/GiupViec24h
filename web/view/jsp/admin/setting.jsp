<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cài Đặt Hệ Thống - Giúp Việc 24H</title>
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
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: #2d3748;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .main-content {
            margin-left: 280px;
            width: calc(100% - 280px);
            min-height: 100vh;
        }

        .header {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            border-bottom: 1px solid rgba(226, 232, 240, 0.8);
            position: sticky;
            top: 0;
            z-index: 50;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 20px rgba(0,0,0,0.08);
        }

        .header .breadcrumb {
            display: flex;
            align-items: center;
            color: #64748b;
            font-size: 0.9rem;
        }

        .header .breadcrumb i {
            margin: 0 0.5rem;
            color: #1AB394;
        }

        .header .user-section {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .notification-badge {
            position: relative;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 50%;
            background: rgba(26, 179, 148, 0.1);
            color: #1AB394;
            transition: all 0.3s ease;
        }

        .notification-badge:hover {
            background: rgba(26, 179, 148, 0.2);
            transform: scale(1.1);
        }

        .notification-badge .badge {
            position: absolute;
            top: 0;
            right: 0;
            background: #ef4444;
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid white;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            cursor: pointer;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            transition: all 0.3s ease;
        }

        .user-profile:hover {
            background: rgba(26, 179, 148, 0.1);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1AB394 0%, #16a085 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }

        .content {
            padding: 2rem;
        }

        .page-title {
            margin-bottom: 2rem;
        }

        .page-title h1 {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }

        .page-title p {
            color: #64748b;
            font-size: 1rem;
        }

        .settings-section {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .settings-section h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            color: #64748b;
            font-size: 0.875rem;
        }

        .toggle-switch {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .toggle-switch input {
            display: none;
        }

        .toggle-switch label {
            position: relative;
            display: inline-block;
            width: 48px;
            height: 24px;
            background: #e2e8f0;
            border-radius: 12px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .toggle-switch label::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            background: white;
            border-radius: 50%;
            top: 2px;
            left: 2px;
            transition: transform 0.3s ease;
        }

        .toggle-switch input:checked + label {
            background: #1AB394;
        }

        .toggle-switch input:checked + label::after {
            transform: translateX(24px);
        }

        .save-btn {
            background: #1AB394;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .save-btn:hover {
            background: #16a085;
            transform: translateY(-2px);
        }

        .admin-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .admin-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .admin-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .admin-table th, .admin-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .admin-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .admin-table td {
            color: #64748b;
        }

        .admin-table .status {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .admin-table .status.active {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .admin-table .status.inactive {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
        }

        .action-btn {
            background: none;
            border: none;
            color: #1AB394;
            cursor: pointer;
            font-size: 0.875rem;
            padding: 0.25rem 0.75rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            background: rgba(26, 179, 148, 0.1);
        }

        @media (max-width: 1024px) {
            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .content {
                padding: 1rem;
            }
            .admin-table th, .admin-table td {
                padding: 0.75rem;
                font-size: 0.875rem;
            }
            .page-title h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="/view/common/admin/admin-sidebar.jsp" %>
        <div class="main-content">
            <div class="header">
                <div class="breadcrumb">
                    <span>Trang Chủ</span>
                    <i class="fas fa-chevron-right"></i>
                    <span>Cài Đặt Hệ Thống</span>
                </div>
                <div class="user-section">
                    <div class="notification-badge">
                        <i class="fas fa-bell"></i>
                        <span class="badge">5</span>
                    </div>
                    <div class="notification-badge">
                        <i class="fas fa-envelope"></i>
                        <span class="badge">12</span>
                    </div>
                    <div class="user-profile">
                        <div class="user-avatar">A</div>
                        <div>
                            <div style="font-weight: 600; font-size: 0.875rem; color: #1a202c;">Admin</div>
                            <div style="font-size: 0.75rem; color: #64748b;">Quản trị viên</div>
                        </div>
                        <i class="fas fa-chevron-down" style="color: #64748b; font-size: 0.75rem;"></i>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="page-title">
                    <h1>Cài Đặt Hệ Thống</h1>
                    <p>Quản lý cấu hình hệ thống và tài khoản quản trị tại Đà Nẵng</p>
                </div>

                <div class="settings-section">
                    <h3>Cài Đặt Chung</h3>
                    <div class="form-group">
                        <label for="siteName">Tên Trang Web</label>
                        <input type="text" id="siteName" value="Giúp Việc 24H" placeholder="Nhập tên trang web">
                    </div>
                    <div class="form-group">
                        <label for="currency">Đơn Vị Tiền Tệ</label>
                        <select id="currency">
                            <option value="VND">VND (Việt Nam Đồng)</option>
                            <option value="USD">USD (Đô La Mỹ)</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="maxBookings">Số Lượng Đặt Lịch Tối Đa/Ngày</label>
                        <input type="number" id="maxBookings" value="50" min="1">
                    </div>
                    <button class="save-btn" onclick="saveGeneralSettings()">Lưu Cài Đặt</button>
                </div>

                <div class="settings-section">
                    <h3>Cài Đặt Thông Báo</h3>
                    <div class="form-group toggle-switch">
                        <span>Gửi thông báo đặt lịch mới qua email</span>
                        <input type="checkbox" id="emailNotifications" checked>
                        <label for="emailNotifications"></label>
                    </div>
                    <div class="form-group toggle-switch">
                        <span>Gửi thông báo thanh toán qua SMS</span>
                        <input type="checkbox" id="smsNotifications">
                        <label for="smsNotifications"></label>
                    </div>
                    <div class="form-group">
                        <label for="notificationEmail">Email Nhận Thông Báo</label>
                        <input type="email" id="notificationEmail" value="admin@giupviec24h.com" placeholder="Nhập email">
                    </div>
                    <button class="save-btn" onclick="saveNotificationSettings()">Lưu Cài Đặt</button>
                </div>

                <div class="admin-table">
                    <h3>Quản Lý Quản Trị Viên</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Họ và Tên</th>
                                <th>Email</th>
                                <th>Vai Trò</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nguyễn Văn A</td>
                                <td>admin1@giupviec24h.com</td>
                                <td>Quản trị viên</td>
                                <td><span class="status active">Hoạt động</span></td>
                                <td>
                                    <button class="action-btn" onclick="editAdmin('admin1')"><i class="fas fa-edit"></i> Sửa</button>
                                    <button class="action-btn" onclick="deleteAdmin('admin1')"><i class="fas fa-trash"></i> Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Lê Thị B</td>
                                <td>admin2@giupviec24h.com</td>
                                <td>Quản trị viên</td>
                                <td><span class="status active">Hoạt động</span></td>
                                <td>
                                    <button class="action-btn" onclick="editAdmin('admin2')"><i class="fas fa-edit"></i> Sửa</button>
                                    <button class="action-btn" onclick="deleteAdmin('admin2')"><i class="fas fa-trash"></i> Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Trần Văn C</td>
                                <td>admin3@giupviec24h.com</td>
                                <td>Quản trị viên</td>
                                <td><span class="status inactive">Ngưng hoạt động</span></td>
                                <td>
                                    <button class="action-btn" onclick="editAdmin('admin3')"><i class="fas fa-edit"></i> Sửa</button>
                                    <button class="action-btn" onclick="deleteAdmin('admin3')"><i class="fas fa-trash"></i> Xóa</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button class="save-btn" style="margin-top: 1rem;" onclick="addAdmin()">Thêm Quản Trị Viên</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Action handlers
        function saveGeneralSettings() {
            alert('Đã lưu cài đặt chung!');
            // Implement save general settings logic
        }

        function saveNotificationSettings() {
            alert('Đã lưu cài đặt thông báo!');
            // Implement save notification settings logic
        }

        function addAdmin() {
            alert('Chuyển đến trang thêm quản trị viên');
            // Implement add admin logic
        }

        function editAdmin(id) {
            alert(`Sửa thông tin quản trị viên ${id}`);
            // Implement edit admin logic
        }

        function deleteAdmin(id) {
            if (confirm(`Bạn có chắc muốn xóa quản trị viên ${id}?`)) {
                alert(`Đã xóa quản trị viên ${id} thành công!`);
                // Implement delete admin logic
            }
        }

        // Animation for settings section
        document.addEventListener('DOMContentLoaded', function() {
            const settingsSections = document.querySelectorAll('.settings-section, .admin-table');
            settingsSections.forEach((section, index) => {
                setTimeout(() => {
                    section.style.opacity = '0';
                    section.style.transform = 'translateY(20px)';
                    section.style.transition = 'all 0.6s ease';
                    setTimeout(() => {
                        section.style.opacity = '1';
                        section.style.transform = 'translateY(0)';
                    }, 100);
                }, index * 150);
            });
        });
    </script>
</body>
</html>