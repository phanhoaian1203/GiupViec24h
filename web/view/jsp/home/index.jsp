<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giúp Việc 24h - Dịch vụ giúp việc chuyên nghiệp tại Đà Nẵng</title>
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <!-- Include CSS -->
    <%@ include file="/view/common/web/add_css.jsp" %>
    <!-- Animation CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    
</head>
<body>
    <!-- Include Header -->
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero Section -->
    <section class="hero" style="position: relative; height: 100vh; display: flex; align-items: center; justify-content: center; padding-top: 80px;">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner1.jpg" alt="Banner" style="width: 100%; height: 100vh; object-fit: cover; position: absolute; top: 0; left: 0; z-index: 1;">
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.7); z-index: 2;"></div>
        <div class="hero-content" style="position: relative; z-index: 3; text-align: center;">
            <h1 class="animate__animated animate__fadeIn">Giúp Việc 24h</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">Dịch vụ giúp việc chuyên nghiệp, an toàn, tiện lợi tại Đà Nẵng</p>
            <div class="animate__animated animate__fadeIn animate__delay-2s">
                <a href="/view/jsp/home/booking.jsp" class="btn">Đặt dịch vụ ngay</a>
                <a href="#services" class="btn btn-secondary">Khám phá dịch vụ</a>
            </div>
        </div>
    </section>

    <!-- Phần "Tất cả những tiện ích gia đình mà bạn cần" -->
    <section id="utilities" class="section">
        <div class="container">
            <h2 class="section-title">Tất cả những tiện ích gia đình mà bạn cần</h2>
            <div class="utilities-slider">
                <div class="utilities-container">
                    <div class="utilities-wrapper" id="utilitiesWrapper">
                        <div class="utilities-slide">
                            <div class="utility-card">
                                <img src="https://i.pinimg.com/736x/62/b0/ca/62b0ca067f15046772bb9ced1bf831c5.jpg" alt="Giúp việc theo giờ" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Giúp việc theo giờ</h3>
                                    <p class="utility-description">Lịch dịch vụ linh hoạt, giúp bạn dọn dẹp nhanh chóng và tiết kiệm thời gian.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://i.pinimg.com/736x/6b/75/ba/6b75baf00b15d606c604127fd2838aff.jpg" alt="Giúp việc theo ngày" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Giúp việc theo ngày</h3>
                                    <p class="utility-description">Dọn dẹp toàn diện trong ngày, mang lại không gian sống sạch sẽ, thoải mái.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://i.pinimg.com/736x/02/ba/ee/02baeec47e96363883e8f3cde500651a.jpg" alt="Giúp việc theo tháng" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Giúp việc theo tháng</h3>
                                    <p class="utility-description">Giải pháp lâu dài với lịch trình cố định, giữ ngôi nhà luôn gọn gàng.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://i.pinimg.com/736x/cc/5a/96/cc5a96b8e569c0bf7ca64fe9812f4844.jpg" alt="Vệ sinh sofa, thảm" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Vệ sinh sofa, thảm</h3>
                                    <p class="utility-description">Làm sạch chuyên sâu với thiết bị hiện đại, trả lại vẻ đẹp nội thất.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://i.pinimg.com/736x/38/d1/84/38d18482c821305e1d1cf7f583f3ce6c.jpg" alt="Vệ sinh máy giặt" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Vệ sinh máy giặt</h3>
                                    <p class="utility-description">Loại bỏ cặn bẩn, vi khuẩn, giúp máy giặt hoạt động hiệu quả hơn.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://i.pinimg.com/736x/bc/52/fa/bc52fabb16921d546cc380cc0561a530.jpg" alt="Dịch vụ đặc biệt" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Dịch vụ đặc biệt</h3>
                                    <p class="utility-description">Tùy chỉnh theo nhu cầu, từ dọn dẹp chuyên sâu đến hỗ trợ sự kiện.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&h=220&q=80" alt="Dịch vụ đặc biệt" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Dịch vụ đặc biệt</h3>
                                    <p class="utility-description">Tùy chỉnh theo nhu cầu, từ dọn dẹp chuyên sâu đến hỗ trợ sự kiện.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&h=220&q=80" alt="Dịch vụ đặc biệt" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Dịch vụ đặc biệt</h3>
                                    <p class="utility-description">Tùy chỉnh theo nhu cầu, từ dọn dẹp chuyên sâu đến hỗ trợ sự kiện.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&h=220&q=80" alt="Dịch vụ đặc biệt" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Dịch vụ đặc biệt</h3>
                                    <p class="utility-description">Tùy chỉnh theo nhu cầu, từ dọn dẹp chuyên sâu đến hỗ trợ sự kiện.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <!--<div class="utility-card">
                                <img src="https://images.unsplash.com/photo-1581578731548-c64695cc6952?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&h=220&q=80" alt="Vệ sinh văn phòng" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Vệ sinh văn phòng</h3>
                                    <p class="utility-description">Tạo môi trường làm việc sạch sẽ, chuyên nghiệp cho doanh nghiệp.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>
                            <div class="utility-card">
                                <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&h=220&q=80" alt="Chăm sóc người già" class="utility-image">
                                <div class="utility-content">
                                    <h3 class="utility-title">Chăm sóc người già</h3>
                                    <p class="utility-description">Dịch vụ chăm sóc chu đáo, tận tình cho người cao tuổi trong gia đình.</p>
                                    <a href="#" class="utility-link">Tìm hiểu thêm</a>
                                </div>
                            </div>-->
                        </div>
                    </div>
                </div>

                <!-- Slider Controls -->
                <div class="slider-controls">
                    <button class="slider-btn prev" id="prevBtn">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <button class="slider-btn next" id="nextBtn">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </div>

                <!-- Slider Indicators -->
                <div class="slider-indicators" id="indicators"></div>
            </div>
        </div>
    </section>
    
    

    <!-- Enhanced Benefits Section -->
