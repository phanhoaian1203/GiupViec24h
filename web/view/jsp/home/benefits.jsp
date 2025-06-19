<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Lợi ích</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
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
        color: #2d3748;
        background: #ffffff;
        overflow-x: hidden;
    }

    .section {
        padding: 5rem 0;
        position: relative;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
    }

    /* Hero Section - Similar to index.jsp */
    .hero {
        background: linear-gradient(135deg, #fefefe 0%, #f8fafc 50%, #f1f5f9 100%);
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
            radial-gradient(circle at 20% 80%, rgba(230, 213, 90, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(212, 194, 69, 0.08) 0%, transparent 50%),
            url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="%23e6d55a" opacity="0.08"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
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
        color: #2d3748;
    }

    .hero-title {
        font-size: 3.2rem;
        font-weight: 800;
        line-height: 1.15;
        margin-bottom: 1.5rem;
        color: #1a202c;
        letter-spacing: -0.02em;
    }

    .hero-subtitle {
        font-size: 1.25rem;
        margin-bottom: 2.5rem;
        opacity: 0.85;
        line-height: 1.6;
        font-weight: 400;
        color: #4a5568;
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

    .hero-stats {
        background: white;
        border-radius: 20px;
        padding: 2rem;
        box-shadow: 0 20px 60px rgba(0,0,0,0.1);
        border: 1px solid #f1f5f9;
        position: relative;
        overflow: hidden;
    }

    .hero-stats::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #e6d55a, #d4c245);
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 1.5rem;
    }

    .stat-item {
        text-align: center;
        padding: 1rem;
    }

    .stat-number {
        font-size: 2rem;
        font-weight: 800;
        color: #e6d55a;
        margin-bottom: 0.5rem;
    }

    .stat-label {
        font-size: 0.9rem;
        color: #718096;
        font-weight: 500;
    }

    /* Enhanced Buttons */
    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 1rem 2rem;
        border-radius: 12px;
        text-decoration: none;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        border: 2px solid transparent;
        cursor: pointer;
        min-width: 160px;
        position: relative;
        overflow: hidden;
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
        background: linear-gradient(135deg, #e6d55a, #d4c245);
        color: #5a4f0f;
        border-color: #e6d55a;
        box-shadow: 0 4px 15px rgba(230, 213, 90, 0.25);
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #d4c245, #c2b23d);
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(230, 213, 90, 0.35);
        color: #5a4f0f;
    }

    .btn-secondary {
        background: transparent;
        color: #4a5568;
        border-color: #e2e8f0;
        backdrop-filter: blur(10px);
    }

    .btn-secondary:hover {
        background: rgba(255, 255, 255, 0.8);
        color: #2d3748;
        transform: translateY(-2px);
        border-color: #cbd5e0;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }

    /* Section Titles */
    .section-title {
        font-size: 2.8rem;
        font-weight: 800;
        color: #2d3748;
        text-align: center;
        margin-bottom: 1.5rem;
        position: relative;
        letter-spacing: -0.02em;
    }

    .section-title::after {
        content: '';
        position: absolute;
        bottom: -12px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 4px;
        background: linear-gradient(90deg, #e6d55a, #d4c245);
        border-radius: 2px;
    }

    .section-subtitle {
        font-size: 1.15rem;
        color: #718096;
        max-width: 650px;
        margin: 0 auto 4rem;
        line-height: 1.6;
        text-align: center;
    }

    /* Benefits Grid - Similar to index.jsp */
    .benefits-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 2rem;
        margin-top: 2rem;
    }

    .benefit-card {
        background: white;
        border-radius: 20px;
        padding: 2.5rem;
        text-align: center;
        box-shadow: 0 4px 25px rgba(0,0,0,0.08);
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        border: 1px solid #f1f5f9;
        position: relative;
        overflow: hidden;
    }

    .benefit-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #e6d55a, #d4c245);
        transform: scaleX(0);
        transition: transform 0.4s ease;
    }

    .benefit-card:hover::before {
        transform: scaleX(1);
    }

    .benefit-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 60px rgba(0,0,0,0.12);
        border-color: #e6d55a;
    }

    .benefit-icon {
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, #fff5e6, #fef2d4);
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 2rem;
        color: #e6d55a;
        font-size: 2rem;
        border: 3px solid #e6d55a;
        transition: all 0.3s ease;
    }

    .benefit-card:hover .benefit-icon {
        transform: scale(1.1) rotate(5deg);
        background: linear-gradient(135deg, #e6d55a, #d4c245);
        color: #5a4f0f;
    }

    .benefit-title {
        font-size: 1.4rem;
        font-weight: 700;
        color: #2d3748;
        margin-bottom: 1rem;
        letter-spacing: -0.01em;
    }

    .benefit-description {
        color: #718096;
        margin-bottom: 2rem;
        line-height: 1.6;
        font-size: 0.95rem;
    }

    /* CTA Section - Similar to index.jsp */
    .cta {
        background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
        color: white;
        padding: 6rem 0;
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .cta::before {
        content: '';
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(230, 213, 90, 0.06) 0%, transparent 70%);
        animation: float 20s ease-in-out infinite;
    }

    @keyframes float {
        0%, 100% { transform: translate(-50%, -50%) rotate(0deg); }
        50% { transform: translate(-50%, -50%) rotate(180deg); }
    }

    .cta-content {
        position: relative;
        z-index: 1;
        max-width: 700px;
        margin: 0 auto;
    }

    .cta-title {
        font-size: 2.8rem;
        font-weight: 800;
        margin-bottom: 1.5rem;
        letter-spacing: -0.02em;
    }

    .cta-subtitle {
        font-size: 1.25rem;
        margin-bottom: 3rem;
        opacity: 0.95;
        line-height: 1.6;
    }

    .cta-buttons {
        display: flex;
        gap: 1.5rem;
        justify-content: center;
        flex-wrap: wrap;
    }

    .btn-white {
        background: white;
        color: #2d3748;
        border-color: white;
    }

    .btn-white:hover {
        background: #f8f9fa;
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(255,255,255,0.2);
    }

    .btn-outline-white {
        background: transparent;
        color: white;
        border-color: white;
        backdrop-filter: blur(10px);
    }

    .btn-outline-white:hover {
        background: white;
        color: #2d3748;
        transform: translateY(-2px);
    }

    /* Animations */
    .fade-in-up {
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .fade-in-up.visible {
        opacity: 1;
        transform: translateY(0);
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

        .hero-visual {
            order: -1;
        }

        .section-title {
            font-size: 2.2rem;
        }

        .section {
            padding: 4rem 0;
        }

        .container {
            padding: 0 1rem;
        }

        .benefits-grid {
            grid-template-columns: 1fr;
        }

        .cta-title {
            font-size: 2.2rem;
        }

        .cta-buttons {
            flex-direction: column;
            align-items: center;
        }

        .stats-grid {
            grid-template-columns: 1fr;
            gap: 1rem;
        }
    }

    @media (max-width: 480px) {
        .hero-title {
            font-size: 2rem;
        }

        .hero-subtitle {
            font-size: 1rem;
        }

        .stat-number {
            font-size: 1.5rem;
        }
    }

    /* Section alternating backgrounds */
    .section:nth-child(even) {
        background: #f8fafc;
    }

    .section:nth-child(even)::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="%23e6d55a" stroke-width="0.3" opacity="0.08"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
        pointer-events: none;
    }

    /* Loading state */
    body {
        opacity: 0;
        transition: opacity 0.5s ease;
    }

    body.loaded {
        opacity: 1;
    }
    </style>

    <%@ include file="/view/common/web/add_css.jsp" %>
</head>
<body>
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero Section - Similar to index.jsp -->
    <section class="hero">
        <div class="hero-container">
            <div class="hero-content">
                <h1 class="hero-title animate__animated animate__fadeInLeft">
                    Lợi ích vượt trội khi sử dụng Giúp Việc 24h
                </h1>
                <p class="hero-subtitle animate__animated animate__fadeInLeft animate__delay-1s">
                    Khám phá những giá trị đặc biệt mà nền tảng chúng tôi mang lại cho khách hàng và người giúp việc tại Đà Nẵng.
                </p>
                <div class="hero-cta animate__animated animate__fadeInLeft animate__delay-2s">
                    <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn btn-primary">
                        <i class="fas fa-user-plus" style="margin-right: 0.5rem;"></i>
                        Đăng ký ngay
                    </a>
                    <a href="#benefits" class="btn btn-secondary">
                        Khám phá lợi ích
                    </a>
                </div>
            </div>
            <div class="hero-visual animate__animated animate__fadeInRight animate__delay-1s">
                <div class="hero-stats">
                    <div class="stats-grid">
                        <div class="stat-item">
                            <div class="stat-number">98%</div>
                            <div class="stat-label">Khách hàng hài lòng</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">24/7</div>
                            <div class="stat-label">Hỗ trợ tận tình</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">100%</div>
                            <div class="stat-label">Được xác minh</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">5★</div>
                            <div class="stat-label">Chất lượng dịch vụ</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Benefits for Customers -->
    <section class="section" id="benefits">
        <div class="container">
            <h2 class="section-title">Lợi ích dành cho khách hàng</h2>
            <p class="section-subtitle">
                Những ưu điểm vượt trội khi sử dụng dịch vụ Giúp Việc 24h cho gia đình bạn
            </p>
            
            <div class="benefits-grid">
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-mobile-alt"></i>
                    </div>
                    <h3 class="benefit-title">Đặt dịch vụ siêu nhanh</h3>
                    <p class="benefit-description">Chỉ vài cú chạm để đặt dịch vụ giúp việc theo giờ, ngày hoặc tháng với giao diện thân thiện.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <h3 class="benefit-title">Bảo mật tuyệt đối</h3>
                    <p class="benefit-description">Người giúp việc được xác minh lý lịch nghiêm ngặt, đảm bảo an toàn 100% cho gia đình.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-money-check-alt"></i>
                    </div>
                    <h3 class="benefit-title">Thanh toán thông minh</h3>
                    <p class="benefit-description">Giá cả minh bạch, không phí ẩn, hỗ trợ đa dạng phương thức thanh toán an toàn.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3 class="benefit-title">Đánh giá thông minh</h3>
                    <p class="benefit-description">Hệ thống đánh giá thông minh giúp đảm bảo chất lượng dịch vụ được cải thiện liên tục.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Benefits for Helpers -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Lợi ích dành cho người giúp việc</h2>
            <p class="section-subtitle">
                Những cơ hội phát triển và lợi ích tuyệt vời dành cho đội ngũ người giúp việc
            </p>
            
            <div class="benefits-grid">
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-coins"></i>
                    </div>
                    <h3 class="benefit-title">Thu nhập ổn định</h3>
                    <p class="benefit-description">Nhận công việc đều đặn với mức thu nhập cạnh tranh, cải thiện chất lượng cuộc sống.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h3 class="benefit-title">Linh hoạt thời gian</h3>
                    <p class="benefit-description">Chủ động chọn lịch làm việc phù hợp, cân bằng giữa công việc và cuộc sống.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <h3 class="benefit-title">Đào tạo chuyên môn</h3>
                    <p class="benefit-description">Tham gia khóa đào tạo kỹ năng chuyên nghiệp để nâng cao chất lượng công việc.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="benefit-title">Môi trường tôn trọng</h3>
                    <p class="benefit-description">Làm việc trong môi trường an toàn, được tôn trọng và hỗ trợ bởi đội ngũ chuyên nghiệp.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="container">
            <div class="cta-content">
                <h2 class="cta-title animate__animated animate__fadeIn">
                    Khám phá tiện ích ngay hôm nay
                </h2>
                <p class="cta-subtitle animate__animated animate__fadeIn animate__delay-1s">
                    Dịch vụ giúp việc chuyên nghiệp với giá cả hợp lý, mang đến sự tiện nghi cho gia đình bạn.
                </p>
                <div class="cta-buttons animate__animated animate__fadeIn animate__delay-2s">
                    <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn btn-white">
                        <i class="fas fa-mobile-alt" style="margin-right: 0.5rem;"></i>
                        Tải ứng dụng ngay
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp" class="btn btn-outline-white">
                        <i class="fas fa-sign-in-alt" style="margin-right: 0.5rem;"></i>
                        Đăng nhập
                    </a>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/view/common/web/footer.jsp" %>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Set body as loaded
            document.body.classList.add('loaded');

            // Intersection Observer for animations
            const observerOptions = {
                threshold: 0.15,
                rootMargin: '0px 0px -100px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, observerOptions);

            // Observe all fade-in elements
            document.querySelectorAll('.fade-in-up').forEach(element => {
                observer.observe(element);
            });

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

            console.log('💼 Benefits page loaded successfully');
        });
    </script>

    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>