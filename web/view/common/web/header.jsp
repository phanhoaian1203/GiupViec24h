<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
<script src="${pageContext.request.contextPath}/js/cscripts.js"></script>

<style>
/* Clean Header Styles - Same as before */
.header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.header.scrolled {
    background: rgba(255, 255, 255, 0.98);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    max-width: 1200px;
    margin: 0 auto;
}

/* Logo */
.logo {
    display: flex;
    align-items: center;
    text-decoration: none;
    color: #2c3e50;
    font-size: 1.4rem;
    font-weight: 700;
    transition: color 0.3s ease;
}

.logo:hover {
    color: #b8a827;
}

.logo i {
    margin-right: 0.5rem;
    font-size: 1.6rem;
    color: #e6d55a;
}

/* Navigation Links */
.nav-links {
    display: flex;
    align-items: center;
    gap: 2rem;
    list-style: none;
    margin: 0;
    padding: 0;
}

.nav-links > a, .nav-links .dropdown .dropbtn {
    color: #2c3e50;
    text-decoration: none;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.3s ease;
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 0.95rem;
    display: flex;
    align-items: center;
}

.nav-links > a:hover, .nav-links .dropdown .dropbtn:hover {
    background: rgba(184, 168, 39, 0.15);
    color: #b8a827;
}

.nav-links > a i {
    margin-right: 0.4rem;
    font-size: 0.9rem;
}

/* Dropdown Styles */
.dropdown {
    position: relative;
}

.dropdown .dropbtn {
    display: flex;
    align-items: center;
    gap: 0.3rem;
}

.dropdown .dropbtn i:last-child {
    transition: transform 0.3s ease;
}

.dropdown:hover .dropbtn i:last-child {
    transform: rotate(180deg);
}

.dropdown-content {
    position: absolute;
    top: 100%;
    left: 0;
    background: white;
    min-width: 250px;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    opacity: 0;
    visibility: hidden;
    transform: translateY(-10px);
    transition: all 0.3s ease;
    border: 1px solid rgba(0, 0, 0, 0.1);
    overflow: hidden;
    z-index: 1001;
    margin-top: 0.5rem;
}

