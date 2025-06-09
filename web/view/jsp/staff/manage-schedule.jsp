<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Lịch Thuê - Giúp Việc 24H</title>
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

        .stat-card.scheduled .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.pending .icon {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .stat-card.completed .icon {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
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

        .schedule-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .schedule-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .schedule-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .schedule-table th, .schedule-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .schedule-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .schedule-table td {
            color: #64748b;
        }

        .schedule-table .status {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .schedule-table .status.scheduled {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .schedule-table .status.pending {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .schedule-table .status.completed {
            background: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
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
            .schedule-table th, .schedule-table td {
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
        <div class="sidebar">
            <div class="logo">
                <i class="fas fa-home"></i>
                Giúp Việc 24H
            </div>
            <ul>
                <li>
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
                <li class="active">
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
                    <span>Hỗ Trợ Đổi Lịch</span>
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
                    <h1>Hỗ Trợ Đổi Lịch</h1>
                    <p>Quản lý và chỉnh sửa lịch thuê người giúp việc tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card scheduled">
                        <div class="icon">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <h3>120</h3>
                        <p>Lịch Đã Lên</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +15 lịch
                        </div>
                    </div>

                    <div class="stat-card.pending">
                        <div class="icon">
                            <i class="fas fa-hourglass-half"></i>
                        </div>
                        <h3>25</h3>
                        <p>Lịch Chờ Xử Lý</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +5 lịch
                        </div>
                    </div>

                    <div class="stat-card.completed">
                        <div class="icon">
                            <i class="fas fa-check-double"></i>
                        </div>
                        <h3>95</h3>
                        <p>Lịch Hoàn Thành</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +10 lịch
                        </div>
                    </div>
                </div>

                <div class="schedule-table">
                    <h3>Danh Sách Lịch Thuê</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã Booking</th>
                                <th>Tên Người Giúp Việc</th>
                                <th>Ngày Lịch</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>BOOK20250608-001</td>
                                <td>Trần Văn A</td>
                                <td>10/06/2025</td>
                                <td><span class="status scheduled">Đã lên lịch</span></td>
                                <td>
                                    <button class="action-btn" onclick="editSchedule('BOOK20250608-001')"><i class="fas fa-edit"></i> Chỉnh sửa</button>
                                    <button class="action-btn" onclick="changeSchedule('BOOK20250608-001')"><i class="fas fa-calendar-alt"></i> Đổi lịch</button>
                                </td>
                            </tr>
                            <tr>
                                <td>BOOK20250608-002</td>
                                <td>Nguyễn Thị B</td>
                                <td>11/06/2025</td>
                                <td><span class="status pending">Chờ xử lý</span></td>
                                <td>
                                    <button class="action-btn" onclick="editSchedule('BOOK20250608-002')"><i class="fas fa-edit"></i> Chỉnh sửa</button>
                                    <button class="action-btn" onclick="changeSchedule('BOOK20250608-002')"><i class="fas fa-calendar-alt"></i> Đổi lịch</button>
                                </td>
                            </tr>
                            <tr>
                                <td>BOOK20250607-003</td>
                                <td>Lê Văn C</td>
                                <td>09/06/2025</td>
                                <td><span class="status completed">Hoàn thành</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewSchedule('BOOK20250607-003')"><i class="fas fa-eye"></i> Xem lịch</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal chỉnh sửa lịch -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <h3>Chỉnh Sửa Lịch - <span id="modalBookingId"></span></h3>
            <form>
                <div class="form-group">
                    <label for="newDate">Ngày Mới:</label>
                    <input type="date" id="newDate" required>
                </div>
                <div class="form-group">
                    <label for="helperName">Tên Người Giúp Việc:</label>
                    <select id="helperName">
                        <option value="Trần Văn A">Trần Văn A</option>
                        <option value="Nguyễn Thị B">Nguyễn Thị B</option>
                        <option value="Lê Văn C">Lê Văn C</option>
                    </select>
                </div>
                <button type="submit" class="btn-submit">Lưu Thay Đổi</button>
            </form>
            <button class="close-modal" onclick="closeModal()">Đóng</button>
        </div>
    </div>

    <!-- Modal đổi lịch -->
    <div id="changeModal" class="modal">
        <div class="modal-content">
            <h3>Đổi Lịch - <span id="changeBookingId"></span></h3>
            <form>
                <div class="form-group">
                    <label for="newChangeDate">Ngày Mới:</label>
                    <input type="date" id="newChangeDate" required>
                </div>
                <div class="form-group">
                    <label for="newHelperName">Tên Người Giúp Việc Mới:</label>
                    <select id="newHelperName">
                        <option value="Trần Văn A">Trần Văn A</option>
                        <option value="Nguyễn Thị B">Nguyễn Thị B</option>
                        <option value="Lê Văn C">Lê Văn C</option>
                    </select>
                </div>
                <button type="submit" class="btn-submit">Xác Nhận Đổi Lịch</button>
            </form>
            <button class="close-modal" onclick="closeModal()">Đóng</button>
        </div>
    </div>

    <!-- Modal xem lịch -->
    <div id="viewModal" class="modal">
        <div class="modal-content">
            <h3>Chi Tiết Lịch - <span id="viewBookingId"></span></h3>
            <div class="form-group">
                <label>Ngày Lịch:</label>
                <p id="viewDate">09/06/2025</p>
            </div>
            <div class="form-group">
                <label>Tên Người Giúp Việc:</label>
                <p id="viewHelper">Lê Văn C</p>
            </div>
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

        // Xử lý modal
        function closeModal() {
            document.getElementById('editModal').style.display = 'none';
            document.getElementById('changeModal').style.display = 'none';
            document.getElementById('viewModal').style.display = 'none';
        }

        function editSchedule(bookingId) {
            const modal = document.getElementById('editModal');
            document.getElementById('modalBookingId').textContent = bookingId;
            document.getElementById('newDate').value = '';
            modal.style.display = 'flex';
        }

        function changeSchedule(bookingId) {
            const modal = document.getElementById('changeModal');
            document.getElementById('changeBookingId').textContent = bookingId;
            document.getElementById('newChangeDate').value = '';
            modal.style.display = 'flex';
        }

        function viewSchedule(bookingId) {
            const modal = document.getElementById('viewModal');
            document.getElementById('viewBookingId').textContent = bookingId;
            document.getElementById('viewDate').textContent = '09/06/2025'; // Dữ liệu mẫu
            document.getElementById('viewHelper').textContent = 'Lê Văn C'; // Dữ liệu mẫu
            modal.style.display = 'flex';
        }

        // Xử lý form submit (mô phỏng)
        document.querySelector('#editModal form').addEventListener('submit', function(e) {
            e.preventDefault();
            const bookingId = document.getElementById('modalBookingId').textContent;
            const newDate = document.getElementById('newDate').value;
            const helperName = document.getElementById('helperName').value;
            if (newDate && helperName) {
                alert(`Đã chỉnh sửa lịch ${bookingId} thành ngày ${newDate} với ${helperName}!`);
                closeModal();
            }
        });

        document.querySelector('#changeModal form').addEventListener('submit', function(e) {
            e.preventDefault();
            const bookingId = document.getElementById('changeBookingId').textContent;
            const newDate = document.getElementById('newChangeDate').value;
            const helperName = document.getElementById('newHelperName').value;
            if (newDate && helperName) {
                alert(`Đã đổi lịch ${bookingId} thành ngày ${newDate} với ${helperName}!`);
                closeModal();
            }
        });

        // Đóng modal khi click ngoài
        window.onclick = function(event) {
            const modals = [document.getElementById('editModal'), document.getElementById('changeModal'), document.getElementById('viewModal')];
            modals.forEach(modal => {
                if (event.target === modal) {
                    modal.style.display = 'none';
                }
            });
        };
    </script>
</body>
</html>