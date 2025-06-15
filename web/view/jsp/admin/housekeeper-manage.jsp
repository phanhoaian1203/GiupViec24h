<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản Lý Người Giúp Việc - Giúp Việc 24H</title>
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

            .stat-card.workers .icon {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
            }

            .stat-card.active-workers .icon {
                background: rgba(16, 185, 129, 0.1);
                color: #10b981;
            }

            .stat-card.inactive-workers .icon {
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

            .workers-table {
                background: white;
                border-radius: 16px;
                padding: 2rem;
                box-shadow: 0 4px 20px rgba(0,0,0,0.08);
                border: 1px solid rgba(226, 232, 240, 0.5);
                margin-bottom: 2rem;
            }

            .workers-table h3 {
                font-size: 1.25rem;
                font-weight: 700;
                color: #1a202c;
                margin-bottom: 1rem;
            }

            .workers-table table {
                width: 100%;
                border-collapse: collapse;
            }

            .workers-table th, .workers-table td {
                padding: 1rem;
                text-align: left;
                border-bottom: 1px solid #f1f5f9;
            }

            .workers-table th {
                background: #f8fafc;
                font-weight: 600;
                color: #374151;
            }

            .workers-table td {
                color: #64748b;
            }

            .workers-table .status {
                display: inline-block;
                padding: 0.25rem 0.75rem;
                border-radius: 12px;
                font-size: 0.875rem;
                font-weight: 500;
            }

            .workers-table .status.active {
                background: rgba(16, 185, 129, 0.1);
                color: #10b981;
            }

            .workers-table .status.inactive {
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

            .quick-actions {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 1rem;
                margin-top: 2rem;
            }

            .action-btn-grid {
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

            .action-btn-grid:hover {
                border-color: #1AB394;
                background: rgba(26, 179, 148, 0.05);
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(26, 179, 148, 0.2);
            }

            .action-btn-grid i {
                font-size: 2rem;
                color: #1AB394;
                margin-bottom: 0.5rem;
            }

            .action-btn-grid h4 {
                font-size: 0.875rem;
                font-weight: 600;
                margin-bottom: 0.25rem;
            }

            .action-btn-grid p {
                font-size: 0.75rem;
                color: #94a3b8;
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
                .workers-table th, .workers-table td {
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
                    <jsp:param name="breadcrumbCurrent" value="Quản Lý Người Giúp Việc"/>
                </jsp:include>

                <div class="content">
                    <div class="page-title">
                        <h1>Quản Lý Người Giúp Việc</h1>
                        <p>Quản lý thông tin và trạng thái của người giúp việc tại Đà Nẵng</p>
                    </div>

                    <div class="stats-grid">
                        <div class="stat-card workers">
                            <div class="icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <h3>187</h3>
                            <p>Tổng Số Người Giúp Việc</p>
                            <div class="trend up">
                                <i class="fas fa-arrow-up"></i>
                                +12 người mới
                            </div>
                        </div>

                        <div class="stat-card active-workers">
                            <div class="icon">
                                <i class="fas fa-user-check"></i>
                            </div>
                            <h3>162</h3>
                            <p>Đang Hoạt Động</p>
                            <div class="trend up">
                                <i class="fas fa-arrow-up"></i>
                                +5% so với tuần trước
                            </div>
                        </div>

                        <div class="stat-card inactive-workers">
                            <div class="icon">
                                <i class="fas fa-user-times"></i>
                            </div>
                            <h3>25</h3>
                            <p>Ngưng Hoạt Động</p>
                            <div class="trend down">
                                <i class="fas fa-arrow-down"></i>
                                -3 người
                            </div>
                        </div>
                    </div>

                    <div class="workers-table">
                        <h3>Danh Sách Người Giúp Việc</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Họ và Tên</th>
                                    <th>Địa Chỉ</th>
                                    <th>Số Điện Thoại</th>
                                    <th>Trạng Thái</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Trần Văn A</td>
                                    <td>Quận Hải Châu, Đà Nẵng</td>
                                    <td>0905 123 456</td>
                                    <td><span class="status active">Hoạt động</span></td>
                                    <td>
                                        <button class="action-btn" onclick="editWorker('Trần Văn A')"><i class="fas fa-edit"></i> Sửa</button>
                                        <button class="action-btn" onclick="removeWorker('Trần Văn A')"><i class="fas fa-trash"></i> Xóa</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nguyễn Thị B</td>
                                    <td>Quận Thanh Khê, Đà Nẵng</td>
                                    <td>0912 345 678</td>
                                    <td><span class="status active">Hoạt động</span></td>
                                    <td>
                                        <button class="action-btn" onclick="editWorker('Nguyễn Thị B')"><i class="fas fa-edit"></i> Sửa</button>
                                        <button class="action-btn" onclick="removeWorker('Nguyễn Thị B')"><i class="fas fa-trash"></i> Xóa</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Lê Văn C</td>
                                    <td>Quận Cẩm Lệ, Đà Nẵng</td>
                                    <td>0938 567 890</td>
                                    <td><span class="status inactive">Ngưng hoạt động</span></td>
                                    <td>
                                        <button class="action-btn" onclick="editWorker('Lê Văn C')"><i class="fas fa-edit"></i> Sửa</button>
                                        <button class="action-btn" onclick="removeWorker('Lê Văn C')"><i class="fas fa-trash"></i> Xóa</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="quick-actions">
                        <a href="#" class="action-btn-grid">
                            <i class="fas fa-user-check"></i>
                            <h4>Duyệt Người Giúp Việc</h4>
                            <p>Xem và phê duyệt hồ sơ mới</p>
                        </a>
                        <a href="#" class="action-btn-grid">
                            <i class="fas fa-sync"></i>
                            <h4>Cập Nhật Trạng Thái</h4>
                            <p>Cập nhật trạng thái hoạt động</p>
                        </a>
                        <a href="#" class="action-btn-grid">
                            <i class="fas fa-search"></i>
                            <h4>Tìm Kiếm Người Giúp Việc</h4>
                            <p>Tìm theo tên hoặc địa chỉ</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Xử lý hành động trên bảng
            function editWorker(name) {
                alert(`Sửa thông tin của ${name}`);
            }

            function removeWorker(name) {
                if (confirm(`Bạn có chắc muốn xóa ${name}?`)) {
                    alert(`Đã xóa ${name} thành công!`);
                }
            }

            // Xử lý navigation sidebar
            document.querySelectorAll('.sidebar ul li').forEach(item => {
                item.addEventListener('click', function () {
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
            document.addEventListener('DOMContentLoaded', function () {
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