.dropdown:hover .dropdown-content {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.dropdown-content a {
    display: flex;
    align-items: center;
    padding: 0.8rem 1.2rem;
    color: #2c3e50;
    text-decoration: none;
    transition: all 0.3s ease;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.dropdown-content a:last-child {
    border-bottom: none;
}

.dropdown-content a:hover {
    background: #f5f0d6;
    color: #b8a827;
    padding-left: 1.5rem;
}

.dropdown-content a i {
    margin-right: 0.5rem;
    font-size: 0.9rem;
}

/* Profile Section */
.profile-icon {
    display: flex;
    align-items: center;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    text-decoration: none;
    color: #2c3e50;
    font-weight: 500;
    transition: all 0.3s ease;
    cursor: pointer;
    position: relative;
}

.profile-icon:hover {
    background: rgba(184, 168, 39, 0.15);
    color: #b8a827;
}

.profile-icon i {
    margin-right: 0.4rem;
    font-size: 1.2rem;
}

.profile-icon:hover .profile-dropdown {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.profile-dropdown {
    position: absolute;
    top: 100%;
    right: 0;
    background: white;
    min-width: 180px;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    opacity: 0;
    visibility: hidden;
    transform: translateY(-10px);
    transition: all 0.3s ease;
    border: 1px solid rgba(0, 0, 0, 0.1);
    overflow: hidden;
    z-index: 1001;
    margin-top: 0.5rem;
}

.profile-dropdown a {
    display: flex;
    align-items: center;
    padding: 0.8rem 1.2rem;
    color: #2c3e50;
    text-decoration: none;
    transition: all 0.3s ease;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.profile-dropdown a:last-child {
    border-bottom: none;
}

.profile-dropdown a:hover {
    background: #f5f0d6;
    color: #b8a827;
    padding-left: 1.5rem;
}

.profile-dropdown a i {
    margin-right: 0.5rem;
    font-size: 0.9rem;
}

/* Button Styles */
.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0.6rem 1.2rem;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
    font-size: 0.95rem;
    min-width: 120px;
    background: linear-gradient(135deg, #e6d55a, #d4c245);
    color: #5a4f0f !important;
    border: 2px solid #e6d55a;
    box-shadow: 0 4px 15px rgba(230, 213, 90, 0.25);
}

.btn:hover {
    background: linear-gradient(135deg, #b8a827, #a39633);
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(184, 168, 39, 0.35);
    color: #5a4f0f !important;
    border-color: #b8a827;
}

.btn:active {
    transform: translateY(0);
    box-shadow: 0 4px 15px rgba(184, 168, 39, 0.4);
}

/* Hamburger Menu */
.hamburger {
    display: none;
    flex-direction: column;
    cursor: pointer;
    padding: 0.5rem;
}

.hamburger div {
    width: 25px;
    height: 3px;
    background: #2c3e50;
    margin: 3px 0;
    transition: all 0.3s ease;
    border-radius: 2px;
}

.hamburger.active .line1 {
    transform: rotate(-45deg) translate(-5px, 6px);
}

.hamburger.active .line2 {
    opacity: 0;
}

.hamburger.active .line3 {
    transform: rotate(45deg) translate(-5px, -6px);
}

/* Mobile Styles */
@media (max-width: 768px) {
    .navbar {
        padding: 1rem;
    }
    
    .hamburger {
        display: flex;
    }
    
    .nav-links {
        position: fixed;
        top: 70px;
        left: 0;
        right: 0;
        background: white;
        flex-direction: column;
        padding: 2rem 1rem;
        gap: 1rem;
        transform: translateY(-100%);
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        border-top: 1px solid rgba(0, 0, 0, 0.1);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }
    
    .nav-links.active {
        transform: translateY(0);
        opacity: 1;
        visibility: visible;
    }
    
    .nav-links > a, .nav-links .dropdown .dropbtn {
        width: 100%;
        justify-content: center;
        padding: 1rem;
        border-radius: 8px;
        background: #f8f9fa;
        margin: 0.2rem 0;
    }
    
    .dropdown-content {
        position: static;
        opacity: 1;
        visibility: visible;
        transform: none;
        box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 0.5rem;
        display: none;
    }
    
    .dropdown.active .dropdown-content {
        display: block;
    }
    
    .profile-icon {
        width: 100%;
        justify-content: center;
        padding: 1rem;
        background: #f8f9fa;
        margin: 0.2rem 0;
    }
    
    .profile-icon .profile-dropdown {
        position: static;
        opacity: 1;
        visibility: visible;
        transform: none;
        box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 0.5rem;
        display: none;
    }
    
    .profile-icon:hover .profile-dropdown {
        display: block;
    }
}
</style>

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
                    Dịch vụ 
                    <i class="fas fa-chevron-down"></i>
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
                    <a href="${pageContext.request.contextPath}/view/jsp/home/elderly-care.jsp">
                        Chăm sóc người già
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/child-care.jsp">
                        Chăm sóc trẻ em
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/patient-care.jsp">
                        Chăm sóc người bệnh
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/sofa-tham-dem-rem.jsp">
                        Vệ sinh thảm, đệm, rèm và ghế sofa
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/may-lanh.jsp">
                        Vệ sinh máy lạnh
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/may-giat.jsp">
                        Vệ sinh máy giặt
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/general-cleaning.jsp">
                        Tổng vệ sinh
                    </a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/nau-an.jsp">
                        Nấu ăn
                    </a>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/view/jsp/home/about.jsp">
                <i class="fas fa-info-circle"></i>
                Về chúng tôi
            </a>
            
            <a href="${pageContext.request.contextPath}/view/jsp/home/contact.jsp">
                <i class="fas fa-phone"></i>
                Liên hệ
            </a>
            
            <%-- FIX: Sử dụng tên biến khác để tránh conflict --%>
            <% User currentUser = (User) session.getAttribute("user"); %>
            <% if (currentUser != null) { %>
                <a href="${pageContext.request.contextPath}/hire">
                    <i class="fas fa-handshake"></i>
                    Thuê
                </a>
                
                <div class="profile-icon">
                    <i class="fas fa-user"></i>
                    <div class="profile-dropdown">
                        <a href="${pageContext.request.contextPath}/view/jsp/customer/customer-profile.jsp">
                            <i class="fas fa-user"></i> Hồ sơ
                        </a>
                        <a href="${pageContext.request.contextPath}/view/jsp/customer/payment-history.jsp">
                            <i class="fas fa-history"></i> Lịch sử thanh toán
                        </a>
                        <a href="${pageContext.request.contextPath}/wallet">
                            <i class="fas fa-wallet"></i>
                            Ví của tôi
                        </a>
                        <a href="${pageContext.request.contextPath}/view/jsp/customer/settings.jsp">
                            <i class="fas fa-cog"></i> Cài đặt
                        </a>
                        <a href="${pageContext.request.contextPath}/LogoutServlet">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </div>
                </div>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp">
                    <i class="fas fa-sign-in-alt"></i>
                    Đăng nhập
                </a>
                
                <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn">
                    <i class="fas fa-user-plus"></i>
                    Đăng ký
                </a>
            <% } %>
        </div>
        
        <div class="hamburger" id="hamburger">
            <div class="line1"></div>
            <div class="line2"></div>
            <div class="line3"></div>
        </div>
    </nav>
</header>

<script>
    const hamburger = document.getElementById('hamburger');
    const navLinks = document.getElementById('navLinks');
    const servicesDropdown = document.getElementById('servicesDropdown');

    hamburger.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        hamburger.classList.toggle('active');
    });

    servicesDropdown.addEventListener('click', (e) => {
        e.stopPropagation();
        servicesDropdown.classList.toggle('active');
    });

    document.addEventListener('click', (e) => {
        if (!servicesDropdown.contains(e.target)) {
            servicesDropdown.classList.remove('active');
        }
    });

    document.querySelectorAll('.nav-links a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
            navLinks.classList.remove('active');
            hamburger.classList.remove('active');
        });
    });

    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            document.querySelector('.header').classList.add('scrolled');
        } else {
            document.querySelector('.header').classList.remove('scrolled');
        }
    });
</script>