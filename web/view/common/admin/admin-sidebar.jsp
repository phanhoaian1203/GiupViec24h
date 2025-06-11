<%@ page contentType="text/html; charset=UTF-8" %>
<div class="sidebar">
    <div class="logo">
        <i class="fas fa-home"></i>
        Giúp Việc 24H
    </div>
    <ul>
        <li <%= request.getRequestURI().contains("AdminDashboard") ? "class=\"active\"" : "" %>>
            <a href="<%= request.getContextPath() %>/view/jsp/admin/adminDashboard.jsp">
                <i class="fas fa-tachometer-alt"></i>
                <span>Bảng Điều Khiển</span>
            </a>
        </li>
        <li <%= request.getRequestURI().contains("housekeeper-manage") ? "class=\"active\"" : "" %>>
            <a href="<%= request.getContextPath() %>/view/jsp/admin/housekeeper-manage.jsp">
                <i class="fas fa-users"></i>
                <span>Quản Lý Người Giúp Việc</span>
            </a>
        </li>
        <li <%= request.getRequestURI().contains("staff-manage") ? "class=\"active\"" : "" %>>
            <a href="<%= request.getContextPath() %>/view/jsp/admin/staff-manage.jsp">
                <i class="fas fa-user-tie"></i>
                <span>Quản Lý Nhân Viên</span>
            </a>
        </li>
        
        <li <%= request.getRequestURI().contains("revenue") ? "class=\"active\"" : "" %>>
            <a href="<%= request.getContextPath() %>/view/jsp/admin/revenue-manage.jsp">
                <i class="fas fa-chart-line"></i>
                <span>Thống Kê Doanh Thu</span>
            </a>
        </li>
        <li <%= request.getRequestURI().contains("reports") ? "class=\"active\"" : "" %>>
            <a href="<%= request.getContextPath() %>/view/jsp/admin/report-manage.jsp">
                <i class="fas fa-file-alt"></i>
                <span>Báo Cáo</span>
            </a>
        </li>
        <li <%= request.getRequestURI().contains("payments") ? "class=\"active\"" : "" %>>
            <a href="<%= request.getContextPath() %>/view/jsp/admin/payment-manage.jsp">
                <i class="fas fa-credit-card"></i>
                <span>Quản Lý Thanh Toán</span>
            </a>
        </li>
        <li <%= request.getRequestURI().contains("settings") ? "class=\"active\"" : "" %>>
            <a href="<%= request.getContextPath() %>/view/jsp/admin/setting.jsp">
                <i class="fas fa-cog"></i>
                <span>Cài Đặt Hệ Thống</span>
            </a>
        </li>
    </ul>
</div>

<style>
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

    @media (max-width: 768px) {
        .sidebar {
            width: 240px;
            transform: translateX(-100%);
            transition: transform 0.3s ease;
        }
        
        .sidebar.open {
            transform: translateX(0);
        }
    }
</style>