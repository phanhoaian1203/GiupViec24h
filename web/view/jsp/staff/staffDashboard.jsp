<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Điều Khiển Nhân Viên - Giúp Việc 24H</title>
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
        <%@ include file="/view/common/staff/staff-sidebar.jsp" %>
        <div class="main-content">
            <%@ include file="/view/common/staff/staff-header.jsp" %>
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
                    <a href="staff-contracts.jsp" class="action-btn">
                        <i class="fas fa-file-contract"></i>
                        <h4>Quản Lý Hợp Đồng</h4>
                        <p>Xem và xử lý hợp đồng</p>
                    </a>
                    <a href="staff-complaints.jsp" class="action-btn">
                        <i class="fas fa-exclamation-circle"></i>
                        <h4>Giải Quyết Khiếu Nại</h4>
                        <p>Xử lý khiếu nại từ khách hàng</p>
                    </a>
                    <a href="staff-schedule.jsp" class="action-btn">
                        <i class="fas fa-calendar-alt"></i>
                        <h4>Quản Lí Lịch Thuê</h4>
                        <p>Đổi lịch cho người giúp việc</p>
                    </a>
                    <a href="staff-vouchers.jsp" class="action-btn">
                        <i class="fas fa-tags"></i>
                        <h4>Quản Lý Voucher</h4>
                        <p>Thêm và kiểm tra voucher</p>
                    </a>
                    <a href="staff-chat.jsp" class="action-btn">
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