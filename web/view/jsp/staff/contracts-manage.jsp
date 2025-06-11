<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Hợp Đồng - Giúp Việc 24H</title>
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

        .stat-card.pending-contracts .icon {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .stat-card.approved-contracts .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.rejected-contracts .icon {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
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

        .contracts-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .contracts-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .contracts-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .contracts-table th, .contracts-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .contracts-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .contracts-table td {
            color: #64748b;
        }

        .contracts-table .status {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .contracts-table .status.pending {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .contracts-table .status.approved {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .contracts-table .status.rejected {
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

        .view-details {
            color: #3b82f6;
        }

        .view-details:hover {
            background: rgba(59, 130, 246, 0.1);
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background: white;
            padding: 2rem;
            border-radius: 16px;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .modal-content h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .modal-content .document {
            margin-bottom: 1rem;
            padding: 1rem;
            background: #f8fafc;
            border-radius: 8px;
            color: #64748b;
        }

        .close-modal {
            background: none;
            border: none;
            color: #ef4444;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 1rem;
        }

        .close-modal:hover {
            color: #dc2626;
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
            .contracts-table th, .contracts-table td {
                padding: 0.75rem;
                font-size: 0.875rem;
            }
            .page-title h1 {
                font-size: 1.5rem;
            }
            .modal-content {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="/view/common/staff/staff-sidebar.jsp">
            <jsp:param name="activePage" value="contracts"/>
        </jsp:include>
        <div class="main-content">
            <div class="header">
                <div class="breadcrumb">
                    <span>Trang Chủ</span>
                    <i class="fas fa-chevron-right"></i>
                    <span>Quản Lý Hợp Đồng</span>
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
                    <h1>Quản Lý Hợp Đồng</h1>
                    <p>Quản lý và xử lý hợp đồng của người giúp việc tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card pending-contracts">
                        <div class="icon">
                            <i class="fas fa-hourglass-half"></i>
                        </div>
                        <h3>150</h3>
                        <p>Hợp Đồng Chờ Duyệt</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +10 hợp đồng
                        </div>
                    </div>

                    <div class="stat-card approved-contracts">
                        <div class="icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h3>300</h3>
                        <p>Hợp Đồng Đã Duyệt</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +20 hợp đồng
                        </div>
                    </div>

                    <div class="stat-card rejected-contracts">
                        <div class="icon">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <h3>50</h3>
                        <p>Hợp Đồng Bị Từ Chối</p>
                        <div class="trend down">
                            <i class="fas fa-arrow-down"></i>
                            -5 hợp đồng
                        </div>
                    </div>
                </div>

                <div class="contracts-table">
                    <h3>Danh Sách Hợp Đồng</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã Hợp Đồng</th>
                                <th>Tên Người Giúp Việc</th>
                                <th>Ngày Tạo</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>HD20250608-001</td>
                                <td>Trần Văn A</td>
                                <td>08/06/2025</td>
                                <td><span class="status pending">Chờ duyệt</span></td>
                                <td>
                                    <button class="action-btn" onclick="approveContract('HD20250608-001')"><i class="fas fa-check"></i> Chấp nhận</button>
                                    <button class="action-btn" onclick="rejectContract('HD20250608-001')"><i class="fas fa-times"></i> Từ chối</button>
                                    <button class="action-btn view-details" onclick="viewDocuments('HD20250608-001')"><i class="fas fa-eye"></i> Xem tài liệu</button>
                                </td>
                            </tr>
                            <tr>
                                <td>HD20250608-002</td>
                                <td>Nguyễn Thị B</td>
                                <td>08/06/2025</td>
                                <td><span class="status pending">Chờ duyệt</span></td>
                                <td>
                                    <button class="action-btn" onclick="approveContract('HD20250608-002')"><i class="fas fa-check"></i> Chấp nhận</button>
                                    <button class="action-btn" onclick="rejectContract('HD20250608-002')"><i class="fas fa-times"></i> Từ chối</button>
                                    <button class="action-btn view-details" onclick="viewDocuments('HD20250608-002')"><i class="fas fa-eye"></i> Xem tài liệu</button>
                                </td>
                            </tr>
                            <tr>
                                <td>HD20250608-003</td>
                                <td>Lê Văn C</td>
                                <td>07/06/2025</td>
                                <td><span class="status approved">Đã duyệt</span></td>
                                <td>
                                    <button class="action-btn view-details" onclick="viewDocuments('HD20250608-003')"><i class="fas fa-eye"></i> Xem tài liệu</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal xem tài liệu -->
    <div id="documentModal" class="modal">
        <div class="modal-content">
            <h3>Tài Liệu Xác Minh - <span id="modalContractId"></span></h3>
            <div class="document">CMND/CCCD: Bản sao CMND/CCCD của Trần Văn A</div>
            <div class="document">Hợp đồng lao động: Hợp đồng lao động đã ký với công ty</div>
            <div class="document">Giấy khám sức khỏe: Kết quả khám sức khỏe ngày 01/06/2025</div>
            <button class="close-modal" onclick="closeModal()">Đóng</button>
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

        // Xử lý hợp đồng
        function approveContract(contractId) {
            if (confirm(`Chấp nhận hợp đồng ${contractId}?`)) {
                alert(`Đã chấp nhận hợp đồng ${contractId} thành công!`);
            }
        }

        function rejectContract(contractId) {
            if (confirm(`Từ chối hợp đồng ${contractId}?`)) {
                alert(`Đã từ chối hợp đồng ${contractId} thành công!`);
            }
        }

        // Xem tài liệu
        function viewDocuments(contractId) {
            const modal = document.getElementById('documentModal');
            const modalContractId = document.getElementById('modalContractId');
            modalContractId.textContent = contractId;
            modal.style.display = 'flex';
        }

        function closeModal() {
            const modal = document.getElementById('documentModal');
            modal.style.display = 'none';
        }

        // Đóng modal khi click ngoài
        window.onclick = function(event) {
            const modal = document.getElementById('documentModal');
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        };
    </script>
</body>
</html>