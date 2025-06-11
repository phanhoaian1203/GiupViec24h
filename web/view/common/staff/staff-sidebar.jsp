<%@ page contentType="text/html; charset=UTF-8" %>
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

    @media (max-width: 1024px) {
        .sidebar {
            transform: translateX(-100%);
            transition: transform 0.3s ease;
        }
        .sidebar.open {
            transform: translateX(0);
        }
    }
</style>

<div class="sidebar">
    <div class="logo">
        <i class="fas fa-home"></i>
        Giúp Việc 24H
    </div>
    <ul>
        <li class="${param.activePage == 'dashboard' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/staffDashboard.jsp">
                <i class="fas fa-tachometer-alt"></i>
                <span>Bảng Điều Khiển</span>
            </a>
        </li>
        <li class="${param.activePage == 'contracts' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/contracts-manage.jsp">
                <i class="fas fa-file-contract"></i>
                <span>Quản Lý Hợp Đồng</span>
            </a>
        </li>
        <li class="${param.activePage == 'complaints' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/complaints-manage.jsp">
                <i class="fas fa-exclamation-circle"></i>
                <span>Giải Quyết Khiếu Nại</span>
            </a>
        </li>
        <li class="${param.activePage == 'schedule' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/schedule-manage.jsp">
                <i class="fas fa-calendar-alt"></i>
                <span>Quản Lí Lịch Thuê</span>
            </a>
        </li>
        <li class="${param.activePage == 'vouchers' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/vouchers-manage.jsp">
                <i class="fas fa-tags"></i>
                <span>Quản Lý Voucher</span>
            </a>
        </li>
        <li class="${param.activePage == 'chat' ? 'active' : ''}">
            <a href="<%= request.getContextPath() %>/view/jsp/staff/staff-chat.jsp">
                <i class="fas fa-comments"></i>
                <span>Chat Hỗ Trợ</span>
            </a>
        </li>
    </ul>
</div>