<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Dịch Vụ Giúp Việc Theo Ngày | Giúp Việc 24h</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Animate & Custom Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <%@ include file="/view/common/web/add_css.jsp" %>
</head>

<body class="hourly-service-page">
    <div class="scroll-progress"></div>
    <%@ include file="/view/common/web/header.jsp" %>

    <!-- Banner -->
    <section class="hero">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner3.jpg" alt="Giúp việc theo ngày banner">
        <div class="overlay"></div>
        <div class="hero-content">
            <h1 class="animate__animated animate__fadeIn">Dịch Vụ Giúp Việc Theo Ngày</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">
                Linh hoạt hàng ngày – hỗ trợ toàn diện cho ngôi nhà của bạn.
            </p>
        </div>
    </section>

    <!-- Giới thiệu -->
    <section id="gioi-thieu">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Giới Thiệu Dịch Vụ</h2>
                <p>Phù hợp cho gia đình bận rộn, cần hỗ trợ định kỳ hàng ngày</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/daily_1.jpg" alt="Giới thiệu dịch vụ">
                </div>
                <div class="content-card">
                    <p>
                        Dịch vụ giúp việc theo ngày là lựa chọn hợp lý khi bạn cần người hỗ trợ trong ngày nhưng không ở lại.
                        Dọn dẹp, nấu nướng, chăm sóc nhà cửa… đều được thực hiện bởi đội ngũ chuyên nghiệp, tận tâm.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Lợi ích -->
    <section id="loi-ich">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Lý Do Nên Chọn</h2>
                <p>Tiện lợi – tiết kiệm – an tâm</p>
            </div>
            <div class="section-content reverse fade-in">
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Linh hoạt mỗi ngày, không cần thuê dài hạn</li>
                        <li>Chi phí hợp lý, trả theo từng ngày</li>
                        <li>Chất lượng ổn định, có thể đặt lại người quen</li>
                        <li>Đáp ứng nhanh khi có nhu cầu đột xuất</li>
                    </ul>
                </div>
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/daily_2.jpg" alt="Lợi ích theo ngày">
                </div>
            </div>
        </div>
    </section>

    <!-- Nhiệm vụ -->
    <section id="nhiem-vu">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Công Việc Hỗ Trợ</h2>
                <p>Đội ngũ cộng tác viên làm được những gì?</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/daily_3.jpg" alt="Công việc">
                </div>
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Vệ sinh phòng, bếp, nhà tắm</li>
                        <li>Chuẩn bị và nấu ăn bữa chính</li>
                        <li>Giặt giũ và ủi quần áo</li>
                        <li>Dọn dẹp sân, ban công, cửa kính</li>
                        <li>Chăm sóc cây cảnh, vật nuôi nhỏ</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Bảng giá -->
    <section id="bang-gia">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Bảng Giá Dịch Vụ</h2>
                <p>Thanh toán theo ca – không phát sinh phí ẩn</p>
            </div>
            <div class="price-section fade-in">
                <table class="price-table">
                    <thead>
                        <tr>
                            <th>Gói Dịch Vụ</th>
                            <th>Thời Gian</th>
                            <th>Giá (VND/ngày)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>Dọn dẹp nhà cửa</td><td>4 tiếng</td><td>300,000</td></tr>
                        <tr><td>Nấu ăn + dọn dẹp</td><td>6 tiếng</td><td>450,000</td></tr>
                        <tr><td>Chăm người già/trẻ</td><td>8 tiếng</td><td>600,000</td></tr>
                        <tr><td>Tổng hợp (full ngày)</td><td>10 tiếng</td><td>750,000</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Câu hỏi thường gặp -->
    <section id="faq">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Câu Hỏi Thường Gặp</h2>
            </div>
            <div class="accordion fade-in">
                <div class="accordion-item">
                    <button class="accordion-button">Có thể đặt gấp trong ngày không?</button>
                    <div class="accordion-content"><p>Chúng tôi hỗ trợ đặt nhanh trong vòng 2 tiếng nếu có nhân sự sẵn sàng.</p></div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button">Người giúp việc có ở lại không?</button>
                    <div class="accordion-content"><p>Dịch vụ theo ngày không ở lại, chỉ làm trong khung giờ đã thỏa thuận.</p></div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button">Có cam kết hoàn tiền nếu không hài lòng?</button>
                    <div class="accordion-content"><p>Có chính sách hoàn tiền/đổi người nếu bạn không hài lòng với chất lượng dịch vụ.</p></div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/view/common/web/footer.jsp" %>

    <script>
        document.querySelectorAll('.accordion-button').forEach(btn => {
            btn.addEventListener('click', () => {
                const content = btn.nextElementSibling;
                const isActive = btn.classList.contains('active');
                document.querySelectorAll('.accordion-button').forEach(b => {
                    b.classList.remove('active');
                    b.nextElementSibling.classList.remove('active');
                });
                if (!isActive) {
                    btn.classList.add('active');
                    content.classList.add('active');
                }
            });
        });

        window.addEventListener('scroll', () => {
            const progress = document.querySelector('.scroll-progress');
            const scrolled = window.scrollY / (document.body.scrollHeight - window.innerHeight);
            progress.style.width = (scrolled * 100) + '%';
        });

        const observer = new IntersectionObserver(entries => {
            entries.forEach(entry => {
                if (entry.isIntersecting) entry.target.classList.add('animate');
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));
    </script>
</body>
</html>
