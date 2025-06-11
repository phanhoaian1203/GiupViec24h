<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<script src="${pageContext.request.contextPath}/js/cscripts.js"></script>

<!-- Header -->
<header class="header" id="header">
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/" class="logo">
            <i class="fas fa-broom"></i>
            <span>Giúp Việc 24h</span>
        </a>
        
        <div class="nav-links" id="navLinks">
            <!-- Dịch vụ Dropdown -->
            <div class="dropdown" id="servicesDropdown">
                <button type="button" class="dropbtn">
                    Dịch vụ <i class="fas fa-chevron-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="${pageContext.request.contextPath}/view/jsp/home/hourly-service.jsp">
                        Giúp việc theo giờ
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/daily-service.jsp">
                        Giúp việc theo ngày
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/month-service.jsp">
                        Giúp việc theo tháng
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/sofa-tham-dem-rem.jsp">
                        Vệ sinh sofa, thảm, đệm, rèm
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/may-giat.jsp">
                        Vệ sinh máy giặt
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/special-service.jsp">
                        Dịch vụ đặc biệt
                    </a>
                </div>
            </div>
            
            <a href="${pageContext.request.contextPath}/view/jsp/home/benefits.jsp">
                <i class="fas fa-gift" style="margin-right: 5px;"></i>
                Lợi ích
            </a>
            
            <a href="${pageContext.request.contextPath}/view/jsp/home/about.jsp">
                <i class="fas fa-info-circle" style="margin-right: 5px;"></i>
                Về chúng tôi
            </a>
            
            <a href="${pageContext.request.contextPath}/view/jsp/home/contact.jsp">
                <i class="fas fa-phone" style="margin-right: 5px;"></i>
                Liên hệ
            </a>
            
            <% User user = (User) session.getAttribute("user"); %>
            <% if (user != null) { %>
                <!-- Hiển thị mục "Thuê" chỉ khi người dùng đã đăng nhập -->
                <a href="${pageContext.request.contextPath}/view/jsp/customer/hire.jsp">
                    <i class="fas fa-handshake" style="margin-right: 5px;"></i>
                    Thuê
                </a>
                
                <!-- Hồ sơ Dropdown -->
                <div class="profile-image-container">
                    <div class="profile-image">
                        <img src="${user.profilePicture != null ? user.profilePicture : pageContext.request.contextPath + '/images/profile-placeholder.jpg'}" alt="Profile">
                    </div>
                    <div class="profile-dropdown" id="profileDropdown">
                        <a href="${pageContext.request.contextPath}/view/jsp/home/profile.jsp">Hồ sơ</a>
                        <a href="${pageContext.request.contextPath}/view/jsp/customer/my-jobs.jsp">Công việc của tôi</a>
                        <a href="${pageContext.request.contextPath}/view/jsp/customer/payment-history.jsp">Lịch sử thanh toán</a>
                        <a href="${pageContext.request.contextPath}/view/jsp/customer/settings.jsp">Cài đặt</a>
                        <a href="${pageContext.request.contextPath}/LogoutServlet">Đăng xuất</a>
                    </div>
                </div>
            <% } else { %>
                <!-- Hiển thị Đăng nhập/Đăng ký khi chưa đăng nhập -->
                <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp">
                    <i class="fas fa-sign-in-alt" style="margin-right: 5px;"></i>
                    Đăng nhập
                </a>
                
                <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn">
                    <i class="fas fa-user-plus" style="margin-right: 5px;"></i>
                    Đăng ký
                </a>
            <% } %>
        </div>
        
        <!-- Hamburger Menu -->
        <div class="hamburger" id="hamburger">
            <div class="line1"></div>
            <div class="line2"></div>
            <div class="line3"></div>
        </div>
    </nav>
</header>

<script>
    // Toggle mobile menu
    const hamburger = document.getElementById('hamburger');
    const navLinks = document.getElementById('navLinks');
    const profileImage = document.querySelector('.profile-image');
    const profileDropdown = document.getElementById('profileDropdown');
    const servicesDropdown = document.getElementById('servicesDropdown');

    hamburger.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        hamburger.classList.toggle('active');
    });

    // Toggle profile dropdown
    if (profileImage) {
        profileImage.addEventListener('click', (e) => {
            e.stopPropagation();
            profileDropdown.classList.toggle('active');
        });
    }

    // Toggle services dropdown
    servicesDropdown.addEventListener('click', (e) => {
        e.stopPropagation();
        servicesDropdown.querySelector('.dropdown-content').classList.toggle('active');
    });

    // Close dropdowns when clicking outside
    document.addEventListener('click', (e) => {
        if (profileImage && !profileImage.contains(e.target) && !profileDropdown.contains(e.target)) {
            profileDropdown.classList.remove('active');
        }
        if (!servicesDropdown.contains(e.target)) {
            servicesDropdown.querySelector('.dropdown-content').classList.remove('active');
        }
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
</script>