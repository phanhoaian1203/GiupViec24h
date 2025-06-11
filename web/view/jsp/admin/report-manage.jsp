<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo Cáo Hệ Thống - Giúp Việc 24H</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
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

        .stat-card.total-services .icon {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
        }

        .stat-card.active-customers .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.worker-performance .icon {
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

        .chart-container {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .chart-container h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .report-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .report-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .report-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .report-table th, .report-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .report-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .report-table td {
            color: #64748b;
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

        .filter-section {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .filter-section select, .filter-section input {
            padding: 0.5rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            color: #64748b;
            font-size: 0.875rem;
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
            .report-table th, .report-table td {
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
                    <span>Báo Cáo Hệ Thống</span>
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
                    <h1>Báo Cáo Hệ Thống</h1>
                    <p>Tổng hợp và phân tích dữ liệu hoạt động của hệ thống tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card total-services">
                        <div class="icon">
                            <i class="fas fa-briefcase"></i>
                        </div>
                        <h3>320</h3>
                        <p>Tổng Số Dịch Vụ</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +12% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card active-customers">
                        <div class="icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3>180</h3>
                        <p>Khách Hàng Hoạt Động</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +8% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card worker-performance">
                        <div class="icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h3>4.5</h3>
                        <p>Đánh Giá Trung Bình</p>
                        <div class="trend down">
                            <i class="fas fa-arrow-down"></i>
                            -0.2 so với tháng trước
                        </div>
                    </div>
                </div>

                <div class="chart-container">
                    <h3>Dịch Vụ Theo Tháng</h3>
                    <div class="filter-section">
                        <select id="yearFilter">
                            <option value="2025">2025</option>
                            <option value="2024">2024</option>
                            <option value="2023">2023</option>
                        </select>
                        <select id="reportType">
                            <option value="services">Số Lượng Dịch Vụ</option>
                            <option value="customers">Khách Hàng Mới</option>
                            <option value="ratings">Đánh Giá</option>
                        </select>
                    </div>
                    <canvas id="reportChart"></canvas>
                </div>

                <div class="report-table">
                    <h3>Chi Tiết Báo Cáo</h3>
                    <div class="filter-section">
                        <select id="statusFilter">
                            <option value="all">Tất cả dịch vụ</option>
                            <option value="completed">Hoàn thành</option>
                            <option value="pending">Đang thực hiện</option>
                            <option value="cancelled">Đã hủy</option>
                        </select>
                        <input type="month" id="monthFilter" value="2025-06">
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã Dịch Vụ</th>
                                <th>Khách Hàng</th>
                                <th>Người Giúp Việc</th>
                                <th>Ngày Thực Hiện</th>
                                <th>Đánh Giá</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>DV001</td>
                                <td>Nguyễn Văn A</td>
                                <td>Trần Thị B</td>
                                <td>01/06/2025</td>
                                <td>4.8</td>
                                <td><span class="status completed">Hoàn thành</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewReport('DV001')"><i class="fas fa-eye"></i> Xem</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DV002</td>
                                <td>Lê Thị C</td>
                                <td>Phạm Văn D</td>
                                <td>02/06/2025</td>
                                <td>-</td>
                                <td><span class="status pending">Đang thực hiện</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewReport('DV002')"><i class="fas fa-eye"></i> Xem</button>
                                </td>
                            </tr>
                            <tr>
                                <td>DV003</td>
                                <td>Trần Văn E</td>
                                <td>Nguyễn Thị F</td>
                                <td>03/06/2025</td>
                                <td>-</td>
                                <td><span class="status cancelled">Đã hủy</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewReport('DV003')"><i class="fas fa-eye"></i> Xem</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Chart.js configuration
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('reportChart').getContext('2d');
            const reportChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Th1', 'Th2', 'Th3', 'Th4', 'Th5', 'Th6', 'Th7', 'Th8', 'Th9', 'Th10', 'Th11', 'Th12'],
                    datasets: [{
                        label: 'Số Lượng Dịch Vụ',
                        data: [25, 30, 28, 35, 40, 45, 50, 48, 55, 60, 65, 70],
                        backgroundColor: 'rgba(26, 179, 148, 0.5)',
                        borderColor: '#1AB394',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    return context.parsed.y + ' dịch vụ';
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Số Lượng'
                            }
                        }
                    }
                }
            });

            // Filter handling
            document.getElementById('yearFilter').addEventListener('change', function() {
                console.log('Filter by year: ' + this.value);
                // Update chart data based on year
            });

            document.getElementById('reportType').addEventListener('change', function() {
                console.log('Report type: ' + this.value);
                // Update chart data based on report type
                const newLabel = this.value === 'services' ? 'Số Lượng Dịch Vụ' : 
                                this.value === 'customers' ? 'Khách Hàng Mới' : 'Điểm Đánh Giá';
                reportChart.data.datasets[0].label = newLabel;
                reportChart.update();
            });

            document.getElementById('statusFilter').addEventListener('change', function() {
                console.log('Filter by status: ' + this.value);
                // Update table data based on status
            });

            document.getElementById('monthFilter').addEventListener('change', function() {
                console.log('Filter by month: ' + this.value);
                // Update table data based on month
            });

            // Action handler
            function viewReport(id) {
                alert(`Xem chi tiết báo cáo ${id}`);
                // Implement view report details logic
            }

            // Animate numbers
            function animateNumbers() {
                const numbers = document.querySelectorAll('.stat-card h3');
                numbers.forEach(num => {
                    const target = parseFloat(num.textContent.replace(/[^\d.]/g, ''));
                    if (!isNaN(target)) {
                        let current = 0;
                        const increment = target / 50;
                        const timer = setInterval(() => {
                            current += increment;
                            if (current >= target) {
                                current = target;
                                clearInterval(timer);
                            }
                            num.textContent = current.toFixed(1).toLocaleString('vi-VN');
                        }, 30);
                    }
                });
            }

            setTimeout(animateNumbers, 500);

            // Stat cards animation
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
    </script>
</body>
</html>