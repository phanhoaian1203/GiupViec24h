
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Dịch vụ giúp việc chuyên nghiệp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1AB394; /* Giữ màu chủ đạo */
            --primary-dark: #18a085;
            --primary-light: #e8f8f5;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --gray: #e0e0e0;
            --text-dark: #333333;
            --accent: #FF7043; /* Màu nhấn mới */
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
            background-color: var(--white);
            color: var(--text-dark);
            line-height: 1.7;
        }

        /* Header Styles - Cải tiến */
        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: var(--white);
            padding: 1.2rem 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: all 0.4s ease;
        }

        .header.scrolled {
            padding: 0.8rem 0;
            background: rgba(26, 179, 148, 0.95);
            backdrop-filter: blur(10px);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.8rem;
            font-weight: 700;
        }

        .logo i {
            font-size: 2rem;
            transition: transform 0.3s ease;
        }

        .logo:hover i {
            transform: rotate(20deg);
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            padding: 0.5rem 0;
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--white);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .hamburger {
            display: none;
            cursor: pointer;
            z-index: 1001;
        }

        .hamburger div {
            width: 25px;
            height: 3px;
            background-color: var(--white);
            margin: 5px;
            transition: all 0.3s ease;
        }

        /* Hero Section - Cải tiến */
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('/api/placeholder/1200/600');
            background-size: cover;
            background-position: center;
            position: relative;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 0;
            padding-top: 80px;
        }

        .hero-content {
            position: relative;
            text-align: center;
            color: var(--white);
            max-width: 800px;
            padding: 0 2rem;
            animation: fadeInUp 1.2s ease-out;
        }

        .hero h1 {
            font-size: 4.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            letter-spacing: 1px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        .hero-tagline {
            font-size: 1.7rem;
            margin-bottom: 2.5rem;
            font-weight: 400;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }

        .btn {
            display: inline-block;
            padding: 0.9rem 2.2rem;
            background-color: var(--primary-color);
            color: var(--white);
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        }

        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-secondary {
            background-color: transparent;
            border: 2px solid var(--white);
            margin-left: 1.5rem;
        }

        .btn-secondary:hover {
            background-color: var(--white);
            color: var(--primary-dark);
        }

        /* Section Styles - Cải tiến */
        .section {
            padding: 6rem 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3.5rem;
            color: var(--primary-dark);
            font-size: 2.5rem;
            font-weight: 700;
            position: relative;
            padding-bottom: 1.2rem;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent));
            border-radius: 2px;
        }

        /* Services Section - Cải tiến */
        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
            margin-top: 2.5rem;
        }

        .service-card {
            background-color: var(--white);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.4s ease;
            position: relative;
            z-index: 1;
        }

        .service-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            opacity: 0;
            z-index: -1;
            transition: opacity 0.4s ease;
        }

        .service-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .service-card:hover::before {
            opacity: 0.05;
        }

        .service-icon {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: var(--white);
            font-size: 3rem;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 180px;
            position: relative;
            overflow: hidden;
        }

        .service-icon::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 30%;
            background: linear-gradient(0deg, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0) 100%);
        }

        .service-content {
            padding: 2.2rem;
        }

        .service-title {
            font-size: 1.5rem;
            margin-bottom: 1.2rem;
            color: var(--primary-dark);
            position: relative;
            padding-bottom: 0.8rem;
        }

        .service-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--primary-color);
        }

        .service-description {
            color: #666;
            margin-bottom: 1.5rem;
            font-size: 1rem;
        }

        .service-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .service-link:hover {
            color: var(--primary-dark);
            transform: translateX(5px);
        }

        /* Benefits Section - Cải tiến */
        .benefits {
            background-color: var(--primary-light);
            padding: 6rem 0;
            position: relative;
            overflow: hidden;
        }

        .benefits::before {
            content: '';
            position: absolute;
            top: -100px;
            left: 0;
            width: 100%;
            height: 100px;
            background: linear-gradient(to bottom right, var(--white) 0%, var(--white) 50%, transparent 50%, transparent 100%);
        }

        .benefits::after {
            content: '';
            position: absolute;
            bottom: -100px;
            left: 0;
            width: 100%;
            height: 100px;
            background: linear-gradient(to top right, var(--white) 0%, var(--white) 50%, transparent 50%, transparent 100%);
        }

        .benefits-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            position: relative;
            z-index: 1;
        }

        .benefits-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 3rem;
        }

        .benefit-card {
            background-color: var(--white);
            border-radius: 12px;
            padding: 3rem 2rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06);
            text-align: center;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .benefit-card::before {
            content: '';
            position: absolute;
            top: -80px;
            left: -80px;
            width: 160px;
            height: 160px;
            background: linear-gradient(135deg, var(--primary-color), transparent);
            opacity: 0.1;
            border-radius: 50%;
            transition: all 0.4s ease;
        }

        .benefit-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .benefit-card:hover::before {
            transform: scale(1.2);
        }

        .benefit-icon {
            font-size: 3.2rem;
            color: var(--primary-color);
            margin-bottom: 1.8rem;
        }

        .benefit-title {
            font-size: 1.6rem;
            margin-bottom: 1.5rem;
            color: var(--primary-dark);
        }

        .benefit-card ul {
            text-align: left;
            list-style-position: inside;
            padding-left: 1rem;
        }

        .benefit-card ul li {
            margin-bottom: 0.8rem;
            position: relative;
            padding-left: 1.2rem;
            list-style-type: none;
        }

        .benefit-card ul li::before {
            content: '✓';
            color: var(--primary-color);
            position: absolute;
            left: 0;
            font-weight: bold;
        }

        /* Commitment Section - Cải tiến */
        .commitment {
            padding: 6rem 0;
            background-color: var(--white);
        }

        .commitment-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .commitment-items {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 4rem;
            margin-top: 4rem;
        }

        .commitment-item {
            display: flex;
            align-items: center;
            flex-direction: column;
            max-width: 220px;
            transition: all 0.4s ease;
            text-align: center;
        }

        .commitment-item:hover {
            transform: translateY(-8px);
        }

        .commitment-icon {
            font-size: 3.5rem;
            color: var(--primary-color);
            margin-bottom: 1.8rem;
            height: 80px;
            width: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: var(--primary-light);
            box-shadow: 0 8px 20px rgba(26, 179, 148, 0.15);
        }

        .commitment-text {
            text-align: center;
            font-size: 1.2rem;
            font-weight: 500;
        }

        /* CTA Section - Cải tiến */
        .cta {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            padding: 6rem 0;
            text-align: center;
            color: var(--white);
            position: relative;
            overflow: hidden;
        }

        .cta::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('/api/placeholder/400/400');
            opacity: 0.05;
            background-size: cover;
        }

        .cta-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            position: relative;
            z-index: 1;
        }

        .cta-title {
            font-size: 2.8rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
        }

        .cta-subtitle {
            font-size: 1.4rem;
            margin-bottom: 3rem;
            font-weight: 300;
            opacity: 0.9;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
        }

        .btn-primary {
            background-color: var(--white);
            color: var(--primary-dark);
            border: none;
        }

        .btn-primary:hover {
            background-color: var(--gray-light);
            color: var(--primary-color);
        }

        .btn-outline {
            background-color: transparent;
            border: 2px solid var(--white);
            color: var(--white);
        }

        .btn-outline:hover {
            background-color: var(--white);
            color: var(--primary-dark);
        }

        /* Footer Styles - Cải tiến */
        .footer {
            background-color: var(--text-dark);
            color: var(--white);
            padding: 5rem 0 2rem;
            position: relative;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark), var(--primary-color));
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 3rem;
        }

        .footer-logo {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .footer-logo i {
            color: var(--primary-color);
        }

        .footer-description {
            margin-bottom: 2rem;
            opacity: 0.9;
            font-size: 1rem;
            line-height: 1.7;
        }

        .footer-social {
            display: flex;
            gap: 1.2rem;
        }

        .footer-social a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            background: rgba(255, 255, 255, 0.1);
            color: var(--white);
            border-radius: 50%;
            transition: all 0.3s ease;
            font-size: 1.2rem;
        }

        .footer-social a:hover {
            background-color: var(--primary-color);
            transform: translateY(-5px);
        }

        .footer-title {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 0.8rem;
        }

        .footer-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background-color: var(--primary-color);
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 1rem;
        }

        .footer-links a {
            color: var(--white);
            opacity: 0.9;
            text-decoration: none;
            font-size: 1rem;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .footer-links a:hover {
            opacity: 1;
            color: var(--primary-color);
            transform: translateX(5px);
        }

        .footer-contact li {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            margin-bottom: 1.5rem;
            font-size: 1rem;
        }

        .footer-contact i {
            color: var(--primary-color);
            margin-top: 5px;
        }

        .copyright {
            text-align: center;
            padding-top: 3rem;
            margin-top: 3rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.9rem;
            opacity: 0.8;
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .hero h1 {
                font-size: 3.5rem;
            }
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.8rem;
            }

            .hero-tagline {
                font-size: 1.4rem;
            }

            .hamburger {
                display: block;
            }

            .nav-links {
                position: fixed;
                right: -100%;
                top: 0;
                width: 70%;
                height: 100vh;
                flex-direction: column;
                align-items: center;
                padding-top: 120px;
                background: var(--primary-dark);
                transition: right 0.5s ease;
                box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
            }

            .nav-links.active {
                right: 0;
            }

            .nav-links a {
                margin: 0.5rem 0;
                font-size: 1.2rem;
            }

            .btn {
                padding: 0.8rem 1.8rem;
                font-size: 1rem;
            }

            .cta-buttons {
                flex-direction: column;
                max-width: 300px;
                margin-left: auto;
                margin-right: auto;
            }

            .btn-secondary {
                margin-left: 0;
                margin-top: 1rem;
            }

            .hero {
                height: 100vh;
                min-height: 600px;
            }
            
            .section {
                padding: 4rem 0;
            }
        }

        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .hero-tagline {
                font-size: 1.2rem;
            }

            .section-title {
                font-size: 2rem;
            }

            .benefit-card ul {
                padding-left: 0;
            }
            
            .service-card, .benefit-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header" id="header">
        <nav class="navbar">
            <div class="logo">
                <i class="fas fa-broom"></i>
                <span>Giúp Việc 24h</span>
            </div>
            <div class="nav-links" id="navLinks">
                <a href="#services">Dịch vụ</a>
                <a href="#benefits">Lợi ích</a>
                <a href="#about">Về chúng tôi</a>
                <a href="#contact">Liên hệ</a>
                <a href="booking.jsp">Thuê</a>
                <a href="view/jsp/home/login.jsp">Đăng nhập</a>
                <a href="view/jsp/home/signup.jsp" class="btn">Đăng ký</a>
            </div>
            <div class="hamburger" id="hamburger">
                <div class="line1"></div>
                <div class="line2"></div>
                <div class="line3"></div>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Giúp Việc 24h</h1>
            <p class="hero-tagline">Giúp việc theo giờ – An toàn – Tiện lợi – Đảm bảo chất lượng</p>
            <div>
                <a href="booking.jsp" class="btn">Đặt dịch vụ ngay</a>
                <a href="#services" class="btn btn-secondary">Tìm hiểu thêm</a>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="section">
        <div class="container">
            <h2 class="section-title">Dịch vụ chính</h2>
            <div class="services">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Thuê giúp việc theo giờ</h3>
                        <p class="service-description">Dịch vụ giúp việc theo giờ linh hoạt, phù hợp với nhu cầu của bạn. Chỉ thanh toán cho thời gian bạn cần.</p>
                        <a href="hourly-service.jsp" class="service-link">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-couch"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Vệ sinh sofa, thảm, máy giặt</h3>
                        <p class="service-description">Dịch vụ vệ sinh chuyên nghiệp với thiết bị hiện đại và nhân viên có chuyên môn cao.</p>
                        <a href="cleaning-service.jsp" class="service-link">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Giúp việc văn phòng</h3>
                        <p class="service-description">Giải pháp vệ sinh và hỗ trợ văn phòng toàn diện, giúp không gian làm việc luôn sạch sẽ và chuyên nghiệp.</p>
                        <a href="office-service.jsp" class="service-link">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Benefits Section -->
    <section id="benefits" class="benefits">
        <div class="benefits-container">
            <h2 class="section-title">Lợi ích của chúng tôi</h2>
            <div class="benefits-grid">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <h3 class="benefit-title">Dành cho khách hàng</h3>
                    <ul>
                        <li>Đặt dịch vụ nhanh chóng, tiện lợi</li>
                        <li>Người giúp việc đã được xác minh kỹ lưỡng</li>
                        <li>Thanh toán an toàn, minh bạch</li>
                        <li>Đánh giá và phản hồi sau mỗi dịch vụ</li>
                    </ul>
                </div>
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-hands-helping"></i>
                    </div>
                    <h3 class="benefit-title">Dành cho người giúp việc</h3>
                    <ul>
                        <li>Tăng thu nhập, công việc ổn định</li>
                        <li>Chủ động sắp xếp thời gian làm việc</li>
                        <li>Được đào tạo kỹ năng chuyên môn</li>
                        <li>Môi trường làm việc an toàn, được tôn trọng</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="container">
        <h2 class="section-title">Về chúng tôi</h2>
        <p style="text-align: center; max-width: 800px; margin: 0 auto; font-size: 1.1rem;">
            Giúp Việc 24h là nền tảng kết nối khách hàng với đội ngũ giúp việc chuyên nghiệp, đáng tin cậy. 
            Chúng tôi đặt sự hài lòng và an toàn của khách hàng lên hàng đầu thông qua quy trình tuyển chọn nghiêm ngặt và dịch vụ chăm sóc tận tâm.
        </p>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container">
        <h2 class="section-title">Liên hệ với chúng tôi</h2>
        <div style="max-width: 600px; margin: 0 auto; text-align: center; font-size: 1.1rem;">
            <p>Chúng tôi luôn sẵn sàng lắng nghe bạn. Vui lòng liên hệ qua các thông tin dưới đây:</p>
            <p><i class="fas fa-map-marker-alt"></i> 123 Đường ABC, Quận XYZ, TP. Hồ Chí Minh</p>
            <p><i class="fas fa-phone-alt"></i> +84 123 456 789</p>
            <p><i class="fas fa-envelope"></i> info@giupviec24h.com</p>
        </div>
    </section>

    <!-- Commitment Section -->
    <section class="commitment">
        <div class="commitment-container">
            <h2 class="section-title">Cam kết của chúng tôi</h2>
            <div class="commitment-items">
                <div class="commitment-item">
                    <div class="commitment-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div class="commitment-text">
                        <p>Xác minh hồ sơ kỹ lưỡng</p>
                    </div>
                </div>
                <div class="commitment-item">
                    <div class="commitment-icon">
                        <i class="fas fa-undo"></i>
                    </div>
                    <div class="commitment-text">
                        <p>Hoàn tiền khi khiếu nại hợp lý</p>
                    </div>
                </div>
                <div class="commitment-item">
                    <div class="commitment-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <div class="commitment-text">
                        <p>Hỗ trợ nhanh chóng 24/7</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="cta-container">
            <h2 class="cta-title">Bắt đầu sử dụng dịch vụ của chúng tôi ngay hôm nay</h2>
            <p class="cta-subtitle">Để trải nghiệm dịch vụ giúp việc chất lượng cao với giá cả hợp lý</p>
            <div class="cta-buttons">
                <a href="view/jsp/home/signup.jsp" class="btn btn-primary">Đăng ký</a>
                <a href="view/jsp/home/login.jsp" class="btn btn-outline">Đăng nhập</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div>
                <div class="footer-logo">
                    <i class="fas fa-broom"></i>
                    <span>Giúp Việc 24h</span>
                </div>
                <p class="footer-description">Dịch vụ giúp việc chuyên nghiệp, tin cậy với đội ngũ nhân viên được đào tạo bài bản và kiểm tra lý lịch kỹ lưỡng.</p>
                <div class="footer-social">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div>
                <h3 class="footer-title">Liên kết nhanh</h3>
                <ul class="footer-links">
                    <li><a href="#services">Dịch vụ</a></li>
                    <li><a href="#benefits">Lợi ích</a></li>
                    <li><a href="about.jsp">Về chúng tôi</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="faq.jsp">Câu hỏi thường gặp</a></li>
                </ul>
            </div>
            <div>
                <h3 class="footer-title">Dịch vụ</h3>
                <ul class="footer-links">
                    <li><a href="hourly-service.jsp">Giúp việc theo giờ</a></li>
                    <li><a href="cleaning-service.jsp">Vệ sinh sofa, thảm</a></li>
                    <li><a href="office-service.jsp">Giúp việc văn phòng</a></li>
                    <li><a href="special-service.jsp">Dịch vụ đặc biệt</a></li>
                </ul>
            </div>
            <div>
                <h3 class="footer-title">Liên hệ</h3>
                <ul class="footer-contact footer-links">
                    <li>
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Khu Đô Thị FPT, Phường Hòa Hải, Quận Ngũ Hành Sơn, TP. Đà Nẵng</span>
                    </li>
                    <li>
                        <i class="fas fa-phone-alt"></i>
                        <span>+84 123 456 789</span>
                    </li>
                    <li>
                        <i class="fas fa-envelope"></i>
                        <span>info@giupviec24h.com</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            <p>© 2025 Giúp Việc 24h. Tất cả quyền được bảo lưu.</p>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
    <script>
        // Smooth scroll for anchor links
        document.querySelectorAll('.nav-links a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>