<%@ page contentType="text/html; charset=UTF-8" %>
<!-- Header -->
<header class="header" id="header">
    <nav class="navbar">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/">
                <i class="fas fa-broom"></i>
                <span>Giúp Việc 24h</span>
            </a>
        </div>
        <div class="nav-links" id="navLinks">
            <div class="dropdown">
                <a href="#services" class="dropbtn">Dịch vụ <i class="fas fa-chevron-down"></i></a>
                <div class="dropdown-content">
                    <a href="${pageContext.request.contextPath}/view/jsp/home/hourly-service.jsp">Thuê giúp việc theo giờ</a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/day-service.jsp">Thuê giúp việc theo ngày</a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/month-service.jsp">Thuê giúp việc theo tháng</a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/sofa-service.jsp">Vệ sinh sofa, thảm</a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/mayGiat-service.jsp">Vệ sinh máy giặt</a>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/special-service.jsp">Dịch vụ đặc biệt</a>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/view/jsp/home/benefits.jsp">Lợi ích</a>
            <a href="${pageContext.request.contextPath}/view/jsp/home/about.jsp">Về chúng tôi</a>
            <a href="#footer">Liên hệ</a>
            <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp">Đăng nhập</a>
            <a href="${pageContext.request.contextPath}/view/jsp/home/signup.jsp" class="btn">Đăng ký</a>
        </div>
        <div class="hamburger" id="hamburger">
            <div class="line1"></div>
            <div class="line2"></div>
            <div class="line3"></div>
        </div>
    </nav>
</header>