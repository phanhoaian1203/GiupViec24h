<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
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
</style>

<div class="header">
    <div class="breadcrumb">
        <span>${param.breadcrumbParent != null ? param.breadcrumbParent : 'Trang Chủ'}</span>
        <i class="fas fa-chevron-right"></i>
        <span>${param.breadcrumbCurrent != null ? param.breadcrumbCurrent : 'Bảng Điều Khiển'}</span>
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
            <% User user = (User) session.getAttribute("user"); %>
            <div class="user-avatar"><%= user != null ? user.getFullName().substring(0, 1).toUpperCase() : "A" %></div>
            <div>
                <div style="font-weight: 600; font-size: 0.875rem; color: #1a202c;"><%= user != null ? user.getFullName() : "Admin" %></div>
                <div style="font-size: 0.75rem; color: #64748b;">Quản trị viên</div>
            </div>
            <i class="fas fa-chevron-down" style="color: #64748b; font-size: 0.75rem;"></i>
        </div>
    </div>
</div>