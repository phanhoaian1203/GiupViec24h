<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về chúng tôi - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1AB394;
            --primary-dark: #18a085;
            --primary-light: #e8f8f5;
            --primary-gradient: linear-gradient(135deg, #1AB394 0%, #18a085 100%);
            --white: #ffffff;
            --gray-light: #F9FAFB;
            --gray-medium: #E5E7EB;
            --gray: #D1D5DB;
            --text-dark: #111827;
            --text-medium: #4B5563;
            --text-light: #6B7280;
            --accent: #FF7043;
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 20px rgba(0, 0, 0, 0.08);
            --shadow-lg: 0 8px 30px rgba(0, 0, 0, 0.12);
            --border-radius: 16px;
            --border-radius-sm: 12px;
            --transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        html {
            scroll-behavior: smooth;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--gray-light);
            color: var(--text-dark);
            line-height: 1.7;
            overflow-x: hidden;
        }

        /* Enhanced Header Styles */
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--text-dark);
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: var(--transition);
        }

        .header.scrolled {
            padding: 0.75rem 0;
            background: rgba(255, 255, 255, 0.98);
            box-shadow: var(--shadow-md);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.6rem;
            font-weight: 700;
            color: var(--primary-dark);
            text-decoration: none;
        }

        .logo i {
            font-size: 2rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            transition: var(--transition);
        }

        .logo:hover i {
            transform: scale(1.1) rotate(5deg);
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .nav-links a {
            color: var(--text-dark);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95rem;
            padding: 0.75rem 1.25rem;
            border-radius: var(--border-radius-sm);
            transition: var(--transition);
            position: relative;
        }

        .nav-links a::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: var(--primary-gradient);
            transition: var(--transition);
            transform: translateX(-50%);
        }

        .nav-links a:hover::before {
            width: 80%;
        }

        .nav-links a:hover {
            background-color: var(--primary-light);
            color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .nav-links .btn {
            background: var(--primary-gradient);
            color: var(--white);
            padding: 0.75rem 1.75rem;
            border-radius: var(--border-radius-sm);
            font-weight: 600;
            box-shadow: var(--shadow-sm);
        }

        .nav-links .btn::before {
            display: none;
        }

        .nav-links .btn:hover {
            background: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        /* Dropdown Enhancements */
        .dropdown {
            position: relative;
        }

        .dropdown .dropbtn {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .dropdown .dropbtn i {
            font-size: 0.75rem;
            transition: var(--transition);
        }

        .dropdown:hover .dropbtn i {
            transform: rotate(180deg);
        }

        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(20px);
            min-width: 240px;
            box-shadow: var(--shadow-lg);
            border-radius: var(--border-radius);
            border: 1px solid rgba(255, 255, 255, 0.2);
            z-index: 1001;
            opacity: 0;
            transform: translateY(10px);
            transition: var(--transition);
            overflow: hidden;
        }

        .dropdown:hover .dropdown-content {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        .dropdown-content a {
            display: block;
            padding: 1rem 1.5rem;
            color: var(--text-dark);
            font-weight: 400;
            border-radius: 0;
            border-bottom: 1px solid var(--gray-medium);
            transition: var(--transition);
        }

        .dropdown-content a:last-child {
            border-bottom: none;
        }

        .dropdown-content a::before {
            display: none;
        }

        .dropdown-content a:hover {
            background: var(--primary-light);
            color: var(--primary-dark);
            padding-left: 2rem;
            transform: none;
        }

        /* Hamburger Menu */
        .hamburger {
            display: none;
            cursor: pointer;
            z-index: 1001;
            padding: 8px;
        }

        .hamburger div {
            width: 25px;
            height: 3px;
            background: var(--text-dark);
            margin: 5px 0;
            transition: var(--transition);
            border-radius: 2px;
        }

        .hamburger.toggle .line1 {
            transform: rotate(-45deg) translate(-5px, 6px);
        }

        .hamburger.toggle .line2 {
            opacity: 0;
        }

        .hamburger.toggle .line3 {
            transform: rotate(45deg) translate(-5px, -6px);
        }

        /* Enhanced Hero Section */
        .about-hero {
            background: linear-gradient(135deg, rgba(26, 179, 148, 0.9) 0%, rgba(24, 160, 133, 0.9) 100%), 
                        url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 300"><defs><pattern id="pattern" x="0" y="0" width="40" height="40" patternUnits="userSpaceOnUse"><circle cx="20" cy="20" r="2" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23pattern)"/></svg>');
            background-size: cover, 40px 40px;
            background-position: center, 0 0;
            padding: 8rem 0 6rem;
            text-align: center;
            color: var(--white);
            position: relative;
            overflow: hidden;
        }

        .about-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 300"><path d="M0,100 Q250,50 500,100 T1000,100 L1000,300 L0,300 Z" fill="rgba(255,255,255,0.05)"/></svg>') no-repeat bottom;
            background-size: cover;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .about-hero h1 {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            background: linear-gradient(135deg, #ffffff 0%, rgba(255,255,255,0.8) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: fadeInUp 1s ease-out;
        }

        .about-hero p {
            font-size: 1.3rem;
            opacity: 0.95;
            max-width: 900px;
            margin: 0 auto;
            font-weight: 400;
            animation: fadeInUp 1s ease-out 0.2s both;
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

        /* Enhanced Section Styles */
        .section {
            padding: 6rem 0;
            position: relative;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            color: var(--text-dark);
            font-size: 2.75rem;
            font-weight: 800;
            position: relative;
            letter-spacing: -0.025em;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 5px;
            background: var(--primary-gradient);
            border-radius: 3px;
        }

        .section-content {
            max-width: 1000px;
            margin: 0 auto;
            text-align: center;
            font-size: 1.125rem;
            color: var(--text-medium);
            margin-bottom: 3rem;
            line-height: 1.8;
            font-weight: 400;
        }

        /* Alternating Section Backgrounds */
        .section:nth-child(even) {
            background: linear-gradient(135deg, var(--primary-light) 0%, rgba(248, 250, 252, 0.8) 100%);
            position: relative;
        }

        .section:nth-child(even)::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" x="0" y="0" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="rgba(26,179,148,0.05)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23dots)"/></svg>');
            pointer-events: none;
        }

        /* Enhanced Value Cards */
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2.5rem;
            margin-top: 3rem;
        }

        .value-card {
            background: var(--white);
            border-radius: var(--border-radius);
            padding: 2.5rem 2rem;
            text-align: center;
            transition: var(--transition);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: var(--shadow-sm);
            position: relative;
            overflow: hidden;
        }

        .value-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
            transform: scaleX(0);
            transition: var(--transition);
        }

        .value-card:hover::before {
            transform: scaleX(1);
        }

        .value-card:hover {
            transform: translateY(-12px);
            box-shadow: var(--shadow-lg);
        }

        .value-icon {
            font-size: 3rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1.5rem;
            transition: var(--transition);
        }

        .value-card:hover .value-icon {
            transform: scale(1.1);
        }

        .value-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--text-dark);
            font-weight: 700;
        }

        .value-card p {
            color: var(--text-medium);
            line-height: 1.7;
            font-weight: 400;
        }

        /* Stats Section */
        .stats-section {
            background: var(--primary-gradient);
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
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="hexagon" x="0" y="0" width="30" height="30" patternUnits="userSpaceOnUse"><polygon points="15,5 25,12 25,22 15,29 5,22 5,12" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100%" height="100%" fill="url(%23hexagon)"/></svg>');
            opacity: 0.5;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 3rem;
            position: relative;
            z-index: 2;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, #ffffff 0%, rgba(255,255,255,0.8) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
            font-weight: 500;
        }

        /* Enhanced CTA Section */
        .cta {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 50%, #0f7a6b 100%);
            padding: 6rem 0;
            text-align: center;
            color: var(--white);
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
            background: radial-gradient(circle at center, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .cta-content {
            position: relative;
            z-index: 2;
        }

        .cta-title {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            font-weight: 800;
            letter-spacing: -0.025em;
        }

        .cta-subtitle {
            font-size: 1.3rem;
            margin-bottom: 2.5rem;
            opacity: 0.95;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            font-weight: 400;
        }

        .btn {
            display: inline-block;
            padding: 1rem 2.5rem;
            background: var(--white);
            color: var(--primary-dark);
            text-decoration: none;
            border-radius: var(--border-radius-sm);
            font-weight: 600;
            font-size: 1.1rem;
            transition: var(--transition);
            border: none;
            box-shadow: var(--shadow-md);
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
            transition: var(--transition);
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            background: var(--gray-light);
            color: var(--primary-color);
            transform: translateY(-3px);
            box-shadow: var(--shadow-lg);
        }

        /* Enhanced Footer */
        .footer {
            background: linear-gradient(135deg, var(--text-dark) 0%, #0a0a0a 100%);
            color: var(--white);
            padding: 5rem 0 2rem;
            position: relative;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: var(--primary-gradient);
        }

        .footer-container {
            max-width: 1400px;
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
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .footer-description {
            margin-bottom: 2rem;
            opacity: 0.9;
            font-size: 1rem;
            line-height: 1.7;
            color: #d1d5db;
        }

        .footer-social {
            display: flex;
            gap: 1rem;
        }

        .footer-social a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            background: rgba(255, 255, 255, 0.1);
            color: var(--white);
            border-radius: 50%;
            transition: var(--transition);
            font-size: 1.2rem;
            backdrop-filter: blur(10px);
        }

        .footer-social a:hover {
            background: var(--primary-color);
            transform: translateY(-3px) scale(1.1);
        }

        .footer-title {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            color: var(--white);
            font-weight: 600;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links a {
            color: #d1d5db;
            text-decoration: none;
            font-size: 1rem;
            transition: var(--transition);
            display: block;
            margin-bottom: 1rem;
            padding: 0.25rem 0;
        }

        .footer-links a:hover {
            color: var(--primary-color);
            transform: translateX(8px);
        }

        .footer-contact li {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            margin-bottom: 1.5rem;
            font-size: 1rem;
            color: #d1d5db;
        }

        .footer-contact i {
            color: var(--primary-color);
            margin-top: 4px;
            font-size: 1.1rem;
        }

        .copyright {
            text-align: center;
            padding-top: 2.5rem;
            margin-top: 3rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.95rem;
            opacity: 0.8;
            color: #9ca3af;
        }

        /* Enhanced Responsive Design */
        @media (max-width: 1200px) {
            .container {
                padding: 0 1.5rem;
            }
            
            .navbar {
                padding: 0 1.5rem;
            }
        }

        @media (max-width: 992px) {
            .about-hero h1 {
                font-size: 2.8rem;
            }
            
            .section-title {
                font-size: 2.3rem;
            }
            
            .values-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 2rem;
            }
        }

        @media (max-width: 768px) {
            .hamburger {
                display: block;
            }

            .nav-links {
                position: fixed;
                right: -100%;
                top: 0;
                width: 85%;
                height: 100vh;
                flex-direction: column;
                align-items: center;
                padding-top: 120px;
                background: rgba(255, 255, 255, 0.98);
                backdrop-filter: blur(20px);
                transition: var(--transition);
                box-shadow: -10px 0 30px rgba(0, 0, 0, 0.1);
                gap: 1rem;
            }

            .nav-links.active {
                right: 0;
            }

            .nav-links a {
                margin: 0.5rem 0;
                font-size: 1.1rem;
                width: 80%;
                text-align: center;
            }

            .about-hero {
                padding: 6rem 0 4rem;
            }

            .about-hero h1 {
                font-size: 2.2rem;
            }

            .about-hero p {
                font-size: 1.1rem;
            }

            .section {
                padding: 4rem 0;
            }

            .section-title {
                font-size: 2rem;
            }

            .section-content {
                font-size: 1rem;
            }

            .cta-title {
                font-size: 2.2rem;
            }

            .cta-subtitle {
                font-size: 1.1rem;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 2rem;
            }

            .stat-number {
                font-size: 2.5rem;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 0 1rem;
            }

            .about-hero h1 {
                font-size: 1.8rem;
            }

            .section-title {
                font-size: 1.8rem;
            }

            .value-card {
                padding: 2rem 1.5rem;
            }

            .values-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .footer-container {
                grid-template-columns: 1fr;
                gap: 2rem;
            }
        }

        /* Smooth reveal animations */
        .fade-in-up {
            opacity: 0;
            transform: translateY(30px);
            transition: var(--transition);
        }

        .fade-in-up.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* Loading animation for page */
        .page-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            transition: opacity 0.5s ease;
        }

        .page-loader.hide {
            opacity: 0;
            pointer-events: none;
        }

        .loader {
            width: 50px;
            height: 50px;
            border: 3px solid var(--gray-medium);
            border-top: 3px solid var(--primary-color);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>

<body>
    <!-- Header -->
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- About Hero Section -->
    <section class="about-hero">
        <div class="container">
            <h1>Về Giúp Việc 24h</h1>
            <p>Chúng tôi tự hào mang đến dịch vụ giúp việc chuyên nghiệp, tiện lợi, giúp bạn chăm sóc gia đình một cách trọn vẹn nhất.</p>
        </div>
    </section>

    <!-- About Us Section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Chúng tôi là Giúp Việc 24h</h2>
            <div class="section-content">
                <p>Công ty TNHH Giúp Việc 24h được thành lập vào ngày 15 tháng 05 năm 2017 bởi CEO – Founder Trần Minh Tuấn. Chúng tôi là đơn vị tiên phong trong việc ứng dụng công nghệ vào ngành dịch vụ giúp việc tại Việt Nam, mang đến các giải pháp tiện ích như: dọn dẹp nhà cửa, vệ sinh thiết bị gia dụng, hỗ trợ công việc văn phòng, và nhiều hơn nữa. Với ứng dụng đặt lịch Giúp Việc 24h dành cho khách hàng và ứng dụng nhận việc Giúp Việc 24h Partner dành cho cộng tác viên, khách hàng và người lao động có thể dễ dàng kết nối và quản lý công việc trực tiếp trên nền tảng số.</p>
            </div>
        </div>
    </section>

    <!-- Meaning Section -->
    <section class="section" style="background-color: var(--primary-light);">
        <div class="container">
            <h2 class="section-title">Ý nghĩa của Giúp Việc 24h</h2>
            <div class="section-content">
                <p>Tên gọi Giúp Việc 24h được lấy cảm hứng từ hình ảnh những người lao động cần cù, sẵn sàng hỗ trợ mọi lúc, mọi nơi – giống như sự hiện diện 24/7 của chúng tôi để đáp ứng nhu cầu của bạn. Các cộng tác viên của Giúp Việc 24h, hay còn gọi là "Giúp Viên," là những người tận tâm, chuyên nghiệp, luôn nỗ lực mang đến cho khách hàng những trải nghiệm dịch vụ tốt nhất với sự tiện lợi và nhanh chóng.</p>
            </div>
        </div>
    </section>

    <!-- Operating Areas Section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Khu vực hoạt động</h2>
            <div class="section-content">
                <p>Hiện nay, Giúp Việc 24h đang cung cấp dịch vụ cho hàng ngàn gia đình tại hơn 15 tỉnh thành lớn trên cả nước, bao gồm: Hà Nội, Hải Phòng, Đà Nẵng, Huế, Nha Trang, Đà Lạt, Bình Dương, TP.HCM, Cần Thơ và nhiều khu vực khác. Không dừng lại ở đó, chúng tôi đang từng bước mở rộng ra thị trường quốc tế, bắt đầu với dịch vụ giúp việc theo giờ tại Singapore và Malaysia, với mục tiêu mang đến sự tiện nghi cho khách hàng trên toàn khu vực Đông Nam Á.</p>
            </div>
        </div>
    </section>

    <!-- Growth Section -->
    <section class="section" style="background-color: var(--primary-light);">
        <div class="container">
            <h2 class="section-title">Phát triển mạnh mẽ hơn</h2>
            <div class="section-content">
                <p>Tính đến nay, Giúp Việc 24h đã hỗ trợ hơn 8,000 cộng tác viên có công việc ổn định và phục vụ nhu cầu chăm sóc nhà cửa cho hơn 800,000 khách hàng trên toàn quốc. Với cam kết không ngừng nâng cao chất lượng, chúng tôi luôn cải tiến ứng dụng và dịch vụ để mang đến cho khách hàng những trải nghiệm tuyệt vời nhất.</p>
            </div>
        </div>
    </section>

    <!-- Vision Section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Tầm nhìn</h2>
            <div class="section-content">
                <p>Giúp Việc 24h không chỉ dừng lại ở việc cung cấp các dịch vụ dọn dẹp, vệ sinh thiết bị gia dụng, hay hỗ trợ công việc văn phòng. Chúng tôi hướng tới trở thành công ty hàng đầu tại Việt Nam và mở rộng ra thị trường Đông Nam Á, tích hợp thêm nhiều dịch vụ tiện ích gia đình trên một nền tảng di động thông minh, giúp bạn chăm sóc tổ ấm một cách dễ dàng và hiệu quả hơn.</p>
            </div>
        </div>
    </section>

    <!-- Mission Section -->
    <section class="section" style="background-color: var(--primary-light);">
        <div class="container">
            <h2 class="section-title">Sứ mệnh</h2>
            <div class="section-content">
                <p>Giúp Việc 24h ra đời với sứ mệnh giải quyết gánh nặng công việc nhà cho các gia đình hiện đại, đồng thời nâng cao giá trị của nghề giúp việc thông qua việc xây dựng đội ngũ lao động chuyên nghiệp, tận tâm và được đào tạo bài bản. Chúng tôi mong muốn mang đến cho khách hàng một cuộc sống thoải mái hơn khi việc nhà được chăm sóc chu đáo, đồng thời tạo ra nguồn thu nhập bền vững cho những người lao động trong ngành.</p>
            </div>
        </div>
    </section>

    <!-- Core Values Section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Giá trị cốt lõi</h2>
            <div class="values-grid">
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <h3 class="value-title">Chất lượng</h3>
                    <p>Cam kết mang đến dịch vụ chất lượng cao. Tất cả các Giúp Viên của chúng tôi đều được tuyển chọn kỹ lưỡng, trải qua đào tạo chuyên sâu và kiểm tra nghiêm ngặt.</p>
                </div>
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3 class="value-title">Tận tâm</h3>
                    <p>Luôn đặt lợi ích của khách hàng lên hàng đầu, làm việc với sự tận tâm để đảm bảo sự hài lòng tối đa.</p>
                </div>
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-bolt"></i>
                    </div>
                    <h3 class="value-title">Tiện lợi</h3>
                    <p>Đặt lịch và nhận việc dễ dàng qua ứng dụng chỉ trong 60 giây, với thời gian làm việc linh hoạt phù hợp mọi nhu cầu.</p>
                </div>
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-rocket"></i>
                    </div>
                    <h3 class="value-title">Cải tiến</h3>
                    <p>Lắng nghe ý kiến khách hàng để không ngừng đổi mới công nghệ và dịch vụ, mang đến trải nghiệm tốt nhất.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Support Section -->
    <section class="section" style="background-color: var(--primary-light);">
        <div class="container">
            <h2 class="section-title">Chúng tôi luôn sẵn sàng hỗ trợ bạn</h2>
            <div class="section-content">
                <p>Bạn có bất kỳ câu hỏi nào về dịch vụ? Chỉ cần liên hệ với chúng tôi, đội ngũ Giúp Việc 24h sẽ nhanh chóng giải đáp mọi thắc mắc của bạn.</p>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="container">
            <h2 class="cta-title">Trải nghiệm dịch vụ của Giúp Việc 24h ngay hôm nay</h2>
            <p class="cta-subtitle">Hãy để chúng tôi chăm sóc tổ ấm của bạn với sự chuyên nghiệp và tận tâm.</p>
            <a href="booking.jsp" class="btn">Đặt dịch vụ ngay</a>
        </div>
    </section>

    <!-- Include Footer -->
    <%@ include file="/view/common/web/footer.jsp" %>
    <!<!-- Include add_js -->
    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>