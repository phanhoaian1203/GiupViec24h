<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giải Quyết Khiếu Nại - Giúp Việc 24H</title>
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

        .stat-card.open-complaints .icon {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .stat-card.resolved-complaints .icon {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .stat-card.total-complaints .icon {
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

        .complaints-table {
            background: white;
            border-radius: 16px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            margin-bottom: 2rem;
        }

        .complaints-table h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .complaints-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .complaints-table th, .complaints-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .complaints-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
        }

        .complaints-table td {
            color: #64748b;
        }

        .complaints-table .status {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 12px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .complaints-table .status.open {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .complaints-table .status.resolved {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
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

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 1rem;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-group p {
            color: #64748b;
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
        }

        @media (max-width: 768px) {
            .content {
                padding: 1rem;
            }
            .complaints-table th, .complaints-table td {
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
            <jsp:param name="activePage" value="complaints"/>
        </jsp:include>
        <div class="main-content">
            <div class="header">
                <div class="breadcrumb">
                    <span>Trang Chủ</span>
                    <i class="fas fa-chevron-right"></i>
                    <span>Giải Quyết Khiếu Nại</span>
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
                    <h1>Giải Quyết Khiếu Nại</h1>
                    <p>Quản lý và xử lý khiếu nại từ người giúp việc và khách hàng tại Đà Nẵng</p>
                </div>

                <div class="stats-grid">
                    <div class="stat-card open-complaints">
                        <div class="icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <h3>15</h3>
                        <p>Khiếu Nại Đang Mở</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +3 khiếu nại
                        </div>
                    </div>

                    <div class="stat-card resolved-complaints">
                        <div class="icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h3>40</h3>
                        <p>Khiếu Nại Đã Giải Quyết</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +5 khiếu nại
                        </div>
                    </div>

                    <div class="stat-card total-complaints">
                        <div class="icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <h3>55</h3>
                        <p>Tổng Số Khiếu Nại</p>
                        <div class="trend up">
                            <i class="fas fa-arrow-up"></i>
                            +8 khiếu nại
                        </div>
                    </div>
                </div>

                <div class="complaints-table">
                    <h3>Danh Sách Khiếu Nại</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã Khiếu Nại</th>
                                <th>Người Khiếu Nại</th>
                                <th>Ngày Gửi</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>CMP20250608-001</td>
                                <td>Trần Văn A (Người Giúp Việc)</td>
                                <td>08/06/2025</td>
                                <td><span class="status open">Đang Mở</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewComplaint('CMP20250608-001')"><i class="fas fa-eye"></i> Xem</button>
                                    <button class="action-btn" onclick="updateComplaint('CMP20250608-001')"><i class="fas fa-edit"></i> Cập Nhật</button>
                                </td>
                            </tr>
                            <tr>
                                <td>CMP20250607-002</td>
                                <td>Nguyễn Thị B (Khách Hàng)</td>
                                <td>07/06/2025</td>
                                <td><span class="status open">Đang Mở</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewComplaint('CMP20250607-002')"><i class="fas fa-eye"></i> Xem</button>
                                    <button class="action-btn" onclick="updateComplaint('CMP20250607-002')"><i class="fas fa-edit"></i> Cập Nhật</button>
                                </td>
                            </tr>
                            <tr>
                                <td>CMP20250605-003</td>
                                <td>Lê Văn C (Người Giúp Việc)</td>
                                <td>05/06/2025</td>
                                <td><span class="status resolved">Đã Giải Quyết</span></td>
                                <td>
                                    <button class="action-btn" onclick="viewComplaint('CMP20250605-003')"><i class="fas fa-eye"></i> Xem</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal xem khiếu nại -->
    <div id="viewModal" class="modal">
        <div class="modal-content">
            <h3>Chi Tiết Khiếu Nại - <span id="viewComplaintId"></span></h3>
            <div class="form-group">
                <label>Người Khiếu Nại:</label>
                <p id="viewComplainant"></p>
            </div>
            <div class="form-group">
                <label>Ngày Gửi:</label>
                <p id="viewDate"></p>
            </div>
            <div class="form-group">
                <label>Nội Dung Khiếu Nại:</label>
                <p id="viewContent"></p>
            </div>
            <div class="form-group">
                <label>Trạng Thái:</label>
                <p id="viewStatus"></p>
            </div>
            <div class="form-group">
                <label>Ghi Chú Giải Quyết:</label>
                <p id="viewResolution"></p>
            </div>
            <button class="close-modal" onclick="closeModal()">Đóng</button>
        </div>
    </div>

    <!-- Modal cập nhật khiếu nại -->
    <div id="updateModal" class="modal">
        <div class="modal-content">
            <h3>Cập Nhật Khiếu Nại - <span id="updateComplaintId"></span></h3>
            <form>
                <div class="form-group">
                    <label for="updateStatus">Trạng Thái:</label>
                    <select id="updateStatus" required>
                        <option value="open">Đang Mở</option>
                        <option value="resolved">Đã Giải Quyết</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="updateResolution">Ghi Chú Giải Quyết:</label>
                    <textarea id="updateResolution" placeholder="Nhập ghi chú giải quyết"></textarea>
                </div>
                <button type="submit" class="btn-submit" onclick="closeModal(); return false;">Cập Nhật</button>
            </form>
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
            document.getElementById('viewModal').style.display = 'none';
            document.getElementById('updateModal').style.display = 'none';
        }

        function viewComplaint(complaintId) {
            const modal = document.getElementById('viewModal');
            document.getElementById('viewComplaintId').textContent = complaintId;
            // Dữ liệu mẫu tĩnh
            document.getElementById('viewComplainant').textContent = complaintId === 'CMP20250608-001' ? 'Trần Văn A (Người Giúp Việc)' : 
                                                                    complaintId === 'CMP20250607-002' ? 'Nguyễn Thị B (Khách Hàng)' : 
                                                                    'Lê Văn C (Người Giúp Việc)';
            document.getElementById('viewDate').textContent = complaintId === 'CMP20250608-001' ? '08/06/2025' : 
                                                              complaintId === 'CMP20250607-002' ? '07/06/2025' : 
                                                              '05/06/2025';
            document.getElementById('viewContent').textContent = 'Nội dung khiếu nại mẫu cho ' + complaintId;
            document.getElementById('viewStatus').textContent = complaintId === 'CMP20250605-003' ? 'Đã Giải Quyết' : 'Đang Mở';
            document.getElementById('viewResolution').textContent = complaintId === 'CMP20250605-003' ? 'Đã xử lý hoàn tất' : 'Chưa có ghi chú';
            modal.style.display = 'flex';
        }

        function updateComplaint(complaintId) {
            const modal = document.getElementById('updateModal');
            document.getElementById('updateComplaintId').textContent = complaintId;
            document.getElementById('updateStatus').value = complaintId === 'CMP20250605-003' ? 'resolved' : 'open';
            document.getElementById('updateResolution').value = '';
            modal.style.display = 'flex';
        }

        // Xử lý form submit (chỉ đóng modal, không xử lý backend)
        document.querySelector('#updateModal form').addEventListener('submit', function(e) {
            e.preventDefault();
            closeModal();
        });

        // Đóng modal khi click ngoài
        window.onclick = function(event) {
            const modals = [document.getElementById('viewModal'), document.getElementById('updateModal')];
            modals.forEach(modal => {
                if (event.target === modal) {
                    modal.style.display = 'none';
                }
            });
        };
    </script>
</body>
</html>