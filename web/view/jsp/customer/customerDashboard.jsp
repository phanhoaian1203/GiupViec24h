<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giúp Việc 24h - Dịch vụ giúp việc chuyên nghiệp tại Đà Nẵng</title>
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    
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
        color: #1a1a1a; /* Darkened from #333333 */
        background: #ecece6; /* Darkened from #f5f5f0 */
        overflow-x: hidden;
    }

    .section {
        padding: 4rem 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1.5rem;
    }

    /* Hero Section */
    .hero {
        background: linear-gradient(135deg, #ecece6 0%, #d0d0d0 50%, #ecece6 100%); /* Darkened from #f5f5f0 and #e0e0e0 */
        min-height: 100vh;
        display: flex;
        align-items: center;
        position: relative;
        overflow: hidden;
        padding-top: 80px;
    }

    .hero::before {
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: 
            radial-gradient(circle at 20% 80%, rgba(192, 169, 135, 0.15) 0%, transparent 50%), /* Darkened from #d9c2a3 */
            radial-gradient(circle at 80% 20%, rgba(192, 169, 135, 0.12) 0%, transparent 50%);
        pointer-events: none;
    }

    .hero-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4rem;
        align-items: center;
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
        position: relative;
        z-index: 2;
    }

    .hero-content {
        color: #1a1a1a; /* Darkened from #333333 */
    }

    .hero-title {
        font-size: 3.2rem;
        font-weight: 900;
        line-height: 1.15;
        margin-bottom: 1.5rem;
        color: #1a1a1a; /* Darkened from #2a2a2a */
        letter-spacing: -0.02em;
    }

    .hero-subtitle {
        font-size: 1.25rem;
        margin-bottom: 2.5rem;
        opacity: 0.85;
        line-height: 1.6;
        font-weight: 600;
        color: #4a4a4a; /* Darkened from #666666 */
        max-width: 90%;
    }

    .hero-cta {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
        align-items: center;
    }

    .hero-visual {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .hero-phone {
        width: 320px;
        height: auto;
        filter: drop-shadow(0 25px 50px rgba(0,0,0,0.15));
        transition: transform 0.3s ease;
    }

    .hero-phone:hover {
        transform: translateY(-5px) scale(1.02);
    }

    .floating-elements {
        position: absolute;
        width: 100%;
        height: 100%;
        pointer-events: none;
    }

    .floating-icon {
        position: absolute;
        width: 60px;
        height: 60px;
        background: #c0a987; /* Darkened from #d9c2a3 */
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        font-size: 1.5rem;
        box-shadow: 0 10px 30px rgba(192, 169, 135, 0.35); /* Updated shadow color */
        animation: float 6s ease-in-out infinite;
    }

    .floating-icon:nth-child(1) {
        top: 20%;
        left: 10%;
        animation-delay: 0s;
    }

    .floating-icon:nth-child(2) {
        top: 60%;
        right: 15%;
        animation-delay: 2s;
    }

    .floating-icon:nth-child(3) {
        bottom: 30%;
        left: 20%;
        animation-delay: 4s;
    }

    @keyframes float {
        0%, 100% {
            transform: translateY(0px) rotate(0deg);
        }
        50% {
            transform: translateY(-20px) rotate(5deg);
        }
    }

    /* Buttons */
    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0.8rem 1.5rem;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 700;
        font-size: 0.95rem;
        transition: background 0.3s ease, transform 0.2s ease;
        border: 2px solid transparent;
        cursor: pointer;
        min-width: 140px;
    }

    .btn-primary {
        background: #c0a987; /* Darkened from #d9c2a3 */
        color: #ffffff;
        border-color: #c0a987;
    }

    .btn-primary:hover {
        background: #a68e6e; /* Darker hover state */
        transform: translateY(-2px);
    }

    .btn-secondary {
        background: transparent;
        color: #4a4a4a; /* Darkened from #666666 */
        border-color: #d0d0d0; /* Darkened from #e0e0e0 */
    }

    .btn-secondary:hover {
        background: #d0d0d0; /* Darkened from #e0e0e0 */
        color: #1a1a1a; /* Darkened from #2a2a2a */
        transform: translateY(-2px);
    }

    /* Section Header Styles (Inspired by Eldorado Stone) */
    .section-header {
        text-align: center;
        margin-bottom: 5rem;
        position: relative;
    }

    .section-category {
        font-size: 0.9rem;
        color: #c0a987; /* Darkened from #d9c2a3 */
        text-transform: uppercase;
        letter-spacing: 0.1em;
        margin-bottom: 0.5rem;
        font-weight: 600;
    }

    .section-category::after {
        content: '';
        display: block;
        width: 50px;
        height: 1px;
        background: #c0a987; /* Darkened from #d9c2a3 */
        margin: 0.5rem auto;
    }

    .section-title {
        font-size: 2.8rem;
        font-weight: 900;
        color: #000000; /* Changed to black from #d9c2a3 */
        margin-bottom: 1.5rem;
        position: relative;
        display: inline-block;
        text-transform: uppercase;
        letter-spacing: -0.02em;
    }

    .section-subtitle {
        font-size: 1.15rem;
        color: #4a4a4a; /* Darkened from #666666 */
        max-width: 650px;
        margin: 0 auto;
        line-height: 1.6;
        font-weight: 500;
    }

    /* Services Section */
    .services {
        padding: 6rem 0;
        background: #ecece6; /* Darkened from #f5f5f0 */
        position: relative;
    }

    .services-carousel {
        position: relative;
        overflow: hidden;
        margin-top: 1rem;
    }

    .services-wrapper {
        overflow-x: auto;
        scroll-behavior: smooth;
        -webkit-overflow-scrolling: touch;
        padding: 1rem 0 2rem;
    }

    .services-grid {
        display: flex;
        gap: 2rem;
        padding: 0 1rem;
    }

    .service-card {
        background: #ffffff;
        border: 1px solid #d0d0d0; /* Darkened from #e0e0e0 */
        width: 260px;
        flex-shrink: 0;
        transition: transform 0.3s ease;
    }

    .service-card:hover {
        transform: translateY(-8px);
    }

    .service-image {
        width: 100%;
        height: 240px;
        object-fit: cover;
    }

    .service-content {
        padding: 1.5rem;
        text-align: center;
    }

    .service-title {
        font-size: 1.25rem;
        font-weight: 800;
        color: #1a1a1a; /* Darkened from #2a2a2a */
        margin-bottom: 0.75rem;
        letter-spacing: -0.01em;
    }

    .service-description {
        color: #4a4a4a; /* Darkened from #666666 */
        font-size: 0.9rem;
        line-height: 1.5;
        margin-bottom: 1.5rem;
        font-weight: 500;
    }

    .service-link {
        color: #c0a987; /* Darkened from #d9c2a3 */
        text-decoration: none;
        font-weight: 700;
        display: inline-flex;
        align-items: center;
        gap: 0.4rem;
        font-size: 0.9rem;
    }

    .service-link:hover {
        color: #a68e6e; /* Darker hover state */
    }

    .carousel-btn {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: #ffffff;
        border: none;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        font-size: 1.3rem;
        color: #1a1a1a; /* Darkened from #2a2a2a */
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        z-index: 10;
        transition: all 0.3s ease;
    }

    .carousel-btn:hover {
        background: #c0a987; /* Darkened from #d9c2a3 */
        color: #ffffff;
        transform: translateY(-50%) scale(1.1);
    }

    .prev-btn {
        left: 1rem;
    }

    .next-btn {
        right: 1rem;
    }

    .services-wrapper::-webkit-scrollbar {
        display: none;
    }

    .services-wrapper {
        -ms-overflow-style: none;
        scrollbar-width: none;
    }

    /* How it Works */
    .how-it-works {
        background: #ffffff;
        padding: 4rem 0;
    }

    .steps-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 2rem;
        margin-top: 3rem;
    }

    .step-card {
        text-align: center;
        background: #ecece6; /* Darkened from #f5f5f0 */
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        position: relative;
        transition: all 0.3s ease;
    }

    .step-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }

    .step-number {
        position: absolute;
        top: -20px;
        left: 50%;
        transform: translateX(-50%);
        width: 40px;
        height: 40px;
        background: #c0a987; /* Darkened from #d9c2a3 */
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        font-weight: 900;
        font-size: 1.1rem;
        box-shadow: 0 4px 15px rgba(192, 169, 135, 0.35); /* Updated shadow color */
        text-shadow: 0 1px 2px rgba(0,0,0,0.2);
    }

    .step-title {
        font-size: 1.2rem;
        font-weight: 800;
        color: #1a1a1a; /* Darkened from #2a2a2a */
        margin: 1.5rem 0 1rem;
    }

    .step-description {
        color: #4a4a4a; /* Darkened from #666666 */
        line-height: 1.6;
        font-weight: 500;
    }

    /* Features Section */
    .features {
        background: #ffffff;
        padding: 4rem 0;
    }

    .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 1.5rem;
        margin-top: 3rem;
    }

    .feature-card {
        display: flex;
        gap: 1.5rem;
        padding: 1.5rem;
        background: #ecece6; /* Darkened from #f5f5f0 */
        border: 1px solid #d0d0d0; /* Darkened from #e0e0e0 */
    }

    .feature-icon {
        width: 50px;
        height: 50px;
        background: #ffffff;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #c0a987; /* Darkened from #d9c2a3 */
        font-size: 1.4rem;
        flex-shrink: 0;
    }

    .feature-content h3 {
        font-size: 1.2rem;
        font-weight: 800;
        color: #1a1a1a; /* Darkened from #2a2a2a */
        margin-bottom: 0.5rem;
    }

    .feature-content p {
        color: #4a4a4a; /* Darkened from #666666 */
        font-size: 0.9rem;
        line-height: 1.5;
        font-weight: 500;
    }

    /* CTA Section */
    .cta {
        background: #1a1a1a; /* Darkened from #2a2a2a */
        color: #ffffff;
        padding: 4rem 0;
    }

    .cta-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1.5rem;
    }

    .cta-image {
        flex: 0 0 50%;
        max-width: 50%;
    }

    .cta-image img {
        width: 100%;
        height: auto;
        display: block;
    }

    .cta-content {
        flex: 0 0 45%;
        max-width: 45%;
        padding-left: 2rem;
    }

    .cta-title {
        font-size: 2.2rem;
        font-weight: 900;
        margin-bottom: 1rem;
        color: #ffffff;
    }

    .cta-subtitle {
        font-size: 1rem;
        margin-bottom: 2rem;
        color: #c0c0c0; /* Darkened from #d9d9d9 */
        line-height: 1.6;
        font-weight: 600;
    }

    .cta-buttons {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
    }

    .btn-cta-primary {
        background: #c0a987; /* Darkened from #d9c2a3 */
        color: #ffffff;
        border: 2px solid #c0a987;
        padding: 0.75rem 1.5rem;
        font-weight: 800;
    }

    .btn-cta-primary:hover {
        background: #a68e6e; /* Darker hover state */
        transform: translateY(-2px);
    }

    .btn-cta-secondary {
        background: transparent;
        color: #ffffff;
        border: 2px solid #ffffff;
        padding: 0.75rem 1.5rem;
        font-weight: 800;
    }

    .btn-cta-secondary:hover {
        background: #ffffff;
        color: #1a1a1a; /* Darkened from #2a2a2a */
        transform: translateY(-2px);
    }

    /* Mobile Responsive */
    @media (max-width: 768px) {
        .hero-container {
            grid-template-columns: 1fr;
            text-align: center;
            gap: 3rem;
        }

        .hero-title {
            font-size: 2.5rem;
        }

        .hero-subtitle {
            font-size: 1.1rem;
            max-width: 100%;
        }

        .hero-phone {
            width: 280px;
            order: -1;
        }

        .section-title {
            font-size: 2.2rem;
        }

        .section {
            padding: 3rem 0;
        }

        .container {
            padding: 0 1rem;
        }

        .services-grid {
            padding-bottom: 1rem;
        }

        .carousel-btn {
            display: none;
        }

        .service-card {
            width: 260px;
        }

        .steps-container {
            grid-template-columns: 1fr;
        }

        .features-grid {
            grid-template-columns: 1fr;
        }

        .feature-card {
            flex-direction: column;
            text-align: center;
        }

        .cta-container {
            flex-direction: column;
            text-align: center;
        }

        .cta-image {
            flex: 0 0 100%;
            max-width: 100%;
            margin-bottom: 2rem;
        }

        .cta-content {
            flex: 0 0 100%;
            max-width: 100%;
            padding-left: 0;
        }

        .cta-title {
            font-size: 1.8rem;
        }

        .cta-buttons {
            flex-direction: column;
            align-items: center;
        }

        .floating-icon {
            display: none;
        }
    }

    @media (max-width: 480px) {
        .hero-title {
            font-size: 2rem;
        }

        .hero-subtitle {
            font-size: 0.95rem;
        }

        .hero-phone {
            width: 240px;
        }

        .section-title {
            font-size: 1.8rem;
        }

        .cta-title {
            font-size: 1.5rem;
        }

        .cta-subtitle {
            font-size: 0.9rem;
        }

        .btn-cta-primary, .btn-cta-secondary {
            width: 100%;
            margin-bottom: 1rem;
        }
    }
    </style>
