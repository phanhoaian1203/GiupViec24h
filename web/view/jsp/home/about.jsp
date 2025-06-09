<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về chúng tôi - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <%@ include file="/view/common/web/add_css.jsp" %>
</head>
<body class="about-page">
    <!-- Header -->
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Hero -->
    <section class="hero" style="position: relative; height: 100vh; display: flex; align-items: center; justify-content: center; padding-top: 80px;">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner1.jpg" alt="Banner" style="width: 100%; height: 100vh; object-fit: cover; position: absolute; top: 0; left: 0; z-index: 1;">
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.7); z-index: 2;"></div>
        <div class="hero-content" style="position: relative; z-index: 3; text-align: center;">
            <h1 class="animate__animated animate__fadeIn">Về Giúp Việc 24h</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">
                Chúng tôi tự hào mang đến dịch vụ giúp việc chuyên nghiệp, tiện lợi, giúp bạn chăm sóc gia đình một cách trọn vẹn nhất.
            </p>
        </div>
    </section>

    <!-- About Us Section -->
    <section class="section">
        <div class="container">
            <div class="about-section-content">
                <div class="about-text">
                    <h2 class="section-title">Chúng tôi là Giúp Việc 24h</h2>
                    <p>
                        Giúp Việc 24h là nền tảng đặt dịch vụ giúp việc nhà tại Đà Nẵng, do nhóm sinh viên phát triển nhằm mang đến giải pháp vệ sinh tiện lợi, hiện đại. Chúng tôi kết nối nhanh chóng giữa khách hàng và đội ngũ giúp việc chuyên nghiệp, cung cấp các dịch vụ như dọn dẹp theo giờ, vệ sinh sau xây dựng, giặt rèm – sofa, vệ sinh thiết bị gia dụng... Với hệ thống đặt lịch thông minh, việc chọn thời gian, địa điểm và nhân viên trở nên dễ dàng hơn bao giờ hết. Giúp Việc 24h – Giải pháp giúp việc đáng tin cậy tại Đà Nẵng.
                    </p>
                </div>
                <div class="about-image-container">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/about/about.jpg" 
                         alt="Illustration of Giúp Việc 24h's technology platform" 
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
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/about/about_2.jpg" 
                         alt="Giúp Việc 24h support team" 
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
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/about/about_3.jpg" 
                         alt="Map of Giúp Việc 24h's operating areas in Vietnam" 
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
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/about/about_4.jpg"
                         alt="Giúp Việc 24h cleaning service" 
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
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/about/about_5.jpg" 
                         alt="Illustration of Giúp Việc 24h's vision" 
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
                     <img src="<%= request.getContextPath() %>/view/assets/home/img/about/about_6.jpg"
                         alt="Giúp Việc 24h company building icon" 
                         class="about-image">
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="container">
            <h2 class="cta-title animate__animated animate__fadeIn">Khám phá tiện ích ngay hôm nay</h2>
            <p class="cta-subtitle animate__animated animate__fadeIn animate__delay-1s">
                Dịch vụ giúp việc chuyên nghiệp với giá cả hợp lý, mang đến sự tiện nghi cho gia đình bạn.
            </p>
            <div class="cta-buttons animate__animated animate__fadeIn animate__delay-2s">
                <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn btn-primary">Đăng ký ngay</a>
                <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp" class="btn btn-outline">Đăng nhập</a>
            </div>
        </div>
    </section>

    <!-- Include Footer -->
    <%@ include file="/view/common/web/footer.jsp" %>
    <!-- Include add_js -->
    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>