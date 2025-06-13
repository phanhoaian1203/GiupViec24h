<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Thuê Nhân Viên Dọn Dẹp Đà Nẵng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <%@ include file="/view/common/web/add_css.jsp" %>
    <style>
        :root {
            --primary-color: #2A9D8F;
            --primary-dark: #264653;
            --primary-light: #E9F1EF;
            --white: #FFFFFF;
            --gray-light: #F7F7F7;
            --gray: #E0E0E0;
            --text-dark: #2D2D2D;
            --accent: #E76F51;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            --shadow-hover: 0 4px 15px rgba(0, 0, 0, 0.1);
            --border: #E0E0E0;
        }

        html {
            scroll-behavior: smooth;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: var(--gray-light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 70px;
            background: var(--white);
            z-index: 1000;
            box-shadow: var(--shadow);
        }

        .banner {
            position: relative;
            height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding-top: 70px;
            background-size: cover;
            background-position: center;
        }

        .banner img {
            width: 100%;
            height: 100%;
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
            background: rgba(0, 0, 0, 0.5);
            z-index: 2;
        }

        .banner-content {
            position: relative;
            z-index: 3;
            text-align: center;
            color: var(--white);
            max-width: 800px;
            padding: 2rem 1.5rem;
        }

        .banner-content h1 {
            font-size: clamp(1.8rem, 3.5vw, 2.5rem);
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .banner-tagline {
            font-size: clamp(0.9rem, 1.5vw, 1.1rem);
            opacity: 0.9;
            margin-bottom: 1.5rem;
        }

        .search-section {
            background: var(--white);
            padding: 1rem 0;
            box-shadow: var(--shadow);
            width: 100%;
            z-index: 900;
        }

        .search-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .search-form {
            display: grid;
            grid-template-columns: 3fr 1fr 1fr 100px;
            gap: 0.8rem;
            align-items: center;
            padding: 1rem;
            background: var(--white);
            border: 1px solid var(--border);
        }

        .form-group {
            position: relative;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            font-size: 0.85rem;
            margin-bottom: 0.4rem;
            color: var(--text-dark);
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.7rem;
            border: 1px solid var(--border);
            font-size: 0.9rem;
            background: var(--white);
            transition: border-color 0.2s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .search-input i {
            position: absolute;
            left: 0.8rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            font-size: 1rem;
        }

        .search-input input {
            padding-left: 2.2rem;
        }

        .btn-search {
            background: var(--primary-color);
            color: var(--white);
            border: none;
            padding: 0.7rem;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        .btn-search:hover {
            background: var(--primary-dark);
        }

        .content-wrapper {
            padding-top: 70px;
        }

        .booking-section {
            max-width: 1100px;
            margin: 0 auto;
            padding: 2rem 1rem;
            display: flex;
            gap: 1.5rem;
        }

        .sidebar {
            width: 260px;
            background: var(--white);
            padding: 1.5rem;
            border: 1px solid var(--border);
            position: sticky;
            top: 90px;
            height: fit-content;
        }

        .sidebar-title {
            font-size: 1.3rem;
            color: var(--primary-dark);
            margin-bottom: 1.5rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .sidebar-title i {
            color: var(--primary-color);
        }

        .filter-group {
            margin-bottom: 1.5rem;
        }

        .filter-title {
            font-size: 1rem;
            font-weight: 500;
            margin-bottom: 0.8rem;
            color: var(--text-dark);
            border-bottom: 1px solid var(--border);
            padding-bottom: 0.4rem;
        }

        .service-list {
            list-style: none;
        }

        .service-list li {
            margin-bottom: 0.6rem;
            display: flex;
            align-items: center;
        }

        .service-list input[type="checkbox"] {
            margin-right: 0.6rem;
            accent-color: var(--primary-color);
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        .service-list label {
            color: var(--text-dark);
            font-size: 0.9rem;
            font-weight: 400;
            cursor: pointer;
        }

        .service-list i {
            margin-right: 0.6rem;
            color: var(--primary-color);
            width: 18px;
        }

        .service-list input:checked + label {
            color: var(--primary-dark);
            font-weight: 500;
        }

        .price-range {
            margin-top: 0.8rem;
        }

        .price-inputs {
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }

        .price-inputs input {
            width: 80px;
            padding: 0.5rem;
            border: 1px solid var(--border);
            font-size: 0.85rem;
            text-align: center;
        }

        .main-content {
            flex: 1;
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .booking-title {
            color: var(--primary-dark);
            font-size: 1.8rem;
            font-weight: 600;
        }

        .results-count {
            color: #666;
            font-size: 0.9rem;
        }

        .sort-options {
            display: flex;
            gap: 0.8rem;
            align-items: center;
        }

        .sort-select {
            padding: 0.5rem;
            border: 1px solid var(--border);
            font-size: 0.9rem;
        }

        .helper-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .helper-card {
            background: var(--white);
            border: 1px solid var(--border);
            box-shadow: var(--shadow);
            transition: box-shadow 0.2s ease;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .helper-card:hover {
            box-shadow: var(--shadow-hover);
        }

        .helper-image-container {
            position: relative;
            height: 180px;
        }

        .helper-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .helper-status {
            position: absolute;
            top: 10px;
            right: 10px;
            background: var(--primary-color);
            color: var(--white);
            padding: 0.3rem 0.7rem;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .helper-discount {
            position: absolute;
            top: 10px;
            left: 10px;
            background: var(--accent);
            color: var(--white);
            padding: 0.3rem 0.7rem;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .helper-info {
            padding: 1.2rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .helper-name {
            font-size: 1.2rem;
            color: var(--primary-dark);
            font-weight: 500;
            margin-bottom: 0.4rem;
        }

        .helper-location {
            font-size: 0.85rem;
            color: #666;
            display: flex;
            align-items: center;
            gap: 0.3rem;
            margin-bottom: 0.4rem;
        }

        .helper-location i {
            color: var(--primary-color);
        }

        .helper-rating {
            display: flex;
            align-items: center;
            gap: 0.3rem;
            font-size: 0.85rem;
            color: var(--text-dark);
        }

        .helper-rating i {
            color: #F4A261;
            font-size: 0.9rem;
        }

        .helper-specialties {
            margin: 0.8rem 0;
        }

        .specialty-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.4rem;
        }

        .specialty-tag {
            background: var(--primary-light);
            color: var(--primary-dark);
            padding: 0.2rem 0.6rem;
            font-size: 0.8rem;
            font-weight: 400;
        }

        .helper-footer {
            padding-top: 0.8rem;
            border-top: 1px solid var(--border);
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 0.5rem;
        }

        .helper-price {
            font-weight: 600;
            color: var(--primary-color);
            font-size: 1.1rem;
        }

        .price-note {
            font-size: 0.8rem;
            color: #666;
        }

        .btn-book, .btn-hire {
    color: var(--white);
    text-decoration: none;
    padding: 0.4rem 0.8rem; /* Giảm padding từ 0.6rem 1.2rem xuống 0.4rem 0.8rem */
    font-weight: 500;
    font-size: 0.8rem; /* Giảm font-size từ 0.9rem xuống 0.8rem */
    transition: background 0.2s ease;
    flex: 1;
    text-align: center;
    max-width: 120px;
}

        .btn-book {
            background: var(--primary-color);
        }

        .btn-book:hover {
            background: var(--primary-dark);
        }

        .btn-hire {
            background: var(--accent);
        }

        .btn-hire:hover {
            background: #D95F41;
        }

        @media (max-width: 1024px) {
            .search-form {
                grid-template-columns: 2fr 1fr 1fr 100px;
                gap: 0.6rem;
            }

            .booking-section {
                gap: 1rem;
            }

            .sidebar {
                width: 240px;
            }
        }

        @media (max-width: 768px) {
            .banner {
                height: 70vh;
            }

            .banner-content h1 {
                font-size: 2rem;
            }

            .banner-tagline {
                font-size: 1rem;
            }

            .booking-section {
                flex-direction: column;
                padding: 1.5rem 1rem;
            }

            .sidebar {
                width: 100%;
                position: static;
            }

            .search-form {
                grid-template-columns: 1fr;
                gap: 0.8rem;
            }

            .btn-search {
                width: 100%;
            }

            .content-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }

            .sort-options {
                width: 100%;
            }

            .helper-list {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .banner-content h1 {
                font-size: 1.6rem;
            }

            .banner-tagline {
                font-size: 0.9rem;
            }

            .booking-section {
                padding: 1rem;
            }

            .sidebar {
                padding: 1rem;
            }

            .helper-image {
                height: 160px;
            }

            .helper-name {
                font-size: 1.1rem;
            }

            .helper-price {
                font-size: 1rem;
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
            <p class="banner-tagline animate__animated animate__fadeIn animate__delay-1s">Dịch vụ giúp việc chuyên nghiệp, đáng tin cậy, mang đến không gian sống sạch sẽ và thoải mái.</p>
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
                        <p class="results-count">Tìm thấy <strong>4</strong> nhân viên phù hợp</p>
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
                    <!-- Thẻ nhân viên 1 -->
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
                                    <span class="specialty-tag">Giúp việc theo giờ</span>
                                    <span class="specialty-tag">Vệ sinh máy giặt</span>
                                </div>
                            </div>
                            <div class="helper-footer">
                                <div>
                                    <div class="helper-price">140,000đ/giờ</div>
                                    <div class="price-note">Tối thiểu 2 giờ</div>
                                </div>
                                <div>
                                    <a href="/helper/1" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/1" class="btn-hire">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Thẻ nhân viên 2 -->
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
                                    <span class="specialty-tag">Vệ sinh máy giặt</span>
                                    
                                </div>
                            </div>
                            <div class="helper-footer">
                                <div>
                                    <div class="helper-price">150,000đ/giờ</div>
                                    <div class="price-note">Tối thiểu 3 giờ</div>
                                </div>
                                <div>
                                    <a href="/helper/2" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/2" class="btn-hire">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Thẻ nhân viên 3 -->
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
                                    <div class="helper-price">130,000đ/giờ</div>
                                    <div class="price-note">Tối thiểu 2 giờ</div>
                                </div>
                                <div>
                                    <a href="/helper/3" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/3" class="btn-hire">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Thẻ nhân viên 4 -->
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
                                    <div class="helper-price">160,000đ/giờ</div>
                                    <div class="price-note">Tối thiểu 4 giờ</div>
                                </div>
                                <div>
                                    <a href="/helper/4" class="btn-book">Xem chi tiết</a>
                                    <a href="/hire/4" class="btn-hire">Thuê ngay</a>
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

            searchForm.addEventListener('submit', function(e) {
                e.preventDefault();
                filterHelpers();
            });

            document.getElementById('search').addEventListener('input', debounce(filterHelpers, 300));
            serviceCheckboxes.forEach(checkbox => checkbox.addEventListener('change', filterHelpers));
            sortSelect.addEventListener('change', function() { sortHelpers(this.value); });
            [minPriceInput, maxPriceInput].forEach(input => input.addEventListener('input', debounce(filterHelpers, 300)));

            function filterHelpers() {
                const searchTerm = document.getElementById('search').value.toLowerCase();
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

                    card.style.display = matchesSearch && matchesDistrict && matchesTime && matchesPrice && matchesService ? 'block' : 'none';
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
                            return 0;
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