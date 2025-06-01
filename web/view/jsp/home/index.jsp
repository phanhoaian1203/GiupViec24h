<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Dịch vụ giúp việc chuyên nghiệp</title>
    <!-- Include CSS -->
    <%@ include file="/view/common/web/add_css.jsp" %>
</head>
<body>
    <!-- Include Header -->
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Giúp Việc 24h</h1>
            <p class="hero-tagline">Giúp việc theo giờ – An toàn – Tiện lợi – Đảm bảo chất lượng</p>
            <div>
                <a href="/view/jsp/home/booking.jsp" class="btn">Đặt dịch vụ ngay</a>
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
                        <a href="/view/jsp/home/hourly-service.jsp" class="service-link">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-couch"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Vệ sinh sofa, thảm, máy giặt</h3>
                        <p class="service-description">Dịch vụ vệ sinh chuyên nghiệp với thiết bị hiện đại và nhân viên có chuyên môn cao.</p>
                        <a href="/view/jsp/home/cleaning-service.jsp" class="service-link">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Giúp việc văn phòng</h3>
                        <p class="service-description">Giải pháp vệ sinh và hỗ trợ văn phòng toàn diện, giúp không gian làm việc luôn sạch sẽ và chuyên nghiệp.</p>
                        <a href="/view/jsp/home/office-service.jsp" class="service-link">Xem chi tiết <i class="fas fa-arrow-right"></i></a>
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
    <section id="about" class="container section">
        <h2 class="section-title">Về chúng tôi</h2>
        <p style="text-align: center; max-width: 800px; margin: 0 auto; font-size: 1rem;">
            Giúp Việc 24h là nền tảng kết nối khách hàng với đội ngũ giúp việc chuyên nghiệp, đáng tin cậy. 
            Chúng tôi đặt sự hài lòng và an toàn của khách hàng lên hàng đầu thông qua quy trình tuyển chọn nghiêm ngặt và dịch vụ chăm sóc tận tâm.
        </p>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container section">
        <h2 class="section-title">Liên hệ với chúng tôi</h2>
        <div style="max-width: 600px; margin: 0 auto; text-align: center; font-size: 1rem;">
            <p>Chúng tôi luôn sẵn sàng lắng nghe bạn. Vui lòng liên hệ qua các thông tin dưới đây:</p>
            <p><i class="fas fa-map-marker-alt"></i> Khu Đô Thị FPT, Phường Hòa Hải, Quận Ngũ Hành Sơn, TP. Đà Nẵng</p>
            <p><i class="fas fa-phone-alt"></i> +84 123 456 789</p>
            <p><i class="fas fa-envelope"></i> info@giupviec24h.com</p>
        </div>
    </section>

    <!-- Commitment Section -->
    <section class="commitment section">
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
                <a href="/view/jsp/home/signup.jsp" class="btn btn-primary">Đăng ký</a>
                <a href="/view/jsp/home/login.jsp" class="btn btn-outline">Đăng nhập</a>
            </div>
        </div>
    </section>

    <!-- Include Footer -->
    <%@ include file="/view/common/web/footer.jsp" %>
    <!<!-- Include add_js -->
    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>