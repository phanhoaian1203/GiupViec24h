<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Thanh Toán - Giúp Việc 24H</title>
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

        .stat-card.completed-payments .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.pending-payments .icon {
            background: rgba(234, 88, 12, 0.1);
            color: #ea580c;
        }

        .stat-card.wallet-payments .icon {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
        }

        .stat-card.online-payments .icon {
            background: rgba(139, 92, 246, 0.1);
            color: #8b5cf6;
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

        .payment-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .payment-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .payment-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .payment-table th, .payment-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .payment-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .payment-table td {
            color: #64748b;
        }

        .payment-table .status {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .payment-table .status.completed {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .payment-table .status.pending {
            background: rgba(234, 88, 12, 0.1);
            color: #ea580c;
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
            .payment-table th, .payment-table td {
                padding: 0.75rem;
                font-size: 0.875rem;
            }
            .page-title h1 {
                font-size: 1.5rem;
            }
            .stats-grid {
                grid-template-columns: 1fr;
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
                <jsp:param name="breadcrumbCurrent" value="Quản Lí Thanh Toán"/>
            </jsp:include>

            <div class="content">
                <div class="page-title">
                    <h1>Quản Lý Thanh Toán</h1>
                    <p>Quản lý các giao dịch thanh toán trước của khách hàng tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card completed-payments">
                        <div class="icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h3>150</h3>
                        <p>Thanh Toán Hoàn Tất</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +10% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card pending-payments">
                        <div class="icon">
                            <i class="fas fa-hourglass-half"></i>
                        </div>
                        <h3>25</h3>
                        <p>Thanh Toán Chờ Xử Lý</p>
                        <div class="trend down">
                            <i class="fas fa-arrow-down"></i>
                            -5% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card wallet-payments">
                        <div class="icon">
                            <i class="fas fa-wallet"></i>
                        </div>
                        <h3>45,000,000</h3>
                        <p>Giao Dịch Qua Ví</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +15% so với tháng trước
                        </div>
                    </div>

                    <div class="stat-card online-payments">
                        <div class="icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <h3>60,000,000</h3>
                        <p>Giao Dịch Online</p>
                        <div class="trend down">
                            <i class="fas fa-arrow-down"></i>
                            -8% so với tháng trước
                        </div>
                    </div>
                </div>

                <div class="payment-table">
                    <h3>Danh Sách Thanh Toán</h3>
                    <div class="filter-section">
                        <select id="statusFilter">
                            <option value="all">Tất cả trạng thái</option>
                            <option value="completed">Hoàn tất</option>
                            <option value="pending">Chờ xử lý</option>
                        </select>
                        <select id="methodFilter">
                            <option value="all">Tất cả phương thức</option>
                            <option value="wallet">Ví điện tử</option>
                            <option value="online">Thanh toán online</option>
                        </select>
                        <input type="month" id="monthFilter" value="2025-06">
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã Giao Dịch</th>
                                <th>Khách Hàng</th>
                                <th>Số Tiền (VND)</th>
                                <th>Ngày Thanh Toán</th>
                                <th>Phương Thức</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>TT001</td>
                                <td>Nguyễn Văn A</td>
                                <td>5,000,000</td>
                                <td>01/06/2025</td>
                                <td>Ví điện tử</td>
                                <td><span class="status completed">Hoàn tất</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewPayment('TT001')"><i class="fas fa-eye"></i> Xem</button>
                                </td>
                            </tr>
                            <tr>
                                <td>TT002</td>
                                <td>Lê Thị B</td>
                                <td>4,500,000</td>
                                <td>02/06/2025</td>
                                <td>Thanh toán online</td>
                                <td><span class="status pending">Chờ xử lý</span></td>
                                <td>
                                    <button class="action-btn" onclick="approvePayment('TT002')"><i class="fas fa-check"></i> Duyệt</button>
                                    <button class="action-btn" onclick="rejectPayment('TT002')"><i class="fas fa-times"></i> Hoàn tiền</button>
                                </td>
                            </tr>
                            <tr>
                                <td>TT003</td>
                                <td>Trần Văn C</td>
                                <td>6,000,000</td>
                                <td>03/06/2025</td>
                                <td>Ví điện tử</td>
                                <td><span class="status completed">Hoàn tất</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewPayment('TT003')"><i class="fas fa-eye"></i> Xem</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Action handlers
        function viewPayment(id) {
            alert(`Xem chi tiết giao dịch ${id}`);
            // Implement view payment details logic
        }

        function approvePayment(id) {
            if (confirm(`Bạn có chắc muốn duyệt giao dịch ${id}?`)) {
                alert(`Đã duyệt giao dịch ${id} thành công!`);
                // Implement approve payment logic
                // Update wallet balance or payment status in backend
            }
        }

        function rejectPayment(id) {
            if (confirm(`Bạn có chắc muốn hoàn tiền giao dịch ${id}?`)) {
                alert(`Đã hoàn tiền giao dịch ${id}!`);
                // Implement refund logic
                // Refund to wallet or online payment gateway
            }
        }

        // Filter handling
        document.getElementById('statusFilter').addEventListener('change', function() {
            console.log('Filter by status: ' + this.value);
            filterTable();
        });

        document.getElementById('methodFilter').addEventListener('change', function() {
            console.log('Filter by method: ' + this.value);
            filterTable();
        });

        document.getElementById('monthFilter').addEventListener('change', function() {
            console.log('Filter by month: ' + this.value);
            filterTable();
        });

        function filterTable() {
            const statusFilter = document.getElementById('statusFilter').value;
            const methodFilter = document.getElementById('methodFilter').value;
            const monthFilter = document.getElementById('monthFilter').value;
            const rows = document.querySelectorAll('.payment-table tbody tr');

            rows.forEach(row => {
                const status = row.querySelector('.status').textContent.toLowerCase();
                const method = row.cells[4].textContent.toLowerCase();
                const date = row.cells[3].textContent;
                const month = date.split('/').slice(1).join('-');

                const statusMatch = statusFilter === 'all' || (statusFilter === 'completed' && status.includes('hoàn tất')) || (statusFilter === 'pending' && status.includes('chờ xử lý'));
                const methodMatch = methodFilter === 'all' || (methodFilter === 'wallet' && method.includes('ví điện tử')) || (methodFilter === 'online' && method.includes('thanh toán online'));
                const monthMatch = !monthFilter || month === monthFilter;

                row.style.display = statusMatch && methodMatch && monthMatch ? '' : 'none';
            });
        }

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
            filterTable();
        });
    </script>
</body>
</html>