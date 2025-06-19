<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về chúng tôi - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
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
        background: #ffffff;
    }

    .section {
        padding: 5rem 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
    }

    /* Hero Section - Enhanced with Richer Yellow */
    .hero {
        background: linear-gradient(135deg, #ecece6 0%, #e5e7eb 50%, #dfe3e8 100%);
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
            radial-gradient(circle at 20% 80%, rgba(192, 169, 135, 0.15) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(166, 142, 110, 0.12) 0%, transparent 50%),
            url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="%23c0a987" opacity="0.12"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
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
        color: #1a1a1a;
    }

    .hero-content h1 {
        font-size: 3.2rem;
        font-weight: 900; /* Matches index.jsp hero-title */
        line-height: 1.15;
        margin-bottom: 1.5rem;
        color: #1a1a1a;
        letter-spacing: -0.02em;
    }

    .hero-tagline {
        font-size: 1.25rem;
        margin-bottom: 2.5rem;
        opacity: 0.85;
        line-height: 1.6;
        font-weight: 600; /* Matches index.jsp hero-subtitle */
        color: #4a4a4a;
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
        border: 1px solid #dfe3e8;
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
        background: linear-gradient(90deg, #c0a987, #a68e6e);
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
        font-weight: 900; /* Matches index.jsp boldness for key numbers */
        color: #a68e6e;
        margin-bottom: 0.5rem;
        text-shadow: 0 1px 2px rgba(166, 142, 110, 0.1);
    }

    .stat-label {
        font-size: 0.9rem;
        color: #5a5a5a;
        font-weight: 600; /* Increased from 500 to match index.jsp subtext boldness */
    }

    /* Section Content Layout */
    .about-section-content {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4rem;
        align-items: center;
        margin-bottom: 3rem;
    }

    .about-section-content.reverse {
        direction: rtl;
    }

    .about-section-content.reverse > * {
        direction: ltr;
    }

    .about-text {
        padding: 1rem 0;
    }

    .section-title {
        font-size: 2.2rem;
        font-weight: 900; /* Matches index.jsp section-title */
        color: #000000;
        margin-bottom: 1.5rem;
        line-height: 1.3;
        position: relative;
        display: inline-block;
    }

    .section-title::after {
        content: '';
        position: absolute;
        bottom: -8px;
        left: 0;
        width: 60px;
        height: 3px;
        background: linear-gradient(90deg, #c0a987, #a68e6e);
        border-radius: 2px;
    }

    .about-text p {
        font-size: 1rem;
        line-height: 1.7;
        color: #4a4a4a;
        text-align: justify;
        font-weight: 500; /* Increased from default to match index.jsp body text */
    }

    /* Image Container - No border radius, no zoom */
    .about-image-container {
        position: relative;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        border-left: 4px solid #c0a987;
        transition: all 0.3s ease;
    }

    .about-image-container:hover {
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        border-left-color: #a68e6e;
    }

    .about-image {
        width: 100%;
        height: 300px;
        object-fit: cover;
    }

    /* CTA Section - Matching index.jsp style */
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
        font-weight: 900; /* Matches index.jsp cta-title */
        margin-bottom: 1rem;
        color: #ffffff;
    }

    .cta-subtitle {
        font-size: 1rem;
        margin-bottom: 2rem;
        color: #c0c0c0;
        line-height: 1.6;
        font-weight: 600; /* Matches index.jsp cta-subtitle */
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
        font-weight: 800; /* Matches index.jsp button boldness */
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
        font-weight: 800; /* Matches index.jsp button boldness */
    }

    .btn-cta-secondary:hover {
        background: #ffffff;
        color: #1a1a1a;
        transform: translateY(-2px);
    }

    /* Enhanced Buttons with Richer Yellow */
    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 1rem 2rem;
        border-radius: 12px;
        text-decoration: none;
        font-weight: 700; /* Matches index.jsp button base weight */
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
        background: linear-gradient(135deg, #c0a987, #a68e6e);
        color: #ffffff;
        border-color: #c0a987;
        box-shadow: 0 4px 15px rgba(192, 169, 135, 0.25);
        text-shadow: 0 1px 2px rgba(0,0,0,0.1);
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #a68e6e, #8c7857);
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(192, 169, 135, 0.4);
        color: #ffffff;
    }

    .btn-secondary {
        background: transparent;
        color: #4a4a4a;
        border-color: #d0d0d0;
        backdrop-filter: blur(10px);
    }

    .btn-secondary:hover {
        background: rgba(255, 255, 255, 0.8);
        color: #1a1a1a;
        transform: translateY(-2px);
        border-color: #a0aec0;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }

    .btn-outline {
        background: transparent;
        color: #4a4a4a;
        border-color: #a0aec0;
    }

    .btn-outline:hover {
        background: #e5e7eb;
        color: #1a1a1a;
        border-color: #718096;
        transform: translateY(-2px);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .hero-container {
            grid-template-columns: 1fr;
            text-align: center;
            gap: 3rem;
        }

        .hero-content h1 {
            font-size: 2.5rem;
        }

        .hero-tagline {
            font-size: 1.1rem;
            max-width: 100%;
        }

        .hero-visual {
            order: -1;
        }

        .stats-grid {
            grid-template-columns: 1fr;
            gap: 1rem;
        }

        .about-section-content {
            grid-template-columns: 1fr;
            gap: 2.5rem;
            text-align: center;
        }

        .about-section-content.reverse {
            direction: ltr;
        }

        .section-title {
            font-size: 1.8rem;
        }

        .about-text {
            padding: 0;
        }

        .about-text p {
            text-align: left;
        }

        .section {
            padding: 3rem 0;
        }

        .container {
            padding: 0 1rem;
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

        .about-image {
            height: 250px;
        }
    }

    @media (max-width: 480px) {
        .hero-content h1 {
            font-size: 1.8rem;
        }

        .section-title {
            font-size: 1.6rem;
        }

        .about-text p {
            font-size: 0.95rem;
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

    /* Section alternating backgrounds */
    .section:nth-child(even) {
        background: #e5e7eb;
    }

    /* Clean separator */
    .section + .section {
        border-top: 1px solid #d0d0d0;
    }

    .section:nth-child(even) + .section {
        border-top: none;
    }
    </style>
</head>
<body class="about-page">
    <!-- Header -->
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero - Similar to index.jsp -->
    <section class="hero">
        <div class="hero-container">
            <div class="hero-content">
                <h1>Về Giúp Việc 24h</h1>
                <p class="hero-tagline">
                    Chúng tôi tự hào mang đến dịch vụ giúp việc chuyên nghiệp, tiện lợi, giúp bạn chăm sóc gia đình một cách trọn vẹn nhất.
                </p>
                <div class="hero-cta">
                    <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn btn-primary">
                        <i class="fas fa-user-plus" style="margin-right: 0.5rem;"></i>
                        Đăng ký ngay
                    </a>
                    <a href="#about-content" class="btn btn-secondary">
                        Tìm hiểu thêm
                    </a>
                </div>
            </div>
            <div class="hero-visual">
                <div class="hero-stats">
                    <div class="stats-grid">
                        <div class="stat-item">
                            <div class="stat-number">2024</div>
                            <div class="stat-label">Năm thành lập</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">500+</div>
                            <div class="stat-label">Khách hàng tin tưởng</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">100%</div>
                            <div class="stat-label">Hài lòng dịch vụ</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">7</div>
                            <div class="stat-label">Quận huyện phủ sóng</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Us Section -->
    <section class="section" id="about-content">
        <div class="container">
            <div class="about-section-content">
                <div class="about-text">
                    <h2 class="section-title">Chúng tôi là Giúp Việc 24h</h2>
                    <p>
                        Giúp Việc 24h là nền tảng đặt dịch vụ giúp việc nhà tại Đà Nẵng, do nhóm sinh viên phát triển nhằm mang đến giải pháp vệ sinh tiện lợi, hiện đại. Chúng tôi kết nối nhanh chóng giữa khách hàng và đội ngũ giúp việc chuyên nghiệp, cung cấp các dịch vụ như dọn dẹp theo giờ, vệ sinh sau xây dựng, giặt rèm – sofa, vệ sinh thiết bị gia dụng... Với hệ thống đặt lịch thông minh, việc chọn thời gian, địa điểm và nhân viên trở nên dễ dàng hơn bao giờ hết. Giúp Việc 24h – Giải pháp giúp việc đáng tin cậy tại Đà Nẵng.
                    </p>
                </div>
                <div class="about-image-container">
                    <img src="${pageContext.request.contextPath}/view/assets/home/img/about/about1.jpg" 
                         alt="Nền tảng công nghệ Giúp Việc 24h" 
                         class="about-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Meaning Section -->
    <section class="section">
        <div class="container">
            <div class="about-section-content reverse">               
                <div class="about-text">
                    <h2 class="section-title">Ý nghĩa của Giúp Việc 24h</h2>
                    <p>
                        Tên gọi "Giúp Việc 24h" thể hiện tinh thần sẵn sàng phục vụ mọi lúc, mọi nơi – như một người bạn đồng hành đáng tin cậy trong việc chăm sóc tổ ấm của bạn tại Đà Nẵng. Chúng tôi hiểu cuộc sống bận rộn cần những giải pháp linh hoạt và hiệu quả, vì vậy Giúp Việc 24h ra đời nhằm mang đến dịch vụ nhanh chóng, chuyên nghiệp và dễ tiếp cận chỉ với vài cú nhấp chuột. Đội ngũ cộng tác viên của chúng tôi là những người tận tâm, được tuyển chọn kỹ lưỡng, luôn sẵn sàng mang đến trải nghiệm chất lượng, an toàn và thoải mái. Giúp Việc 24h – Luôn bên bạn khi cần.
                    </p>
                </div>
                <div class="about-image-container">
                    <img src="${pageContext.request.contextPath}/view/assets/home/img/about/about2.jpg" 
                         alt="Đội ngũ hỗ trợ Giúp Việc 24h" 
                         class="about-image">
                </div>         
            </div>
        </div>
    </section>

    <!-- Operating Areas Section -->
    <section class="section">
        <div class="container">
            <div class="about-section-content">
                <div class="about-text">
                    <h2 class="section-title">Khu vực hoạt động</h2>
                    <p>
                        Giúp Việc 24h hiện cung cấp dịch vụ tại Đà Nẵng – trung tâm kinh tế, văn hóa và du lịch miền Trung, phục vụ khắp các quận huyện như Hải Châu, Thanh Khê, Sơn Trà, Ngũ Hành Sơn, Liên Chiểu, Cẩm Lệ và Hòa Vang. Với định hướng phát triển chuyên nghiệp, tiện lợi và nhanh chóng, chúng tôi luôn sẵn sàng đáp ứng mọi nhu cầu vệ sinh, dọn dẹp tại bất kỳ khu vực nào trong thành phố. Trong tương lai, Giúp Việc 24h sẽ mở rộng ra các tỉnh lân cận để phục vụ nhiều gia đình hơn. Giúp Việc 24h – Đồng hành cùng bạn trong từng không gian sống.
                    </p>
                </div>
                <div class="about-image-container">
                    <img src="${pageContext.request.contextPath}/view/assets/home/img/about/about3.jpg" 
                         alt="Bản đồ khu vực hoạt động của Giúp Việc 24h" 
                         class="about-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Growth Section -->
    <section class="section">
        <div class="container">
            <div class="about-section-content reverse">
                <div class="about-text">
                    <h2 class="section-title">Phát triển mạnh mẽ hơn</h2>
                    <p>
                        Dù mới được phát triển bởi một nhóm sinh viên, Giúp Việc 24h đã nhanh chóng nhận được sự tin tưởng từ hàng trăm khách hàng tại Đà Nẵng. Chúng tôi đang từng bước xây dựng đội ngũ cộng tác viên uy tín, tạo cơ hội việc làm linh hoạt cho người lao động địa phương. Với tinh thần đổi mới và cam kết phục vụ tận tâm, Giúp Việc 24h không ngừng nâng cao trải nghiệm người dùng, mở rộng dịch vụ và hướng tới trở thành lựa chọn hàng đầu cho mọi gia đình khi cần giúp việc nhà chất lượng, nhanh chóng và tiện lợi.
                    </p>
                </div>
                <div class="about-image-container">
                    <img src="${pageContext.request.contextPath}/view/assets/home/img/about/about4.jpg"
                         alt="Dịch vụ dọn dẹp Giúp Việc 24h" 
                         class="about-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Vision Section -->
    <section class="section">
        <div class="container">
            <div class="about-section-content">
                <div class="about-text">
                    <h2 class="section-title">Tầm nhìn</h2>
                    <p>
                        Giúp Việc 24h không chỉ là nền tảng giúp việc nhà tại Đà Nẵng mà còn hướng đến trở thành hệ thống dịch vụ tiện ích hàng đầu miền Trung, mang lại giải pháp chăm sóc nhà cửa thông minh, hiện đại và phù hợp với cuộc sống bận rộn. Trong tương lai, chúng tôi đặt mục tiêu mở rộng ra các tỉnh thành lân cận và phát triển thành nền tảng tích hợp nhiều dịch vụ gia đình trên một hệ thống duy nhất. Giúp Việc 24h – người bạn đồng hành đáng tin cậy, giúp việc dễ dàng, tiết kiệm thời gian và hiệu quả hơn bao giờ hết.
                    </p>
                </div>
                <div class="about-image-container">
                    <img src="${pageContext.request.contextPath}/view/assets/home/img/about/about5.jpg" 
                         alt="Tầm nhìn của Giúp Việc 24h" 
                         class="about-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Mission Section -->
    <section class="section">
        <div class="container">
            <div class="about-section-content reverse">
                <div class="about-text">
                    <h2 class="section-title">Sứ mệnh</h2>
                    <p>
                        Giúp Việc 24h ra đời với sứ mệnh giúp các gia đình tại Đà Nẵng giảm bớt gánh nặng việc nhà, từ đó có thêm thời gian tận hưởng cuộc sống và chăm sóc bản thân. Chúng tôi tin rằng một ngôi nhà sạch sẽ là nền tảng cho sự hạnh phúc và bình yên. Đồng thời, Giúp Việc 24h hướng tới nâng cao giá trị nghề giúp việc bằng cách xây dựng đội ngũ cộng tác viên tận tâm, đáng tin cậy và chuyên nghiệp. Nền tảng không chỉ kết nối khách hàng với người lao động mà còn tạo cơ hội việc làm ổn định và bền vững cho cộng đồng địa phương.
                    </p>
                </div>
                <div class="about-image-container">
                     <img src="${pageContext.request.contextPath}/view/assets/home/img/about/about6.jpg"
                         alt="Sứ mệnh của Giúp Việc 24h" 
                         class="about-image">
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section - Matching index.jsp style -->
    <section class="cta">
        <div class="cta-container">
            <div class="cta-image">
                <img src="${pageContext.request.contextPath}/view/assets/home/img/banner/banner.jpg" alt="Giúp việc service">
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
</body>
</html>