<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User, model.HousekeeperProfile, dao.HousekeeperProfileDAO, java.sql.SQLException" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<% 
    User user = (request.getSession(false) != null && request.getSession(false).getAttribute("user") != null) 
                ? (User) request.getSession(false).getAttribute("user") : null;
    HousekeeperProfile housekeeperProfile = null;
    String profileImageUrl = "/images/profile-placeholder.jpg"; // Default image

    if (user != null) {
        try {
            HousekeeperProfileDAO profileDAO = new HousekeeperProfileDAO();
            housekeeperProfile = profileDAO.getHousekeeperProfileById(user.getUserId()); // Lấy từ DB
            if (housekeeperProfile != null && housekeeperProfile.getProfileImageUrl() != null) {
                profileImageUrl = request.getContextPath() + "/" + housekeeperProfile.getProfileImageUrl();
            }
        } catch (RuntimeException e) {
                e.printStackTrace();//Log lỗi nếu có
            }
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Housekeeper - Giúp Việc 24h</title>
    <%@ include file="/view/common/web/add_css.jsp" %>
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        
        .dashboard-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px 20px;
        }
        
        .welcome-section {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .welcome-title {
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2.5rem;
            font-weight: 800;
            text-align: center;
            margin-bottom: 10px;
        }
        
        .welcome-subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 1.1rem;
            margin-bottom: 0;
        }
        
        .profile-section {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 2px solid #f3f4f6;
        }
        
        .profile-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .profile-icon svg {
            width: 24px;
            height: 24px;
            color: white;
        }
        
        .profile-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1f2937;
            margin: 0;
        }
        
        .profile-modern-layout {
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 40px;
            align-items: start;
        }
        
        .profile-avatar-section {
            text-align: center;
            padding: 30px;
            background: linear-gradient(135deg, #f8fafc, #e2e8f0);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.8);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .avatar-container {
            position: relative;
            display: inline-block;
            margin-bottom: 15px;
        }
        
        .modern-profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .avatar-status {
            position: absolute;
            bottom: 5px;
            right: 5px;
            width: 15px;
            height: 15px;
            background: #10b981;
            border-radius: 50%;
            border: 3px solid white;
        }
        
        .user-name {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1f2937;
            margin: 0 0 5px 0;
        }
        
        .user-role {
            color: #6b7280;
            font-size: 1rem;
            margin: 0;
        }
        
        .profile-details-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .detail-card {
            display: flex;
            align-items: center;
            padding: 20px;
            background: linear-gradient(135deg, #f8fafc, #ffffff);
            border-radius: 15px;
            border: 1px solid #e5e7eb;
            transition: all 0.3s ease;
        }
        
        .detail-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border-color: #667eea;
        }
        
        .detail-icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
        }
        
        .detail-icon svg {
            width: 20px;
            height: 20px;
            color: white;
        }
        
        .detail-content {
            flex: 1;
        }
        
        .detail-content label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            color: #6b7280;
            margin-bottom: 4px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .detail-content span {
            font-size: 1rem;
            font-weight: 500;
            color: #1f2937;
            word-break: break-word;
        }
        
        .functions-section {
            margin-top: 30px;
        }
        
        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: white;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .function-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
        }
        
        .function-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 25px;
            text-decoration: none;
            color: inherit;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }
        
        .function-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }
        
        .function-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
        }
        
        .function-card:hover::before {
            transform: scaleX(1);
        }
        
        .function-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .function-icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            transition: transform 0.3s ease;
        }
        
        .function-card:hover .function-icon {
            transform: scale(1.1);
        }
        
        .function-icon svg {
            width: 22px;
            height: 22px;
            color: white;
        }
        
        .function-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #1f2937;
            margin: 0;
        }
        
        .function-description {
            color: #6b7280;
            font-size: 0.95rem;
            line-height: 1.5;
            margin: 0;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .stat-label {
            color: #6b7280;
            font-size: 0.9rem;
            font-weight: 500;
            margin-top: 5px;
        }
        
        .custom-header {
            position: fixed;
            top: 0;
            right: 20px;
            padding: 10px 20px;
            z-index: 1000;
        }
        
        .logout-btn {
            display: inline-block;
            padding: 12px 25px;
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease;
            text-align: center;
        }
        
        .logout-btn:hover {
            background: linear-gradient(135deg, #dc2626, #b91c1c);
            transform: translateY(-2px);
        }
        
        @media (max-width: 768px) {
            .dashboard-container {
                padding: 20px 15px;
            }
            
            .welcome-section {
                padding: 25px;
            }
            
            .welcome-title {
                font-size: 2rem;
            }
            
            .profile-modern-layout {
                grid-template-columns: 1fr;
                gap: 25px;
            }
            
            .profile-details-section {
                grid-template-columns: 1fr;
            }
            
            .function-grid {
                grid-template-columns: 1fr;
            }
            
            .custom-header {
                right: 10px;
                padding: 5px 10px;
            }
            
            .logout-btn {
                padding: 8px 15px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <!-- Custom Header with Logout Button -->
    <div class="custom-header">
        <a href="${pageContext.request.contextPath}/LogoutServlet" class="logout-btn">Đăng xuất</a>
    </div>

    <div class="dashboard-container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1 class="welcome-title">Trung Tâm Quản Lý Công Việc</h1>
            <p class="welcome-subtitle">Chào mừng <%= user != null ? user.getFullName() : "Khách" %> đến với hệ thống Giúp Việc 24h</p>
        </div>

        <!-- Profile Information -->
        <div class="profile-section">
            <div class="profile-header">
                <div class="profile-icon">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                </div>
                <h2 class="profile-title">Hồ Sơ Cá Nhân</h2>
            </div>
            
            <div class="profile-modern-layout">
                <div class="profile-avatar-section">
                    <div class="avatar-container">
                        <img src="<%= profileImageUrl %>" alt="Profile Image" class="modern-profile-image">
                        <div class="avatar-status"></div>
                    </div>
                    <h3 class="user-name"><%= user != null ? user.getFullName() : "Unknown" %></h3>
                    <p class="user-role">Nhân viên dịch vụ</p>
                </div>
                
                <div class="profile-details-section">
                    <div class="detail-card">
                        <div class="detail-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                        <div class="detail-content">
                            <label>Email</label>
                            <span><%= user != null ? user.getEmail() : "N/A" %></span>
                        </div>
                    </div>
                    
                    <div class="detail-card">
                        <div class="detail-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                            </svg>
                        </div>
                        <div class="detail-content">
                            <label>Số điện thoại</label>
                            <span><%= user != null ? user.getPhoneNumber() : "N/A" %></span>
                        </div>
                    </div>
                    
                    <div class="detail-card">
                        <div class="detail-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            </svg>
                        </div>
                        <div class="detail-content">
                            <label>Địa chỉ</label>
                            <span><%= user != null ? user.getAddress() : "N/A" %></span>
                        </div>
                    </div>
                    
                    <div class="detail-card">
                        <div class="detail-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                            </svg>
                        </div>
                        <div class="detail-content">
                            <label>Quê quán</label>
                            <span><%= user != null ? user.getHometown() : "N/A" %></span>
                        </div>
                    </div>
                    
                    <div class="detail-card">
                        <div class="detail-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                        <div class="detail-content">
                            <label>Năm sinh</label>
                            <span><%= user != null ? user.getBirthYear() : "N/A" %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Function Navigation -->
        <div class="functions-section">
            <h2 class="section-title">Quản Lý Công Việc</h2>
            <div class="function-grid">
                <a href="${pageContext.request.contextPath}/ViewSchedulesServlet" class="function-card">
                    <div class="function-header">
                        <div class="function-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                        <h3 class="function-title">Xem Lịch Làm Việc</h3>
                    </div>
                    <p class="function-description">Xem và quản lý các ca làm việc được phân công cho bạn</p>
                </a>

                <a href="${pageContext.request.contextPath}/ViewBookingsServlet" class="function-card">
                    <div class="function-header">
                        <div class="function-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                            </svg>
                        </div>
                        <h3 class="function-title">Xem Đặt Lịch</h3>
                    </div>
                    <p class="function-description">Kiểm tra danh sách tất cả các đặt lịch dịch vụ</p>
                </a>

                <a href="${pageContext.request.contextPath}/view/jsp/housekeeper/updateBookingStatus.jsp" class="function-card">
                    <div class="function-header">
                        <div class="function-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <h3 class="function-title">Xác Nhận/Từ Chối</h3>
                    </div>
                    <p class="function-description">Xác nhận hoặc từ chối các yêu cầu đặt lịch từ khách hàng</p>
                </a>

                <a href="${pageContext.request.contextPath}/UpdateProfileServlet" class="function-card">
                    <div class="function-header">
                        <div class="function-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                            </svg>
                        </div>
                        <h3 class="function-title">Cập Nhật Hồ Sơ</h3>
                    </div>
                    <p class="function-description">Chỉnh sửa và cập nhật thông tin cá nhân của bạn</p>
                </a>

                <a href="${pageContext.request.contextPath}/view/jsp/housekeeper/sendMessage.jsp" class="function-card">
                    <div class="function-header">
                        <div class="function-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path>
                            </svg>
                        </div>
                        <h3 class="function-title">Gửi Tin Nhắn</h3>
                    </div>
                    <p class="function-description">Liên lạc và trao đổi với khách hàng qua tin nhắn</p>
                </a>

                <a href="${pageContext.request.contextPath}/view/jsp/housekeeper/viewNotifications.jsp" class="function-card">
                    <div class="function-header">
                        <div class="function-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-5 5v-5zM10.94 14H7a2 2 0 01-2-2V4a2 2 0 012-2h10a2 2 0 012 2v8a2 2 0 01-2 2h-3.06L10 18v-4z"></path>
                            </svg>
                        </div>
                        <h3 class="function-title">Xem Thông Báo</h3>
                    </div>
                    <p class="function-description">Kiểm tra các thông báo và cập nhật mới nhất</p>
                </a>

                <a href="${pageContext.request.contextPath}/view/jsp/housekeeper/completeBooking.jsp" class="function-card">
                    <div class="function-header">
                        <div class="function-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                            </svg>
                        </div>
                        <h3 class="function-title">Hoàn Thành Đặt Lịch</h3>
                    </div>
                    <p class="function-description">Đánh dấu hoàn thành công việc và cập nhật trạng thái</p>
                </a>
            </div>
        </div>
    </div>

    <%@ include file="/view/common/web/footer.jsp" %>
    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>