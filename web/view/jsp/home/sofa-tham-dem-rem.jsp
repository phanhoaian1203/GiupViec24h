<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dịch vụ vệ sinh Sofa - Rèm - Đệm - Thảm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <%@ include file="/view/common/web/add_css.jsp" %>
    <style>
        :root {
            --primary-color: #1AB394;
            --primary-dark: #15967a;
            --primary-light: #e8f8f5;
            --primary-gradient: linear-gradient(135deg, #1AB394 0%, #15967a 100%);
            --white: #ffffff;
            --gray-50: #fafafa;
            --gray-100: #f5f5f5;
            --gray-200: #e5e7eb;
            --gray-600: #6b7280;
            --gray-900: #111827;
            --text-dark: #1f2937;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --border-radius: 12px;
            --border-radius-lg: 16px;
            --accent-orange: #f59e0b;
            --accent-gradient: linear-gradient(135deg, #f59e0b 0%, #dល).5rem;
            --transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body.cleaning-service-page {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: var(--gray-50);
            color: var(--text-dark);
            line-height: 1.6;
            overflow-x: hidden;
        }

        .scroll-progress {
            position: fixed;
            top: 0;
            left: 0;
            height: 3px;
            background: var(--primary-gradient);
            width: 0;
            z-index: 1000;
            transition: width 0.25s ease;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
        }

        /* Hero Section */
        .hero {
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

        .hero img {
            width: 100%;
            height: 100vh;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
        }

        .hero .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 2;
        }

        .hero-content {
            position: relative;
            z-index: 3;
            text-align: center;
            color: var(--white);
            max-width: 900px;
            padding: 2rem 1.5rem;
            width: 100%;
        }

        .hero-content h1 {
            font-size: clamp(2rem, 4vw, 3rem);
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--white);
        }

        .hero-tagline {
            font-size: clamp(1rem, 2vw, 1.2rem);
            color: var(--white);
            opacity: 0.8;
            margin-bottom: 2rem;
        }

        /* Section Styling */
        .section {
            padding: 80px 0;
        }

        .section:nth-child(even) {
            background: var(--white);
        }

        .section-header {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-header h2 {
            font-size: clamp(2rem, 4vw, 2.75rem);
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 16px;
        }

        .section-header p {
            font-size: 1.125rem;
            color: var(--gray-600);
            max-width: 600px;
            margin: 0 auto;
        }

        /* Ly Do Chon Section */
        .features-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
        }

        .feature-image {
            position: relative;
            border-radius: var(--border-radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow-lg);
        }

        .feature-image img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .feature-image:hover img {
            transform: scale(1.05);
        }

        .feature-content h3 {
            font-size: 1.875rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 16px;
        }

        .feature-content p {
            font-size: 1.125rem;
            color: var(--gray-600);
            margin-bottom: 32px;
        }

        .modern-list {
            list-style: none;
            padding: 0;
        }

        .modern-list li {
            display: flex;
            align-items: center;
            font-size: 1rem;
            color: var(--text-dark);
            margin-bottom: 16px;
            padding: 12px 0;
        }

        .modern-list li::before {
            content: "✓";
            color: var(--primary-color);
            font-weight: 600;
            font-size: 1.125rem;
            margin-right: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 24px;
            height: 24px;
            background: var(--primary-light);
            border-radius: 50%;
        }

        .btn-primary {
            display: inline-block;
            padding: 16px 32px;
            background: var(--primary-color);/*var(--accent-gradient);*/
            color: var(--white);
            text-decoration: none;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: var(--shadow);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        /* Process Section */
        .process-section {
            background: var(--white);
        }

        .tabs-container {
            background: var(--white);
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        .tab-header {
            background: var(--primary-gradient);
            padding: 24px;
            text-align: center;
        }

        .tab-header h2 {
            color: var(--white);
            font-size: 1.75rem;
            font-weight: 600;
            margin: 0;
        }

        .nav-tabs {
            display: flex;
            background: var(--gray-100);
            overflow-x: auto;
        }

        .nav-tabs button {
            flex: 1;
            padding: 16px 24px;
            border: none;
            background: transparent;
            color: var(--gray-600);
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .nav-tabs button.active {
            background: var(--white);
            color: var(--primary-color);
            box-shadow: inset 0 -2px 0 var(--primary-color);
        }

        .tab-content {
            display: none;
            padding: 40px;
        }

        .tab-content.active {
            display: block;
        }

        .process-list {
            list-style: none;
            padding: 0;
            counter-reset: step-counter;
        }

        .process-list li {
            counter-increment: step-counter;
            display: flex;
            align-items: flex-start;
            margin-bottom: 24px;
            padding: 20px;
            background: var(--gray-50);
            border-radius: var(--border-radius);
            position: relative;
        }

        .process-list li::before {
            content: counter(step-counter);
            background: var(--primary-gradient);
            color: var(--white);
            font-weight: 600;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 16px;
            flex-shrink: 0;
        }

        /* Pricing Section */
        .pricing-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
            margin-top: 40px;
        }

        .price-card {
            background: var(--white);
            border-radius: var(--border-radius-lg);
            padding: 32px 24px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .price-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
            border-color: var(--primary-color);
        }

        .price-card .icon {
            font-size: 3rem;
            margin-bottom: 16px;
            color: var(--primary-color);
        }

        .price-card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 24px;
        }

        .price-list {
            list-style: none;
            padding: 0;
            text-align: left;
        }

        .price-list li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid var(--gray-200);
            font-size: 0.95rem;
        }

        .price-list li:last-child {
            border-bottom: none;
        }

        .price-list li span {
            color: var(--primary-color);
            font-weight: 600;
        }

        /* Team Section */
        .team-section {
            background: var(--gray-50);
        }

        .team-content {
            text-align: center;
        }

        .team-image {
            margin-bottom: 40px;
            border-radius: var(--border-radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow-lg);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            max-height: 300px;
        }

        .team-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .team-badges {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            justify-content: center;
            margin-top: 32px;
        }

        .badge {
            padding: 8px 16px;
            background: var(--primary-light);
            color: var(--primary-color);
            border-radius: var(--border-radius);
            font-size: 0.875rem;
            font-weight: 500;
            border: 1px solid var(--primary-color);
        }

        /* CTA Section */
        .cta-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 50%, #0f7a6b 100%);
            color: var(--white);
            text-align: center;
            padding: 6rem 0;
            position: relative;
            overflow: hidden;
        }

        .cta-section::before {
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

        .cta-section .cta-content {
            position: relative;
            z-index: 2;
        }

        .cta-section h2 {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            letter-spacing: -0.025em;
            color: var(--white);
        }

        .cta-section p {
            font-size: 1.3rem;
            margin-bottom: 2.5rem;
            opacity: 0.95;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            font-weight: 400;
        }

        .btn-cta {
            display: inline-block;
            padding: 1rem 2.5rem;
            background: var(--white);
            color: var(--primary-dark);
            text-decoration: none;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 600;
            transition: var(--transition);
            border: none;
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
            margin-right: 1rem;
        }

        .btn-cta::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: var(--transition);
        }

        .btn-cta:hover::before {
            left: 100%;
        }

        .btn-cta:hover {
            background: var(--gray-light);
            color: var(--primary-color);
            transform: translateY(-3px);
            box-shadow: var(--shadow-lg);
        }

        .btn-outline {
            display: inline-block;
            padding: 1rem 2.5rem;
            background: transparent;
            color: var(--white);
            text-decoration: none;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 600;
            transition: var(--transition);
            border: 2px solid var(--white);
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
        }

        .btn-outline::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: var(--transition);
        }

        .btn-outline:hover::before {
            left: 100%;
        }

        .btn-outline:hover {
            background: var(--white);
            color: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: var(--shadow-lg);
        }

        /* Animations */
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }

        .fade-in.animate {
            opacity: 1;
            transform: translateY(0);
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .pricing-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 16px;
            }
            
            .section {
                padding: 60px 0;
            }

            .features-grid {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .feature-image img {
                height: 250px;
            }

            .pricing-grid {
                grid-template-columns: 1fr;
            }

            .nav-tabs {
                flex-direction: column;
            }

            .nav-tabs button {
                text-align: center;
            }

            .team-badges {
                flex-direction: column;
                align-items: center;
            }

            .badge {
                width: 100%;
                text-align: center;
                max-width: 300px;
            }

            .hero {
                min-height: calc(100vh - 70px);
                margin-left: 0;
                width: 100%;
            }

            .hero h1 {
                font-size: 2.2rem;
            }

            .hero-tagline {
                font-size: 1.2rem;
            }

            .cta-section h2 {
                font-size: 2.2rem;
            }

            .cta-section p {
                font-size: 1.1rem;
            }
        }

        @media (max-width: 640px) {
            .hero h1 {
                font-size: 1.8rem;
            }

            .hero-tagline {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body class="cleaning-service-page">
    <div class="scroll-progress"></div>

    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner1.jpg" alt="Banner">
        <div class="overlay"></div>
        <div class="hero-content">
            <h1 class="animate__animated animate__fadeIn">Dịch Vụ Vệ Sinh Sofa - Rèm - Đệm - Thảm</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">Mang lại không gian sạch sẽ, thơm mát với dịch vụ vệ sinh chuyên nghiệp từ GiupViec24h. Đội ngũ tận tâm, công nghệ hiện đại đảm bảo sự hài lòng tuyệt đối.</p>
        </div>
    </section>


    <!-- Why Choose Us Section -->
    <section class="section">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Tại sao nên chọn dịch vụ vệ sinh Sofa - Rèm - Đệm - Thảm của GiupViec24h?</h2>
                <p>Chúng tôi mang đến giải pháp vệ sinh hoàn hảo với đội ngũ chuyên nghiệp</p>
            </div>
            <div class="features-grid fade-in">
                <div class="feature-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/sofa_dem_rem_tham/sofa.jpg" alt="Dịch vụ vệ sinh chuyên nghiệp" />
                </div>
                <div class="feature-content">
                    <h3>Chất Lượng Vượt Trội</h3>
                    <p>Với kinh nghiệm nhiều năm và công nghệ tiên tiến, chúng tôi đảm bảo mang lại kết quả tốt nhất cho khách hàng.</p>
                    <ul class="modern-list">
                        <li>Đặt lịch nhanh chóng, linh hoạt</li>
                        <li>Thiết bị vệ sinh hiện đại nhất</li>
                        <li>Quy trình chuẩn quốc tế</li>
                        <li>Đội ngũ tay nghề cao</li>
                        <li>Giá cả minh bạch, hợp lý</li>
                    </ul>
                    <a href="<%= request.getContextPath() %>/booking" class="btn-primary">Đặt Dịch Vụ Ngay</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Process Section -->
    <section class="section process-section">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Quy Trình Thực Hiện</h2>
                <p>Quy trình chuyên nghiệp, đảm bảo chất lượng tối ưu</p>
            </div>
            <div class="tabs-container fade-in">
                <div class="tab-header">
                    <h2>Chọn Dịch Vụ</h2>
                </div>
                <div class="nav-tabs">
                    <button class="tab-link active" onclick="openTab(event, 'Sofa')">
                        <i class="fas fa-couch"></i> Sofa
                    </button>
                    <button class="tab-link" onclick="openTab(event, 'Rem')">
                        <i class="fas fa-window-maximize"></i> Rèm cửa
                    </button>
                    <button class="tab-link" onclick="openTab(event, 'Dem')">
                        <i class="fas fa-bed"></i> Đệm
                    </button>
                    <button class="tab-link" onclick="openTab(event, 'Tham')">
                        <i class="fas fa-th-large"></i> Thảm
                    </button>
                </div>
                <div class="tab-content active" id="Sofa">
                    <ul class="process-list">
                        <li>Kiểm tra và hút sạch bụi bẩn trên toàn bộ bề mặt sofa</li>
                        <li>Phun đều dung dịch vệ sinh chuyên dụng để phá vỡ vết bẩn</li>
                        <li>Chà sâu bằng máy chuyên dụng loại bỏ 90% vết bẩn cứng đầu</li>
                        <li>Hút sạch chất bẩn và dung dịch vệ sinh</li>
                        <li>Xả lại để loại bỏ hoàn toàn hóa chất còn sót lại</li>
                        <li>Sấy khô nhanh chóng bằng thiết bị chuyên nghiệp</li>
                    </ul>
                </div>
                <div class="tab-content" id="Rem">
                    <ul class="process-list">
                        <li>Hút bụi và kiểm tra tình trạng rèm cửa</li>
                        <li>Xử lý vết bẩn bằng dung dịch chuyên dụng</li>
                        <li>Giặt sạch và làm khô hoàn toàn</li>
                        <li>Là ủi và treo lại đúng vị trí</li>
                    </ul>
                </div>
                <div class="tab-content" id="Dem">
                    <ul class="process-list">
                        <li>Hút sạch bụi bẩn và vi khuẩn</li>
                        <li>Xử lý vết bẩn sâu bằng công nghệ tiên tiến</li>
                        <li>Khử trùng và diệt khuẩn toàn diện</li>
                        <li>Sấy khô nhanh để tránh ẩm mốc</li>
                    </ul>
                </div>
                <div class="tab-content" id="Tham">
                    <ul class="process-list">
                        <li>Hút bụi và loại bỏ cặn bẩn bề mặt</li>
                        <li>Giặt sâu bằng máy móc chuyên nghiệp</li>
                        <li>Xử lý mùi hôi và vi khuẩn</li>
                        <li>Sấy khô và chải lông thảm</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Pricing Section -->
    <section class="section">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Bảng Giá Dịch Vụ</h2>
                <p>Giá cả minh bạch, cạnh tranh nhất thị trường</p>
            </div>
            <div class="pricing-grid fade-in">
                <div class="price-card">
                    <div class="icon">🪟</div>
                    <h3>Rèm Cửa</h3>
                    <ul class="price-list">
                        <li>Giặt khô <span>400.000₫</span></li>
                        <li>Phòng khách <span>300.000₫</span></li>
                    </ul>
                </div>
                <div class="price-card">
                    <div class="icon">🛏️</div>
                    <h3>Đệm</h3>
                    <ul class="price-list">
                        <li>Dưới 1.5m <span>300.000₫</span></li>
                        <li>1.5m - 1.8m <span>350.000₫</span></li>
                        <li>Trên 2m <span>430.000₫</span></li>
                    </ul>
                </div>
                <div class="price-card">
                    <div class="icon">🛋️</div>
                    <h3>Sofa</h3>
                    <ul class="price-list">
                        <li>1 ghế ngồi <span>360.000₫</span></li>
                        <li>2 ghế ngồi <span>450.000₫</span></li>
                        <li>3 ghế + 1 dài <span>500.000₫</span></li>
                    </ul>
                </div>
                <div class="price-card">
                    <div class="icon">🧹</div>
                    <h3>Thảm</h3>
                    <ul class="price-list">
                        <li>Dưới 10m² <span>300.000₫</span></li>
                        <li>10m² - 20m² <span>500.000₫</span></li>
                        <li>Trên 20m² <span>700.000₫</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="section team-section">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Đội Ngũ Chuyên Nghiệp</h2>
                <p>Những chuyên gia hàng đầu trong lĩnh vực vệ sinh</p>
            </div>
            <div class="team-content fade-in">
                <div class="team-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/sofa_dem_rem_tham/doi_ngu.jpg" alt="Đội ngũ vệ sinh chuyên nghiệp" />
                </div>
                <div class="team-badges">
                    <span class="badge">Kinh nghiệm 5+ năm</span>
                    <span class="badge">Đã kiểm tra lý lịch</span>
                    <span class="badge">Được đào tạo chuyên nghiệp</span>
                    <span class="badge">Thân thiện & lịch sự</span>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container cta-content">
            <h2 class="animate__animated animate__fadeIn">Khám Phá Dịch Vụ Vệ Sinh Chuyên Nghiệp Ngay Hôm Nay</h2>
            <p class="animate__animated animate__fadeIn animate__delay-1s">Mang lại không gian sạch sẽ, thơm mát với dịch vụ vệ sinh sofa, rèm, đệm, thảm chất lượng cao, giá cả hợp lý.</p>
            <div class="animate__animated animate__fadeIn animate__delay-2s">
                <a href="<%= request.getContextPath() %>/view/jsp/home/signup.jsp" class="btn-cta">Đăng Ký Ngay</a>
                <a href="<%= request.getContextPath() %>/view/jsp/home/login.jsp" class="btn-outline">Đăng Nhập</a>
            </div>
        </div>
    </section>

    <%@ include file="/view/common/web/footer.jsp" %>

    <script>
        // Scroll Progress Bar
        function updateScrollProgress() {
            const scrollTop = window.pageYOffset;
            const documentHeight = document.documentElement.scrollHeight - window.innerHeight;
            const scrollPercent = (scrollTop / documentHeight) * 100;
            document.querySelector('.scroll-progress').style.width = scrollPercent + '%';
        }

        // Tab Functionality
        function openTab(event, tabName) {
            const tabContents = document.querySelectorAll('.tab-content');
            tabContents.forEach(content => content.classList.remove('active'));

            const tabLinks = document.querySelectorAll('.tab-link');
            tabLinks.forEach(link => link.classList.remove('active'));

            document.getElementById(tabName).classList.add('active');
            event.currentTarget.classList.add('active');
        }

        // Intersection Observer for animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -100px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate');
                }
            });
        }, observerOptions);

        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            // Observe all fade-in elements
            document.querySelectorAll('.fade-in').forEach(el => {
                observer.observe(el);
            });

            // Scroll progress
            window.addEventListener('scroll', updateScrollProgress);
            updateScrollProgress();
        });
    </script>
</body>
</html>