<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê Doanh Thu - Giúp Việc 24H</title>
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

        .stat-card.total-revenue .icon {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
        }

        .stat-card.monthly-revenue .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.average-revenue .icon {
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

        .revenue-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .revenue-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .revenue-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .revenue-table th, .revenue-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .revenue-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .revenue-table td {
            color: #64748b;
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
            .revenue-table th, .revenue-table td {
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
            <jsp:include page="/view/common/admin/admin-header.jsp">
                <jsp:param name="breadcrumbParent" value="Trang Chủ"/>
                <jsp:param name="breadcrumbCurrent" value="Thống Kê Doanh Thu"/>
            </jsp:include>

            <div class="content">
                <div class="page-title">
                    <h1>Thống Kê Doanh Thu</h1>
                    <p>Phân tích doanh thu và hiệu suất kinh doanh của hệ thống tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card total-revenue">
                        <div class="icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <h3>2,450,000,000</h3>
                        <p>Tổng Doanh Thu</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +15% so với năm trước
                        </div>
                    </div>

                    <div class="stat-card monthly-revenue">
                        <div class="icon">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3>250,000,000</h3>
                        <p>Doanh Thu Tháng Này</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +8% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card average-revenue">
                        <div class="icon">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <h3>5,000,000</h3>
                        <p>Doanh Thu Trung Bình/Hợp Đồng</p>
                        <div class="trend down">
                            <i class="fas fa-arrow-down"></i>
                            -2% so với tháng trước
                        </div>
                    </div>
                </div>

                <div class="chart-container">
                    <h3>Doanh Thu Theo Tháng</h3>
                    <div class="filter-section">
                        <select id="yearFilter">
                            <option value="2025">2025</option>
                            <option value="2024">2024</option>
                            <option value="2023">2023</option>
                        </select>
                        <input type="month" id="monthFilter" value="2025-06">
                    </div>
                    <canvas id="revenueChart"></canvas>
                </div>

                <div class="revenue-table">
                    <h3>Chi Tiết Doanh Thu</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã Hợp Đồng</th>
                                <th>Khách Hàng</th>
                                <th>Người Giúp Việc</th>
                                <th>Ngày Thanh Toán</th>
                                <th>Số Tiền (VND)</th>
                                <th>Trạng Thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>HD001</td>
                                <td>Nguyễn Văn A</td>
                                <td>Trần Thị B</td>
                                <td>01/06/2025</td>
                                <td>5,000,000</td>
                                <td><span class="status active">Đã thanh toán</span></td>
                            </tr>
                            <tr>
                                <td>HD002</td>
                                <td>Lê Thị C</td>
                                <td>Phạm Văn D</td>
                                <td>02/06/2025</td>
                                <td>4,500,000</td>
                                <td><span class="status active">Đã thanh toán</span></td>
                            </tr>
                            <tr>
                                <td>HD003</td>
                                <td>Trần Văn E</td>
                                <td>Nguyễn Thị F</td>
                                <td>03/06/2025</td>
                                <td>6,000,000</td>
                                <td><span class="status inactive">Chưa thanh toán</span></td>
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
            const ctx = document.getElementById('revenueChart').getContext('2d');
            const revenueChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Th1', 'Th2', 'Th3', 'Th4', 'Th5', 'Th6', 'Th7', 'Th8', 'Th9', 'Th10', 'Th11', 'Th12'],
                    datasets: [{
                        label: 'Doanh Thu (triệu VND)',
                        data: [200, 220, 210, 230, 240, 250, 260, 270, 280, 290, 300, 310],
                        borderColor: '#1AB394',
                        backgroundColor: 'rgba(26, 179, 148, 0.1)',
                        fill: true,
                        tension: 0.4
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
                                    return context.parsed.y + ' triệu VND';
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Doanh Thu (triệu VND)'
                            }
                        }
                    }
                }
            });

            // Filter handling
            document.getElementById('yearFilter').addEventListener('change', function() {
                console.log('Filter by year: ' + this.value);
                // Update chart data based on year (implement with actual backend call)
            });

            document.getElementById('monthFilter').addEventListener('change', function() {
                console.log('Filter by month: ' + this.value);
                // Update chart data based on month (implement with actual backend call)
            });

            // Animate numbers
            function animateNumbers() {
                const numbers = document.querySelectorAll('.stat-card h3');
                numbers.forEach(num => {
                    const target = parseInt(num.textContent.replace(/[^\d]/g, ''));
                    if (!isNaN(target)) {
                        let current = 0;
                        const increment = target / 50;
                        const timer = setInterval(() => {
                            current += increment;
                            if (current >= target) {
                                current = target;
                                clearInterval(timer);
                            }
                            num.textContent = Math.floor(current).toLocaleString('vi-VN');
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