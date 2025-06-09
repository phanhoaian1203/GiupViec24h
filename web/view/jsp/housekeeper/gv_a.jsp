<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ Sơ Nhân Viên - Nguyễn Văn A</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="${pageContext.request.contextPath}/js/cscripts.js"></script>
    <%@ include file="/view/common/web/add_css.jsp" %>
    <style>
        .profile-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            box-shadow: 0 20px 40px rgba(26, 179, 148, 0.12);
            border: 1px solid rgba(26, 179, 148, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            display: grid;
            grid-template-columns: 350px 1fr;
            min-height: 650px;
        }
        
        .profile-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(90deg, #1AB394, #20d4aa, #1AB394);
        }
        
        .profile-left {
            background: linear-gradient(135deg, rgba(26, 179, 148, 0.08), rgba(32, 212, 170, 0.08));
            padding: 3rem 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            border-right: 1px solid rgba(26, 179, 148, 0.1);
        }
        
        .profile-right {
            padding: 3rem 2.5rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        
        .profile-avatar {
            position: relative;
            margin-bottom: 2rem;
        }
        
        .avatar-image {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover;
            border: 6px solid #1AB394;
            box-shadow: 0 15px 40px rgba(26, 179, 148, 0.3);
            transition: all 0.4s ease;
        }
        
        .avatar-image:hover {
            transform: scale(1.05) rotate(2deg);
            box-shadow: 0 20px 50px rgba(26, 179, 148, 0.4);
        }
        
        .avatar-status {
            position: absolute;
            bottom: 15px;
            right: 15px;
            background: #1AB394;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            border: 4px solid white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        
        .employee-name-left {
            font-size: 2.2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 1rem;
            line-height: 1.2;
        }
        
        .rating-section-left {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1.5rem;
        }
        
        .stars {
            color: #ffca28;
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
        }
        
        .rating-text {
            color: #666;
            font-weight: 500;
            font-size: 1.1rem;
        }
        
        .employee-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            background: linear-gradient(135deg, rgba(26, 179, 148, 0.15), rgba(32, 212, 170, 0.15));
            color: #1AB394;
            padding: 0.75rem 1.5rem;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            border: 2px solid rgba(26, 179, 148, 0.2);
            margin-bottom: 2rem;
        }
        
        .quick-stats {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            width: 100%;
        }
        
        .stat-item {
            background: rgba(255, 255, 255, 0.7);
            padding: 1rem;
            border-radius: 15px;
            border-left: 4px solid #1AB394;
        }
        
        .stat-number_ {
            font-size: 1.8rem;
            font-weight: 700;
            color: #000000; /* Đổi thành màu đen */
            margin-bottom: 0.25rem;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.9rem;
            font-weight: 500;
        }
        
        .brand-section {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 2rem;
            padding: 0.75rem 1.25rem;
            background: rgba(26, 179, 148, 0.1);
            border-radius: 25px;
            width: fit-content;
            align-self: flex-start;
        }
        
        .brand-icon {
            width: 28px;
            height: 28px;
            background: #1AB394;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 0.9rem;
        }
        
        .employee-name {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 0.5rem;
            line-height: 1.2;
        }
        
        .rating-section {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }
        
        .stars {
            color: #ffca28;
            font-size: 1.1rem;
        }
        
        .rating-text {
            color: #666;
            font-weight: 500;
        }
        
        .info-grid {
            display: grid;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .info-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1rem;
            background: rgba(26, 179, 148, 0.05);
            border-radius: 12px;
            border-left: 3px solid #1AB394;
            transition: all 0.3s ease;
        }
        
        .info-item:hover {
            background: rgba(26, 179, 148, 0.1);
            transform: translateX(5px);
        }
        
        .info-icon {
            color: #1AB394;
            font-size: 1.1rem;
            width: 20px;
            text-align: center;
        }
        
        .info-text {
            color: #555;
            font-weight: 500;
        }
        
        .section {
            margin-bottom: 2.5rem;
        }
        
        .section:last-of-type {
            margin-bottom: 0;
        }
        
        .section-title {
            color: #1AB394;
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .section-title::before {
            content: '';
            width: 4px;
            height: 20px;
            background: linear-gradient(135deg, #1AB394, #20d4aa);
            border-radius: 2px;
        }
        
        .skills-container {
            display: flex;
            gap: 0.75rem;
            flex-wrap: wrap;
        }
        
        .skill-tag {
            background: linear-gradient(135deg, #e8f8f5, #f0fbf9);
            color: #1AB394;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 500;
            border: 1px solid rgba(26, 179, 148, 0.2);
            transition: all 0.3s ease;
            cursor: default;
        }
        
        .skill-tag:hover {
            background: #1AB394;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(26, 179, 148, 0.3);
        }
        
        .experience-list {
            list-style: none;
            padding: 0;
        }
        
        .experience-item {
            color: #666;
            margin-bottom: 0.75rem;
            padding-left: 1.5rem;
            position: relative;
            line-height: 1.6;
        }
        
        .experience-item::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: #1AB394;
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .action-buttons {
            display: flex;
            gap: 1.5rem;
            justify-content: flex-start;
            margin-top: 2rem;
        }
        
        .btn {
            padding: 1rem 2.5rem;
            border-radius: 30px;
            text-decoration: none;
            text-align: center;
            font-weight: 600;
            font-size: 1.05rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            min-width: 160px;
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }
        
        .btn:hover::before {
            left: 100%;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #1AB394, #20d4aa);
            color: #fff;
            box-shadow: 0 5px 15px rgba(26, 179, 148, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.4);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #FF7043, #ff8a65);
            color: #fff;
            box-shadow: 0 5px 15px rgba(255, 112, 67, 0.3);
        }
        
        .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 112, 67, 0.4);
        }
        
        .content-wrapper {
            background: transparent;
            padding: 2rem;
            margin: 2rem auto;
            max-width: 1000px;
            flex: 1;
            padding-top: 100px;
        }
        
        @media (max-width: 768px) {
            .content-wrapper {
                padding: 1rem;
                margin: 1rem;
                padding-top: 80px;
            }
            
            .profile-card {
                grid-template-columns: 1fr;
                min-height: auto;
            }
            
            .profile-left {
                border-right: none;
                border-bottom: 1px solid rgba(26, 179, 148, 0.1);
                padding: 2rem 1.5rem;
            }
            
            .profile-right {
                padding: 2rem 1.5rem;
            }
            
            .avatar-image {
                width: 140px;
                height: 140px;
            }
            
            .employee-name-left {
                font-size: 1.8rem;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: stretch;
                gap: 1rem;
            }
            
            .btn {
                width: 100%;
                min-width: auto;
            }
            
            .quick-stats {
                flex-direction: row;
                justify-content: space-between;
            }
            
            .stat-item {
                flex: 1;
                text-align: center;
                margin: 0 0.25rem;
            }
            
            .stat-number {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body style="background: linear-gradient(135deg, #f8fffe 0%, #e6f3f2 100%); color: #333; font-family: 'Montserrat', 'Roboto', sans-serif; line-height: 1.6; margin: 0; padding: 0; display: flex; flex-direction: column; min-height: 100vh;">
    <%@ include file="/view/common/web/header.jsp" %>
    
    <div class="content-wrapper">
        <div class="profile-card">
            <!-- Left Side - Profile Avatar & Basic Info -->
            <div class="profile-left">
                <div class="brand-section">
                    <div class="brand-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <span style="font-weight: 600; color: #1AB394;">Giúp Việc 24h</span>
                </div>
                
                <div class="profile-avatar">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/housekeeper/profile.jpg" alt="Nguyễn Văn A" class="avatar-image">
                    <div class="avatar-status">
                        <i class="fas fa-check-circle"></i>
                    </div>
                </div>
                
                <h1 class="employee-name-left">Nguyễn Văn A</h1>
                
                <div class="rating-section-left">
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <span class="rating-text">4.7 (15 đánh giá)</span>
                </div>
                
                <div class="employee-badge">
                    <i class="fas fa-shield-alt"></i>
                    <span>Nhân viên đã xác thực</span>
                </div>
                
                <div class="quick-stats">
                    <div class="stat-item">
                        <div class="stat-number_">3+</div>
                        <div class="stat-label">Năm kinh nghiệm</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number_">50+</div>
                        <div class="stat-label">Khách hàng</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number_">140k</div>
                        <div class="stat-label">VNĐ/giờ</div>
                    </div>
                </div>
            </div>
            
            <!-- Right Side - Detailed Information -->
            <div class="profile-right">
                <div class="content-sections">
                    <!-- Info Grid -->
                    <div class="info-grid" style="margin-bottom: 2.5rem;">
                        <div class="info-item">
                            <i class="fas fa-map-marker-alt info-icon"></i>
                            <span class="info-text">Khu vực: Hải Châu, Đà Nẵng</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-clock info-icon"></i>
                            <span class="info-text">Thời gian làm việc: Buổi sáng (7:00 - 12:00)</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-money-bill-wave info-icon"></i>
                            <span class="info-text">Giá dịch vụ: 140,000 VNĐ/giờ (Tối thiểu 2 giờ)</span>
                        </div>
                    </div>
                    
                    <!-- Skills Section -->
                    <div class="section">
                        <h3 class="section-title">
                            <i class="fas fa-tools" style="color: #1AB394;"></i>
                            Chuyên môn
                        </h3>
                        <div class="skills-container">
                            <span class="skill-tag">Dọn dẹp nhà cửa</span>
                            <span class="skill-tag">Giặt ủi quần áo</span>
                            <span class="skill-tag">Vệ sinh bếp</span>
                        </div>
                    </div>
                    
                    <!-- Experience Section -->
                    <div class="section">
                        <h3 class="section-title">
                            <i class="fas fa-briefcase" style="color: #1AB394;"></i>
                            Kinh nghiệm làm việc
                        </h3>
                        <ul class="experience-list">
                            <li class="experience-item">3 năm kinh nghiệm trong lĩnh vực giúp việc theo giờ</li>
                            <li class="experience-item">Đã phục vụ hơn 50 hộ gia đình tại Đà Nẵng</li>
                            <li class="experience-item">Chuyên cung cấp dịch vụ dọn dẹp sạch sẽ, gọn gàng</li>
                        </ul>
                    </div>
                </div>
                
                <!-- Action Buttons -->
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/view/jsp/customer/booking.jsp" class="btn btn-secondary">
                        <i class="fas fa-handshake" style="margin-right: 0.5rem;"></i>
                        Thuê ngay
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="/view/common/web/footer.jsp" %>
</body>
</html>