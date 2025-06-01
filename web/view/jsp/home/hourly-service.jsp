<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Dịch Vụ Giúp Việc Theo Giờ</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap');
    
    /* Modern CSS Reset */
    *, *::before, *::after {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    :root {
        --primary: #00B4A6;
        --primary-dark: #008B7F;
        --primary-light: #E6F9F7;
        --secondary: #FF6B6B;
        --accent: #4ECDC4;
        --dark: #1A202C;
        --gray: #718096;
        --light-gray: #F7FAFC;
        --white: #FFFFFF;
        --shadow: 0 10px 40px rgba(0, 180, 166, 0.1);
        --shadow-lg: 0 20px 60px rgba(0, 180, 166, 0.15);
        --gradient: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
        --gradient-dark: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
    }

    html {
        scroll-behavior: smooth;
    }

    body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        line-height: 1.7;
        color: var(--dark);
        background: var(--white);
        overflow-x: hidden;
    }

    /* Floating Background Elements */
    .bg-decoration {
        position: fixed;
        pointer-events: none;
        z-index: -1;
    }

    .bg-decoration::before {
        content: '';
        position: absolute;
        width: 400px;
        height: 400px;
        background: linear-gradient(45deg, rgba(0, 180, 166, 0.03), rgba(78, 205, 196, 0.05));
        border-radius: 50%;
        top: 10%;
        right: -10%;
        animation: float 20s ease-in-out infinite;
    }

    .bg-decoration::after {
        content: '';
        position: absolute;
        width: 300px;
        height: 300px;
        background: linear-gradient(45deg, rgba(255, 107, 107, 0.03), rgba(78, 205, 196, 0.03));
        border-radius: 50%;
        bottom: 20%;
        left: -5%;
        animation: float 25s ease-in-out infinite reverse;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0px) rotate(0deg); }
        50% { transform: translateY(-30px) rotate(180deg); }
    }

    /* Modern Header */
    header {
        background: var(--gradient);
        color: var(--white);
        padding: 120px 20px 100px;
        text-align: center;
        position: relative;
        overflow: hidden;
        min-height: 70vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    header::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 200"><path d="M0,100 C150,200 350,0 500,100 C650,200 850,0 1000,100 L1000,00 L0,0 Z" style="fill:rgba(255,255,255,0.1)"></path></svg>') repeat-x;
        background-size: 1000px 200px;
        animation: wave 15s linear infinite;
    }

    @keyframes wave {
        0% { background-position-x: 0; }
        100% { background-position-x: 1000px; }
    }

    .header-content {
        position: relative;
        z-index: 2;
        max-width: 800px;
    }

    header h1 {
        font-size: clamp(2.5rem, 5vw, 4rem);
        font-weight: 800;
        margin-bottom: 24px;
        letter-spacing: -0.02em;
        line-height: 1.1;
        opacity: 0;
        animation: slideInUp 1s ease 0.3s forwards;
    }

    header p {
        font-size: clamp(1.1rem, 2vw, 1.3rem);
        font-weight: 400;
        line-height: 1.6;
        opacity: 0.95;
        max-width: 600px;
        margin: 0 auto;
        opacity: 0;
        animation: slideInUp 1s ease 0.6s forwards;
    }

    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Container */
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }

    /* Modern Sections */
    section {
        padding: 100px 0;
        position: relative;
    }

    section:nth-child(even) {
        background: var(--light-gray);
    }

    .section-header {
        text-align: center;
        margin-bottom: 80px;
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.8s ease;
    }

    .section-header.animate {
        opacity: 1;
        transform: translateY(0);
    }

    .section-header h2 {
        font-size: clamp(2rem, 4vw, 3rem);
        font-weight: 700;
        color: var(--dark);
        margin-bottom: 16px;
        position: relative;
        display: inline-block;
    }

    .section-header h2::after {
        content: '';
        position: absolute;
        bottom: -8px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 4px;
        background: var(--gradient);
        border-radius: 2px;
    }

    .section-header p {
        font-size: 1.2rem;
        color: var(--gray);
        max-width: 600px;
        margin: 0 auto;
    }

    /* Card Layout */
    .section-content {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 60px;
        align-items: center;
        opacity: 0;
        transform: translateY(40px);
        transition: all 0.8s ease;
    }

    .section-content.animate {
        opacity: 1;
        transform: translateY(0);
    }

    .section-content.reverse {
        direction: rtl;
    }

    .section-content.reverse > * {
        direction: ltr;
    }

    .content-card {
        background: var(--white);
        padding: 40px;
        border-radius: 24px;
        box-shadow: var(--shadow);
        transition: all 0.4s ease;
        border: 1px solid rgba(0, 180, 166, 0.08);
    }

    .content-card:hover {
        transform: translateY(-8px);
        box-shadow: var(--shadow-lg);
    }

    .content-image {
        position: relative;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: var(--shadow);
        transition: all 0.4s ease;
    }

    .content-image:hover {
        transform: scale(1.02);
        box-shadow: var(--shadow-lg);
    }

    .content-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: all 0.4s ease;
    }

    .content-image:hover img {
        transform: scale(1.05);
    }

    /* Modern List */
    .modern-list {
        list-style: none;
        padding: 0;
    }

    .modern-list li {
        display: flex;
        align-items: flex-start;
        margin-bottom: 20px;
        padding: 16px 0;
        border-bottom: 1px solid rgba(0, 180, 166, 0.1);
        transition: all 0.3s ease;
    }

    .modern-list li:hover {
        padding-left: 12px;
        background: var(--primary-light);
        margin-left: -12px;
        margin-right: -12px;
        border-radius: 12px;
        border-bottom: 1px solid transparent;
    }

    .modern-list li::before {
        content: '✓';
        background: var(--gradient);
        color: var(--white);
        width: 24px;
        height: 24px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        font-weight: 600;
        margin-right: 16px;
        flex-shrink: 0;
        margin-top: 2px;
    }

    /* Modern Table */
    .price-section {
        background: var(--white);
        padding: 60px 40px;
        border-radius: 24px;
        box-shadow: var(--shadow);
        margin: 40px 0;
    }

    .price-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: var(--shadow);
        background: var(--white);
    }

    .price-table th {
        background: var(--gradient);
        color: var(--white);
        padding: 24px 20px;
        font-weight: 600;
        font-size: 16px;
        text-align: left;
        letter-spacing: 0.5px;
    }

    .price-table td {
        padding: 20px;
        border-bottom: 1px solid #f1f5f9;
        font-size: 15px;
        transition: all 0.3s ease;
    }

    .price-table tbody tr:hover td {
        background: var(--primary-light);
        color: var(--primary-dark);
    }

    .price-table tbody tr:nth-child(even) td {
        background: #f8fafc;
    }

    /* Modern Accordion */
    .accordion {
        max-width: 800px;
        margin: 0 auto;
        background: var(--white);
        border-radius: 20px;
        box-shadow: var(--shadow);
        overflow: hidden;
    }

    .accordion-item {
        border-bottom: 1px solid #f1f5f9;
    }

    .accordion-item:last-child {
        border-bottom: none;
    }

    .accordion-button {
        width: 100%;
        padding: 28px 32px;
        background: var(--white);
        border: none;
        text-align: left;
        font-size: 18px;
        font-weight: 600;
        color: var(--dark);
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .accordion-button:hover {
        background: var(--primary-light);
        color: var(--primary-dark);
    }

    .accordion-button.active {
        background: var(--primary);
        color: var(--white);
    }

    .accordion-button::after {
        content: '+';
        font-size: 24px;
        font-weight: 300;
        transition: transform 0.3s ease;
    }

    .accordion-button.active::after {
        transform: rotate(45deg);
    }

    .accordion-content {
        max-height: 0;
        overflow: hidden;
        background: #f8fafc;
        transition: max-height 0.4s ease;
    }

    .accordion-content.active {
        max-height: 200px;
    }

    .accordion-content p {
        padding: 24px 32px;
        color: var(--gray);
        line-height: 1.7;
        font-size: 16px;
    }

    /* Responsive Design */
    @media (max-width: 968px) {
        .section-content {
            grid-template-columns: 1fr;
            gap: 40px;
        }
        
        .section-content.reverse {
            direction: ltr;
        }
        
        section {
            padding: 60px 0;
        }
        
        .section-header {
            margin-bottom: 50px;
        }
        
        .content-card {
            padding: 32px 24px;
        }
        
        .price-section {
            padding: 40px 24px;
        }
    }

    @media (max-width: 640px) {
        header {
            padding: 80px 20px 60px;
            min-height: 60vh;
        }
        
        section {
            padding: 40px 0;
        }
        
        .content-card {
            padding: 24px 20px;
        }
        
        .price-table th,
        .price-table td {
            padding: 16px 12px;
            font-size: 14px;
        }
        
        .accordion-button {
            padding: 20px 24px;
            font-size: 16px;
        }
        
        .accordion-content p {
            padding: 20px 24px;
            font-size: 15px;
        }
    }

    /* Animations */
    .fade-in {
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.8s ease;
    }

    .fade-in.animate {
        opacity: 1;
        transform: translateY(0);
    }

    /* Scroll Progress Bar */
    .scroll-progress {
        position: fixed;
        top: 0;
        left: 0;
        width: 0%;
        height: 3px;
        background: var(--gradient);
        z-index: 1000;
        transition: width 0.1s ease;
    }
</style>
</head>
<body>
    <div class="bg-decoration"></div>
    <div class="scroll-progress"></div>

    <header>
        <div class="header-content">
            <h1>Dịch Vụ Giúp Việc Theo Giờ</h1>
            <p>Giải pháp giúp việc linh hoạt, an toàn và tiện lợi cho gia đình bạn. Đội ngũ cộng tác viên chuyên nghiệp, tận tâm mang đến sự hài lòng và tin cậy.</p>
        </div>
    </header>

    <section id="giai-phap">
        <div class="container">
            <div class="section-header fade-in">
                <h2>Giải Pháp Giúp Việc Theo Giờ</h2>
                <p>Dịch vụ linh hoạt, tiết kiệm và hiệu quả cho mọi gia đình</p>
            </div>
            <div class="section-content fade-in">
                <div class="content-image">
                    <img src="https://images.unsplash.com/photo-1588776814546-f5f28982e185?auto=format&fit=crop&w=600&q=80" alt="Giúp việc theo giờ - giải pháp" />
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
                    <img src="https://images.unsplash.com/photo-1579671488015-5e94866f5554?auto=format&fit=crop&w=600&q=80" alt="Lý do chọn giúp việc theo giờ" />
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
                    <img src="https://images.unsplash.com/photo-1590080877777-1158b4790b49?auto=format&fit=crop&w=600&q=80" alt="Cộng tác viên giúp việc" />
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

    <script>
        // Scroll Progress Bar
        function updateScrollProgress() {
            const scrollTop = window.pageYOffset;
            const documentHeight = document.documentElement.scrollHeight - window.innerHeight;
            const scrollPercent = (scrollTop / documentHeight) * 100;
            document.querySelector('.scroll-progress').style.width = scrollPercent + '%';
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
        document.querySelectorAll('.fade-in').forEach(el => {
            observer.observe(el);
        });

        // Accordion functionality
        document.querySelectorAll('.accordion-button').forEach(button => {
            button.addEventListener('click', () => {
                const content = button.nextElementSibling;
                const isActive = button.classList.contains('active');

                // Close all accordion items
                document.querySelectorAll('.accordion-button').forEach(btn => {
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
            // Add a small delay to ensure smooth animations
            setTimeout(() => {
                document.querySelectorAll('.section-header, .section-content').forEach(el => {
                    observer.observe(el);
                });
            }, 100);
        });
    </script>
</body>
</html>

