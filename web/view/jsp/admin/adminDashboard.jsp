<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Điều Khiển Admin - Giúp Việc 24H</title>
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

        .stat-card.workers .icon {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
        }

        .stat-card.orders .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.revenue .icon {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .stat-card.customers .icon {
            background: rgba(139, 92, 246, 0.1);
            color: #8b5cf6;
        }

        .stat-card.staff .icon {
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

        .charts-section {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .chart-card {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
        }

        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .chart-header h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
        }

        .chart-controls {
            display: flex;
            gap: 0.5rem;
        }

        .chart-controls button {
            padding: 0.5rem 1rem;
            border: 1px solid #e2e8f0;
            background: white;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .chart-controls button.active {
            background: #1AB394;
            color: white;
            border-color: #1AB394;
        }

        .chart-controls button:hover:not(.active) {
            background: #f8fafc;
            border-color: #1AB394;
        }

        .chart-placeholder {
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

        .recent-activities {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid #f1f5f9;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-size: 0.875rem;
        }

        .activity-icon.new-order {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .activity-icon.new-worker {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
        }

        .activity-icon.payment {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .activity-content {
            flex: 1;
        }

        .activity-content h4 {
            font-size: 0.875rem;
            font-weight: 600;
            color: #1a202c;
            margin-bottom: 0.25rem;
        }

        .activity-content p {
            font-size: 0.75rem;
            color: #64748b;
        }

        .activity-time {
            font-size: 0.75rem;
            color: #94a3b8;
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

        @media (max-width: 1024px) {
            .charts-section {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            
            .content {
                padding: 1rem;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
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
            <jsp:include page="/view/common/admin/admin-header.jsp">
                <jsp:param name="breadcrumbParent" value="Trang Chủ"/>
                <jsp:param name="breadcrumbCurrent" value="Bảng Điều Khiển"/>
            </jsp:include>
            <div class="content">
                <div class="page-title">
                    <h1>Bảng Điều Khiển</h1>
                    <p>Tổng quan hoạt động hệ thống thuê người giúp việc tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card workers">
                        <div class="icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3>187</h3>
                        <p>Người Giúp Việc Hoạt Động</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +12% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card orders">
                        <div class="icon">
                            <i class="fas fa-clipboard-list"></i>
                        </div>
                        <h3>342</h3>
                        <p>Lượt Thuê Hôm Nay</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +8% so với hôm qua
                        </div>
                    </div>

                    <div class="stat-card revenue">
                        <div class="icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <h3>45.2M</h3>
                        <p>Doanh Thu Tháng (VNĐ)</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +15% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card customers">
                        <div class="icon">
                            <i class="fas fa-user-friends"></i>
                        </div>
                        <h3>1,248</h3>
                        <p>Tổng Khách Hàng</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +23 khách hàng mới
                        </div>
                    </div>

                    <div class="stat-card staff">
                        <div class="icon">
                            <i class="fas fa-user-tie"></i>
                        </div>
                        <h3>25</h3>
                        <p>Nhân Viên Quản Lý</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +2 nhân viên mới
                        </div>
                    </div>
                </div>

                <div class="charts-section">
                    <div class="chart-card">
                        <div class="chart-header">
                            <h3>Thống Kê Doanh Thu</h3>
                            <div class="chart-controls">
                                <button class="active">7 Ngày</button>
                                <button>30 Ngày</button>
                                <button>3 Tháng</button>
                                <button>1 Năm</button>
                            </div>
                        </div>
                        <div class="chart-placeholder">
                            📊 Biểu đồ doanh thu theo thời gian (Tích hợp Chart.js)
                        </div>
                    </div>

                    <div class="chart-card">
                        <div class="chart-header">
                            <h3>Hoạt Động Gần Đây</h3>
                        </div>
                        <div class="recent-activities">
                            <div class="activity-item">
                                <div class="activity-icon new-order">
                                    <i class="fas fa-shopping-cart"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Đơn hàng mới #DH2024001</h4>
                                    <p>Khách hàng: Nguyễn Thị Mai</p>
                                </div>
                                <div class="activity-time">5 phút trước</div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon new-worker">
                                    <i class="fas fa-user-plus"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Người giúp việc mới đăng ký</h4>
                                    <p>Trần Văn Hùng - Quận Hải Châu</p>
                                </div>
                                <div class="activity-time">12 phút trước</div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon payment">
                                    <i class="fas fa-credit-card"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Thanh toán thành công</h4>
                                    <p>Đơn hàng #DH2024000 - 450,000 VNĐ</p>
                                </div>
                                <div class="activity-time">25 phút trước</div>
                            </div>
                            
                            <div class="activity-item">
                                <div class="activity-icon new-order">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="activity-content">
                                    <h4>Đánh giá 5 sao</h4>
                                    <p>Khách hàng đánh giá dịch vụ</p>
                                </div>
                                <div class="activity-time">1 giờ trước</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="quick-actions">
                    <a href="#" class="action-btn">
                        <i class="fas fa-user-plus"></i>
                        <h4>Thêm Người Giúp Việc</h4>
                        <p>Đăng ký người giúp việc mới</p>
                    </a>
                    
                    <a href="#" class="action-btn">
                        <i class="fas fa-clipboard-list"></i>
                        <h4>Xem Lượt Thuê</h4>
                        <p>Quản lý tất cả đơn hàng</p>
                    </a>
                    
                    <a href="#" class="action-btn">
                        <i class="fas fa-chart-bar"></i>
                        <h4>Báo Cáo Chi Tiết</h4>
                        <p>Xem báo cáo doanh thu</p>
                    </a>
                    
                    <a href="#" class="action-btn">
                        <i class="fas fa-user-tie"></i>
                        <h4>Quản Lý Nhân Viên</h4>
                        <p>Thêm/sửa/xóa nhân viên</p>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.querySelectorAll('.chart-controls button').forEach(button => {
            button.addEventListener('click', function() {
                document.querySelectorAll('.chart-controls .active').forEach(btn => {
                    btn.classList.remove('active');
                });
                this.classList.add('active');
                console.log('Đang tải dữ liệu cho:', this.textContent);
            });
        });

        document.querySelectorAll('.sidebar ul li').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.sidebar ul li.active').forEach(li => {
                    li.classList.remove('active');
                });
                this.classList.add('active');
            });
        });

        function toggleSidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.classList.toggle('open');
        }

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
                        if (num.textContent.includes('M')) {
                            num.textContent = (current / 1000000).toFixed(1) + 'M';
                        } else {
                            num.textContent = Math.floor(current).toLocaleString();
                        }
                    }, 30);
                }
            });
        }

        setTimeout(animateNumbers, 500);
    </script>
</body>
</html>