<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Voucher - Giúp Việc 24H</title>
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
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }

        .stat-card .icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .stat-card.active-vouchers .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.expired-vouchers .icon {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
        }

        .stat-card.total-vouchers .icon {
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

        .vouchers-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .vouchers-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .vouchers-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .vouchers-table th, .vouchers-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .vouchers-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .vouchers-table td {
            color: #64748b;
        }

        .vouchers-table .status {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .vouchers-table .status.active {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .vouchers-table .status.expired {
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
            margin-right: 0.5rem;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            background: rgba(26, 179, 148, 0.1);
        }

        .delete-btn {
            color: #ef4444;
        }

        .delete-btn:hover {
            background: rgba(239, 68, 68, 0.1);
        }

        .create-form, .update-form {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-top: 2rem;
        }

        .create-form h3, .update-form h3 {
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
            font-size: 0.875rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 1rem;
        }

        .btn-submit {
            background: linear-gradient(135deg, #1AB394, #16a085);
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 179, 148, 0.3);
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
            .vouchers-table th, .vouchers-table td {
                padding: 0.75rem;
                font-size: 0.875rem;
            }
            .page-title h1 {
                font-size: 1.5rem;
            }
            .create-form, .update-form {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="/view/common/staff/staff-sidebar.jsp">
            <jsp:param name="activePage" value="vouchers"/>
        </jsp:include>
        <div class="main-content">
            <jsp:include page="/view/common/staff/staff-header.jsp">
                <jsp:param name="breadcrumbParent" value="Trang Chủ"/>
                <jsp:param name="breadcrumbCurrent" value="Quản Lý Voucher"/>
            </jsp:include>

            <div class="content">
                <div class="page-title">
                    <h1>Quản Lý Voucher</h1>
                    <p>Quản lý và chỉnh sửa các voucher tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card active-vouchers">
                        <div class="icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h3>50</h3>
                        <p>Voucher Đang Hoạt Động</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +8 voucher
                        </div>
                    </div>

                    <div class="stat-card expired-vouchers">
                        <div class="icon">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <h3>20</h3>
                        <p>Voucher Hết Hạn</p>
                        <div class="trend down">
                            <i class="fas fa-arrow-down"></i>
                            -5 voucher
                        </div>
                    </div>

                    <div class="stat-card total-vouchers">
                        <div class="icon">
                            <i class="fas fa-tags"></i>
                        </div>
                        <h3>70</h3>
                        <p>Tổng Số Voucher</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +3 voucher
                        </div>
                    </div>
                </div>

                <div class="vouchers-table">
                    <h3>Danh Sách Voucher</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã Voucher</th>
                                <th>Giá Trị (VNĐ)</th>
                                <th>Ngày Hết Hạn</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>VCH20250608-001</td>
                                <td>100,000</td>
                                <td>15/06/2025</td>
                                <td><span class="status active">Hoạt động</span></td>
                                <td>
                                    <button class="action-btn" onclick="updateVoucher('VCH20250608-001')"><i class="fas fa-edit"></i> Cập nhật</button>
                                    <button class="action-btn delete-btn" onclick="deleteVoucher('VCH20250608-001')"><i class="fas fa-trash"></i> Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>VCH20250608-002</td>
                                <td>50,000</td>
                                <td>10/06/2025</td>
                                <td><span class="status active">Hoạt động</span></td>
                                <td>
                                    <button class="action-btn" onclick="updateVoucher('VCH20250608-002')"><i class="fas fa-edit"></i> Cập nhật</button>
                                    <button class="action-btn delete-btn" onclick="deleteVoucher('VCH20250608-002')"><i class="fas fa-trash"></i> Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>VCH20250515-003</td>
                                <td>200,000</td>
                                <td>01/06/2025</td>
                                <td><span class="status expired">Hết hạn</span></td>
                                <td>
                                    <button class="action-btn delete-btn" onclick="deleteVoucher('VCH20250515-003')"><i class="fas fa-trash"></i> Xóa</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="create-form">
                    <h3>Tạo Voucher Mới</h3>
                    <form>
                        <div class="form-group">
                            <label for="voucherCode">Mã Voucher:</label>
                            <input type="text" id="voucherCode" placeholder="Nhập mã voucher" required>
                        </div>
                        <div class="form-group">
                            <label for="voucherValue">Giá Trị (VNĐ):</label>
                            <input type="number" id="voucherValue" placeholder="Nhập giá trị" min="1000" required>
                        </div>
                        <div class="form-group">
                            <label for="expiryDate">Ngày Hết Hạn:</label>
                            <input type="date" id="expiryDate" required>
                        </div>
                        <button type="submit" class="btn-submit">Tạo Voucher</button>
                    </form>
                </div>

                <div class="update-form" style="display: none;" id="updateForm">
                    <h3>Cập Nhật Voucher</h3>
                    <form>
                        <div class="form-group">
                            <label for="updateVoucherCode">Mã Voucher:</label>
                            <input type="text" id="updateVoucherCode" placeholder="Nhập mã voucher" required readonly>
                        </div>
                        <div class="form-group">
                            <label for="updateVoucherValue">Giá Trị (VNĐ):</label>
                            <input type="number" id="updateVoucherValue" placeholder="Nhập giá trị" min="1000" required>
                        </div>
                        <div class="form-group">
                            <label for="updateExpiryDate">Ngày Hết Hạn:</label>
                            <input type="date" id="updateExpiryDate" required>
                        </div>
                        <button type="submit" class="btn-submit">Cập Nhật Voucher</button>
                    </form>
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

        // Xử lý hành động voucher
        function deleteVoucher(voucherId) {
            if (confirm(`Bạn có chắc muốn xóa voucher ${voucherId}?`)) {
                alert(`Đã xóa voucher ${voucherId} thành công!`);
            }
        }

        function updateVoucher(voucherId) {
            const updateForm = document.getElementById('updateForm');
            document.getElementById('updateVoucherCode').value = voucherId;
            document.getElementById('updateVoucherValue').value = '';
            document.getElementById('updateExpiryDate').value = '';
            updateForm.style.display = 'block';
        }

        // Xử lý form submit (mô phỏng)
        document.querySelector('.create-form form').addEventListener('submit', function(e) {
            e.preventDefault();
            const code = document.getElementById('voucherCode').value;
            const value = document.getElementById('voucherValue').value;
            const expiry = document.getElementById('expiryDate').value;
            if (code && value && expiry) {
                alert(`Đã tạo voucher ${code} với giá trị ${value} VNĐ, hết hạn ${expiry}!`);
                this.reset();
            }
        });

        document.querySelector('.update-form form').addEventListener('submit', function(e) {
            e.preventDefault();
            const code = document.getElementById('updateVoucherCode').value;
            const value = document.getElementById('updateVoucherValue').value;
            const expiry = document.getElementById('updateExpiryDate').value;
            if (code && value && expiry) {
                alert(`Đã cập nhật voucher ${code} với giá trị ${value} VNĐ, hết hạn ${expiry}!`);
                document.getElementById('updateForm').style.display = 'none';
            }
        });
    </script>
</body>
</html>