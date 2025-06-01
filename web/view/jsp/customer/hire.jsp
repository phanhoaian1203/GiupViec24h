<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Đặt Nhân Viên Dọn Dẹp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1AB394;
            --primary-dark: #18a085;
            --primary-light: #e8f8f5;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --gray: #e0e0e0;
            --text-dark: #333333;
            -- accent: #FF7043;
        }

        html {
            scroll-behavior: smooth;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', 'Roboto', sans-serif;
        }

        body {
            background-color: var(--white);
            color: var(--text-dark);
            line-height: 1.7;
        }

        /* Header Styles */
        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: var(--white);
            padding: 1.2rem 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: all 0.4s ease;
        }

        .header.scrolled {
            padding: 0.8rem 0;
            background: rgba(26, 179, 148, 0.95);
            backdrop-filter: blur(10px);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.8rem;
            font-weight: 700;
        }

        .logo i {
            font-size: 2rem;
            transition: transform 0.3s ease;
        }

        .logo:hover i {
            transform: rotate(20deg);
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            padding: 0.5rem 0;
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--white);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .profile-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #fff;
            cursor: pointer;
            overflow: hidden;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-image-container {
            position: relative;
        }

        .profile-dropdown {
            position: absolute;
            top: 100%;
            right: 2rem;
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            min-width: 200px;
            display: none;
            z-index: 1001;
            margin-top: 5px;
        }

        .profile-dropdown.active {
            display: block;
        }

        .profile-dropdown a {
            display: block;
            padding: 0.8rem 1.5rem;
            color: var(--text-dark);
            text-decoration: none;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .profile-dropdown a:hover {
            background-color: var(--gray-light);
            color: var(--primary-dark);
        }

        .hamburger {
            display: none;
            cursor: pointer;
            z-index: 1001;
        }

        .hamburger div {
            width: 25px;
            height: 3px;
            background-color: var(--white);
            margin: 5px;
            transition: all 0.3s ease;
        }

        /* Booking Section with Sidebar */
        .booking-section {
            padding: 6rem 0 2rem;
            min-height: calc(100vh - 200px);
            padding-top: 100px;
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            gap: 2rem;
            padding-left: 2rem;
            padding-right: 2rem;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: var(--gray-light);
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 100px;
            height: fit-content;
        }

        .sidebar-title {
            font-size: 1.5rem;
            color: var(--primary-dark);
            margin-bottom: 1.5rem;
            font-weight: 600;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .sidebar-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--primary-color);
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 1rem;
        }

        .sidebar-menu a {
            color: var(--text-dark);
            text-decoration: none;
            font-size: 1rem;
            font-weight: 500;
            display: block;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar-menu a:hover,
        .sidebar-menu a.active {
            background-color: var(--primary-color);
            color: var(--white);
        }

        /* Main Content */
        .main-content {
            flex: 1;
        }

        .booking-title {
            text-align: center;
            margin-bottom: 3.5rem;
            color: var(--primary-dark);
            font-size: 2.5rem;
            font-weight: 700;
            position: relative;
            padding-bottom: 1.2rem;
        }

        .booking-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent));
            border-radius: 2px;
        }

        .helper-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .helper-card {
            background-color: var(--white);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .helper-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .helper-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background-color: #f0f0f0;
        }

        .helper-info {
            padding: 1.5rem;
        }

        .helper-name {
            font-size: 1.3rem;
            color: var(--primary-dark);
            margin-bottom: 0.5rem;
        }

        .helper-location {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 1rem;
        }

        .helper-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 0.9rem;
            color: #666;
        }

        .helper-price {
            font-weight: 600;
            color: var(--primary-color);
        }

        .helper-rating {
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .helper-rating i {
            color: #ffca28;
            font-size: 0.9rem;
        }

        .helper-discount {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: var(--accent);
            color: var(--white);
            padding: 0.3rem 0.8rem;
            border-radius: 12px;
            font-size: 0.9rem;
        }

        .btn-book {
            display: inline-block;
            padding: 0.6rem 1.2rem;
            background-color: var(--primary-color);
            color: var(--white);
            text-decoration: none;
            border-radius: 20px;
            font-weight: 500;
            margin-top: 1rem;
            transition: background-color 0.3s ease;
        }

        .btn-book:hover {
            background-color: var(--primary-dark);
        }

        /* Footer Styles */
        .footer {
            background-color: var(--text-dark);
            color: var(--white);
            padding: 5rem 0 2rem;
            position: relative;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark), var(--primary-color));
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 3rem;
        }

        .footer-logo {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .footer-logo i {
            color: var(--primary-color);
        }

        .footer-description {
            margin-bottom: 2rem;
            opacity: 0.9;
            font-size: 1rem;
            line-height: 1.7;
        }

        .footer-social {
            display: flex;
            gap: 1.2rem;
        }

        .footer-social a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            background: rgba(255, 255, 255, 0.1);
            color: var(--white);
            border-radius: 50%;
            transition: all 0.3s ease;
            font-size: 1.2rem;
        }

        .footer-social a:hover {
            background-color: var(--primary-color);
            transform: translateY(-5px);
        }

        .footer-title {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 0.8rem;
        }

        .footer-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background-color: var(--primary-color);
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 1rem;
        }

        .footer-links a {
            color: var(--white);
            opacity: 0.9;
            text-decoration: none;
            font-size: 1rem;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .footer-links a:hover {
            opacity: 1;
            color: var(--primary-color);
            transform: translateX(5px);
        }

        .footer-contact li {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            margin-bottom: 1.5rem;
            font-size: 1rem;
        }

        .footer-contact i {
            color: var(--primary-color);
            margin-top: 5px;
        }

        .copyright {
            text-align: center;
            padding-top: 3rem;
            margin-top: 3rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.9rem;
            opacity: 0.8;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .booking-section {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                position: static;
            }

            .sidebar-menu {
                display: flex;
                flex-wrap: wrap;
                gap: 1rem;
            }

            .sidebar-menu li {
                margin-bottom: 0;
            }

            .sidebar-menu a {
                padding: 0.5rem;
            }
        }

        @media (max-width: 768px) {
            .nav-links {
                position: fixed;
                right: -100%;
                top: 0;
                width: 70%;
                height: 100vh;
                flex-direction: column;
                align-items: center;
                padding-top: 120px;
                background: var(--primary-dark);
                transition: right 0.5s ease;
                box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
            }

            .nav-links.active {
                right: 0;
            }

            .nav-links a {
                margin: 0.5rem 0;
                font-size: 1.2rem;
            }

            .profile-image-container {
                margin: 0.5rem 0;
            }

            .profile-dropdown {
                right: auto;
                left: 50%;
                transform: translateX(-50%);
                width: 70%;
            }

            .helper-list {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .booking-title {
                font-size: 2rem;
            }

            .helper-card {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header" id="header">
        <nav class="navbar">
            <div class="logo">
                <i class="fas fa-broom"></i>
                <span>Giúp Việc 24h</span>
            </div>
            <div class="nav-links" id="navLinks">
                <a href="service.jsp">Dịch vụ</a>
                <a href="#benefits">Lợi ích</a>
                <a href="#about">Về chúng tôi</a>
                <a href="#contact">Liên hệ</a>
                <a href="hire.jsp">Thuê</a>
                <div class="profile-image-container">
                    <div class="profile-image">
                        <img src="path/to/profile-image.jpg" alt="Profile">
                    </div>
                    <div class="profile-dropdown" id="profileDropdown">
                        <a href="profile.jsp">Profile</a>
                        <a href="my-jobs.jsp">My Jobs</a>
                        <a href="payment-history.jsp">Payment History</a>
                        <a href="settings.jsp">Settings</a>
                        <a href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>
            <div class="hamburger" id="hamburger">
                <div class="line1"></div>
                <div class="line2"></div>
                <div class="line3"></div>
            </div>
        </nav>
    </header>

    <!-- Booking Section with Sidebar -->
    <section class="booking-section">
        <!-- Sidebar -->
        <div class="sidebar">
            <h3 class="sidebar-title">Chọn Dịch Vụ</h3>
            <ul class="sidebar-menu">
                <li><a href="#" class="active">Giúp việc theo giờ</a></li>
                <li><a href="#">Vệ sinh sofa thảm</a></li>
                <li><a href="#">Giúp việc văn phòng</a></li>
                <li><a href="#">Dịch vụ đặc biệt</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <h2 class="booking-title">Nhân Viên Dọn Dẹp Có Sẵn</h2>
            <div class="helper-list">
                <div class="helper-card">
                    <img src="/api/placeholder/300/200" alt="Helper 1" class="helper-image">
                    <div class="helper-info">
                        <div class="helper-name">Nguyễn Thị Lan</div>
                        <div class="helper-location">Quận 1, TP. Hồ Chí Minh</div>
                        <div class="helper-details">
                            <span class="helper-price">150k/giờ</span>
                            <div class="helper-rating">
                                <i class="fas fa-star"></i> 4.8 <span>(25 đánh giá)</span>
                            </div>
                        </div>
                        <a href="#" class="btn-book">Xem chi tiết</a>
                    </div>
                    <div class="helper-discount">Giảm 10%</div>
                </div>
                <div class="helper-card">
                    <img src="/api/placeholder/300/200" alt="Helper 2" class="helper-image">
                    <div class="helper-info">
                        <div class="helper-name">Trần Văn Hùng</div>
                        <div class="helper-location">Quận 7, TP. Hồ Chí Minh</div>
                        <div class="helper-details">
                            <span class="helper-price">140k/giờ</span>
                            <div class="helper-rating">
                                <i class="fas fa-star"></i> 4.5 <span>(18 đánh giá)</span>
                            </div>
                        </div>
                        <a href="#" class="btn-book">Xem chi tiết</a>
                    </div>
                </div>
                <div class="helper-card">
                    <img src="/api/placeholder/300/200" alt="Helper 3" class="helper-image">
                    <div class="helper-info">
                        <div class="helper-name">Lê Thị Mai</div>
                        <div class="helper-location">Quận 3, TP. Hồ Chí Minh</div>
                        <div class="helper-details">
                            <span class="helper-price">160k/giờ</span>
                            <div class="helper-rating">
                                <i class="fas fa-star"></i> 4.9 <span>(30 đánh giá)</span>
                            </div>
                        </div>
                        <a href="#" class="btn-book">Xem chi tiết</a>
                    </div>
                    <div class="helper-discount">Giảm 15%</div>
                </div>
                <div class="helper-card">
                    <img src="/api/placeholder/300/200" alt="Helper 4" class="helper-image">
                    <div class="helper-info">
                        <div class="helper-name">Phạm Văn Nam</div>
                        <div class="helper-location">Quận 10, TP. Hồ Chí Minh</div>
                        <div class="helper-details">
                            <span class="helper-price">145k/giờ</span>
                            <div class="helper-rating">
                                <i class="fas fa-star"></i> 4.6 <span>(22 đánh giá)</span>
                            </div>
                        </div>
                        <a href="#" class="btn-book">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div>
                <div class="footer-logo">
                    <i class="fas fa-broom"></i>
                    <span>Giúp Việc 24h</span>
                </div>
                <p class="footer-description">Dịch vụ giúp việc chuyên nghiệp, tin cậy với đội ngũ nhân viên được đào tạo bài bản và kiểm tra lý lịch kỹ lưỡng.</p>
                <div class="footer-social">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div>
                <h3 class="footer-title">Liên kết nhanh</h3>
                <ul class="footer-links">
                    <li><a href="#services">Dịch vụ</a></li>
                    <li><a href="#benefits">Lợi ích</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/jsp/home/about.jsp">Về chúng tôi</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="faq.jsp">Câu hỏi thường gặp</a></li>
                </ul>
            </div>
            <div>
                <h3 class="footer-title">Dịch vụ</h3>
                <ul class="footer-links">
                    <li><a href="hourly-service.jsp">Giúp việc theo giờ</a></li>
                    <li><a href="cleaning-service.jsp">Vệ sinh sofa, thảm</a></li>
                    <li><a href="office-service.jsp">Giúp việc văn phòng</a></li>
                    <li><a href="special-service.jsp">Dịch vụ đặc biệt</a></li>
                </ul>
            </div>
            <div>
                <h3 class="footer-title">Liên hệ</h3>
                <ul class="footer-contact footer-links">
                    <li>
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Khu Đô Thị FPT, Phường Hòa Hải, Quận Ngũ Hành Sơn, TP. Đà Nẵng</span>
                    </li>
                    <li>
                        <i class="fas fa-phone-alt"></i>
                        <span>+84 123 456 789</span>
                    </li>
                    <li>
                        <i class="fas fa-envelope"></i>
                        <span>info@giupviec24h.com</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            <p>© 2025 Giúp Việc 24h. Tất cả quyền được bảo lưu.</p>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
    <script>
        // Toggle mobile menu
        const hamburger = document.getElementById('hamburger');
        const navLinks = document.getElementById('navLinks');
        const profileImage = document.querySelector('.profile-image');
        const profileDropdown = document.getElementById('profileDropdown');

        hamburger.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            hamburger.classList.toggle('active');
        });

        // Smooth scroll for anchor links
        document.querySelectorAll('.nav-links a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
                navLinks.classList.remove('active');
            });
        });

        // Header scroll effect
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                document.querySelector('.header').classList.add('scrolled');
            } else {
                document.querySelector('.header').classList.remove('scrolled');
            }
        });

        // Sidebar menu interaction
        document.querySelectorAll('.sidebar-menu a').forEach(link => {
            link.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelectorAll('.sidebar-menu a').forEach(item => item.classList.remove('active'));
                this.classList.add('active');
                // Add logic here to filter helpers based on the selected service
            });
        });

        // Profile dropdown toggle
        profileImage.addEventListener('click', (e) => {
            e.stopPropagation();
            profileDropdown.classList.toggle('active');
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', (e) => {
            if (!profileImage.contains(e.target) && !profileDropdown.contains(e.target)) {
                profileDropdown.classList.remove('active');
            }
        });
    </script>
</body>
</html>
