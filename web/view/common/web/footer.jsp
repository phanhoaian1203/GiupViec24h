<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
/* Enhanced Footer Styles */
.footer {
    background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
    color: white;
    position: relative;
    overflow: hidden;
    width: 100%;
    clear: both; /* Ensure footer stays at the bottom */
}

.footer::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: 
        radial-gradient(circle at 20% 80%, rgba(230, 213, 90, 0.05) 0%, transparent 50%),
        radial-gradient(circle at 80% 20%, rgba(230, 213, 90, 0.03) 0%, transparent 50%);
    pointer-events: none;
}

.footer-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 3rem 2rem 2rem;
    display: grid;
    grid-template-columns: 2fr 1fr 1fr 1.5fr;
    gap: 3rem;
    position: relative;
    z-index: 1;
}

/* Logo Section */
.footer-logo {
    display: flex;
    align-items: center;
    font-size: 1.5rem;
    font-weight: 800;
    margin-bottom: 1.5rem;
    color: white;
}

.footer-logo i {
    margin-right: 0.75rem;
    font-size: 1.8rem;
    color: #e6d55a;
    padding: 0.5rem;
    background: rgba(230, 213, 90, 0.1);
    border-radius: 12px;
    border: 2px solid rgba(230, 213, 90, 0.2);
}

.footer-description {
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin-bottom: 2rem;
    font-size: 0.95rem;
}

/* Social Media */
.footer-social {
    display: flex;
    gap: 1rem;
}

.footer-social a {
    width: 45px;
    height: 45px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
}

.footer-social a:hover {
    background: #e6d55a;
    color: #2d3748;
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(230, 213, 90, 0.3);
    border-color: #e6d55a;
}

/* Footer Titles */
.footer-title {
    font-size: 1.2rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    color: white;
    position: relative;
    padding-bottom: 0.5rem;
}

.footer-title::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 30px;
    height: 2px;
    background: #e6d55a;
    border-radius: 1px;
}

/* Footer Links */
.footer-links {
    list-style: none;
    padding: 0;
    margin: 0;
}

.footer-links li {
    margin-bottom: 0.75rem;
}

.footer-links a {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: all 0.3s ease;
    font-size: 0.9rem;
    display: inline-flex;
    align-items: center;
    padding: 0.25rem 0;
    position: relative;
}

.footer-links a::before {
    content: '';
    position: absolute;
    left: -15px;
    width: 4px;
    height: 4px;
    background: #e6d55a;
    border-radius: 50%;
    opacity: 0;
    transition: all 0.3s ease;
}

.footer-links a:hover {
    color: #e6d55a;
    padding-left: 15px;
}

.footer-links a:hover::before {
    opacity: 1;
}

/* Contact Section */
.footer-contact {
    list-style: none;
    padding: 0;
    margin: 0;
}

.footer-contact li {
    display: flex;
    align-items: flex-start;
    margin-bottom: 1.25rem;
    font-size: 0.9rem;
}

.footer-contact i {
    width: 20px;
    color: #e6d55a;
    margin-right: 1rem;
    margin-top: 0.2rem;
    flex-shrink: 0;
}

.footer-contact span {
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.5;
}

.footer-contact a {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: all 0.3s ease;
}

.footer-contact a:hover {
    color: #e6d55a;
}

/* Copyright */
.copyright {
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    padding: 1.5rem 2rem;
    text-align: center;
    position: relative;
    z-index: 1;
    background: inherit; /* Ensure copyright inherits footer background */
}

.copyright p {
    color: rgba(255, 255, 255, 0.6);
    margin: 0;
    font-size: 0.9rem;
}

/* Newsletter Section */
.footer-newsletter {
    margin-top: 1rem;
}

.newsletter-form {
    display: flex;
    margin-top: 1rem;
    gap: 0.5rem;
}

.newsletter-input {
    flex: 1;
    padding: 0.75rem 1rem;
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.1);
    color: white;
    font-size: 0.9rem;
    backdrop-filter: blur(10px);
}

.newsletter-input::placeholder {
    color: rgba(255, 255, 255, 0.6);
}

.newsletter-input:focus {
    outline: none;
    border-color: #e6d55a;
    background: rgba(255, 255, 255, 0.15);
}

