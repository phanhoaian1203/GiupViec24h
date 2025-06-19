<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${housekeeper.fullName} - Chi Tiết Người Giúp Việc | Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #1a1a1a;
            background: #f9f9f7;
            overflow-x: hidden;
            padding-top: 80px; /* Increased from 60px to 80px for more spacing */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        /* Breadcrumb */
        .breadcrumb {
            position: relative;
            z-index: 900; /* Below header but above content */
            background: #f9f9f7;
            padding: 0.75rem 0;
            border-bottom: 1px solid #e0e0e0;
        }

        .breadcrumb-nav {
            display: flex;
            align-items: center;
            gap: 0.4rem;
            font-size: 0.85rem;
            color: #666;
        }

        .breadcrumb-nav a {
            color: #c0a987;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .breadcrumb-nav a:hover {
            color: #a68e6e;
        }

        .breadcrumb-nav i {
            color: #666;
            font-size: 0.6rem;
        }

        /* Main Content Layout */
        .detail-section {
            padding-top: 30px; /* Adjusted to maintain layout with increased body padding */
            padding-bottom: 3rem;
            background: #ffffff;
            min-height: 100vh;
        }

        /* Main Content Layout */
        .detail-content {
            display: grid;
            grid-template-columns: 380px 1fr;
            gap: 2.5rem;
            margin-top: 1.5rem;
        }

        /* Profile Card */
        .profile-card {
            background: #f5f5f1;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky;
            top: 130px; /* Adjusted for increased header + breadcrumb spacing */
            height: fit-content;
        }

        .profile-image-container {
            position: relative;
            height: 300px;
            overflow: hidden;
        }

        .profile-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .profile-image:hover {
            transform: scale(1.02);
        }

        .status-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #22c55e;
            color: white;
            padding: 0.4rem 0.8rem;
            border-radius: 15px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            gap: 0.2rem;
        }

        .status-badge.unavailable {
            background: #ef4444;
        }

        .status-badge i {
            width: 6px;
            height: 6px;
            background: currentColor;
            border-radius: 50%;
        }

        .profile-info {
            padding: 1.5rem;
        }

        .profile-name {
            font-size: 1.6rem;
            font-weight: 800;
            color: #1a1a1a;
            margin-bottom: 0.4rem;
            letter-spacing: -0.02em;
        }

        .profile-rating {
            display: flex;
            align-items: center;
            gap: 0.4rem;
            margin-bottom: 1rem;
        }

        .stars {
            display: flex;
            gap: 0.15rem;
        }

        .star {
            color: #fbbf24;
            font-size: 1rem;
        }

        .star.empty {
            color: #d1d5db;
        }

        .rating-text {
            font-size: 0.85rem;
            color: #666;
            font-weight: 500;
        }

        .profile-location {
            display: flex;
            align-items: center;
            gap: 0.4rem;
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 1.2rem;
        }

        .profile-location i {
            color: #c0a987;
            width: 14px;
        }

        .quick-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.8rem;
            margin-bottom: 1.5rem;
        }

        .stat-item {
            text-align: center;
            padding: 0.8rem;
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
        }

        .stat-value {
            font-size: 1.2rem;
            font-weight: 700;
            color: #c0a987;
            margin-bottom: 0.2rem;
        }

        .stat-label {
            font-size: 0.75rem;
            color: #666;
            text-transform: uppercase;
            font-weight: 500;
            letter-spacing: 0.05em;
        }

        .price-section {
            background: #ffffff;
            border: 2px solid #c0a987;
            border-radius: 6px;
            padding: 1.2rem;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .price-title {
            font-size: 0.85rem;
            color: #666;
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            font-weight: 500;
        }

        .price-value {
            font-size: 1.8rem;
            font-weight: 800;
            color: #c0a987;
            margin-bottom: 0.4rem;
        }

        .price-note {
            font-size: 0.75rem;
            color: #666;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.8rem 1.2rem;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            cursor: pointer;
            border-radius: 6px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .btn-primary {
            background: #c0a987;
            color: #ffffff;
            border-color: #c0a987;
        }

        .btn-primary:hover {
            background: #a68e6e;
            transform: translateY(-1px);
            box-shadow: 0 2px 10px rgba(192, 169, 135, 0.2);
        }

        .btn-secondary {
            background: transparent;
            color: #666;
            border-color: #e0e0e0;
        }

        .btn-secondary:hover {
            background: #e0e0e0;
            color: #1a1a1a;
            transform: translateY(-1px);
        }

        .btn i {
            margin-right: 0.4rem;
        }

        /* Detail Info */
        .detail-info {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .detail-header {
            background: #f5f5f1;
            padding: 1.5rem;
            border-bottom: 1px solid #e0e0e0;
        }

        .detail-title {
            font-size: 2rem;
            font-weight: 800;
            color: #1a1a1a;
            margin-bottom: 0.4rem;
            text-transform: uppercase;
            letter-spacing: -0.02em;
        }

        .detail-subtitle {
            color: #666;
            font-size: 1rem;
            font-weight: 500;
        }

        .detail-tabs {
            display: flex;
            background: #ffffff;
            border-bottom: 1px solid #e0e0e0;
            padding: 0.2rem;
        }

        .tab-button {
            flex: 1;
            padding: 0.6rem 1rem;
            background: none;
            border: none;
            font-size: 0.85rem;
            font-weight: 600;
            color: #666;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border-bottom: 2px solid transparent;
        }

        .tab-button.active {
            color: #c0a987;
            border-bottom-color: #c0a987;
        }

        .tab-button:hover:not(.active) {
            color: #1a1a1a;
            background: #f5f5f1;
        }

        .tab-content {
            padding: 1.5rem;
        }

        .tab-panel {
            display: none;
        }

        .tab-panel.active {
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Skills Section */
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 0.8rem;
            margin-bottom: 1.5rem;
        }

        .skill-item {
            background: #f5f5f1;
            padding: 0.8rem;
            border-radius: 6px;
            border: 1px solid #e0e0e0;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            transition: all 0.3s ease;
        }

        .skill-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-color: #c0a987;
        }

        .skill-icon {
            width: 30px;
            height: 30px;
            background: #c0a987;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1rem;
            flex-shrink: 0;
        }

        .skill-text {
            font-weight: 600;
            color: #1a1a1a;
            font-size: 0.85rem;
        }

        /* About Section */
        .about-text {
            font-size: 0.95rem;
            line-height: 1.7;
            color: #666;
            margin-bottom: 1.5rem;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.2rem;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            padding: 0.8rem;
            background: #f9f9f7;
            border-radius: 6px;
            border: 1px solid #e0e0e0;
        }

        .info-icon {
            width: 35px;
            height: 35px;
            background: #c0a987;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1rem;
            flex-shrink: 0;
        }

        .info-content h4 {
            font-size: 0.8rem;
            color: #666;
            margin-bottom: 0.2rem;
            text-transform: uppercase;
            font-weight: 500;
            letter-spacing: 0.05em;
        }

        .info-content p {
            font-size: 0.95rem;
            color: #1a1a1a;
            font-weight: 600;
        }

        /* Reviews Section */
        .reviews-summary {
            background: #f5f5f1;
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .review-score {
            font-size: 2.5rem;
            font-weight: 800;
            color: #c0a987;
            margin-bottom: 0.4rem;
        }

        .review-stars {
            display: flex;
            justify-content: center;
            gap: 0.2rem;
            margin-bottom: 0.8rem;
        }

        .review-stars .star {
            font-size: 1.2rem;
        }

        .review-count {
            color: #666;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .reviews-list {
            display: flex;
            flex-direction: column;
            gap: 1.2rem;
        }

        .review-item {
            background: #f9f9f7;
            padding: 1.2rem;
            border-radius: 6px;
            border: 1px solid #e0e0e0;
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.8rem;
        }

        .reviewer-info {
            display: flex;
            align-items: center;
            gap: 0.6rem;
        }

        .reviewer-avatar {
            width: 30px;
            height: 30px;
            background: #c0a987;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1rem;
        }

        .reviewer-name {
            font-weight: 600;
            color: #1a1a1a;
            font-size: 0.9rem;
        }

        .review-date {
            color: #999;
            font-size: 0.8rem;
        }

        .review-rating {
            display: flex;
            gap: 0.15rem;
        }

        .review-text {
            color: #666;
            line-height: 1.6;
            font-size: 0.9rem;
        }

        /* Availability Section */
        .availability-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 0.4rem;
            margin-bottom: 1.5rem;
        }

        .day-card {
            text-align: center;
            padding: 0.6rem 0.4rem;
            background: #f9f9f7;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .day-card.available {
            background: #dcfce7;
            border-color: #22c55e;
            color: #166534;
        }

        .day-card.busy {
            background: #fee2e2;
            border-color: #ef4444;
            color: #dc2626;
        }

        .day-name {
            font-size: 0.7rem;
            font-weight: 500;
            text-transform: uppercase;
            margin-bottom: 0.2rem;
        }

        .day-status {
            font-size: 0.65rem;
            font-weight: 400;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .detail-content {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .profile-card {
                position: static;
                margin-bottom: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            body {
                padding-top: 70px; /* Increased from 50px to 70px for more spacing */
            }

            .detail-section {
                padding-top: 25px; /* Adjusted to maintain layout */
            }

            .detail-content {
                gap: 1rem;
            }

            .profile-image-container {
                height: 220px;
            }

            .profile-info {
                padding: 1rem;
            }

            .profile-name {
                font-size: 1.4rem;
            }

            .detail-title {
                font-size: 1.6rem;
            }

            .detail-tabs {
                flex-direction: column;
            }

            .tab-button {
                padding: 0.4rem 0.8rem;
            }

            .skills-grid {
                grid-template-columns: 1fr;
            }

            .availability-grid {
                grid-template-columns: repeat(3, 1fr);
                gap: 0.6rem;
            }

            .quick-stats {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 0.5rem;
            }

            body {
                padding-top: 65px; /* Increased from 45px to 65px for more spacing */
            }

            .detail-section {
                padding-top: 20px; /* Adjusted to maintain layout */
            }

            .profile-image-container {
                height: 180px;
            }

            .detail-header {
                padding: 1rem;
            }

            .detail-title {
                font-size: 1.4rem;
            }

            .action-buttons {
                gap: 0.5rem;
            }

            .btn {
                padding: 0.6rem 1rem;
                font-size: 0.8rem;
            }
        }

        /* Loading Animation */
        body {
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        body.loaded {
            opacity: 1;
        }

        /* Notification Styles */
        .notification {
            position: fixed;
            top: 80px; /* Adjusted to match new body padding-top */
            right: 20px;
            padding: 0.8rem 1.2rem;
            background: #c0a987;
            color: white;
            border-radius: 6px;
            font-weight: 600;
            z-index: 10000;
            transform: translateX(100%);
            transition: transform 0.3s ease;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .notification.success {
            background: #c0a987;
        }

        .notification.info {
            background: #3b82f6;
        }
    </style>
</head>
<body>
    <%-- Include header --%>
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Breadcrumb -->
    <section class="breadcrumb">
        <div class="container">
            <nav class="breadcrumb-nav">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                <i class="fas fa-chevron-right"></i>
                <a href="${pageContext.request.contextPath}/hire">Thuê người giúp việc</a>
                <i class="fas fa-chevron-right"></i>
                <span>${housekeeper.fullName}</span>
            </nav>
        </div>
    </section>

    <!-- Main Content -->
    <section class="detail-section">
        <div class="container">
            <div class="detail-content">
                <!-- Profile Card -->
                <div class="profile-card">
                    <div class="profile-image-container">
                        <img src="${pageContext.request.contextPath}/${housekeeper.profileImageUrl}" 
                             alt="${housekeeper.fullName}" 
                             class="profile-image"
                             onerror="this.src='${pageContext.request.contextPath}/view/assets/profile/default.jpg'">
                        
                        <c:choose>
                            <c:when test="${housekeeper.active}">
                                <div class="status-badge">
                                    <i></i>
                                    Có sẵn
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="status-badge unavailable">
                                    <i></i>
                                    Không có sẵn
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="profile-info">
                        <h1 class="profile-name">${housekeeper.fullName}</h1>
                        
                        <div class="profile-rating">
                            <div class="stars">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= (housekeeper.averageRating != null ? housekeeper.averageRating : 4)}">
                                            <i class="fas fa-star star"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-star star empty"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <span class="rating-text">
                                <c:choose>
                                    <c:when test="${housekeeper.averageRating != null}">
                                        <fmt:formatNumber value="${housekeeper.averageRating}" pattern="#.#" minFractionDigits="1"/>
                                    </c:when>
                                    <c:otherwise>4.0</c:otherwise>
                                </c:choose>
                                (${housekeeper.bookingCount} đánh giá)
                            </span>
                        </div>

                        <div class="profile-location">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>${housekeeper.workAreas}, Đà Nẵng</span>
                        </div>

                        <div class="quick-stats">
                            <div class="stat-item">
                                <div class="stat-value">${housekeeper.experienceYears}</div>
                                <div class="stat-label">Năm kinh nghiệm</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-value">${housekeeper.bookingCount}</div>
                                <div class="stat-label">Lần được thuê</div>
                            </div>
                        </div>

                        <div class="price-section">
                            <div class="price-title">Giá dịch vụ</div>
                            <div class="price-value">
                                <fmt:formatNumber value="${housekeeper.hourlyRate}" type="number" groupingUsed="true"/>đ
                            </div>
                            <div class="price-note">mỗi giờ làm việc</div>
                        </div>

                        <div class="action-buttons">
                            <a href="${pageContext.request.contextPath}/booking?housekeeperId=${housekeeper.userId}" class="btn btn-primary">
                                <i class="fas fa-calendar-check"></i>
                                Thuê ngay
                            </a>
                            <a href="tel:${housekeeper.phoneNumber}" class="btn btn-secondary">
                                <i class="fas fa-phone"></i>
                                Gọi điện
                            </a>
                            <button class="btn btn-secondary" onclick="toggleFavorite()">
                                <i class="far fa-heart" id="favoriteIcon"></i>
                                Yêu thích
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Detail Info -->
                <div class="detail-info">
                    <div class="detail-header">
                        <h2 class="detail-title">Thông tin chi tiết</h2>
                        <p class="detail-subtitle">Tìm hiểu thêm về ${housekeeper.fullName} và dịch vụ của cô ấy</p>
                    </div>

                    <div class="detail-tabs">
                        <button class="tab-button active" onclick="showTab('skills')">Kỹ năng</button>
                        <button class="tab-button" onclick="showTab('about')">Giới thiệu</button>
                        <button class="tab-button" onclick="showTab('reviews')">Đánh giá</button>
                        <button class="tab-button" onclick="showTab('availability')">Lịch trống</button>
                    </div>

                    <div class="tab-content">
                        <!-- Skills Tab -->
                        <div id="skills" class="tab-panel active">
                            <div class="skills-grid">
                                <c:choose>
                                    <c:when test="${not empty housekeeper.skills}">
                                        <c:forEach var="skill" items="${fn:split(housekeeper.skills, ',')}" varStatus="skillStatus">
                                            <div class="skill-item">
                                                <div class="skill-icon">
                                                    <c:choose>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Giup viec theo gio')}">
                                                            <i class="fas fa-clock"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Giup viec theo ngay')}">
                                                            <i class="fas fa-calendar-day"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Giup viec theo thang')}">
                                                            <i class="fas fa-calendar-alt"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Tong ve sinh')}">
                                                            <i class="fas fa-broom"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Ve sinh tham')}">
                                                            <i class="fas fa-couch"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Ve sinh may lanh')}">
                                                            <i class="fas fa-snowflake"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Ve sinh may giat')}">
                                                            <i class="fas fa-tshirt"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Cham soc nguoi gia')}">
                                                            <i class="fas fa-user-friends"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Cham soc tre em')}">
                                                            <i class="fas fa-baby"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Cham soc nguoi benh')}">
                                                            <i class="fas fa-user-md"></i>
                                                        </c:when>
                                                        <c:when test="${fn:contains(fn:trim(skill), 'Nau an')}">
                                                            <i class="fas fa-utensils"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fas fa-star"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="skill-text">${fn:trim(skill)}</div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="skill-item">
                                            <div class="skill-icon">
                                                <i class="fas fa-broom"></i>
                                            </div>
                                            <div class="skill-text">Giúp việc nhà</div>
                                        </div>
                                        <div class="skill-item">
                                            <div class="skill-icon">
                                                <i class="fas fa-sparkles"></i>
                                            </div>
                                            <div class="skill-text">Dọn dẹp</div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- About Tab -->
                        <div id="about" class="tab-panel">
                            <div class="about-text">
                                <p>Xin chào! Tôi là <strong>${housekeeper.fullName}</strong>, một người giúp việc chuyên nghiệp với 
                                   <strong>${housekeeper.experienceYears} năm kinh nghiệm</strong> trong lĩnh vực dịch vụ gia đình tại Đà Nẵng.</p>
                                
                                <p>Tôi cam kết mang đến cho gia đình bạn dịch vụ chất lượng cao nhất với sự tận tâm và chu đáo. 
                                   Với kinh nghiệm phong phú và kỹ năng chuyên môn, tôi sẽ giúp ngôi nhà của bạn luôn sạch sẽ, 
                                   gọn gàng và thoải mái.</p>
                                
                                <p>Tôi luôn đặt sự hài lòng của khách hàng lên hàng đầu và không ngừng học hỏi để nâng cao 
                                   chất lượng dịch vụ. Hãy để tôi được phục vụ gia đình bạn!</p>
                            </div>

                            <div class="info-grid">
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-birthday-cake"></i>
                                    </div>
                                    <div class="info-content">
                                        <h4>Năm sinh</h4>
                                        <p>${housekeeper.birthYear}</p>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-venus-mars"></i>
                                    </div>
                                    <div class="info-content">
                                        <h4>Giới tính</h4>
                                        <p>
                                            <c:choose>
                                                <c:when test="${housekeeper.gender == 'male'}">Nam</c:when>
                                                <c:when test="${housekeeper.gender == 'female'}">Nữ</c:when>
                                                <c:otherwise>Khác</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-home"></i>
                                    </div>
                                    <div class="info-content">
                                        <h4>Quê quán</h4>
                                        <p>${housekeeper.hometown}</p>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-phone"></i>
                                    </div>
                                    <div class="info-content">
                                        <h4>Điện thoại</h4>
                                        <p>${housekeeper.phoneNumber}</p>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-map-marked-alt"></i>
                                    </div>
                                    <div class="info-content">
                                        <h4>Khu vực làm việc</h4>
                                        <p>${housekeeper.workAreas}</p>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-medal"></i>
                                    </div>
                                    <div class="info-content">
                                        <h4>Kinh nghiệm</h4>
                                        <p>${housekeeper.experienceYears} năm</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Reviews Tab -->
                        <div id="reviews" class="tab-panel">
                            <div class="reviews-summary">
                                <div class="review-score">
                                    <c:choose>
                                        <c:when test="${housekeeper.averageRating != null}">
                                            <fmt:formatNumber value="${housekeeper.averageRating}" pattern="#.#" minFractionDigits="1"/>
                                        </c:when>
                                        <c:otherwise>4.0</c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="review-stars">
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:choose>
                                            <c:when test="${i <= (housekeeper.averageRating != null ? housekeeper.averageRating : 4)}">
                                                <i class="fas fa-star star"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-star star empty"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                                <div class="review-count">Dựa trên ${housekeeper.bookingCount} đánh giá</div>
                            </div>

                            <div class="reviews-list">
                                <!-- Sample Reviews - In real app, these would come from database -->
                                <div class="review-item">
                                    <div class="review-header">
                                        <div class="reviewer-info">
                                            <div class="reviewer-avatar">A</div>
                                            <div>
                                                <div class="reviewer-name">Anh Tuấn</div>
                                                <div class="review-date">2 tuần trước</div>
                                            </div>
                                        </div>
                                        <div class="review-rating">
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                        </div>
                                    </div>
                                    <div class="review-text">
                                        Dịch vụ rất tốt! ${housekeeper.fullName} làm việc rất tận tâm và chu đáo. 
                                        Nhà tôi được dọn dẹp sạch sẽ, gọn gàng. Sẽ sử dụng dịch vụ lần nữa.
                                    </div>
                                </div>

                                <div class="review-item">
                                    <div class="review-header">
                                        <div class="reviewer-info">
                                            <div class="reviewer-avatar">M</div>
                                            <div>
                                                <div class="reviewer-name">Chị Mai</div>
                                                <div class="review-date">1 tháng trước</div>
                                            </div>
                                        </div>
                                        <div class="review-rating">
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star empty"></i>
                                        </div>
                                    </div>
                                    <div class="review-text">
                                        Làm việc nhanh gọn, đúng giờ. Giá cả hợp lý. Tuy nhiên cần chú ý hơn một chút 
                                        ở việc dọn dẹp góc khuất.
                                    </div>
                                </div>

                                <div class="review-item">
                                    <div class="review-header">
                                        <div class="reviewer-info">
                                            <div class="reviewer-avatar">L</div>
                                            <div>
                                                <div class="reviewer-name">Chị Linh</div>
                                                <div class="review-date">2 tháng trước</div>
                                            </div>
                                        </div>
                                        <div class="review-rating">
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                            <i class="fas fa-star star"></i>
                                        </div>
                                    </div>
                                    <div class="review-text">
                                        Rất hài lòng với dịch vụ! Cô ấy rất thân thiện và chuyên nghiệp. 
                                        Sẽ giới thiệu cho bạn bè.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Availability Tab -->
                        <div id="availability" class="tab-panel">
                            <h3 style="margin-bottom: 1.2rem; color: #1a1a1a; font-weight: 600;">Lịch trống trong tuần</h3>
                            <div class="availability-grid">
                                <div class="day-card available">
                                    <div class="day-name">Thứ 2</div>
                                    <div class="day-status">Có thể</div>
                                </div>
                                <div class="day-card available">
                                    <div class="day-name">Thứ 3</div>
                                    <div class="day-status">Có thể</div>
                                </div>
                                <div class="day-card busy">
                                    <div class="day-name">Thứ 4</div>
                                    <div class="day-status">Bận</div>
                                </div>
                                <div class="day-card available">
                                    <div class="day-name">Thứ 5</div>
                                    <div class="day-status">Có thể</div>
                                </div>
                                <div class="day-card available">
                                    <div class="day-name">Thứ 6</div>
                                    <div class="day-status">Có thể</div>
                                </div>
                                <div class="day-card available">
                                    <div class="day-name">Thứ 7</div>
                                    <div class="day-status">Có thể</div>
                                </div>
                                <div class="day-card busy">
                                    <div class="day-name">CN</div>
                                    <div class="day-status">Bận</div>
                                </div>
                            </div>

                            <div style="background: #f9f9f7; padding: 1.2rem; border-radius: 6px; margin-top: 1.5rem;">
                                <h4 style="color: #1a1a1a; margin-bottom: 0.8rem; font-weight: 600;">
                                    <i class="fas fa-info-circle" style="color: #c0a987; margin-right: 0.4rem;"></i>
                                    Lưu ý về lịch làm việc
                                </h4>
                                <ul style="color: #666; line-height: 1.5; padding-left: 1rem;">
                                    <li>Lịch trống có thể thay đổi theo thời gian thực</li>
                                    <li>Đặt lịch trước ít nhất 2 giờ để đảm bảo có thể phục vụ</li>
                                    <li>Có thể làm việc ngoài giờ theo thỏa thuận</li>
                                    <li>Liên hệ trực tiếp để biết thêm chi tiết về lịch trống</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%-- Include footer --%>
    <%@ include file="/view/common/web/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.body.classList.add('loaded');
            console.log('🏠 Housekeeper detail page loaded successfully');
            console.log('👤 Viewing profile:', '${housekeeper.fullName}');
        });

        function showTab(tabName) {
            document.querySelectorAll('.tab-panel').forEach(panel => panel.classList.remove('active'));
            document.querySelectorAll('.tab-button').forEach(button => button.classList.remove('active'));
            document.getElementById(tabName).classList.add('active');
            event.target.classList.add('active');
        }

        function toggleFavorite() {
            const icon = document.getElementById('favoriteIcon');
            const isFavorited = icon.classList.contains('fas');
            if (isFavorited) {
                icon.classList.remove('fas');
                icon.classList.add('far');
                showNotification('Đã xóa khỏi danh sách yêu thích', 'info');
            } else {
                icon.classList.remove('far');
                icon.classList.add('fas');
                showNotification('Đã thêm vào danh sách yêu thích', 'success');
            }
        }

        function showNotification(message, type = 'info') {
            const notification = document.createElement('div');
            notification.className = 'notification';
            let backgroundColor = type === 'success' ? '#c0a987' : '#3b82f6';
            notification.style.cssText = `
                position: fixed;
                top: 80px;
                right: 20px;
                padding: 0.8rem 1.2rem;
                background: ${backgroundColor};
                color: white;
                border-radius: 6px;
                font-weight: 600;
                z-index: 10000;
                transform: translateX(100%);
                transition: transform 0.3s ease;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            `;
            notification.textContent = message;
            document.body.appendChild(notification);
            setTimeout(() => notification.style.transform = 'translateX(0)', 100);
            setTimeout(() => {
                notification.style.transform = 'translateX(100%)';
                setTimeout(() => document.body.removeChild(notification), 300);
            }, 3000);
        }

        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
        });

        document.querySelectorAll('img').forEach(img => {
            img.addEventListener('error', function() {
                this.src = '${pageContext.request.contextPath}/view/assets/profile/default.jpg';
            });
        });

        document.querySelectorAll('.btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                if (this.href && this.href.includes('booking')) {
                    const originalText = this.innerHTML;
                    this.innerHTML = '<i class="fas fa-spinner fa-spin" style="margin-right: 0.4rem;"></i>Đang xử lý...';
                    this.style.pointerEvents = 'none';
                    setTimeout(() => {
                        this.innerHTML = originalText;
                        this.style.pointerEvents = 'auto';
                    }, 2000);
                }
            });
        });

        document.querySelectorAll('.skill-item').forEach(item => {
            item.addEventListener('mouseenter', function() { this.style.transform = 'translateY(-2px)'; });
            item.addEventListener('mouseleave', function() { this.style.transform = 'translateY(0)'; });
        });

        document.querySelectorAll('a[href^="tel:"]').forEach(tel => {
            tel.addEventListener('click', function(e) { showNotification('Đang gọi điện...', 'info'); });
        });
    </script>
</body>
</html>