</head>
<body>
    <!-- Include Header -->
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-container">
            <div class="hero-content">
                <h1 class="hero-title">
                    Thao tác 60 giây trên ứng dụng, có ngay người nhận việc sau 60 phút
                </h1>
                <p class="hero-subtitle">
                    Dịch vụ giúp việc theo giờ đầu tiên tại Đà Nẵng. Giá cả minh bạch, người làm uy tín, thanh toán không dùng tiền mặt.
                </p>
                <div class="hero-cta">
                    <a href="/view/jsp/home/booking.jsp" class="btn btn-primary">
                        <i class="fas fa-mobile-alt" style="margin-right: 0.5rem;"></i>
                        Tải ứng dụng ngay
                    </a>
                    <a href="#services" class="btn btn-secondary">
                        Khám phá dịch vụ
                    </a>
                </div>
            </div>
            <div class="hero-visual">
                <img src="${pageContext.request.contextPath}/view/assets/home/img/banner/banner.jpg" alt="Giúp việc app" class="hero-phone">
                <div class="floating-elements">
                    <div class="floating-icon">
                        <i class="fas fa-broom"></i>
                    </div>
                    <div class="floating-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="floating-icon">
                        <i class="fas fa-star"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services">
        <div class="container">
            <div class="section-header">
                <div class="section-category">DỊCH VỤ</div>
                <h2 class="section-title">DỊCH VỤ TIỆN ÍCH GIA ĐÌNH</h2>
                <p class="section-subtitle">
                    Với 11 dịch vụ tiện ích chuyên nghiệp, Giúp Việc 24h sẵn sàng hỗ trợ mọi nhu cầu việc nhà của bạn một cách tận tâm và chu đáo
                </p>
            </div>
            <div class="services-carousel">
                <button class="carousel-btn prev-btn"><i class="fas fa-chevron-left"></i></button>
                <div class="services-wrapper">
                    <div class="services-grid">
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv1.jpg" alt="Giúp việc theo giờ" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Giúp việc theo giờ</h3>
                                <p class="service-description">Lịch trình linh hoạt, phù hợp mọi nhu cầu dọn dẹp nhà cửa.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv2.jpg" alt="Giúp việc theo ngày" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Giúp việc theo ngày</h3>
                                <p class="service-description">Dịch vụ toàn thời gian, hỗ trợ dọn dẹp chuyên sâu.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv3.jpg" alt="Giúp việc theo tháng" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Giúp việc theo tháng</h3>
                                <p class="service-description">Gói dài hạn, đảm bảo nhà cửa luôn sạch sẽ.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv4.jpg" alt="Chăm sóc người già" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Chăm sóc người già</h3>
                                <p class="service-description">Hỗ trợ tận tình, đảm bảo sức khỏe và sinh hoạt hàng ngày.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv5.jpg" alt="Chăm sóc trẻ em" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Chăm sóc trẻ em</h3>
                                <p class="service-description">Chăm sóc an toàn, vui chơi cùng bé hàng ngày.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv6.jpg" alt="Chăm sóc người bệnh" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Chăm sóc người bệnh</h3>
                                <p class="service-description">Hỗ trợ y tế cơ bản và chăm sóc tận tâm.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv7.jpg" alt="Vệ sinh thảm, đệm, rèm" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Vệ sinh thảm, đệm, rèm và ghế sofa</h3>
                                <p class="service-description">Làm sạch sâu, khử mùi hiệu quả.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv8.jpg" alt="Vệ sinh máy lạnh" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Vệ sinh máy lạnh</h3>
                                <p class="service-description">Giúp máy lạnh hoạt động hiệu quả, không khí trong lành.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv9.jpg" alt="Vệ sinh máy giặt" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Vệ sinh máy giặt</h3>
                                <p class="service-description">Loại bỏ vi khuẩn, đảm bảo quần áo sạch sẽ.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv10.jpg" alt="Nấu ăn" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Nấu ăn</h3>
                                <p class="service-description">Mang đến bữa ăn gia đình ấm áp, trọn vị.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <div class="service-card">
                            <img src="${pageContext.request.contextPath}/view/assets/home/img/index/sv11.jpg" alt="Tổng vệ sinh" class="service-image">
                            <div class="service-content">
                                <h3 class="service-title">Tổng vệ sinh</h3>
                                <p class="service-description">Dọn dẹp toàn diện từ trong ra ngoài.</p>
                                <a href="#" class="service-link">Chi tiết dịch vụ <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-btn next-btn"><i class="fas fa-chevron-right"></i></button>
            </div>
        </div>
    </section>

    <!-- How it Works -->
    <section class="how-it-works">
        <div class="container">
            <div class="section-header">
                <div class="section-category">QUY TRÌNH</div>
                <h2 class="section-title">CÁCH THỨC HOẠT ĐỘNG</h2>
                <p class="section-subtitle">
                    Quy trình đơn giản với 3 bước cơ bản
                </p>
            </div>
            <div class="steps-container">
                <div class="step-card fade-in">
                    <div class="step-number">1</div>
                    <h3 class="step-title">Tìm kiếm người giúp việc</h3>
                    <p class="step-description">
                        Duyệt qua danh sách người giúp việc, lọc theo dịch vụ, địa điểm và thời gian phù hợp với nhu cầu của bạn.
                    </p>
                </div>
                <div class="step-card fade-in">
                    <div class="step-number">2</div>
                    <h3 class="step-title">Đặt lịch dịch vụ</h3>
                    <p class="step-description">
                        Chọn người giúp việc phù hợp và đặt lịch làm việc trực tiếp trên website với chi phí minh bạch.
                    </p>
                </div>
                <div class="step-card fade-in">
                    <div class="step-number">3</div>
                    <h3 class="step-title">Đánh giá & thanh toán</h3>
                    <p class="step-description">
                        Đánh giá chất lượng dịch vụ và thanh toán an toàn, tiện lợi qua website sau khi hoàn thành.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <div class="section-header">
                <div class="section-category">LỢI ÍCH</div>
                <h2 class="section-title">TẠI SAO CHỌN GIÚP VIỆC 24H?</h2>
                <p class="section-subtitle">
                    Những lợi ích vượt trội và cam kết chất lượng khi sử dụng dịch vụ của chúng tôi
                </p>
            </div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-user-check"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Nhân viên được xác minh</h3>
                        <p>100% nhân viên có hồ sơ lý lịch rõ ràng, được kiểm tra kỹ lưỡng và đào tạo chuyên nghiệp trước khi làm việc.</p>
                    </div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-money-bill-wave"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Giá cả minh bạch</h3>
                        <p>Tất cả chi phí được hiển thị rõ ràng ngay từ đầu, không có phí ẩn hay phát sinh thêm bất kỳ khoản nào.</p>
                    </div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Hỗ trợ 24/7</h3>
                        <p>Đội ngũ chăm sóc khách hàng luôn sẵn sàng hỗ trợ bạn mọi lúc, mọi nơi qua hotline và ứng dụng.</p>
                    </div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Bảo hiểm toàn diện</h3>
                        <p>Mọi rủi ro trong quá trình làm việc đều được bảo hiểm, đảm bảo an toàn tuyệt đối cho khách hàng.</p>
                    </div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Đúng giờ cam kết</h3>
                        <p>Nhân viên luôn đến đúng giờ hẹn, nếu trễ hẹn quá 15 phút sẽ được hoàn lại 100% chi phí dịch vụ.</p>
                    </div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <div class="feature-content">
                        <h3>Chất lượng đảm bảo</h3>
                        <p>Nếu không hài lòng với chất lượng dịch vụ, bạn có thể yêu cầu làm lại hoặc hoàn tiền 100%.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="cta-container">
            <div class="cta-image">
                <img src="${pageContext.request.contextPath}/view/assets/home/img/banner/banner2.jpg" alt="Giúp việc service">
            </div>
            <div class="cta-content">
                <h2 class="cta-title">TRẢI NGHIỆM DỊCH VỤ HÔM NAY</h2>
                <p class="cta-subtitle">
                    Tham gia cùng hàng ngàn khách hàng đã tin tưởng và hài lòng với dịch vụ Giúp Việc 24h tại Đà Nẵng. Khám phá ngay giải pháp giúp việc chuyên nghiệp cho gia đình bạn.
                </p>
                <div class="cta-buttons">
                    <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn btn-cta-primary">
                        Tìm hiểu thêm
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp" class="btn btn-cta-secondary">
                        Khám phá ngay
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Include Footer -->
    <%@ include file="/view/common/web/footer.jsp" %>
    
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Smooth scroll for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });

            // Carousel functionality
            const servicesWrapper = document.querySelector('.services-wrapper');
            const prevBtn = document.querySelector('.prev-btn');
            const nextBtn = document.querySelector('.next-btn');
            const scrollAmount = 300;

            if (nextBtn && prevBtn && servicesWrapper) {
                nextBtn.addEventListener('click', () => {
                    servicesWrapper.scrollLeft += scrollAmount;
                });

                prevBtn.addEventListener('click', () => {
                    servicesWrapper.scrollLeft -= scrollAmount;
                });

                // Auto-hide buttons when at start/end
                servicesWrapper.addEventListener('scroll', () => {
                    const isAtStart = servicesWrapper.scrollLeft <= 0;
                    const isAtEnd = servicesWrapper.scrollLeft >= servicesWrapper.scrollWidth - servicesWrapper.clientWidth;
                    prevBtn.style.opacity = isAtStart ? '0.3' : '1';
                    nextBtn.style.opacity = isAtEnd ? '0.3' : '1';
                });
            }

            console.log('🏠 Giúp Việc 24h - Page loaded successfully');
        });
    </script>
</body>
</html>