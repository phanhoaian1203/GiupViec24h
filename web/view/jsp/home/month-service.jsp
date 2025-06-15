<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Dịch Vụ Giúp Việc Theo Tháng | Giúp Việc 24h</title>
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
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner2.jpg" alt="Giúp việc theo tháng banner">
        <div class="overlay"></div>
        <div class="hero-content">
            <h1 class="animate__animated animate__fadeIn">Dịch Vụ Giúp Việc Theo Tháng</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">
                Giải pháp ổn định, lâu dài và đáng tin cậy cho ngôi nhà của bạn.
            </p>
        </div>
    </section>

    <!-- Giới thiệu dịch vụ -->
    <section id="gioi-thieu">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Giới Thiệu Dịch Vụ</h2>
                <p>Giúp việc theo tháng – giải pháp toàn thời gian, ổn định, hiệu quả</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/month_1.jpg" alt="Giới thiệu dịch vụ theo tháng">
                </div>
                <div class="content-card">
                    <p>
                        Dịch vụ giúp việc theo tháng phù hợp với gia đình cần người hỗ trợ lâu dài và ổn định.
                        Bạn sẽ có người hỗ trợ toàn thời gian cho các công việc như dọn dẹp, nấu ăn, chăm sóc thành viên trong gia đình và các công việc nội trợ khác.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Lý do chọn -->
    <section id="loi-ich">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Vì Sao Nên Chọn Giúp Việc Theo Tháng</h2>
                <p>Giải pháp ổn định và đáng tin cậy nhất cho mọi gia đình</p>
            </div>
            <div class="section-content reverse fade-in">
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Hỗ trợ toàn thời gian, ổn định</li>
                        <li>Gắn bó lâu dài, hiểu nhu cầu gia đình</li>
                        <li>Tiết kiệm chi phí nếu dùng thường xuyên</li>
                        <li>Dễ dàng thay thế hoặc điều chỉnh nếu cần</li>
                        <li>Được tuyển chọn và đào tạo kỹ lưỡng</li>
                    </ul>
                </div>
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/month_2.jpg" alt="Lợi ích theo tháng">
                </div>
            </div>
        </div>
    </section>

    <!-- Nhiệm vụ -->
    <section id="nhiem-vu">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Nội Dung Công Việc</h2>
                <p>Những gì người giúp việc theo tháng có thể hỗ trợ</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/month_3.jpg" alt="Công việc theo tháng">
                </div>
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Dọn dẹp toàn bộ nhà cửa hàng ngày</li>
                        <li>Chuẩn bị bữa ăn, đi chợ nấu cơm</li>
                        <li>Giặt giũ, là quần áo</li>
                        <li>Chăm sóc trẻ nhỏ hoặc người lớn tuổi</li>
                        <li>Hỗ trợ các công việc khác theo yêu cầu</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Bảng giá -->
    <section id="bang-gia">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Chi Phí Dịch Vụ</h2>
                <p>Minh bạch - linh hoạt - tiết kiệm</p>
            </div>
            <div class="price-section fade-in">
                <table class="price-table">
                    <thead>
                        <tr>
                            <th>Loại Công Việc</th>
                            <th>Thời Gian</th>
                            <th>Giá Tháng (VND)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>Giúp việc toàn thời gian (ở lại)</td><td>6 ngày/tuần</td><td>7,000,000</td></tr>
                        <tr><td>Giúp việc giờ hành chính</td><td>6 ngày/tuần</td><td>5,500,000</td></tr>
                        <tr><td>Chăm sóc người già/trẻ nhỏ</td><td>24/7</td><td>8,000,000</td></tr>
                        <tr><td>Nội trợ kết hợp chăm sóc</td><td>Toàn thời gian</td><td>7,500,000</td></tr>
                        <tr><td>Khác (theo yêu cầu)</td><td>Linh hoạt</td><td>Thỏa thuận</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- FAQ -->
    <section id="faq">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Câu Hỏi Thường Gặp</h2>
            </div>
            <div class="accordion fade-in">
                <div class="accordion-item">
                    <button class="accordion-button">Có thể thay đổi người giúp việc giữa tháng không?</button>
                    <div class="accordion-content"><p>Chúng tôi hỗ trợ thay đổi khi có lý do hợp lý, với thời gian báo trước.</p></div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button">Giúp việc có ở lại không?</button>
                    <div class="accordion-content"><p>Bạn có thể chọn giữa ở lại hoặc về trong ngày, tùy vào gói dịch vụ.</p></div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button">Tôi cần ký hợp đồng không?</button>
                    <div class="accordion-content"><p>Có hợp đồng rõ ràng giữa các bên để bảo vệ quyền lợi của bạn.</p></div>
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
