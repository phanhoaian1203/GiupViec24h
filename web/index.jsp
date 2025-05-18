<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Dịch vụ giúp việc chuyên nghiệp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        :root {
            --primary-color: #1abc9c; /* Màu xanh kas chủ đạo */
            --primary-dark: #16a085;
            --secondary-color: #3498db;
            --text-color: #333;
            --light-color: #ecf0f1;
            --accent-color: #e74c3c;
        }
        html {
            scroll-behavior: smooth; /* ✅ Cuộn mượt */
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
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
            gap: 10px;
            font-size: 1.8rem;
            font-weight: bold;
        }
        
        .logo i {
            font-size: 2rem;
        }
        
        .nav-links {
            display: flex;
            gap: 2rem;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .nav-links a:hover {
            color: var(--light-color);
        }
        
        .hero {
            background: url('/api/placeholder/1200/600') center/cover no-repeat;
            position: relative;
            height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
        }
        
        .hero-content {
            position: relative;
            text-align: center;
            color: white;
            max-width: 700px;
            padding: 0 2rem;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            color: white;
        }
        
        .hero-tagline {
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .btn {
            display: inline-block;
            padding: 0.8rem 2rem;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        
        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: transparent;
            border: 2px solid white;
            margin-left: 1rem;
        }
        
        .btn-secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 4rem 2rem;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            color: var(--primary-dark);
            font-size: 2rem;
            position: relative;
            padding-bottom: 1rem;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background-color: var(--primary-color);
        }
        
        .services {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .service-card {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        
        .service-icon {
            background-color: var(--primary-color);
            color: white;
            font-size: 3rem;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 150px;
        }
        
        .service-content {
            padding: 1.5rem;
        }
        
        .service-title {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--primary-dark);
        }
        
        .service-description {
            color: #666;
            margin-bottom: 1rem;
        }
        
        .service-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .service-link:hover {
            color: var(--primary-dark);
        }
        
        .benefits {
            background-color: #f0f9f6;
            padding: 4rem 0;
        }
        
        .benefits-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        .benefits-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .benefit-card {
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
        }
        
        .benefit-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .benefit-title {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--primary-dark);
        }
        
        .stats {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            padding: 4rem 0;
        }
        
        .stats-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 2rem;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-number {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        
        .commitment {
            padding: 4rem 0;
            background-color: white;
        }
        
        .commitment-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 2rem;
            text-align: center;
        }
        
        .commitment-items {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .commitment-item {
            display: flex;
            align-items: center;
            flex-direction: column;
            max-width: 250px;
        }
        
        .commitment-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .commitment-text {
            text-align: center;
        }
        
        .cta {
            background-color: #f0f9f6;
            padding: 4rem 0;
            text-align: center;
        }
        
        .cta-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        .cta-title {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: var(--primary-dark);
        }
        
        .cta-subtitle {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            color: #666;
        }
        
        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            flex-wrap: wrap;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
            border: none;
        }
        
        .btn-outline {
            background-color: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }
        
        .btn-outline:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        .footer {
            background-color: #2c3e50;
            color: white;
            padding: 4rem 0 2rem;
        }
        
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }
        
        .footer-logo {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .footer-logo i {
            color: var(--primary-color);
        }
        
        .footer-description {
            margin-bottom: 1.5rem;
            opacity: 0.8;
        }
        
        .footer-social {
            display: flex;
            gap: 1rem;
        }
        
        .footer-social a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 50%;
            transition: all 0.3s ease;
        }
        
        .footer-social a:hover {
            background-color: var(--primary-color);
            transform: translateY(-3px);
        }
        
        .footer-title {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
        }
        
        .footer-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 2px;
            background-color: var(--primary-color);
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-links li {
            margin-bottom: 0.8rem;
        }
        
        .footer-links a {
            color: white;
            opacity: 0.8;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .footer-links a:hover {
            opacity: 1;
            color: var(--primary-color);
            padding-left: 5px;
        }
        
        .footer-contact li {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-bottom: 1rem;
        }
        
        .footer-contact i {
            color: var(--primary-color);
            margin-top: 5px;
        }
        
        .copyright {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.9rem;
            opacity: 0.7;
        }
        
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero-tagline {
                font-size: 1.2rem;
            }
            
            .navbar {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-links {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                display: block;
                width: 100%;
                margin: 0.5rem 0;
                text-align: center;
            }
            
            .cta-buttons {
                flex-direction: column;
            }
            
            .btn-secondary {
                margin-left: 0;
                margin-top: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <nav class="navbar">
            <div class="logo">
                <i class="fas fa-broom"></i>
                <span>Giúp Việc 24h</span>
            </div>
            <div class="nav-links">
                <a href="#services">Dịch vụ</a>
                <a href="#benefits">Lợi ích</a>
                <a href="#about">Về chúng tôi</a>
                <a href="#contact">Liên hệ</a>
                <a href="login.jsp">Đăng nhập</a>
                <a href="signup.jsp" class="btn">Đăng ký</a>
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
    <section id="services" class="container">
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

    <!-- Stats Section -->
    <!--<section class="stats">
        <div class="stats-container">
            <div class="stat-item">
                <div class="stat-number">5000+</div>
                <div class="stat-label">Khách hàng tin dùng</div>
            </div>
            
            <div class="stat-item">
                <div class="stat-number">1000+</div>
                <div class="stat-label">Người giúp việc</div>
            </div>
            
            <div class="stat-item">
                <div class="stat-number">20.000+</div>
                <div class="stat-label">Lượt đặt dịch vụ</div>
            </div>
        </div>
    </section>-->
    <!-- About Section -->
<section id="about" class="container">
    <h2 class="section-title">Về chúng tôi</h2>
    <p style="text-align: center; max-width: 800px; margin: 0 auto;">
        Giúp Việc 24h là nền tảng kết nối khách hàng với đội ngũ giúp việc chuyên nghiệp, đáng tin cậy. 
        Chúng tôi đặt sự hài lòng và an toàn của khách hàng lên hàng đầu thông qua quy trình tuyển chọn nghiêm ngặt và dịch vụ chăm sóc tận tâm.
    </p>
</section>

    
    <!-- Contact Section -->
<section id="contact" class="container">
    <h2 class="section-title">Liên hệ với chúng tôi</h2>
    <div style="max-width: 600px; margin: 0 auto; text-align: center;">
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
                <a href="signup.jsp" class="btn btn-primary">Đăng ký</a>
                <a href="login.jsp" class="btn btn-outline">Đăng nhập</a>
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
            <p>&copy; 2025 Giúp Việc 24h. Tất cả quyền được bảo lưu.</p>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
</body>
</html>