<!-- Benefits Section -->
  <%-- Bắt đầu SECTION: An tâm với lựa chọn của bạn --%>
    <section class="benefits section" id="peace-of-mind">
        <div class="container">
            <h2 class="section-title">An Tâm Với Lựa Chọn Của Bạn</h2>
            <p class="section-subtitle" style="text-align: center; max-width: 700px; margin-left: auto; margin-right: auto; margin-bottom: 3rem; color: #555;">
                Chúng tôi luôn đặt sự yên tâm và hài lòng của bạn lên hàng đầu với dịch vụ chuyên nghiệp, minh bạch và đáng tin cậy.
            </p>
            <div class="benefits-grid">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-user-check"></i> <%-- Icon gợi ý: Người giúp việc được xác minh --%>
                    </div>
                    <h3 class="benefit-title">Nhân Viên Chuyên Nghiệp</h3>
                    <p>Đội ngũ giúp việc được tuyển chọn kỹ càng, đào tạo bài bản và có hồ sơ rõ ràng, đảm bảo sự tin cậy.</p>
                </div>

                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-wallet"></i> <%-- Icon gợi ý: Giá cả minh bạch --%>
                    </div>
                    <h3 class="benefit-title">Chi Phí Minh Bạch</h3>
                    <p>Giá dịch vụ được niêm yết công khai, rõ ràng trên ứng dụng và website, không phát sinh chi phí ẩn.</p>
                </div>

                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-calendar-alt"></i> <%-- Icon gợi ý: Đặt lịch dễ dàng --%>
                    </div>
                    <h3 class="benefit-title">Lịch Trình Linh Hoạt</h3>
                    <p>Dễ dàng đặt lịch, tùy chỉnh hoặc thay đổi dịch vụ theo nhu cầu cá nhân của bạn một cách nhanh chóng.</p>
                </div>

                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-shield-alt"></i> <%-- Icon gợi ý: An toàn bảo mật --%>
                    </div>
                    <h3 class="benefit-title">An Toàn & Bảo Vệ</h3>
                    <p>Chúng tôi cam kết bảo vệ quyền lợi của bạn với các chính sách hỗ trợ và bảo hiểm rủi ro (nếu có).</p>
                </div>
            </div>
        </div>
    </section>

    
    
    <!-- Commitment Section -->
    <section class="commitment section">
        <div class="container">
            <h2 class="section-title animate__animated animate__fadeIn">Cam kết chất lượng</h2>
            <div class="commitment-items">
                <div class="commitment-item animate__animated">
                    <div class="commitment-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div class="commitment-text">
                        <p>Xác minh hồ sơ nghiêm ngặt</p>
                    </div>
                </div>
                <div class="commitment-item animate__animated">
                    <div class="commitment-icon">
                        <i class="fas fa-undo"></i>
                    </div>
                    <div class="commitment-text">
                        <p>Hoàn tiền nếu không hài lòng</p>
                    </div>
                </div>
                <div class="commitment-item animate__animated">
                    <div class="commitment-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <div class="commitment-text">
                        <p>Hỗ trợ 24/7 nhanh chóng</p>
                    </div>
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

    <!-- Include Footer -->
    <%@ include file="/view/common/web/footer.jsp" %>
    <!-- Include JavaScript -->
    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>