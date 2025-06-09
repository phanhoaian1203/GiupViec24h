<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Thuê Nhân Viên Dọn Dẹp Đà Nẵng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <%@ include file="/view/common/web/add_css.jsp" %>
    <style>
        :root {
            --primary-color: #1AB394;
            --primary-dark: #18a085;
            --primary-light: #e8f8f5;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --gray: #e0e0e0;
            --text-dark: #333333;
            --accent: #FF7043;
            --shadow: 0 4px 20px rgba(26, 179, 148, 0.1);
            --shadow-hover: 0 8px 30px rgba(26, 179, 148, 0.2);
            --hire-color: #FF7043;
            --hire-dark: #e65b2f;
        }

        html {
            scroll-behavior: smooth;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', 'Roboto', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f8fffe 0%, #e8f8f5 100%);
            color: var(--text-dark);
            line-height: 1.7;
            position: relative;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 80px;
            background: var(--white);
            z-index: 1100;
            box-shadow: var(--shadow);
        }

        .banner {
            position: relative;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding-top: 80px;
            width: 100vw;
            margin-left: calc(-50vw + 50%);
            background-size: cover;
            background-position: center;
        }

        .banner img {
            width: 100%;
            height: 100vh;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
        }

        .banner .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 2;
        }

        .banner-content {
            position: relative;
            z-index: 3;
            text-align: center;
            color: var(--white);
            max-width: 900px;
            padding: 2rem 1.5rem;
            width: 100%;
        }

        .banner-content h1 {
            font-size: clamp(2rem, 4vw, 3rem);
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--white);
        }

        .banner-tagline {
            font-size: clamp(1rem, 2vw, 1.2rem);
            color: var(--white);
            opacity: 0.8;
            margin-bottom: 2rem;
        }

        .search-section {
            background: var(--white);
            padding: 1.2rem 0;
            box-shadow: var(--shadow);
            width: 100%;
            z-index: 1000;
        }

        .search-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1.5rem;
        }

        .search-form {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 120px;
            gap: 1rem;
            align-items: center;
            background: var(--gray-light);
            padding: 1.2rem;
            border-radius: 12px;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .form-group {
            position: relative;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--text-dark);
            font-size: 0.9rem;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid var(--gray);
            border-radius: 8px;
            font-size: 0.95rem;
            background: var(--white);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.1);
        }

        .search-input {
            position: relative;
        }

        .search-input i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            font-size: 1.1rem;
        }

        .search-input input {
            padding-left: 2.5rem;
        }

        .btn-search {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: var(--white);
            border: none;
            padding: 0.8rem 1.2rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-hover);
        }

        .content-wrapper {
            padding-top: 80px;
        }

        .booking-section {
            padding: 3.5rem 0;
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            gap: 2.5rem;
            padding: 0 2rem;
        }

        .sidebar {
            width: 300px;
            background: var(--white);
            padding: 2rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            position: sticky;
            top: 120px;
            height: fit-content;
            transition: transform 0.3s ease;
        }

        .sidebar-title {
            font-size: 1.5rem;
            color: var(--primary-dark);
            margin-bottom: 1.8rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.6rem;
        }

        .sidebar-title i {
            color: var(--primary-color);
        }

        .filter-group {
            margin-bottom: 2.5rem;
        }

        .filter-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 1.2rem;
            color: var(--text-dark);
            padding-bottom: 0.6rem;
            border-bottom: 2px solid var(--primary-light);
        }

        .service-list {
            list-style: none;
        }

        .service-list li {
            margin-bottom: 0.9rem;
            display: flex;
            align-items: center;
            padding: 0.9rem 1.2rem;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .service-list input[type="checkbox"] {
            margin-right: 0.8rem;
            accent-color: var(--primary-color);
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .service-list label {
            color: var(--text-dark);
            font-size: 0.95rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            width: 100%;
            cursor: pointer;
        }

        .service-list i {
            margin-right: 0.8rem;
            width: 20px;
            color: var(--primary-color);
        }

        .service-list input:checked + label {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: var(--white);
            padding: 0.9rem;
            border-radius: 10px;
        }

        .service-list input:checked + label i {
            color: var(--white);
        }

        .price-range {
            margin-top: 1.2rem;
        }

        .price-inputs {
            display: flex;
            gap: 0.6rem;
            align-items: center;
        }

        .price-inputs input {
            width: 90px;
            padding: 0.6rem;
            border: 1px solid var(--gray);
            border-radius: 8px;
            text-align: center;
            font-size: 0.9rem;
        }

        .main-content {
            flex: 1;
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
        }

        .booking-title {
            color: var(--primary-dark);
            font-size: 2.2rem;
            font-weight: 700;
            position: relative;
            padding-bottom: 0.6rem;
        }

        .booking-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 70px;
            height: 4px;
            background: var(--primary-color);
            transition: width 0.3s ease;
        }

        .booking-title:hover::after {
            width: 90px;
        }

        .results-count {
            color: #666;
            font-size: 1rem;
        }

        .sort-options {
            display: flex;
            gap: 1.2rem;
            align-items: center;
        }

        .sort-select {
            padding: 0.6rem 1.2rem;
            border: 1px solid var(--gray);
            border-radius: 8px;
            background: var(--white);
            font-size: 0.95rem;
        }

        .helper-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .helper-card {
            background: var(--white);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            border: 1px solid rgba(26, 179, 148, 0.1);
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .helper-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-hover);
        }

        .helper-image-container {
            position: relative;
            overflow: hidden;
            height: 200px;
        }

        .helper-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .helper-card:hover .helper-image {
            transform: scale(1.08);
        }

        .helper-status {
            position: absolute;
            top: 12px;
            right: 12px;
            background: rgba(26, 179, 148, 0.9);
            color: var(--white);
            padding: 0.4rem 0.9rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .helper-discount {
            position: absolute;
            top: 12px;
            left: 12px;
            background: linear-gradient(135deg, var(--accent), #ff5722);
            color: var(--white);
            padding: 0.4rem 0.9rem;
            border-radius: 16px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .helper-info {
            padding: 1.5rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .helper-header {
            margin-bottom: 1rem;
        }

        .helper-name {
            font-size: 1.3rem;
            color: var(--primary-dark);
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .helper-location {
            font-size: 0.95rem;
            color: #666;
            display: flex;
            align-items: center;
            gap: 0.4rem;
            margin-bottom: 0.5rem;
        }

        .helper-location i {
            color: var(--primary-color);
        }

        .helper-rating {
            display: flex;
            align-items: center;
            gap: 0.4rem;
            background: var(--primary-light);
            padding: 0.4rem 0.8rem;
            border-radius: 12px;
            width: fit-content;
        }

        .helper-rating i {
            color: #ffca28;
            font-size: 0.95rem;
        }

        .helper-rating span {
            font-size: 0.9rem;
            color: var(--text-dark);
        }

        .helper-specialties {
            margin: 1rem 0;
        }

        .specialty-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }

        .specialty-tag {
            background: var(--primary-light);
            color: var(--primary-dark);
            padding: 0.3rem 0.7rem;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .helper-footer {
            padding-top: 1rem;
            border-top: 1px solid var(--gray-light);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .helper-price {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .price-note {
            font-size: 0.85rem;
            color: #666;
            margin-bottom: 1rem;
        }

        .btn-book {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: var(--white);
            text-decoration: none;
            padding: 0.7rem 1.4rem;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            min-width: 120px;
            text-align: center;
        }

        .btn-book:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(26, 179, 148, 0.3);
        }

        .btn-hire {
            background: linear-gradient(135deg, var(--hire-color), var(--hire-dark));
            color: var(--white);
            text-decoration: none;
            padding: 0.7rem 1.4rem;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.95rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            min-width: 120px;
            text-align: center;
        }

        .btn-hire:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(255, 112, 67, 0.3);
        }

        @media (max-width: 1024px) {
            .search-form {
                grid-template-columns: 2fr 1fr 1fr 120px;
                gap: 0.8rem;
            }

            .booking-section {
                gap: 1.5rem;
            }

            .sidebar {
                width: 280px;
            }
        }

        @media (max-width: 768px) {
            .banner {
                min-height: calc(100vh - 70px);
                margin-left: 0;
                width: 100%;
            }

            .banner h1 {
                font-size: 2.2rem;
            }

            .banner-tagline {
                font-size: 1.2rem;
            }

            .booking-section {
                flex-direction: column;
                padding: 2rem 1rem;
            }

            .sidebar {
                width: 100%;
                position: static;
                margin-bottom: 2rem;
            }

            .search-form {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .btn-search {
                width: 100%;
            }

            .content-header {
                flex-direction: column;
                gap: 1.2rem;
            }

            .sort-options {
                width: 100%;
                justify-content: space-between;
            }

            .helper-list {
                grid-template-columns: 1fr;
            }

            .booking-title {
                font-size: 1.8rem;
            }

            .content-wrapper {
                padding-top: 80px;
            }
        }

        @media (max-width: 480px) {
            .banner h1 {
                font-size: 1.8rem;
            }

            .banner-tagline {
                font-size: 1rem;
            }

            .booking-section {
                padding: 1.5rem 1rem;
            }

            .sidebar {
                padding: 1.5rem;
            }

            .search-container {
                padding: 0 1rem;
            }

            .helper-image {
                height: 180px;
            }

            .helper-name {
                font-size: 1.1rem;
            }

            .helper-price {
                font-size: 1.1rem;
            }

            .btn-book, .btn-hire {
                min-width: 100px;
                padding: 0.6rem 1rem;
                font-size: 0.9rem;
            }

            .helper-footer {
                flex-direction: column;
                align-items: center;
            }

            .content-wrapper {
                padding-top: 80px;
            }

            .booking-title {
                font-size: 1.6rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="/view/common/web/header.jsp" %>

    <section class="banner">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner_hire.jpg" alt="Banner Thuê Nhân Viên Dọn Dẹp">
        <div class="overlay"></div>
        <div class="banner-content">
            <h1 class="animate__animated animate__fadeIn">Thuê Nhân Viên Dọn Dẹp Đà Nẵng</h1>
            <p class="banner-tagline animate__animated animate__fadeIn animate__delay-1s">Dịch vụ giúp việc chuyên nghiệp, đáng tin cậy, mang đến không gian sống sạch sẽ và thoải mái tại Đà Nẵng.</p>
        </div>
    </section>

    <section class="search-section">
        <div class="search-container">
            <form class="search-form" id="searchForm">
                <div class="form-group search-input">
                    <label for="search">Tìm kiếm</label>
                    <i class="fas fa-search"></i>
                    <input type="text" id="search" placeholder="Tìm theo tên hoặc địa điểm..." />
                </div>
                <div class="form-group">
                    <label for="district">Quận/Huyện</label>
                    <select id="district">
                        <option value="">Tất cả</option>
                        <option value="hai-chau">Hải Châu</option>
                        <option value="thanh-khe">Thanh Khê</option>
                        <option value="son-tra">Sơn Trà</option>
                        <option value="ngu-hanh-son">Ngũ Hành Sơn</option>
                        <option value="lien-chieu">Liên Chiểu</option>
                        <option value="cam-le">Cẩm Lệ</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="time">Thời gian</label>
                    <select id="time">
                        <option value="">Tất cả</option>
                        <option value="morning">Buổi sáng</option>
                        <option value="afternoon">Buổi chiều</option>
                        <option value="evening">Buổi tối</option>
                        <option value="fullday">Cả ngày</option>
                    </select>
                </div>
                <button type="submit" class="btn-search">Tìm kiếm</button>
            </form>
        </div>
    </section>

    <div class="content-wrapper">
        <section class="booking-section">
            <div class="sidebar">
                <h3 class="sidebar-title">
                    <i class="fas fa-filter"></i>
                    Bộ lọc dịch vụ
                </h3>
                
                <div class="filter-group">
                    <div class="filter-title">Loại dịch vụ</div>
                    <ul class="service-list">
                        <li>
                            <input type="checkbox" id="service-hourly" name="services" value="Giúp việc theo giờ" checked>
                            <label for="service-hourly"><i class="fas fa-clock"></i> Giúp việc theo giờ</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-sofa" name="services" value="Vệ sinh sofa, thảm">
                            <label for="service-sofa"><i class="fas fa-couch"></i> Vệ sinh sofa, thảm</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-washer" name="services" value="Vệ sinh máy giặt">
                            <label for="service-washer"><i class="fas fa-washing-machine"></i> Vệ sinh máy giặt</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-general" name="services" value="Dọn dẹp tổng thể">
                            <label for="service-general"><i class="fas fa-home"></i> Dọn dẹp tổng thể</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-childcare" name="services" value="Chăm sóc trẻ em">
                            <label for="service-childcare"><i class="fas fa-baby"></i> Chăm sóc trẻ em</label>
                        </li>
                        <li>
                            <input type="checkbox" id="service-special" name="services" value="Dịch vụ đặc biệt">
                            <label for="service-special"><i class="fas fa-star"></i> Dịch vụ đặc biệt</label>
                        </li>
                    </ul>
                </div>

                <div class="filter-group">
                    <div class="filter-title">Mức giá (VNĐ/giờ)</div>
                    <div class="price-range">
                        <div class="price-inputs">
                            <input type="number" placeholder="Từ" min="100000" max="300000" step="10000" id="minPrice">
                            <span>-</span>
                            <input type="number" placeholder="Đến" min="100000" max="300000" step="10000" id="maxPrice">
                        </div>
                    </div>
                </div>
            </div>

            <div class="main-content">
                <div class="content-header">
                    <div>
                        <h2 class="booking-title">Giúp Việc Uy Tín Tại Đà Nẵng</h2>
                        <p class="results-count">Tìm thấy <strong>${helpers.size()}</strong> nhân viên phù hợp</p>
                    </div>
                    <div class="sort-options">
                        <label for="sort">Sắp xếp:</label>
                        <select id="sort" class="sort-select">
                            <option value="rating">Đánh giá cao nhất</option>
                            <option value="price-low">Giá thấp đến cao</option>
                            <option value="price-high">Giá cao đến thấp</option>
                            <option value="distance">Gần nhất</option>
                        </select>
                    </div>
                </div>

                <div class="helper-list" id="helperList">
                    <c:forEach var="helper" items="${helpers}">
                        <div class="helper-card" data-time="${helper.availableTime}">
                            <div class="helper-image-container">
                                <img src="${helper.imageUrl != null ? helper.imageUrl : '/api/placeholder/320/200'}" alt="${helper.name}" class="helper-image">
                                <div class="helper-status">${helper.status}</div>
                                <c:if test="${helper.discount > 0}">
                                    <div class="helper-discount">Giảm ${helper.discount}%</div>
                                </c:if>
                            </div>
                            <div class="helper-info">
                                <div class="helper-header">
                                    <div>
                                        <div class="helper-name">${helper.name}</div>
                                        <div class="helper-location">
                                            <i class="fas fa-map-marker-alt"></i>
                                            ${helper.location}
                                        </div>
                                    </div>
                                    <div class="helper-rating">
                                        <i class="fas fa-star"></i>
                                        <span>${helper.rating} (${helper.reviewCount})</span>
                                    </div>
                                </div>
                                <div class="helper-specialties">
                                    <div class="specialty-tags">
                                        <c:forEach var="specialty" items="${helper.specialties}">
                                            <span class="specialty-tag">${specialty}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="helper-footer">
                                    <div>
                                        <div class="helper-price">${helper.price}đ/giờ</div>
                                        <div class="price-note">Tối thiểu ${helper.minHours} giờ</div>
                                    </div>
                                    <div>
                                        <a href="/helper/${helper.id}" class="btn-book">Xem chi tiết</a>
                                        <a href="/hire/${helper.id}" class="btn-hire">Thuê ngay</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="helper-card" data-time="morning">
                        <div class="helper-image-container">
                            <img src="/api/placeholder/320/200" alt="Nguyễn Văn A" class="helper-image">
                            <div class="helper-status">Có sẵn</div>
                        </div>
                        <div class="helper-info">
                            <div class="helper-header">
                                <div>
                                    <div class="helper-name">Nguyễn Văn A</div>
                                    <div class="helper-location">
                                        <i class="fas fa-map-marker-alt"></i>
                                        Đà Nẵng, Hải Châu
                                    </div>
                                </div>
                                <div class="helper-rating">
                                    <i class="fas fa-star"></i>
                                    <span>4.7 (15)</span>
                                </div>
                            </div>
                            <div class="helper-specialties">
                                <div class="specialty-tags">
                                    <span class="specialty-tag">Dọn dẹp</span>
                                    <span class="specialty-tag">Giặt ủi</span>
                                </div>
                            </div>
                            <div class="helper-footer">
                                <div>
                                    <div class="helper-price">140k/giờ</div>
                                    <div class="price-note">Tối thiểu 2 giờ</div>
                                </div>
                                <div>
                                    <a href="${pageContext.request.contextPath}/view/jsp/housekeeper/gv_a.jsp" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/5" class="btn-hire">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="helper-card" data-time="afternoon">
                        <div class="helper-image-container">
                            <img src="/api/placeholder/320/200" alt="Trần Thị B" class="helper-image">
                            <div class="helper-status">Có sẵn</div>
                            <div class="helper-discount">Giảm 10%</div>
                        </div>
                        <div class="helper-info">
                            <div class="helper-header">
                                <div>
                                    <div class="helper-name">Trần Thị B</div>
                                    <div class="helper-location">
                                        <i class="fas fa-map-marker-alt"></i>
                                        Đà Nẵng, Thanh Khê
                                    </div>
                                </div>
                                <div class="helper-rating">
                                    <i class="fas fa-star"></i>
                                    <span>4.8 (20)</span>
                                </div>
                            </div>
                            <div class="helper-specialties">
                                <div class="specialty-tags">
                                    <span class="specialty-tag">Vệ sinh</span>
                                    <span class="specialty-tag">Chăm sóc trẻ</span>
                                </div>
                            </div>
                            <div class="helper-footer">
                                <div>
                                    <div class="helper-price">150k/giờ</div>
                                    <div class="price-note">Tối thiểu 3 giờ</div>
                                </div>
                                <div>
                                    <a href="/helper/6" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/6" class="btn-hire">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="helper-card" data-time="evening">
                        <div class="helper-image-container">
                            <img src="/api/placeholder/320/200" alt="Lê Văn C" class="helper-image">
                            <div class="helper-status">Có sẵn</div>
                        </div>
                        <div class="helper-info">
                            <div class="helper-header">
                                <div>
                                    <div class="helper-name">Lê Văn C</div>
                                    <div class="helper-location">
                                        <i class="fas fa-map-marker-alt"></i>
                                        Đà Nẵng, Sơn Trà
                                    </div>
                                </div>
                                <div class="helper-rating">
                                    <i class="fas fa-star"></i>
                                    <span>4.6 (12)</span>
                                </div>
                            </div>
                            <div class="helper-specialties">
                                <div class="specialty-tags">
                                    <span class="specialty-tag">Dọn dẹp tổng thể</span>
                                </div>
                            </div>
                            <div class="helper-footer">
                                <div>
                                    <div class="helper-price">130k/giờ</div>
                                    <div class="price-note">Tối thiểu 2 giờ</div>
                                </div>
                                <div>
                                    <a href="/helper/7" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/7" class="btn-hire">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="helper-card" data-time="fullday">
                        <div class="helper-image-container">
                            <img src="/api/placeholder/320/200" alt="Phạm Thị D" class="helper-image">
                            <div class="helper-status">Có sẵn</div>
                            <div class="helper-discount">Giảm 15%</div>
                        </div>
                        <div class="helper-info">
                            <div class="helper-header">
                                <div>
                                    <div class="helper-name">Phạm Thị D</div>
                                    <div class="helper-location">
                                        <i class="fas fa-map-marker-alt"></i>
                                        Đà Nẵng, Ngũ Hành Sơn
                                    </div>
                                </div>
                                <div class="helper-rating">
                                    <i class="fas fa-star"></i>
                                    <span>4.9 (25)</span>
                                </div>
                            </div>
                            <div class="helper-specialties">
                                <div class="specialty-tags">
                                    <span class="specialty-tag">Giặt ủi</span>
                                    <span class="specialty-tag">Vệ sinh sofa</span>
                                </div>
                            </div>
                            <div class="helper-footer">
                                <div>
                                    <div class="helper-price">160k/giờ</div>
                                    <div class="price-note">Tối thiểu 4 giờ</div>
                                </div>
                                <div>
                                    <a href="/helper/8" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/8" class="btn-hire">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <%@ include file="/view/common/web/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchForm = document.getElementById('searchForm');
            const serviceCheckboxes = document.querySelectorAll('.service-list input[name="services"]');
            const sortSelect = document.getElementById('sort');
            const minPriceInput = document.getElementById('minPrice');
            const maxPriceInput = document.getElementById('maxPrice');
            const helperCards = document.querySelectorAll('.helper-card');
            const helperList = document.getElementById('helperList');

            // Search and Filter
            searchForm.addEventListener('submit', function(e) {
                e.preventDefault();
                filterHelpers();
            });

            // Real-time search
            const searchInput = document.getElementById('search');
            searchInput.addEventListener('input', debounce(filterHelpers, 300));

            // Service checkboxes filter
            serviceCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', filterHelpers);
            });

            // Sort functionality
            sortSelect.addEventListener('change', function() {
                sortHelpers(this.value);
            });

            // Price range filter
            [minPriceInput, maxPriceInput].forEach(input => {
                input.addEventListener('input', debounce(filterHelpers, 300));
            });

            function filterHelpers() {
                const searchTerm = searchInput.value.toLowerCase();
                const district = document.getElementById('district').value;
                const time = document.getElementById('time').value;
                const minPrice = parseInt(minPriceInput.value) || 0;
                const maxPrice = parseInt(maxPriceInput.value) || Infinity;
                const selectedServices = Array.from(serviceCheckboxes)
                    .filter(checkbox => checkbox.checked)
                    .map(checkbox => checkbox.value.toLowerCase());

                helperCards.forEach(card => {
                    const name = card.querySelector('.helper-name').textContent.toLowerCase();
                    const location = card.querySelector('.helper-location').textContent.toLowerCase();
                    const specialties = Array.from(card.querySelectorAll('.specialty-tag')).map(tag => tag.textContent.toLowerCase());
                    const price = parseInt(card.querySelector('.helper-price').textContent.replace(/[^0-9]/g, ''));
                    const cardTime = card.dataset.time;

                    const matchesSearch = !searchTerm || name.includes(searchTerm) || location.includes(searchTerm);
                    const matchesDistrict = !district || location.includes(district.replace('-', ' '));
                    const matchesTime = !time || cardTime === time;
                    const matchesPrice = price >= minPrice && price <= maxPrice;
                    const matchesService = selectedServices.length === 0 || 
                        selectedServices.some(service => 
                            service === 'giúp việc theo giờ' || specialties.includes(service));

                    if (matchesSearch && matchesDistrict && matchesTime && matchesPrice && matchesService) {
                        card.style.display = 'block';
                        card.style.opacity = '0';
                        setTimeout(() => card.style.opacity = '1', 50);
                    } else {
                        card.style.display = 'none';
                    }
                });

                updateResultsCount();
            }

            function sortHelpers(sortBy) {
                const cards = Array.from(helperCards);
                cards.sort((a, b) => {
                    switch (sortBy) {
                        case 'rating':
                            return parseFloat(b.querySelector('.helper-rating span').textContent) - parseFloat(a.querySelector('.helper-rating span').textContent);
                        case 'price-low':
                            return parseInt(a.querySelector('.helper-price').textContent.replace(/[^0-9]/g, '')) - parseInt(b.querySelector('.helper-price').textContent.replace(/[^0-9]/g, ''));
                        case 'price-high':
                            return parseInt(b.querySelector('.helper-price').textContent.replace(/[^0-9]/g, '')) - parseInt(a.querySelector('.helper-price').textContent.replace(/[^0-9]/g, ''));
                        case 'distance':
                            return 0; // Placeholder for geolocation
                        default:
                            return 0;
                    }
                });

                helperList.innerHTML = '';
                cards.forEach(card => helperList.appendChild(card));
                updateResultsCount();
            }

            function updateResultsCount() {
                const visibleCards = document.querySelectorAll('.helper-card[style*="block"]').length;
                document.querySelector('.results-count').innerHTML = `Tìm thấy <strong>${visibleCards}</strong> nhân viên phù hợp`;
            }

            function debounce(func, wait) {
                let timeout;
                return function(...args) {
                    clearTimeout(timeout);
                    timeout = setTimeout(() => func.apply(this, args), wait);
                };
            }
        });
    </script>
</body>
</html>