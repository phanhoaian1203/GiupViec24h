<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Lợi ích</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
    <%@ include file="/view/common/web/add_css.jsp" %>
    <style>
   /* CSS Variables for Modern Design */
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --warm-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            --cool-gradient: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            
            --primary-color: #667eea;
            --primary-dark: #5a67d8;
            --primary-light: #e6e9ff;
            --accent-color: #f093fb;
            --success-color: #4facfe;
            --warning-color: #fed6e3;
            
            --white: #ffffff;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
            --gray-400: #9ca3af;
            --gray-500: #6b7280;
            --gray-600: #4b5563;
            --gray-700: #374151;
            --gray-800: #1f2937;
            --gray-900: #111827;
            
            --shadow-xs: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-sm: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --shadow-2xl: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            
            --border-radius-sm: 8px;
            --border-radius-md: 12px;
            --border-radius-lg: 16px;
            --border-radius-xl: 24px;
            
            --transition-fast: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            --transition-smooth: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            --transition-slow: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            
            --font-primary: 'Inter', system-ui, -apple-system, sans-serif;
            --font-display: 'Poppins', system-ui, -apple-system, sans-serif;
        }

        /* Global Reset & Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: var(--font-primary);
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            background-attachment: fixed;
            color: var(--gray-900);
            line-height: 1.7;
            font-weight: 400;
            overflow-x: hidden;
        }

        /* Glassmorphism Container */
        .glass-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius-xl);
            box-shadow: var(--shadow-2xl);
        }

        /* Container */
        .container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        /* Modern Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            transition: var(--transition-smooth);
        }

        .header.scrolled {
            background: rgba(255, 255, 255, 0.98);
            box-shadow: var(--shadow-lg);
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            max-width: 1280px;
            margin: 0 auto;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-family: var(--font-display);
            font-size: 1.75rem;
            font-weight: 700;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-decoration: none;
            transition: var(--transition-smooth);
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .logo i {
            font-size: 2rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 2.5rem;
        }

        .nav-links a {
            color: var(--gray-700);
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            padding: 0.75rem 1.25rem;
            border-radius: var(--border-radius-lg);
            position: relative;
            transition: var(--transition-smooth);
        }

        .nav-links a::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: var(--primary-gradient);
            transition: var(--transition-smooth);
            transform: translateX(-50%);
        }

        .nav-links a:hover::before {
            width: 80%;
        }

        .nav-links a:hover {
            color: var(--primary-color);
            transform: translateY(-2px);
        }

        .nav-buttons {
            display: flex;
            gap: 1rem;
        }

        .nav-buttons .btn {
            padding: 0.75rem 1.5rem;
            border-radius: var(--border-radius-lg);
            font-weight: 600;
            font-size: 0.95rem;
            text-decoration: none;
            transition: var(--transition-smooth);
            position: relative;
            overflow: hidden;
        }

        .nav-buttons .btn-primary {
            background: var(--primary-gradient);
            color: var(--white);
            box-shadow: var(--shadow-md);
        }

        .nav-buttons .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-xl);
        }

        .nav-buttons .btn-outline {
            background: transparent;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        .nav-buttons .btn-outline:hover {
            background: var(--primary-color);
            color: var(--white);
            transform: translateY(-2px);
        }

        /* Hero Section with Modern Design */
        .hero {
            padding: 8rem 0 6rem;
            text-align: center;
            position: relative;
            overflow: hidden;
            margin-top: 80px;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="50" cy="10" r="0.5" fill="rgba(255,255,255,0.05)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(1deg); }
        }

        .hero-content {
            max-width: 900px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        .hero h1 {
            font-family: var(--font-display);
            font-size: clamp(2.5rem, 5vw, 4rem);
            font-weight: 800;
            margin-bottom: 1.5rem;
            color: var(--white);
            line-height: 1.2;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            animation: fadeInUp 1s ease-out;
        }

        .hero p {
            font-size: clamp(1.1rem, 2vw, 1.3rem);
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
            margin-bottom: 2rem;
            animation: fadeInUp 1s ease-out 0.2s both;
        }

        .hero-decoration {
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            animation: pulse 4s ease-in-out infinite;
        }

        .hero-decoration:nth-child(1) {
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .hero-decoration:nth-child(2) {
            top: 20%;
            right: 15%;
            animation-delay: 2s;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }

        /* Modern Section Styles */
        .section {
            padding: 6rem 0;
            position: relative;
        }

        .section:nth-child(even) {
            background: var(--gray-50);
        }

        .section-header {
            text-align: center;
            margin-bottom: 4rem;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .section-title {
            font-family: var(--font-display);
            font-size: clamp(2rem, 4vw, 2.75rem);
            font-weight: 700;
            margin-bottom: 1.5rem;
            position: relative;
            display: inline-block;
        }

        .section-title.gradient-text {
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -12px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--primary-gradient);
            border-radius: 2px;
        }

        .section-subtitle {
            font-size: 1.2rem;
            color: var(--gray-600);
            line-height: 1.7;
            font-weight: 400;
        }

        /* Modern Benefits Grid */
        .benefits-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
            margin-top: 3rem;
        }

        .benefit-card {
            background: var(--white);
            border-radius: var(--border-radius-xl);
            padding: 2.5rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-100);
            transition: var(--transition-smooth);
            position: relative;
            overflow: hidden;
            group: hover;
        }

        .benefit-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
            transform: scaleX(0);
            transition: var(--transition-smooth);
        }

        .benefit-card:hover::before {
            transform: scaleX(1);
        }

        .benefit-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-2xl);
            border-color: rgba(102, 126, 234, 0.2);
        }

        .benefit-card:nth-child(4n+1) .benefit-icon { background: var(--primary-gradient); }
        .benefit-card:nth-child(4n+2) .benefit-icon { background: var(--secondary-gradient); }
        .benefit-card:nth-child(4n+3) .benefit-icon { background: var(--success-gradient); }
        .benefit-card:nth-child(4n+4) .benefit-icon { background: var(--warm-gradient); }

        .benefit-icon {
            width: 70px;
            height: 70px;
            border-radius: var(--border-radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            font-size: 1.75rem;
            color: var(--white);
            box-shadow: var(--shadow-lg);
            transition: var(--transition-smooth);
        }

        .benefit-card:hover .benefit-icon {
            transform: scale(1.1) rotate(5deg);
        }

        .benefit-title {
            font-family: var(--font-display);
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--gray-800);
            line-height: 1.3;
        }

        .benefit-description {
            color: var(--gray-600);
            font-size: 1rem;
            line-height: 1.6;
            font-weight: 400;
        }

        /* Modern Stats Section */
        .stats-section {
            background: var(--dark-gradient);
            color: var(--white);
            padding: 5rem 0;
            position: relative;
            overflow: hidden;
        }

        .stats-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23dots)"/></svg>');
            opacity: 0.3;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 3rem;
            position: relative;
            z-index: 2;
        }

        .stat-card {
            text-align: center;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius-xl);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: var(--transition-smooth);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
        }

        .stat-number {
            font-family: var(--font-display);
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, #ffffff 0%, #e0e7ff 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
            font-weight: 500;
        }

        /* Modern CTA Section */
        .cta {
            background: var(--primary-gradient);
            padding: 6rem 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .cta::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 30% 80%, rgba(255, 255, 255, 0.2) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.15) 0%, transparent 50%);
        }

        .cta-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        .cta-title {
            font-family: var(--font-display);
            font-size: clamp(2rem, 4vw, 3rem);
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: var(--white);
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .cta-subtitle {
            font-size: 1.2rem;
            margin-bottom: 3rem;
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .cta-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            padding: 1rem 2.5rem;
            border-radius: var(--border-radius-lg);
            font-weight: 600;
            font-size: 1.1rem;
            text-decoration: none;
            transition: var(--transition-smooth);
            position: relative;
            overflow: hidden;
            min-width: 200px;
            justify-content: center;
        }

        .cta-btn-primary {
            background: var(--white);
            color: var(--primary-color);
            box-shadow: var(--shadow-xl);
        }

        .cta-btn-primary:hover {
            background: var(--gray-100);
            transform: translateY(-3px);
            box-shadow: var(--shadow-2xl);
        }

        .cta-btn-outline {
            background: transparent;
            color: var(--white);
            border: 2px solid rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
        }

        .cta-btn-outline:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: var(--white);
            transform: translateY(-3px);
        }

        /* Animation Classes */
        .fade-in-up {
            opacity: 0;
            transform: translateY(30px);
            transition: var(--transition-slow);
        }

        .fade-in-up.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .slide-in-left {
            opacity: 0;
            transform: translateX(-50px);
            transition: var(--transition-slow);
        }

        .slide-in-left.visible {
            opacity: 1;
            transform: translateX(0);
        }

        .slide-in-right {
            opacity: 0;
            transform: translateX(50px);
            transition: var(--transition-slow);
        }

        .slide-in-right.visible {
            opacity: 1;
            transform: translateX(0);
        }

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
        @media (max-width: 1024px) {
            .container {
                padding: 0 1.5rem;
            }
            
            .nav {
                padding: 1rem 1.5rem;
            }
        }

        @media (max-width: 768px) {
            .nav {
                flex-direction: column;
                gap: 1.5rem;
                padding: 1.5rem;
            }

            .nav-links {
                gap: 1.5rem;
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav-buttons {
                flex-direction: column;
                width: 100%;
                max-width: 300px;
            }

            .hero {
                padding: 6rem 0 4rem;
            }

            .section {
                padding: 4rem 0;
            }

            .benefits-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 2rem;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }

            .cta-btn {
                width: 100%;
                max-width: 300px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 1rem;
            }

            .hero {
                padding: 5rem 0 3rem;
            }

            .section {
                padding: 3rem 0;
            }

            .benefit-card {
                padding: 2rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .nav-links {
                gap: 1rem;
            }

            .nav-links a {
                padding: 0.5rem 0.75rem;
                font-size: 0.9rem;
            }
        }

        /* Accessibility & Performance */
        @media (prefers-reduced-motion: reduce) {
            * {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }

        /* Focus styles for accessibility */
        .nav-links a:focus,
        .nav-buttons .btn:focus,
        .cta-btn:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Loading animation */
        .loading {
            opacity: 0;
            animation: fadeIn 0.5s ease-in-out forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero -->
    <section class="hero">
        <div class="container">
            <h1>Lợi ích vượt trội khi sử dụng Giúp Việc 24h</h1>
            <p>Khám phá những giá trị đặc biệt mà nền tảng chúng tôi mang lại cho khách hàng và người giúp việc tại Đà Nẵng.</p>
        </div>
    </section>

    <!-- Benefits for Customers -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Lợi ích dành cho khách hàng</h2>
            <p class="section-subtitle">Trải nghiệm dịch vụ tiện lợi, an toàn và đáng tin cậy với công nghệ hiện đại.</p>
            
            <div class="benefits-grid">
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-rocket"></i>
                    </div>
                    <h3 class="benefit-title">Đặt dịch vụ siêu nhanh</h3>
                    <p class="benefit-description">Chỉ vài cú chạm để đặt dịch vụ giúp việc theo giờ, ngày hoặc tháng với giao diện thân thiện.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-shield-check"></i>
                    </div>
                    <h3 class="benefit-title">Bảo mật tuyệt đối</h3>
                    <p class="benefit-description">Người giúp việc được xác minh lý lịch nghiêm ngặt, đảm bảo an toàn 100% cho gia đình.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-credit-card"></i>
                    </div>
                    <h3 class="benefit-title">Thanh toán thông minh</h3>
                    <p class="benefit-description">Giá cả minh bạch, không phí ẩn, hỗ trợ đa dạng phương thức thanh toán an toàn.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-star"></i>
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
            <p class="section-subtitle">Thu nhập ổn định và môi trường làm việc chuyên nghiệp, tôn trọng.</p>
            
            <div class="benefits-grid">
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-wallet"></i>
                    </div>
                    <h3 class="benefit-title">Thu nhập ổn định</h3>
                    <p class="benefit-description">Nhận công việc đều đặn với mức thu nhập cạnh tranh, cải thiện chất lượng cuộc sống.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <h3 class="benefit-title">Linh hoạt thời gian</h3>
                    <p class="benefit-description">Chủ động chọn lịch làm việc phù hợp, cân bằng giữa công việc và cuộc sống.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3 class="benefit-title">Đào tạo chuyên môn</h3>
                    <p class="benefit-description">Tham gia khóa đào tạo kỹ năng chuyên nghiệp để nâng cao chất lượng công việc.</p>
                </div>
                
                <div class="benefit-card fade-in-up">
                    <div class="benefit-icon">
                        <i class="fas fa-handshake"></i>
                    </div>
                    <h3 class="benefit-title">Môi trường tôn trọng</h3>
                    <p class="benefit-description">Làm việc trong môi trường an toàn, được tôn trọng và hỗ trợ bởi đội ngũ chuyên nghiệp.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats -->
    <section class="stats-section">
        <div class="container">
            <div class="stats-grid">
                <div>
                    <div class="stat-number">500+</div>
                    <div class="stat-label">Khách hàng hài lòng</div>
                </div>
                <div>
                    <div class="stat-number">200+</div>
                    <div class="stat-label">Người giúp việc chuyên nghiệp</div>
                </div>
                <div>
                    <div class="stat-number">1000+</div>
                    <div class="stat-label">Dịch vụ hoàn thành</div>
                </div>
                <div>
                    <div class="stat-number">4.8/5</div>
                    <div class="stat-label">Đánh giá trung bình</div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section class="cta">
        <div class="container">
            <h2 class="cta-title">Tham gia Giúp Việc 24h ngay hôm nay</h2>
            <p class="cta-subtitle">Trải nghiệm dịch vụ chất lượng cao hoặc trở thành người giúp việc chuyên nghiệp tại Đà Nẵng.</p>
            <div class="cta-buttons">
                <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="cta-btn cta-btn-primary">Đăng ký ngay</a>
                <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp" class="cta-btn cta-btn-outline">Đăng nhập</a>
            </div>
        </div>
    </section>

    <%@ include file="/view/common/web/footer.jsp" %>
    <%@ include file="/view/common/web/add_js.jsp" %>

    <script>
        // Smooth scroll animation
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('.fade-in-up').forEach(el => observer.observe(el));

        // Header scroll effect
        window.addEventListener('scroll', () => {
            const header = document.querySelector('.header');
            if (window.scrollY > 100) {
                header.style.background = 'rgba(255, 255, 255, 0.98)';
            } else {
                header.style.background = 'rgba(255, 255, 255, 0.95)';
            }
        });
    </script>
</body>
</html>