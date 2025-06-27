<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dịch vụ vệ sinh máy giặt</title>
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
            --transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .washing-machine-service-page {
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

        /* Price Section */
        .price-section {
            padding: 40px 0;
            text-align: center;
        }

        .price-section h2 {
            font-size: clamp(2rem, 4vw, 2.75rem);
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 16px;
        }

        .price-section p {
            font-size: 1.125rem;
            color: var(--gray-600);
            max-width: 600px;
            margin: 0 auto 40px;
        }

        .price-cards {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .price-card {
            background: var(--white);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            padding: 20px;
            width: 200px;
            text-align: center;
            position: relative;
            transition: transform 0.3s ease;
        }

        .price-card:hover {
            transform: translateY(-5px);
        }

        .price-card h3 {
            font-size: 1.2rem;
            color: var(--gray-900);
            margin-bottom: 10px;
        }

        .price-card .current-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-right: 10px;
        }

        .price-card .original-price {
            font-size: 0.9rem;
            color: var(--gray-600);
            text-decoration: line-through;
            margin-bottom: 10px;
        }

        .price-card .discount {
            font-size: 0.9rem;
            color: var(--accent-orange);
            margin-bottom: 10px;
        }

        .price-note {
            font-size: 0.9rem;
            color: var(--gray-600);
            max-width: 600px;
            margin: 0 auto;
            padding: 10px;
            background: var(--gray-100);
            border-radius: var(--border-radius);
        }

        /* FAQ Section */
        .faq-section {
            padding: 40px 0;
            text-align: center;
        }

        .faq-section h2 {
            font-size: clamp(2rem, 4vw, 2.75rem);
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 16px;
        }

        .faq-section p {
            font-size: 1.125rem;
            color: var(--gray-600);
            max-width: 600px;
            margin: 0 auto 40px;
        }

        .faq-list {
            max-width: 600px;
            margin: 0 auto;
            text-align: left;
        }

        .faq-list li {
            margin-bottom: 15px;
            border-bottom: 1px solid var(--gray-200);
            padding-bottom: 10px;
        }

        .faq-list .faq-question {
            font-size: 16px;
            color: var(--text-dark);
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .faq-list .faq-question span {
            color: var(--accent-orange);
            font-weight: 600;
        }

        .faq-list .faq-answer {
            display: none;
            padding-top: 10px;
            font-size: 15px;
            color: var(--gray-600);
        }

        .faq-list .faq-answer.active {
            display: block;
        }

        /* Other Sections Styling */
        .washing-machine-service-page .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .washing-machine-service-page .section-content {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .washing-machine-service-page .section-content.reverse {
            flex-direction: row-reverse;
        }

        .washing-machine-service-page .section-content .content-image {
            flex: 1;
        }

        .washing-machine-service-page .section-content .content-image img {
            width: 100%;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }

        .washing-machine-service-page .section-content .content-card {
            flex: 1;
            padding: 20px;
            background: var(--white);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }

        .washing-machine-service-page .section-content .content-card p {
            font-size: 16px;
            margin-bottom: 15px;
        }

        .washing-machine-service-page .modern-list {
            list-style: none;
        }

        .washing-machine-service-page .modern-list li {
            font-size: 16px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .washing-machine-service-page .modern-list li:before {
            content: "✓";
            color: var(--primary-color);
            margin-right: 10px;
            font-weight: bold;
        }

        .washing-machine-service-page .image-gallery {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .washing-machine-service-page .image-pair {
            display: flex;
            gap: 20px;
        }

        .washing-machine-service-page .image-item {
            text-align: center;
        }

        .washing-machine-service-page .image-item img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }

        .washing-machine-service-page .image-item p {
            margin-top: 10px;
            font-size: 14px;
            color: var(--text-dark);
        }

        .washing-machine-service-page .testimonial {
            background: var(--white);
            padding: 20px;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            margin-bottom: 20px;
        }

        .washing-machine-service-page .testimonial p {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .washing-machine-service-page .testimonial .author {
            font-size: 14px;
            color: var(--gray-600);
            font-style: italic;
        }

        .washing-machine-service-page .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
        }

        .washing-machine-service-page .fade-in.animate {
            opacity: 1;
            transform: translateY(0);
        }

        @media (max-width: 768px) {
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

            .price-cards {
                flex-direction: column;
                align-items: center;
            }

            .price-card {
                width: 80%;
                margin-bottom: 20px;
            }

            .washing-machine-service-page .section-content {
                flex-direction: column;
            }

            .washing-machine-service-page .section-content.reverse {
                flex-direction: column;
            }

            .washing-machine-service-page .image-pair {
                flex-direction: column;
            }

            .washing-machine-service-page .image-item img {
                width: 100%;
                height: auto;
            }

            .washing-machine-service-page .container {
                padding: 20px;
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
<body class="washing-machine-service-page">
    <div class="bg-decoration"></div>
    <div class="scroll-progress"></div>

    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner1.jpg" alt="Banner">
        <div class="overlay"></div>
        <div class="hero-content">
            <h1 class="animate__animated animate__fadeIn">Dịch Vụ Vệ Sinh Máy Giặt</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">Dịch vụ vệ sinh máy giặt chuyên nghiệp tại Đà Nẵng, đảm bảo thiết bị sạch sẽ, vận hành êm ái và tiết kiệm điện năng.</p>
        </div>
    </section>

    <section id="bang-gia" class="price-section fade-in">
        <div class="container">
            <div class="section-header">
                <h2>Bảng Giá Vệ Sinh Máy Giặt Cập Nhật Mới Nhất</h2>
                <p>Giá cả minh bạch, phù hợp với mọi loại máy giặt</p>
            </div>
            <div class="price-cards">
                <div class="price-card">
                    <h3>Máy lồng đứng</h3>
                    <p class="current-price">216,000<sup>đ</sup></p>
                    <p class="original-price">120,000<sup>đ</sup></p>
                    <p class="discount">Giảm giá</p>
                </div>
                <div class="price-card">
                    <h3>Máy lồng ngang</h3>
                    <p class="current-price">336,000<sup>đ</sup></p>
                    <p class="original-price">220,000<sup>đ</sup></p>
                    <p class="discount">Giảm giá</p>
                </div>
                <div class="price-card">
                    <h3>Máy giặt công nghiệp</h3>
                    <p class="current-price">420,000<sup>đ</sup></p>
                    <p class="original-price">250,000<sup>đ</sup></p>
                    <p class="discount">Giảm giá</p>
                </div>
                <div class="price-card">
                    <h3>Máy giặt mini</h3>
                    <p class="current-price">660,000<sup>đ</sup></p>
                    <p class="original-price">220,000<sup>đ</sup></p>
                    <p class="discount">Giảm giá</p>
                </div>
            </div>
            <div class="price-note">
                <p><strong>Lưu ý</strong></p>
                <ul style="list-style-type: disc; text-align: left; padding-left: 20px;">
                    <li>Giá vệ sinh được hỗ trợ dựa trên số lần đặt lịch vệ sinh trong tháng.</li>
                    <li>Giá chi mang tính chất tham khảo, giá trị hoàn tiền sẽ được điều chỉnh sau khi hoàn tất dịch vụ.</li>
                    <li>Giá dịch vụ sẽ được báo giá trước khi đặt lịch.</li>
                </ul>
            </div>
        </div>
    </section>

    <section id="ly-do-chon">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Vì Sao Nên Chọn Dịch Vụ Vệ Sinh Máy Giặt Của Giúp Việc 24h?</h2>
                <p>Ưu điểm vượt trội mang đến sự an tâm và hài lòng</p>
            </div>
            <div class="section-content reverse fade-in">
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Đội ngũ kỹ thuật viên được đào tạo chuyên sâu, giàu kinh nghiệm</li>
                        <li>Sử dụng thiết bị và dung dịch vệ sinh chuyên dụng, an toàn</li>
                        <li>Quy trình vệ sinh chuẩn mực, đảm bảo sạch sâu từng chi tiết</li>
                        <li>Cam kết bảo vệ máy giặt, không gây hư hỏng trong quá trình vệ sinh</li>
                        <li>Lịch đặt dịch vụ linh hoạt, phục vụ nhanh chóng tại Đà Nẵng</li>
                    </ul>
                </div>
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/washing_machine_1.jpg" alt="Lý do chọn dịch vụ vệ sinh máy giặt" />
                </div>
            </div>
        </div>
    </section>

    <section id="quy-trinh" class="process-section fade-in">
        <div class="container">
            <div class="section-header">
                <h2>Quy Trình Vệ Sinh Máy Giặt Của Giúp Việc 24h</h2>
                <p>Công việc được thực hiện chuyên nghiệp và tỉ mỉ</p>
            </div>
            <ul class="process-steps">
                <li>Bước 1: Bắt đầu vệ sinh máy giặt bằng cách kiểm tra tình trạng máy</li>
                <li>Bước 2: Tháo rời các bộ phận như lồng giặt, ống dẫn nước</li>
                <li>Bước 3: Vệ sinh lồng giặt, ống dẫn và các chi tiết bằng dung dịch chuyên dụng</li>
                <li>Bước 4: Loại bỏ cặn bẩn, vi khuẩn và nấm mốc</li>
                <li>Bước 5: Lắp ráp lại và kiểm tra hoạt động của máy giặt</li>
                <li>Bước 6: Làm sạch khu vực xung quanh máy giặt sau khi hoàn tất</li>
            </ul>
        </div>
    </section>

    <section id="hinh-anh">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Hình Ảnh Thực Tế Trước Và Sau Khi Vệ Sinh</h2>
                <p>Chứng minh hiệu quả dịch vụ của chúng tôi</p>
            </div>
            <div class="section-content fade-in">
                <div class="image-gallery">
                    <div class="image-pair">
                        <div class="image-item">
                            <img src="<%= request.getContextPath() %>/view/assets/home/img/service/washing_machine_before.jpg" alt="Máy giặt trước khi vệ sinh" />
                            <p>Trước khi vệ sinh</p>
                        </div>
                        <div class="image-item">
                            <img src="<%= request.getContextPath() %>/view/assets/home/img/service/washing_machine_after.jpg" alt="Máy giặt sau khi vệ sinh" />
                            <p>Sau khi vệ sinh</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="ky-thuat-vien">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Ai Sẽ Là Người Vệ Sinh Máy Giặt Nhà Bạn?</h2>
                <p>Đội ngũ chuyên nghiệp, đáng tin cậy</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/washing_machine_team.jpg" alt="Kỹ thuật viên vệ sinh máy giặt" />
                </div>
                <div class="content-card">
                    <p>Đội ngũ kỹ thuật viên của Giúp Việc 24h đều được tuyển chọn kỹ lưỡng, trải qua đào tạo chuyên môn về vệ sinh và bảo trì máy giặt. Họ có kinh nghiệm xử lý nhiều loại máy giặt khác nhau, đảm bảo mang lại dịch vụ an toàn và hiệu quả.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="danh-gia-khach-hang">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Khách Hàng Nói Gì Về Dịch Vụ Vệ Sinh Máy Giặt?</h2>
                <p>Phản hồi từ những khách hàng đã trải nghiệm</p>
            </div>
            <div class="section-content fade-in">
                <div class="testimonial">
                    <p>"Dịch vụ rất chuyên nghiệp, máy giặt nhà tôi sạch như mới sau khi vệ sinh. Kỹ thuật viên nhiệt tình, đúng giờ!"</p>
                    <p class="author">- Chị Lan, Hải Châu, Đà Nẵng</p>
                </div>
                <div class="testimonial">
                    <p>"Tôi rất hài lòng với quy trình làm việc rõ ràng và giá cả hợp lý. Sẽ tiếp tục sử dụng dịch vụ!"</p>
                    <p class="author">- Anh Hùng, Ngũ Hành Sơn, Đà Nẵng</p>
                </div>
            </div>
        </div>
    </section>

    <section id="dau-hieu-can-ve-sinh">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Dấu Hiệu Nhận Biết Máy Giặt Cần Được Vệ Sinh</h2>
                <p>Khi nào bạn nên gọi dịch vụ vệ sinh?</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Máy giặt có mùi hôi khó chịu</li>
                        <li>Quần áo sau khi giặt vẫn còn vết bẩn hoặc mùi</li>
                        <li>Máy giặt rung lắc mạnh hoặc phát ra tiếng ồn lớn</li>
                        <li>Lồng giặt xuất hiện cặn bẩn hoặc mảng bám</li>
                        <li>Máy giặt tiêu tốn nhiều điện năng hơn bình thường</li>
                    </ul>
                </div>
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/washing_machine_signs.jpg" alt="Dấu hiệu máy giặt cần vệ sinh" />
                </div>
            </div>
        </div>
    </section>

    <section id="tan-suat-ve-sinh">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Bao Lâu Nên Vệ Sinh Máy Giặt Một Lần?</h2>
                <p>Đảm bảo máy giặt luôn hoạt động hiệu quả</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-card">
                    <p>Để duy trì hiệu suất và tuổi thọ của máy giặt, bạn nên vệ sinh định kỳ từ 6 tháng đến 1 năm một lần, tùy thuộc vào tần suất sử dụng. Với các gia đình sử dụng máy giặt thường xuyên (hơn 4 lần/tuần), nên vệ sinh mỗi 6 tháng để loại bỏ cặn bẩn và vi khuẩn hiệu quả.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="cau-hoi-thuong-gap" class="faq-section fade-in">
        <div class="container">
            <div class="section-header">
                <h2>Những Câu Hỏi Thường Gặp</h2>
                <p>Giải đáp chi tiết các thắc mắc về dịch vụ</p>
            </div>
            <ul class="faq-list">
                <li>
                    <div class="faq-question" onclick="toggleAnswer(this)">
                        <span>1.</span> Vì sao nên thường xuyên vệ sinh máy giặt?
                        <span>+</span>
                    </div>
                    <div class="faq-answer">
                        Bạn nên vệ sinh máy giặt thường xuyên để tránh tình trạng máy bị hỏng do cặn bẩn, vi khuẩn tích tụ. Việc này giúp máy hoạt động hiệu quả, tiết kiệm điện năng và bảo vệ quần áo khỏi mùi hôi hoặc vi khuẩn.
                    </div>
                </li>
                <li>
                    <div class="faq-question" onclick="toggleAnswer(this)">
                        <span>2.</span> Sử dụng máy giặt thế nào để tăng tuổi thọ máy?
                        <span>+</span>
                    </div>
                    <div class="faq-answer">
                        Để tăng tuổi thọ máy giặt, bạn nên sử dụng nước phù hợp, tránh quá tải quần áo, và vệ sinh định kỳ. Ngoài ra, ngắt nguồn điện khi không sử dụng để tránh rủi ro.
                    </div>
                </li>
                <li>
                    <div class="faq-question" onclick="toggleAnswer(this)">
                        <span>3.</span> Có nên tự vệ sinh điều hòa tại nhà không?
                        <span>+</span>
                    </div>
                    <div class="faq-answer">
                        Không khuyến khích tự vệ sinh điều hòa tại nhà vì cần thiết bị chuyên dụng và kỹ thuật chuyên môn. Hãy liên hệ dịch vụ chuyên nghiệp để đảm bảo an toàn và hiệu quả.
                    </div>
                </li>
                <li>
                    <div class="faq-question" onclick="toggleAnswer(this)">
                        <span>4.</span> Dịch vụ vệ sinh máy giặt bTaskee có làm việc ngay cuộc gọi không?
                        <span>+</span>
                    </div>
                    <div class="faq-answer">
                        Dịch vụ có thể sắp xếp lịch làm việc ngay nếu có nhân viên rảnh, nhưng thường cần đặt lịch trước để đảm bảo chất lượng và sự thuận tiện.
                    </div>
                </li>
                <li>
                    <div class="faq-question" onclick="toggleAnswer(this)">
                        <span>5.</span> Tôi có thể đặt lịch dịch vụ hôm nay không?
                        <span>+</span>
                    </div>
                    <div class="faq-answer">
                        Có, bạn có thể đặt lịch dịch vụ hôm nay thông qua website hoặc gọi trực tiếp để được hỗ trợ ngay.
                    </div>
                </li>
                <li>
                    <div class="faq-question" onclick="toggleAnswer(this)">
                        <span>6.</span> Tôi có phải trả thêm phí nếu dùng dịch vụ hay gas máy lạnh không?
                        <span>+</span>
                    </div>
                    <div class="faq-answer">
                        Phí dịch vụ cơ bản đã bao gồm, nhưng nếu cần nạp gas máy lạnh, sẽ có chi phí bổ sung tùy theo lượng gas sử dụng.
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <%@ include file="/view/common/web/footer.jsp" %>

    <script>
        // Scroll Progress Bar
        function updateScrollProgress() {
            const scrollTop = window.pageYOffset;
            const documentHeight = document.documentElement.scrollHeight - window.innerHeight;
            const scrollPercent = (scrollTop / documentHeight) * 100;
            document.querySelector('.washing-machine-service-page .scroll-progress').style.width = scrollPercent + '%';
        }

        // Intersection Observer for animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate');
                }
            });
        }, observerOptions);

        // Observe all fade-in elements
        document.querySelectorAll('.washing-machine-service-page .fade-in').forEach(el => {
            observer.observe(el);
        });

        // FAQ toggle functionality
        function toggleAnswer(element) {
            const answer = element.nextElementSibling;
            const isActive = answer.classList.contains('active');
            answer.style.display = isActive ? 'none' : 'block';
            answer.classList.toggle('active');
            element.querySelector('span:last-child').textContent = isActive ? '+' : '-';
        }

        // Event listeners
        window.addEventListener('scroll', updateScrollProgress);
        window.addEventListener('load', () => {
            updateScrollProgress();
            setTimeout(() => {
                document.querySelectorAll('.washing-machine-service-page .section-header, .washing-machine-service-page .section-content').forEach(el => {
                    observer.observe(el);
                });
            }, 100);
        });
    </script>
</body>
</html>