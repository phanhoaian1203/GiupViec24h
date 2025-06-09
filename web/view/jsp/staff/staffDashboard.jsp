<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Điều Khiển Nhân Viên - Giúp Việc 24H</title>
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

        .sidebar {
            width: 280px;
            background: linear-gradient(180deg, #2d3748 0%, #1a202c 100%);
            color: white;
            padding: 0;
            position: fixed;
            height: 100%;
            box-shadow: 4px 0 20px rgba(0,0,0,0.1);
            z-index: 100;
        }

        .sidebar .logo {
            padding: 2rem 1.5rem;
            font-size: 1.4rem;
            font-weight: 800;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            background: rgba(26, 179, 148, 0.1);
        }

        .sidebar .logo i {
            color: #1AB394;
            margin-right: 0.5rem;
            font-size: 1.6rem;
        }

        .sidebar ul {
            list-style: none;
            padding: 1rem 0;
        }

        .sidebar ul li {
            margin: 0.25rem 1rem;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .sidebar ul li a {
            display: flex;
            align-items: center;
            padding: 1rem 1.5rem;
            color: #cbd5e0;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .sidebar ul li:hover {
            background: rgba(255,255,255,0.1);
            transform: translateX(5px);
        }

        .sidebar ul li.active {
            background: linear-gradient(135deg, #1AB394 0%, #16a085 100%);
            box-shadow: 0 4px 15px rgba(26, 179, 148, 0.3);
        }

        .sidebar ul li.active a {
            color: white;
        }

        .sidebar ul li i {
            margin-right: 1rem;
            width: 20px;
            text-align: center;
            font-size: 1.1rem;
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

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #1AB394 0%, #16a085 100%);
        }

        .stat-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }

        .stat-card .icon {
            width: 60px;
            height: 60px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .stat-card.contracts .icon {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
        }

        .stat-card.complaints .icon {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .stat-card.schedule .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.vouchers .icon {
            background: rgba(139, 92, 246, 0.1);
            color: #8b5cf6;
        }

        .stat-card.chats .icon {
            background: rgba(234, 88, 12, 0.1);
            color: #ea580c;
        }

        .stat-card h3 {
            font-size: 2.5rem;
            font-weight: 800;
            color: #1a202c;
            margin-bottom: 0.5rem;
        }

        .stat-card p {
            color: #64748b;
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .stat-card .trend {
            display: flex;
            align-items: center;
            font-size: 0.875rem;
            font-weight: 600;
        }

        .stat-card .trend.up {
            color: #10b981;
        }

        .stat-card .trend.down {
            color: #ef4444;
        }

        .stat-card .trend i {
            margin-right: 0.25rem;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 2rem;
        }

        .action-btn {
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            color: #64748b;
        }

        .action-btn:hover {
            border-color: #1AB394;
            background: rgba(26, 179, 148, 0.05);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(26, 179, 148, 0.2);
        }

        .action-btn i {
            font-size: 2rem;
            color: #1AB394;
            margin-bottom: 0.5rem;
        }

        .action-btn h4 {
            font-size: 0.875rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .action-btn p {
            font-size: 0.75rem;
            color: #94a3b8;
        }

        .chat-section {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-top: 2rem;
        }

        .chat-section h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .chat-placeholder {
            height: 300px;
            background: linear-gradient(135deg, rgba(26, 179, 148, 0.05) 0%, rgba(22, 160, 133, 0.05) 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #64748b;
            font-style: italic;
            border: 2px dashed rgba(26, 179, 148, 0.2);
        }

        @media (max-width: 1024px) {
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }
            .sidebar.open {
                transform: translateX(0);
            }
        }

        @media (max-width: 768px) {
            .content {
                padding: 1rem;
            }
            .page-title h1 {
                font-size: 1.5rem;
            }
            .quick-actions {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="logo">
                <i class="fas fa-home"></i>
                Giúp Việc 24H
            </div>
            <ul>
                <li class="active">
                    <a href="#dashboard">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Bảng Điều Khiển</span>
                    </a>
                </li>
                <li>
                    <a href="#contracts">
                        <i class="fas fa-file-contract"></i>
                        <span>Quản Lý Hợp Đồng</span>
                    </a>
                </li>
                <li>
                    <a href="#complaints">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Giải Quyết Khiếu Nại</span>
                    </a>
                </li>
                <li>
                    <a href="#schedule">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Quản Lí Lịch Thuê</span>
                    </a>
                </li>
                <li>
                    <a href="#vouchers">
                        <i class="fas fa-tags"></i>
                        <span>Quản Lý Voucher</span>
                    </a>
                </li>
                <li>
                    <a href="#chat">
                        <i class="fas fa-comments"></i>
                        <span>Chat Hỗ Trợ</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="main-content">
            <div class="header">
                <div class="breadcrumb">
                    <span>Trang Chủ</span>
                    <i class="fas fa-chevron-right"></i>
                    <span>Bảng Điều Khiển</span>
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
                        <div class="user-avatar">S</div>
                        <div>
                            <div style="font-weight: 600; font-size: 0.875rem; color: #1a202c;">Staff</div>
                            <div style="font-size: 0.75rem; color: #64748b;">Nhân viên hỗ trợ</div>
                        </div>
                        <i class="fas fa-chevron-down" style="color: #64748b; font-size: 0.75rem;"></i>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="page-title">
                    <h1>Bảng Điều Khiển Nhân Viên</h1>
                    <p>Tổng quan các công việc hỗ trợ tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card contracts">
                        <div class="icon">
                            <i class="fas fa-file-contract"></i>
                        </div>
                        <h3>150</h3>
                        <p>Hợp Đồng Đang Xử Lý</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +10 hợp đồng
                        </div>
                    </div>

                    <div class="stat-card complaints">
                        <div class="icon">
                            <i class="fas fa-exclamation-circle"></i>
                        </div>
                        <h3>12</h3>
                        <p>Khiếu Nại Chưa Xử Lý</p>
                        <div class="trend down">
                            <i class="fas fa-arrow-down"></i>
                            -2 khiếu nại
                        </div>
                    </div>

                    <div class="stat-card schedule">
                        <div class="icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <h3>25</h3>
                        <p>Yêu Cầu Đổi Lịch</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +5 yêu cầu
                        </div>
                    </div>

                    <div class="stat-card vouchers">
                        <div class="icon">
                            <i class="fas fa-tags"></i>
                        </div>
                        <h3>50</h3>
                        <p>Voucher Đang Hoạt Động</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +8 voucher
                        </div>
                    </div>

                    <div class="stat-card chats">
                        <div class="icon">
                            <i class="fas fa-comments"></i>
                        </div>
                        <h3>30</h3>
                        <p>Tin Nhắn Chưa Đọc</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +10 tin nhắn
                        </div>
                    </div>
                </div>

                <div class="quick-actions">
                    <a href="#contracts" class="action-btn">
                        <i class="fas fa-file-contract"></i>
                        <h4>Quản Lý Hợp Đồng</h4>
                        <p>Xem và xử lý hợp đồng</p>
                    </a>
                    <a href="#complaints" class="action-btn">
                        <i class="fas fa-exclamation-circle"></i>
                        <h4>Giải Quyết Khiếu Nại</h4>
                        <p>Xử lý khiếu nại từ khách hàng</p>
                    </a>
                    <a href="#schedule" class="action-btn">
                        <i class="fas fa-calendar-alt"></i>
                        <h4>Quản Lí Lịch Thuê</h4>
                        <p>Đổi lịch cho người giúp việc</p>
                    </a>
                    <a href="#vouchers" class="action-btn">
                        <i class="fas fa-tags"></i>
                        <h4>Quản Lý Voucher</h4>
                        <p>Thêm và kiểm tra voucher</p>
                    </a>
                    <a href="#chat" class="action-btn">
                        <i class="fas fa-comments"></i>
                        <h4>Chat Hỗ Trợ</h4>
                        <p>Chat với khách hàng và người giúp việc</p>
                    </a>
                </div>

                <div class="chat-section">
                    <h3>Chat Hỗ Trợ</h3>
                    <div class="chat-placeholder">
                        💬 Khu vực chat với khách hàng và người giúp việc (Tích hợp WebSocket)
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Xử lý navigation sidebar
        document.querySelectorAll('.sidebar ul li').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.sidebar ul li.active').forEach(li => {
                    li.classList.remove('active');
                });
                this.classList.add('active');
            });
        });

        // Responsive sidebar toggle (cho mobile)
        function toggleSidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.classList.toggle('open');
        }

        // Thêm animation cho stat cards khi load
        document.addEventListener('DOMContentLoaded', function() {
            const statCards = document.querySelectorAll('.stat-card');
            statCards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    card.style.transition = 'all 0.6s ease';
                    
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, 100);
                }, index * 150);
            });
        });

        // Hiệu ứng số đếm cho statistics
        function animateNumbers() {
            const numbers = document.querySelectorAll('.stat-card h3');
            numbers.forEach(num => {
                const target = parseInt(num.textContent.replace(/[^\d.]/g, ''));
                if (!isNaN(target)) {
                    let current = 0;
                    const increment = target / 50;
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= target) {
                            current = target;
                            clearInterval(timer);
                        }
                        num.textContent = Math.floor(current).toLocaleString();
                    }, 30);
                }
            });
        }

        setTimeout(animateNumbers, 500);
    </script>
</body>
</html>