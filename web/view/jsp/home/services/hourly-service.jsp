<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dịch vụ giúp việc theo giờ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <%@ include file="/view/common/web/add_css.jsp" %>
</head>
<body class="hourly-service-page">
    <div class="bg-decoration"></div>
    <div class="scroll-progress"></div>

    <%@ include file="/view/common/web/header.jsp" %>

    <section class="hero">
        <img src="<%= request.getContextPath() %>/view/assets/home/img/banner/banner1.jpg" alt="Banner">
        <div class="overlay"></div>
        <div class="hero-content">
            <h1 class="animate__animated animate__fadeIn">Dịch Vụ Giúp Việc Theo Giờ</h1>
            <p class="hero-tagline animate__animated animate__fadeIn animate__delay-1s">Giải pháp giúp việc linh hoạt, an toàn và tiện lợi cho gia đình bạn. Đội ngũ cộng tác viên chuyên nghiệp, tận tâm mang đến sự hài lòng và tin cậy.</p>
        </div>
    </section>

    <section id="giai-phap">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Giải Pháp Giúp Việc Theo Giờ</h2>
                <p>Dịch vụ linh hoạt, tiết kiệm và hiệu quả cho mọi gia đình</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/hourly_1.jpg" alt="Giúp việc theo giờ - giải pháp" />
                </div>
                <div class="content-card">
                    <p>Dịch vụ giúp việc theo giờ của chúng tôi giúp tiết kiệm thời gian và chi phí cho khách hàng. Bạn có thể đặt lịch linh hoạt phù hợp với nhu cầu và thời gian của mình, từ dọn dẹp nhà cửa, nấu ăn đến chăm sóc người già và trẻ nhỏ.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="ly-do-chon">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Lý Do Chọn Giúp Việc Theo Giờ</h2>
                <p>Những ưu điểm vượt trội khiến khách hàng tin tựa</p>
            </div>
            <div class="section-content reverse fade-in">
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Tiết kiệm chi phí so với thuê giúp việc toàn thời gian</li>
                        <li>Linh hoạt về thời gian, bạn có thể đặt giúp việc theo giờ phù hợp</li>
                        <li>Đội ngũ cộng tác viên được đào tạo chuyên nghiệp, đáng tin cậy</li>
                        <li>Dịch vụ đa dạng phù hợp với nhiều nhu cầu trong gia đình</li>
                        <li>An toàn, bảo mật thông tin khách hàng tuyệt đối</li>
                    </ul>
                </div>
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/hourly_2.jpg" alt="Lý do chọn giúp việc theo giờ" />
                </div>
            </div>
        </div>
    </section>

    <section id="cong-tac-vien">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Cộng Tác Viên Sẽ Làm Những Gì?</h2>
                <p>Đa dạng dịch vụ đáp ứng mọi nhu cầu gia đình</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="<%= request.getContextPath() %>/view/assets/home/img/service/hourly_3.jpg" alt="Cộng tác viên giúp việc" />
                </div>
                <div class="content-card">
                    <ul class="modern-list">
                        <li>Dọn dẹp nhà cửa, lau chùi, giặt giũ</li>
                        <li>Nấu các bữa ăn theo yêu cầu</li>
                        <li>Chăm sóc, trông trẻ và người già</li>
                        <li>Bảo quản và sắp xếp vật dụng trong gia đình</li>
                        <li>Hỗ trợ các công việc khác theo yêu cầu khách hàng</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section id="gia">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Bảng Giá Dịch Vụ</h2>
                <p>Giá cả minh bạch, cạnh tranh trên thị trường</p>
            </div>
            <div class="price-section fade-in">
                <table class="price-table">
                    <thead>
                        <tr>
                            <th>Dịch Vụ</th>
                            <th>Thời Gian</th>
                            <th>Giá (VND)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Dọn dẹp nhà cửa</td>
                            <td>1 giờ</td>
                            <td>120,000</td>
                        </tr>
                        <tr>
                            <td>Nấu ăn</td>
                            <td>1 giờ</td>
                            <td>150,000</td>
                        </tr>
                        <tr>
                            <td>Chăm sóc trẻ và người già</td>
                            <td>1 giờ</td>
                            <td>130,000</td>
                        </tr>
                        <tr>
                            <td>Giặt ủi</td>
                            <td>1 giờ</td>
                            <td>100,000</td>
                        </tr>
                        <tr>
                            <td>Hỗ trợ việc khác</td>
                            <td>Theo yêu cầu</td>
                            <td>Thỏa thuận</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <section id="cau-hoi-thuong-gap">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Câu Hỏi Thường Gặp</h2>
                <p>Giải đáp những thắc mắc phổ biến của khách hàng</p>
            </div>
            <div class="accordion fade-in">
                <div class="accordion-item">
                    <button class="accordion-button" type="button">
                        Làm thế nào để đặt dịch vụ giúp việc theo giờ?
                    </button>
                    <div class="accordion-content">
                        <p>Bạn có thể liên hệ với chúng tôi qua điện thoại, website hoặc ứng dụng để đặt lịch giúp việc theo giờ phù hợp với nhu cầu.</p>
                    </div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button" type="button">
                        Cộng tác viên có được đào tạo không?
                    </button>
                    <div class="accordion-content">
                        <p>Cộng tác viên đều trải qua quá trình đào tạo chuyên nghiệp để đảm bảo phục vụ khách hàng hiệu quả và an toàn.</p>
                    </div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button" type="button">
                        Dịch vụ có đảm bảo an toàn không?
                    </button>
                    <div class="accordion-content">
                        <p>Chúng tôi cam kết đảm bảo an toàn và bảo mật thông tin khách hàng trong suốt quá trình cung cấp dịch vụ giúp việc.</p>
                    </div>
                </div>
                <div class="accordion-item">
                    <button class="accordion-button" type="button">
                        Có thể thay đổi lịch giúp việc không?
                    </button>
                    <div class="accordion-content">
                        <p>Bạn có thể thay đổi lịch giúp việc dễ dàng qua kênh liên lạc của chúng tôi trước thời gian đã đặt.</p>
                    </div>
                </div>
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
            document.querySelector('.hourly-service-page .scroll-progress').style.width = scrollPercent + '%';
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
        document.querySelectorAll('.hourly-service-page .fade-in').forEach(el => {
            observer.observe(el);
        });

        // Accordion functionality
        document.querySelectorAll('.hourly-service-page .accordion-button').forEach(button => {
            button.addEventListener('click', () => {
                const content = button.nextElementSibling;
                const isActive = button.classList.contains('active');

                // Close all accordion items
                document.querySelectorAll('.hourly-service-page .accordion-button').forEach(btn => {
                    btn.classList.remove('active');
                    btn.nextElementSibling.classList.remove('active');
                });

                // Open clicked item if it wasn't active
                if (!isActive) {
                    button.classList.add('active');
                    content.classList.add('active');
                }
            });
        });

        // Event listeners
        window.addEventListener('scroll', updateScrollProgress);
        window.addEventListener('load', () => {
            updateScrollProgress();
            setTimeout(() => {
                document.querySelectorAll('.hourly-service-page .section-header, .hourly-service-page .section-content').forEach(el => {
                    observer.observe(el);
                });
            }, 100);
        });
    </script>
</body>
</html>