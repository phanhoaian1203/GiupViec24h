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
        color: #1a1a1a;
        background: #ecece6;
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
        background: linear-gradient(135deg, #ecece6 0%, #d0d0d0 50%, #ecece6 100%);
        min-height: 110vh;
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
            radial-gradient(circle at 20% 80%, rgba(192, 169, 135, 0.15) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(192, 169, 135, 0.12) 0%, transparent 50%);
        pointer-events: none;
    }

    .hero-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 3rem;
        align-items: center;
        width: 100%;
        max-width: 1400px;
        margin: 0 auto;
        padding: 0 2rem;
        position: relative;
        z-index: 2;
    }

    .hero-content {
        color: #1a1a1a;
        padding-right: 2rem;
    }

    .hero-badge {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        background: rgba(192, 169, 135, 0.1);
        color: #c0a987;
        padding: 0.7rem 1.2rem;
        border-radius: 50px;
        font-size: 0.9rem;
        font-weight: 700;
        margin-bottom: 2rem;
        border: 1px solid rgba(192, 169, 135, 0.2);
        box-shadow: 0 8px 32px rgba(192, 169, 135, 0.1);
    }

    .hero-title {
        font-size: 3.8rem;
        font-weight: 900;
        line-height: 1.1;
        margin-bottom: 2rem;
        color: #000000;
        letter-spacing: -0.02em;
    }

    .hero-title .highlight {
        color: #000000;
    }

    .hero-subtitle {
        font-size: 1.3rem;
        margin-bottom: 3rem;
        line-height: 1.6;
        font-weight: 500;
        color: #4a4a4a;
        max-width: 95%;
    }

    .hero-cta {
        display: flex;
        gap: 1.5rem;
        flex-wrap: wrap;
        align-items: center;
        margin-bottom: 3rem;
    }

    .hero-stats {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 2rem;
        margin-top: 2rem;
        padding: 2rem 0;
        border-top: 1px solid rgba(192, 169, 135, 0.2);
    }

    .stat-item {
        text-align: center;
        color: #1a1a1a;
    }

    .stat-number {
        display: block;
        font-size: 2.2rem;
        font-weight: 900;
        color: #c0a987;
        line-height: 1;
        margin-bottom: 0.5rem;
    }

    .stat-label {
        font-size: 0.9rem;
        color: #4a4a4a;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .hero-visual {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 600px;
    }

    .hero-phone {
        width: 100%;
        max-width: 550px;
        height: 600px;
        object-fit: cover;
        border-radius: 20px;
        filter: drop-shadow(0 30px 60px rgba(0,0,0,0.15));
        transition: transform 0.4s ease;
        border: 3px solid rgba(192, 169, 135, 0.2);
    }

    .hero-phone:hover {
        transform: translateY(-10px) scale(1.02);
    }

    .trust-indicators {
        position: absolute;
        bottom: -30px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        gap: 2rem;
        z-index: 10;
    }

    .trust-badge {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 1rem 1.5rem;
        border-radius: 12px;
        display: flex;
        align-items: center;
        gap: 0.7rem;
        box-shadow: 0 10px 30px rgba(192, 169, 135, 0.2);
        border: 1px solid rgba(192, 169, 135, 0.2);
    }

    .trust-icon {
        width: 30px;
        height: 30px;
        background: linear-gradient(135deg, #c0a987, #a68e6e);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 0.9rem;
    }

    .trust-text {
        font-size: 0.85rem;
        font-weight: 700;
        color: #1a1a1a;
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
        background: #c0a987;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        font-size: 1.5rem;
        box-shadow: 0 10px 30px rgba(192, 169, 135, 0.35);
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
        padding: 1rem 2rem;
        border-radius: 12px;
        text-decoration: none;
        font-weight: 700;
        font-size: 1rem;
        transition: all 0.3s ease;
        border: 2px solid transparent;
        cursor: pointer;
        min-width: 180px;
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
        background: linear-gradient(135deg, #c0a987 0%, #a68e6e 100%);
        color: #ffffff;
        border-color: #c0a987;
        box-shadow: 0 8px 25px rgba(192, 169, 135, 0.4);
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #a68e6e 0%, #8a7355 100%);
        transform: translateY(-3px);
        box-shadow: 0 12px 35px rgba(192, 169, 135, 0.5);
    }

    .btn-secondary {
        background: transparent;
        color: #4a4a4a;
        border: 2px solid #c0a987;
    }

    .btn-secondary:hover {
        background: #c0a987;
        color: #ffffff;
        transform: translateY(-3px);
    }

    .btn-outline {
        background: rgba(192, 169, 135, 0.1);
        color: #c0a987;
        border: 2px solid rgba(192, 169, 135, 0.3);
        backdrop-filter: blur(10px);
    }

    .btn-outline:hover {
        background: rgba(192, 169, 135, 0.2);
        border-color: rgba(192, 169, 135, 0.5);
        transform: translateY(-3px);
    }

    /* Section Header Styles */
    .section-header {
        text-align: center;
        margin-bottom: 5rem;
        position: relative;
    }

    .section-category {
        font-size: 0.9rem;
        color: #c0a987;
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
        background: #c0a987;
        margin: 0.5rem auto;
    }

    .section-title {
        font-size: 2.8rem;
        font-weight: 900;
        color: #000000;
        margin-bottom: 1.5rem;
        position: relative;
        display: inline-block;
        text-transform: uppercase;
        letter-spacing: -0.02em;
    }

    .section-subtitle {
        font-size: 1.15rem;
        color: #4a4a4a;
        max-width: 650px;
        margin: 0 auto;
        line-height: 1.6;
        font-weight: 500;
    }

    /* Services Section */
    .services {
        padding: 6rem 0;
        background: #ecece6;
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
        border: 1px solid #d0d0d0;
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
        color: #1a1a1a;
        margin-bottom: 0.75rem;
        letter-spacing: -0.01em;
    }

    .service-description {
        color: #4a4a4a;
        font-size: 0.9rem;
        line-height: 1.5;
        margin-bottom: 1.5rem;
        font-weight: 500;
    }

    .service-link {
        color: #c0a987;
        text-decoration: none;
        font-weight: 700;
        display: inline-flex;
        align-items: center;
        gap: 0.4rem;
        font-size: 0.9rem;
    }

    .service-link:hover {
        color: #a68e6e;
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
        color: #1a1a1a;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        z-index: 10;
        transition: all 0.3s ease;
    }

    .carousel-btn:hover {
        background: #c0a987;
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
        background: #ecece6;
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
        background: #c0a987;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        font-weight: 900;
        font-size: 1.1rem;
        box-shadow: 0 4px 15px rgba(192, 169, 135, 0.35);
        text-shadow: 0 1px 2px rgba(0,0,0,0.2);
    }

    .step-title {
        font-size: 1.2rem;
        font-weight: 800;
        color: #1a1a1a;
        margin: 1.5rem 0 1rem;
    }

    .step-description {
        color: #4a4a4a;
        line-height: 1.6;
        font-weight: 500;
    }

    /* Reviews Section */
    .reviews {
        background: #ffffff;
        padding: 5rem 0;
    }

    .reviews-container {
        position: relative;
        overflow: hidden;
        margin-top: 3rem;
    }

    .reviews-wrapper {
        overflow-x: auto;
        scroll-behavior: smooth;
        -webkit-overflow-scrolling: touch;
        padding: 1rem 0 2rem;
    }

    .reviews-grid {
        display: flex;
        gap: 2rem;
        padding: 0 1rem;
        min-width: max-content;
    }

    .review-card {
        background: #ecece6;
        border: 1px solid #d0d0d0;
        border-radius: 16px;
        padding: 2rem;
        width: 350px;
        flex-shrink: 0;
        position: relative;
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .review-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }

    .review-rating {
        display: flex;
        gap: 0.25rem;
        margin-bottom: 1rem;
    }

    .review-star {
        color: #f39c12;
        font-size: 1.2rem;
    }

    .review-content {
        color: #4a4a4a;
        font-size: 1rem;
        line-height: 1.6;
        margin-bottom: 1.5rem;
        font-style: italic;
        font-weight: 500;
    }

    .review-author {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .author-avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background: linear-gradient(135deg, #c0a987, #a68e6e);
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        font-weight: 700;
        font-size: 1.2rem;
        flex-shrink: 0;
    }

    .author-info h4 {
        color: #1a1a1a;
        font-weight: 700;
        font-size: 1rem;
        margin-bottom: 0.25rem;
    }

    .author-info p {
        color: #4a4a4a;
        font-size: 0.85rem;
        font-weight: 500;
    }

    .review-quote {
        position: absolute;
        top: 1rem;
        right: 1rem;
        color: #c0a987;
        font-size: 2rem;
        opacity: 0.3;
    }

    .reviews-carousel-btn {
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
        color: #1a1a1a;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        z-index: 10;
        transition: all 0.3s ease;
    }

    .reviews-carousel-btn:hover {
        background: #c0a987;
        color: #ffffff;
        transform: translateY(-50%) scale(1.1);
    }

    .reviews-prev-btn {
        left: 1rem;
    }

    .reviews-next-btn {
        right: 1rem;
    }

    .reviews-wrapper::-webkit-scrollbar {
        display: none;
    }

    .reviews-wrapper {
        -ms-overflow-style: none;
        scrollbar-width: none;
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
        background: #ecece6;
        border: 1px solid #d0d0d0;
    }

    .feature-icon {
        width: 50px;
        height: 50px;
        background: #ffffff;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #c0a987;
        font-size: 1.4rem;
        flex-shrink: 0;
    }

    .feature-content h3 {
        font-size: 1.2rem;
        font-weight: 800;
        color: #1a1a1a;
        margin-bottom: 0.5rem;
    }

    .feature-content p {
        color: #4a4a4a;
        font-size: 0.9rem;
        line-height: 1.5;
        font-weight: 500;
    }

    /* FAQ Section */
    .faq {
        background: #ffffff;
        padding: 5rem 0;
    }

    .faq-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 0 1.5rem;
    }

    .faq-item {
        background: #ffffff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        margin-bottom: 1rem;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
    }

    .faq-item:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .faq-question {
        width: 100%;
        background: none;
        border: none;
        padding: 1.5rem 2rem;
        text-align: left;
        font-size: 1.1rem;
        font-weight: 600;
        color: #333333;
        cursor: pointer;
        display: flex;
        justify-content: space-between;
        align-items: center;
        transition: background-color 0.3s ease;
    }

    .faq-question:hover {
        background-color: #f8f9fa;
    }

    .faq-question.active {
        background-color: #fff7e6;
        color: #c0a987;
    }

    .faq-icon {
        font-size: 1.2rem;
        color: #c0a987;
        transition: transform 0.3s ease;
    }

    .faq-question.active .faq-icon {
        transform: rotate(45deg);
    }

    .faq-answer {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease, padding 0.3s ease;
        background-color: #fafafa;
    }

    .faq-answer.active {
        max-height: 500px;
        padding: 1.5rem 2rem;
    }

    .faq-answer p {
        color: #666666;
        line-height: 1.6;
        margin-bottom: 1rem;
    }

    .faq-answer p:last-child {
        margin-bottom: 0;
    }
    .cta {
        background: #1a1a1a;
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
        color: #c0c0c0;
        line-height: 1.6;
        font-weight: 600;
    }

    .cta-buttons {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
    }

    .btn-cta-primary {
        background: #c0a987;
        color: #ffffff;
        border: 2px solid #c0a987;
        padding: 0.75rem 1.5rem;
        font-weight: 800;
    }

    .btn-cta-primary:hover {
        background: #a68e6e;
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
        color: #1a1a1a;
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

        .carousel-btn, .reviews-carousel-btn {
            display: none;
        }

        .service-card, .review-card {
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

        .faq-container {
            max-width: 100%;
            padding: 0 1rem;
        }

        .faq-question {
            padding: 1rem 1.5rem;
            font-size: 1rem;
        }

        .faq-answer.active {
            padding: 1rem 1.5rem;
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
            height: 300px;
        }

        .hero-stats {
            grid-template-columns: 1fr;
            gap: 1rem;
        }

        .stat-number {
            font-size: 1.8rem;
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
                <div class="hero-badge">
                    <i class="fas fa-award"></i>
                    #1 Nền tảng giúp việc uy tín tại Đà Nẵng
                </div>
                <h1 class="hero-title">
                    Tìm kiếm <span class="highlight">người giúp việc</span> chuyên nghiệp chỉ trong <span class="highlight">60 giây</span>
                </h1>
                
                <div class="hero-cta">
                    <a href="/view/jsp/home/booking.jsp" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                        Thuê người giúp việc ngay
                    </a>
                    <a href="#register-helper" class="btn btn-secondary">
                        <i class="fas fa-user-plus"></i>
                        Đăng ký làm giúp việc
                    </a>
                </div>
                
            </div>
            <div class="hero-visual">
                <img src="${pageContext.request.contextPath}/view/assets/home/img/banner/banner.jpg" alt="Dịch vụ giúp việc chuyên nghiệp tại Đà Nẵng - Uy tín, chất lượng" class="hero-phone">
                
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
    <section id="services" class="services">
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

    <!-- Reviews Section -->
    <section class="reviews">
        <div class="container">
            <div class="section-header">
                <div class="section-category">ĐÁNH GIÁ</div>
                <h2 class="section-title">KHÁCH HÀNG NÓI GÌ VỀ CHÚNG TÔI?</h2>
                <p class="section-subtitle">
                    Hàng ngàn khách hàng đã tin tưởng và hài lòng với dịch vụ Giúp Việc 24h tại Đà Nẵng
                </p>
            </div>
            <div class="reviews-container">
                <button class="reviews-carousel-btn reviews-prev-btn"><i class="fas fa-chevron-left"></i></button>
                <div class="reviews-wrapper">
                    <div class="reviews-grid">
                        <div class="review-card">
                            <div class="review-quote">
                                <i class="fas fa-quote-right"></i>
                            </div>
                            <div class="review-rating">
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                            </div>
                            <p class="review-content">
                                "Dịch vụ tuyệt vời! Chị giúp việc rất tận tâm và chuyên nghiệp. Nhà tôi luôn sạch sẽ và các con cũng được chăm sóc chu đáo. Giá cả hợp lý, sẽ tiếp tục sử dụng dịch vụ!"
                            </p>
                            <div class="review-author">
                                <div class="author-avatar">ML</div>
                                <div class="author-info">
                                    <h4>Chị Mai Lan</h4>
                                    <p>Hải Châu, Đà Nẵng</p>
                                </div>
                            </div>
                        </div>

                        <div class="review-card">
                            <div class="review-quote">
                                <i class="fas fa-quote-right"></i>
                            </div>
                            <div class="review-rating">
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                            </div>
                            <p class="review-content">
                                "Tôi rất hài lòng với dịch vụ chăm sóc người già. Cô giúp việc rất tâm lý, kiên nhẫn và có kinh nghiệm. Mẹ tôi rất thích và gia đình yên tâm hơn rất nhiều."
                            </p>
                            <div class="review-author">
                                <div class="author-avatar">TH</div>
                                <div class="author-info">
                                    <h4>Anh Tuấn Hải</h4>
                                    <p>Thanh Khê, Đà Nẵng</p>
                                </div>
                            </div>
                        </div>

                        <div class="review-card">
                            <div class="review-quote">
                                <i class="fas fa-quote-right"></i>
                            </div>
                            <div class="review-rating">
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                            </div>
                            <p class="review-content">
                                "Quy trình đặt dịch vụ rất đơn giản và nhanh chóng. Giá cả minh bạch, không có phí phát sinh. Đặc biệt là dịch vụ vệ sinh thảm sofa rất chuyên nghiệp, nhà tôi như mới."
                            </p>
                            <div class="review-author">
                                <div class="author-avatar">PL</div>
                                <div class="author-info">
                                    <h4>Chị Phương Linh</h4>
                                    <p>Sơn Trà, Đà Nẵng</p>
                                </div>
                            </div>
                        </div>

                        <div class="review-card">
                            <div class="review-quote">
                                <i class="fas fa-quote-right"></i>
                            </div>
                            <div class="review-rating">
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                            </div>
                            <p class="review-content">
                                "Dịch vụ chăm sóc trẻ em rất uy tín. Cô giúp việc có kinh nghiệm, biết cách chơi với trẻ. Con tôi rất thích và luôn háo hức chờ cô đến. Tôi hoàn toàn yên tâm khi đi làm."
                            </p>
                            <div class="review-author">
                                <div class="author-avatar">NH</div>
                                <div class="author-info">
                                    <h4>Chị Ngọc Hân</h4>
                                    <p>Ngũ Hành Sơn, Đà Nẵng</p>
                                </div>
                            </div>
                        </div>

                        <div class="review-card">
                            <div class="review-quote">
                                <i class="fas fa-quote-right"></i>
                            </div>
                            <div class="review-rating">
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                            </div>
                            <p class="review-content">
                                "Dịch vụ nấu ăn tại nhà rất tiện lợi. Cô có tay nghề tốt, món ăn ngon miệng và đảm bảo dinh dưỡng. Gia đình tôi rất hài lòng, đặc biệt các cụ già ăn rất vừa miệng."
                            </p>
                            <div class="review-author">
                                <div class="author-avatar">DT</div>
                                <div class="author-info">
                                    <h4>Anh Đức Thành</h4>
                                    <p>Liên Chiểu, Đà Nẵng</p>
                                </div>
                            </div>
                        </div>

                        <div class="review-card">
                            <div class="review-quote">
                                <i class="fas fa-quote-right"></i>
                            </div>
                            <div class="review-rating">
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                                <i class="fas fa-star review-star"></i>
                            </div>
                            <p class="review-content">
                                "Tôi đã sử dụng dịch vụ tổng vệ sinh cuối năm. Đội ngũ làm việc rất chuyên nghiệp, tỉ mỉ từng chi tiết. Nhà cửa sạch bóng, mọi thứ được sắp xếp gọn gàng. Rất đáng tiền!"
                            </p>
                            <div class="review-author">
                                <div class="author-avatar">VL</div>
                                <div class="author-info">
                                    <h4>Chị Vân Ly</h4>
                                    <p>Cẩm Lệ, Đà Nẵng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="reviews-carousel-btn reviews-next-btn"><i class="fas fa-chevron-right"></i></button>
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

    <!-- FAQ Section -->
    <section class="faq">
        <div class="container">
            <div class="section-header">
                <div class="section-category">HỖ TRỢ</div>
                <h2 class="section-title">CÂU HỎI THƯỜNG GẶP</h2>
                <p class="section-subtitle">
                    Những câu hỏi phổ biến nhất mà khách hàng quan tâm về dịch vụ Giúp Việc 24h
                </p>
            </div>
            <div class="faq-container">
                <div class="faq-item">
                    <button class="faq-question" onclick="toggleFAQ(this)">
                        1. Ứng dụng Giúp Việc 24h đang được triển khai ở đâu?
                        <span class="faq-icon">+</span>
                    </button>
                    <div class="faq-answer">
                        <p>Hiện tại, ứng dụng Giúp Việc 24h đã được triển khai tại hơn 20 tỉnh thành trên toàn quốc. Trong thời gian tới, Giúp Việc 24h sẽ tiếp tục mở rộng hoạt động đến nhiều thành phố khác trong thời gian sớm nhất.</p>
                        <p>Bên cạnh thị trường Việt Nam, Giúp Việc 24h cũng đã có mặt tại 3 quốc gia Đông Nam Á gồm: Thái Lan, Indonesia và Malaysia, và đang không ngừng mở rộng ra thị trường quốc tế.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <button class="faq-question" onclick="toggleFAQ(this)">
                        2. Mình muốn sử dụng thử dịch vụ của Giúp Việc 24h nhưng phân vân về chất lượng dịch vụ có tốt hay không?
                        <span class="faq-icon">+</span>
                    </button>
                    <div class="faq-answer">
                        <p>Giúp Việc 24h cam kết 100% người giúp việc đều được xác minh danh tính, kiểm tra lý lịch tư pháp và đào tạo chuyên nghiệp trước khi tham gia nền tảng.</p>
                        <p>Chúng tôi có chính sách hoàn tiền 100% nếu khách hàng không hài lòng với chất lượng dịch vụ. Ngoài ra, tất cả dịch vụ đều được bảo hiểm toàn diện để đảm bảo an toàn cho khách hàng.</p>
                        <p>Với hơn 15.000 khách hàng đã sử dụng và đánh giá trung bình 4.9/5 sao, bạn có thể hoàn toàn yên tâm về chất lượng dịch vụ của chúng tôi.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <button class="faq-question" onclick="toggleFAQ(this)">
                        3. Khi đăng công việc lên ứng dụng thì phải mất bao lâu mới có người nhận việc?
                        <span class="faq-icon">+</span>
                    </button>
                    <div class="faq-answer">
                        <p>Thông thường, sau khi đăng công việc lên ứng dụng, bạn sẽ nhận được phản hồi từ người giúp việc trong vòng 10-15 phút.</p>
                        <p>Trong khung giờ cao điểm (8h-17h các ngày trong tuần), thời gian phản hồi có thể nhanh hơn, chỉ khoảng 5-10 phút. Đối với các yêu cầu đặc biệt hoặc ngoài giờ, thời gian có thể kéo dài đến 30-60 phút.</p>
                        <p>Hệ thống sẽ tự động thông báo cho bạn ngay khi có người giúp việc phù hợp nhận việc.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <button class="faq-question" onclick="toggleFAQ(this)">
                        4. Làm sao nhận dạng người giúp việc?
                        <span class="faq-icon">+</span>
                    </button>
                    <div class="faq-answer">
                        <p>Mỗi người giúp việc trên nền tảng đều có hồ sơ chi tiết bao gồm ảnh chân dung, thông tin cá nhân đã được xác minh, đánh giá từ khách hàng trước và chứng chỉ đào tạo.</p>
                        <p>Trước khi bắt đầu làm việc, người giúp việc sẽ gọi điện xác nhận và gửi ảnh selfie tại địa điểm làm việc thông qua ứng dụng.</p>
                        <p>Bạn cũng có thể yêu cầu xem giấy tờ tùy thân của người giúp việc để đối chiếu với thông tin trên ứng dụng.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <button class="faq-question" onclick="toggleFAQ(this)">
                        5. Vào ngày Lễ, Tết, người giúp việc có đến dọn dẹp nhà không?
                        <span class="faq-icon">+</span>
                    </button>
                    <div class="faq-answer">
                        <p>Có, Giúp Việc 24h hoạt động 365 ngày trong năm, kể cả các ngày lễ, Tết và cuối tuần.</p>
                        <p>Tuy nhiên, vào các ngày đặc biệt này, mức phí dịch vụ sẽ có phụ phí phù hợp theo quy định (thường tăng 50-100% so với ngày thường).</p>
                        <p>Chúng tôi khuyên bạn nên đặt lịch trước ít nhất 1-2 ngày để đảm bảo có người giúp việc phù hợp.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <button class="faq-question" onclick="toggleFAQ(this)">
                        6. Làm thế nào để sử dụng dịch vụ trên Ứng dụng một cách hoàn hảo?
                        <span class="faq-icon">+</span>
                    </button>
                    <div class="faq-answer">
                        <p>Để có trải nghiệm tốt nhất, bạn nên:</p>
                        <p>• Mô tả rõ ràng công việc cần làm và yêu cầu cụ thể</p>
                        <p>• Cung cấp địa chỉ chính xác và số điện thoại liên lạc</p>
                        <p>• Đọc kỹ hồ sơ và đánh giá của người giúp việc trước khi chọn</p>
                        <p>• Chuẩn bị sẵn dụng cụ vệ sinh cần thiết</p>
                        <p>• Đánh giá và phản hồi sau khi sử dụng dịch vụ để giúp cải thiện chất lượng</p>
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

            // Services Carousel functionality
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

            // Reviews Carousel functionality
            const reviewsWrapper = document.querySelector('.reviews-wrapper');
            const reviewsPrevBtn = document.querySelector('.reviews-prev-btn');
            const reviewsNextBtn = document.querySelector('.reviews-next-btn');
            const reviewsScrollAmount = 350;

            if (reviewsNextBtn && reviewsPrevBtn && reviewsWrapper) {
                reviewsNextBtn.addEventListener('click', () => {
                    reviewsWrapper.scrollLeft += reviewsScrollAmount;
                });

                reviewsPrevBtn.addEventListener('click', () => {
                    reviewsWrapper.scrollLeft -= reviewsScrollAmount;
                });

                // Auto-hide buttons when at start/end
                reviewsWrapper.addEventListener('scroll', () => {
                    const isAtStart = reviewsWrapper.scrollLeft <= 0;
                    const isAtEnd = reviewsWrapper.scrollLeft >= reviewsWrapper.scrollWidth - reviewsWrapper.clientWidth;
                    reviewsPrevBtn.style.opacity = isAtStart ? '0.3' : '1';
                    reviewsNextBtn.style.opacity = isAtEnd ? '0.3' : '1';
                });
            }

            // Auto scroll reviews
            let reviewsAutoScroll = setInterval(() => {
                if (reviewsWrapper) {
                    const maxScroll = reviewsWrapper.scrollWidth - reviewsWrapper.clientWidth;
                    if (reviewsWrapper.scrollLeft >= maxScroll) {
                        reviewsWrapper.scrollLeft = 0;
                    } else {
                        reviewsWrapper.scrollLeft += reviewsScrollAmount;
                    }
                }
            }, 5000);

            // Pause auto scroll on hover
            const reviewsContainer = document.querySelector('.reviews-container');
            if (reviewsContainer) {
                reviewsContainer.addEventListener('mouseenter', () => {
                    clearInterval(reviewsAutoScroll);
                });

                reviewsContainer.addEventListener('mouseleave', () => {
                    reviewsAutoScroll = setInterval(() => {
                        if (reviewsWrapper) {
                            const maxScroll = reviewsWrapper.scrollWidth - reviewsWrapper.clientWidth;
                            if (reviewsWrapper.scrollLeft >= maxScroll) {
                                reviewsWrapper.scrollLeft = 0;
                            } else {
                                reviewsWrapper.scrollLeft += reviewsScrollAmount;
                            }
                        }
                    }, 5000);
                });
            }

            console.log('🏠 Giúp Việc 24h - Page loaded successfully');
        });

        // FAQ Toggle Function
        function toggleFAQ(element) {
            const answer = element.nextElementSibling;
            const icon = element.querySelector('.faq-icon');
            
            // Toggle current FAQ item only
            const isActive = element.classList.contains('active');
            
            if (isActive) {
                // Close this FAQ
                element.classList.remove('active');
                answer.classList.remove('active');
                icon.textContent = '+';
                icon.style.transform = 'rotate(0deg)';
            } else {
                // Open this FAQ
                element.classList.add('active');
                answer.classList.add('active');
                icon.textContent = '×';
                icon.style.transform = 'rotate(0deg)';
            }
        }
    </script>
</body>
</html>