.newsletter-btn {
    padding: 0.75rem 1.5rem;
    background: linear-gradient(135deg, #e6d55a, #d4c245);
    color: #2d3748;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    font-size: 0.9rem;
}

.newsletter-btn:hover {
    background: linear-gradient(135deg, #d4c245, #c2b23d);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(230, 213, 90, 0.3);
}

/* Trust Badges */
.trust-badges {
    display: flex;
    gap: 1rem;
    margin-top: 1.5rem;
    flex-wrap: wrap;
}

.trust-badge {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    background: rgba(255, 255, 255, 0.05);
    padding: 0.5rem 1rem;
    border-radius: 8px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    font-size: 0.8rem;
    color: rgba(255, 255, 255, 0.8);
}

.trust-badge i {
    color: #e6d55a;
}

/* Mobile Responsive */
@media (max-width: 768px) {
    .footer-container {
        grid-template-columns: 1fr;
        gap: 2rem;
        padding: 2rem 1rem 1.5rem;
    }
    
    .footer-social {
        justify-content: center;
    }
    
    .newsletter-form {
        flex-direction: column;
    }
    
    .newsletter-btn {
        align-self: flex-start;
    }
    
    .trust-badges {
        justify-content: center;
    }
    
    .copyright {
        padding: 1rem;
    }
}

@media (max-width: 480px) {
    .footer-container {
        padding: 1.5rem 1rem;
    }
    
    .footer-logo {
        justify-content: center;
        text-align: center;
    }
    
    .footer-description {
        text-align: center;
    }
}

/* Scroll to top button */
.scroll-top {
    position: fixed;
    bottom: 2rem;
    right: 2rem;
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #e6d55a, #d4c245);
    color: #2d3748;
    border: none;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    opacity: 0;
    visibility: hidden;
    transition: all 0.3s ease;
    box-shadow: 0 4px 20px rgba(230, 213, 90, 0.3);
    z-index: 1000;
}

.scroll-top.visible {
    opacity: 1;
    visibility: visible;
}

.scroll-top:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 30px rgba(230, 213, 90, 0.4);
}

/* Animation for footer elements */
.footer-animate {
    opacity: 0;
    transform: translateY(20px);
    transition: all 0.6s ease;
}

.footer-animate.visible {
    opacity: 1;
    transform: translateY(0);
}
</style>

<!-- Footer -->
<footer class="footer" id="footer">
    <div class="footer-container">
        <div class="footer-animate">
            <div class="footer-logo">
                <i class="fas fa-broom"></i>
                <span>Giúp Việc 24h</span>
            </div>
            <p class="footer-description">
                Dịch vụ giúp việc chuyên nghiệp, đáng tin cậy tại Đà Nẵng. Đội ngũ được đào tạo bài bản, kiểm tra lý lịch kỹ lưỡng, mang đến sự an tâm cho mọi gia đình.
            </p>
            <div class="footer-social">
                <a href="https://facebook.com/giupviec24h" aria-label="Facebook" target="_blank">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="https://twitter.com/giupviec24h" aria-label="Twitter" target="_blank">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="https://instagram.com/giupviec24h" aria-label="Instagram" target="_blank">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="https://youtube.com/giupviec24h" aria-label="YouTube" target="_blank">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
            <div class="trust-badges">
                <div class="trust-badge">
                    <i class="fas fa-shield-check"></i>
                    <span>Được chứng nhận</span>
                </div>
                <div class="trust-badge">
                    <i class="fas fa-award"></i>
                    <span>Chất lượng cao</span>
                </div>
            </div>
        </div>
        
        <div class="footer-animate">
            <h3 class="footer-title">Liên kết nhanh</h3>
            <ul class="footer-links">
                <li><a href="#services">Dịch vụ</a></li>           
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/about.jsp">Về chúng tôi</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/blog.jsp">Blog</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/faq.jsp">Câu hỏi thường gặp</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/contact.jsp">Liên hệ</a></li>
            </ul>
        </div>
        
        <div class="footer-animate">
            <h3 class="footer-title">Dịch vụ</h3>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/hourly-service.jsp">Giúp việc theo giờ</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/daily-service.jsp">Giúp việc theo ngày</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/month-service.jsp">Giúp việc theo tháng</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/general-cleaning.jsp">Tổng vệ sinh</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/sofa-tham-dem-rem.jsp">Vệ sinh thảm, ghế sofa</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/may-lanh.jsp">Vệ sinh máy lạnh</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/may-giat.jsp">Vệ sinh máy giặt</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/elderly-care.jsp">Chăm sóc người già</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/child-care.jsp">Chăm sóc trẻ em</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/patient-care.jsp">Chăm sóc người bệnh</a></li>
                <li><a href="${pageContext.request.contextPath}/view/jsp/home/nau-an.jsp">Nấu ăn</a></li>
            </ul>
        </div>
        
        <div class="footer-animate">
            <h3 class="footer-title">Liên hệ & Đăng ký nhận tin</h3>
            <ul class="footer-contact">
                <li>
                    <i class="fas fa-map-marker-alt"></i>
                    <span>Khu Đô Thị FPT, Phường Hòa Hải, Quận Ngũ Hành Sơn, TP. Đà Nẵng</span>
                </li>
                <li>
                    <i class="fas fa-phone-alt"></i>
                    <span><a href="tel:+84123456789">+84 123 456 789</a></span>
                </li>
                <li>
                    <i class="fas fa-envelope"></i>
                    <span><a href="mailto:info@giupviec24h.com">info@giupviec24h.com</a></span>
                </li>
            </ul>
            
            <div class="footer-newsletter">
                <p style="color: rgba(255, 255, 255, 0.8); margin-bottom: 0.5rem; font-size: 0.9rem;">
                    Đăng ký nhận ưu đãi và tin tức mới nhất
                </p>
                <form class="newsletter-form" onsubmit="handleNewsletter(event)">
                    <input 
                        type="email" 
                        class="newsletter-input" 
                        placeholder="Nhập email của bạn..."
                        required
                    >
                    <button type="submit" class="newsletter-btn">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
    
    <div class="copyright">
        <p>© 2025 Giúp Việc 24h. Tất cả quyền được bảo lưu. | 
           <a href="${pageContext.request.contextPath}/view/jsp/home/privacy.jsp" style="color: rgba(255, 255, 255, 0.6); text-decoration: none;">Chính sách bảo mật</a> | 
           <a href="${pageContext.request.contextPath}/view/jsp/home/terms.jsp" style="color: rgba(255, 255, 255, 0.6); text-decoration: none;">Điều khoản sử dụng</a>
        </p>
    </div>
</footer>

<!-- Scroll to top button -->
<button class="scroll-top" id="scrollTop" onclick="scrollToTop()" aria-label="Scroll to top">
    <i class="fas fa-chevron-up"></i>
</button>

<script>
// Footer animations and interactions
document.addEventListener('DOMContentLoaded', function() {
    // Animate footer elements on scroll
    const footerAnimateElements = document.querySelectorAll('.footer-animate');
    const scrollTopBtn = document.getElementById('scrollTop');
    
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, observerOptions);

    footerAnimateElements.forEach(element => {
        observer.observe(element);
    });

    // Scroll to top button visibility
    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            scrollTopBtn.classList.add('visible');
        } else {
            scrollTopBtn.classList.remove('visible');
        }
    });
});

// Scroll to top function
function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

// Newsletter form handler
function handleNewsletter(event) {
    event.preventDefault();
    const email = event.target.querySelector('.newsletter-input').value;
    
    // Show success message
    const btn = event.target.querySelector('.newsletter-btn');
    const originalHTML = btn.innerHTML;
    
    btn.innerHTML = '<i class="fas fa-check"></i>';
    btn.style.background = '#10b981';
    
    setTimeout(() => {
        btn.innerHTML = originalHTML;
        btn.style.background = '';
        event.target.reset();
    }, 2000);
    
    // Here you would typically send the email to your backend
    console.log('Newsletter subscription:', email);
}

// Social media tracking (optional)
document.querySelectorAll('.footer-social a').forEach(link => {
    link.addEventListener('click', function(e) {
        const platform = this.getAttribute('aria-label');
        console.log(`Social media click: ${platform}`);
        // You can add analytics tracking here
    });
});
</script>