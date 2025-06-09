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
    <%@ include file="/view/common/web/add_css.jsp" %>
</head>
<body>
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero -->
    <section class="hero" style="position: relative; height: 100vh; display: flex; align-items: center; justify-content: center; padding-top: 80px;">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner1.jpg" alt="Banner" style="width: 100%; height: 100vh; object-fit: cover; position: absolute; top: 0; left: 0; z-index: 1;">
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.7); z-index: 2;"></div>
        <div class="hero-content" style="position: relative; z-index: 3; text-align: center;">
            <h1 class="animate__animated animate__fadeIn">Lợi ích vượt trội khi sử dụng Giúp Việc 24h</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">Khám phá những giá trị đặc biệt mà nền tảng chúng tôi mang lại cho khách hàng và người giúp việc tại Đà Nẵng.</p>
        </div>
    </section>

    <!-- Benefits for Customers -->
    <section class="section">
        <div class="container">
            <h2 class="section-title">Lợi ích dành cho khách hàng</h2>
            
            
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
                <div class="stat-card">
                    <div class="stat-number">500+</div>
                    <div class="stat-label">Khách hàng hài lòng</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">200+</div>
                    <div class="stat-label">Người giúp việc chuyên nghiệp</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">1000+</div>
                    <div class="stat-label">Dịch vụ hoàn thành</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">4.8/5</div>
                    <div class="stat-label">Đánh giá trung bình</div>
                </div>
            </div>
        </div>
    </section>

    
    <!-- CTA Section -->
    <section class="cta">
        <div class="container">
            <h2 class="cta-title animate__animated animate__fadeIn">Khám phá tiện ích ngay hôm nay</h2>
            <p class="cta-subtitle animate__animated animate__fadeIn animate__delay-1s">Dịch vụ giúp việc chuyên nghiệp với giá cả hợp lý, mang đến sự tiện nghi cho gia đình bạn.</p>
            <div class="cta-buttons animate__animated animate__fadeIn animate__delay-2s">
                <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn btn-primary">Đăng ký ngay</a>
                <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp" class="btn btn-outline">Đăng nhập</a>
            </div>
        </div>
    </section>

    <%@ include file="/view/common/web/footer.jsp" %>
    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>