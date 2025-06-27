<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
    /* Global Styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        line-height: 1.6;
        color: #2d3748;
        background: #ffffff;
    }

    /* Hero Section - Enhanced Banner */
    .contact-hero {
        background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 50%, #f5f5f5 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        position: relative;
        overflow: hidden;
        padding-top: 80px;
    }

    .contact-hero::before {
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: 
            radial-gradient(circle at 20% 80%, rgba(192, 169, 135, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 80% 20%, rgba(166, 142, 110, 0.08) 0%, transparent 50%),
            url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1.5" fill="%23c0a987" opacity="0.08"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
        pointer-events: none;
    }

    .hero-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4rem;
        align-items: center;
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
        position: relative;
        z-index: 2;
    }

    .hero-content {
        color: #2d3748;
    }

    .contact-hero h1 {
        font-size: 3.2rem;
        font-weight: 800;
        line-height: 1.15;
        margin-bottom: 1.5rem;
        color: #1a1a1a;
        letter-spacing: -0.02em;
    }

    .contact-hero p {
        font-size: 1.25rem;
        margin-bottom: 2.5rem;
        opacity: 0.85;
        line-height: 1.6;
        font-weight: 400;
        color: #4a4a4a;
        max-width: 90%;
    }

    .hero-cta {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
        align-items: center;
    }

    .hero-visual {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .contact-info-card {
        background: white;
        border-radius: 20px;
        padding: 2.5rem;
        box-shadow: 0 20px 60px rgba(0,0,0,0.1);
        border: 1px solid #e0e0e0;
        position: relative;
        overflow: hidden;
    }

    .contact-info-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #c0a987, #a68e6e);
    }

    .contact-info-grid {
        display: grid;
        gap: 1.5rem;
    }

    .contact-info-item {
        display: flex;
        align-items: center;
        gap: 1rem;
        padding: 1rem;
        background: #f5f5f5;
        border-radius: 12px;
        transition: all 0.3s ease;
    }

    .contact-info-item:hover {
        background: #e0e0e0;
        transform: translateX(5px);
    }

    .contact-info-icon {
        width: 50px;
        height: 50px;
        background: linear-gradient(135deg, #c0a987, #a68e6e);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #4a4a4a;
        font-size: 1.2rem;
        flex-shrink: 0;
    }

    .contact-info-text {
        flex: 1;
    }

    .contact-info-text .label {
        font-size: 0.85rem;
        color: #718096;
        font-weight: 500;
        margin-bottom: 0.25rem;
    }

    .contact-info-text .value {
        font-size: 1rem;
        color: #1a1a1a;
        font-weight: 600;
    }

    /* Enhanced Buttons */
    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 1rem 2rem;
        border-radius: 12px;
        text-decoration: none;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        border: 2px solid transparent;
        cursor: pointer;
        min-width: 160px;
        position: relative;
        overflow: hidden;
    }

    .btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: left 0.5s;
    }

    .btn:hover::before {
        left: 100%;
    }

    .btn-primary {
        background: linear-gradient(135deg, #c0a987, #a68e6e);
        color: #4a4a4a;
        border-color: #c0a987;
        box-shadow: 0 4px 15px rgba(192, 169, 135, 0.25);
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #a68e6e, #8f7860);
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(192, 169, 135, 0.35);
        color: #4a4a4a;
    }

    .btn-secondary {
        background: transparent;
        color: #4a4a4a;
        border-color: #e0e0e0;
        backdrop-filter: blur(10px);
    }

    .btn-secondary:hover {
        background: rgba(255, 255, 255, 0.8);
        color: #1a1a1a;
        transform: translateY(-2px);
        border-color: #d4d4d4;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    }

    /* Main Content */
    .contact-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 5rem 2rem;
    }

    .contact-content {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4rem;
        align-items: start;
    }

    /* Section Headers */
    .section-header {
        margin-bottom: 2rem;
    }

    .section-header h2 {
        font-size: 2rem;
        font-weight: 700;
        color: #1a1a1a;
        margin-bottom: 0.75rem;
        position: relative;
    }

    .section-header h2::after {
        content: '';
        position: absolute;
        bottom: -8px;
        left: 0;
        width: 40px;
        height: 3px;
        background: linear-gradient(90deg, #c0a987, #a68e6e);
        border-radius: 2px;
    }

    .section-header p {
        color: #4a4a4a;
        line-height: 1.6;
    }

    /* Form Section */
    .contact-form-section {
        background: white;
        padding: 2.5rem;
        border-radius: 16px;
        box-shadow: 0 4px 25px rgba(0,0,0,0.08);
        border: 1px solid #e0e0e0;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 600;
        color: #2d3748;
        font-size: 0.95rem;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 0.875rem 1rem;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 0.95rem;
        transition: all 0.3s ease;
        font-family: inherit;
        background: #f5f5f5;
    }

    .form-group input:focus,
    .form-group textarea:focus {
        outline: none;
        border-color: #c0a987;
        background: white;
        box-shadow: 0 0 0 3px rgba(192, 169, 135, 0.1);
    }

    .form-group textarea {
        min-height: 120px;
        resize: vertical;
    }

    .form-group input::placeholder,
    .form-group textarea::placeholder {
        color: #a0aec0;
    }

    /* Submit Button */
    .btn-submit {
        background: linear-gradient(135deg, #c0a987, #a68e6e);
        color: #4a4a4a;
        border: none;
        padding: 1rem 2rem;
        border-radius: 8px;
        font-weight: 600;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        min-width: 160px;
        justify-content: center;
    }

    .btn-submit:hover {
        background: linear-gradient(135deg, #a68e6e, #8f7860);
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(192, 169, 135, 0.3);
    }

    /* Contact Info Section */
    .contact-info-section {
        background: #f5f5f5;
        padding: 2.5rem;
        border-radius: 16px;
        border: 1px solid #e0e0e0;
    }

    .contact-details {
        list-style: none;
        margin-bottom: 2rem;
    }

    .contact-details li {
        display: flex;
        align-items: flex-start;
        gap: 1rem;
        margin-bottom: 1.5rem;
        padding: 1rem;
        background: white;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .contact-details i {
        color: #c0a987;
        font-size: 1.2rem;
        margin-top: 0.2rem;
        width: 20px;
        text-align: center;
    }

    .contact-details strong {
        color: #1a1a1a;
        font-weight: 600;
        display: block;
        margin-bottom: 0.25rem;
    }

    /* Working Hours */
    .working-hours {
        background: white;
        padding: 1.5rem;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .working-hours h3 {
        color: #1a1a1a;
        font-size: 1.1rem;
        font-weight: 600;
        margin-bottom: 1rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .working-hours i {
        color: #c0a987;
    }

    .working-hours p {
        margin-bottom: 0.5rem;
        color: #4a4a4a;
    }

    /* Messages */
    .success-message,
    .error-message {
        padding: 1rem 1.5rem;
        border-radius: 8px;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        font-weight: 500;
    }

    .success-message {
        background: #f0fff4;
        color: #22543d;
        border: 1px solid #9ae6b4;
    }

    .error-message {
        background: #fff5f5;
        color: #742a2a;
        border: 1px solid #fed7d7;
    }

    /* Map Section */
    .map-container {
        margin-top: 3rem;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 4px 25px rgba(0,0,0,0.1);
    }

    .map-container iframe {
        width: 100%;
        height: 400px;
        border: none;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .contact-hero {
            min-height: 50vh;
            padding: 6rem 1rem 3rem;
        }

        .contact-hero h1 {
            font-size: 2.5rem;
        }

        .contact-hero p {
            font-size: 1.1rem;
        }

        .contact-container {
            padding: 3rem 1rem;
        }

        .contact-content {
            grid-template-columns: 1fr;
            gap: 2.5rem;
        }

        .contact-form-section,
        .contact-info-section {
            padding: 1.5rem;
        }

        .section-header h2 {
            font-size: 1.6rem;
        }

        .contact-details li {
            flex-direction: row;
            text-align: left;
        }
    }

    @media (max-width: 480px) {
        .contact-hero h1 {
            font-size: 2rem;
        }

        .contact-hero p {
            font-size: 1rem;
        }

        .contact-form-section,
        .contact-info-section {
            padding: 1rem;
        }

        .btn-submit {
            width: 100%;
        }
    }

    /* Quick Contact */
    .quick-contact {
        background: linear-gradient(135deg, #4a4a4a 0%, #c0a987 100%);
        color: white;
        padding: 3rem 0;
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .quick-contact::before {
        content: '';
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(192, 169, 135, 0.06) 0%, transparent 70%);
        animation: float 20s ease-in-out infinite;
    }

    @keyframes float {
        0%, 100% { transform: translate(-50%, -50%) rotate(0deg); }
        50% { transform: translate(-50%, -50%) rotate(180deg); }
    }

    .quick-contact-content {
        position: relative;
        z-index: 1;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
    }

    .quick-contact h2 {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 1rem;
    }

    .quick-contact p {
        font-size: 1.1rem;
        opacity: 0.9;
        margin-bottom: 2rem;
    }

    .quick-contact-buttons {
        display: flex;
        gap: 1rem;
        justify-content: center;
        flex-wrap: wrap;
    }

    .btn-white {
        background: white;
        color: #1a1a1a;
        padding: 0.875rem 1.5rem;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn-white:hover {
        background: #f8f9fa;
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(255,255,255,0.2);
    }
    </style>
</head>
<body>
    <%@ include file="/view/common/web/header.jsp" %>

    

    <!-- Main Content -->
    <div class="contact-container">
        <div class="contact-content">
            <!-- Form Section -->
            <div class="contact-form-section">
                <div class="section-header">
                    <h2>Gửi tin nhắn</h2>
                    <p>Điền thông tin vào form dưới đây và chúng tôi sẽ phản hồi bạn trong thời gian sớm nhất.</p>
                </div>
                
                <% 
                    String successMessage = (String) request.getAttribute("successMessage");
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (successMessage != null) {
                %>
                    <div class="success-message">
                        <i class="fas fa-check-circle"></i> <%= successMessage %>
                    </div>
                <% } else if (errorMessage != null) { %>
                    <div class="error-message">
                        <i class="fas fa-exclamation-triangle"></i> <%= errorMessage %>
                    </div>
                <% } %>
                
                <form action="${pageContext.request.contextPath}/ContactServlet" method="post">
                    <div class="form-group">
                        <label for="fullName">Họ và tên *</label>
                        <input type="text" name="fullName" id="fullName" required placeholder="Vui lòng nhập họ và tên của bạn">
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Địa chỉ email *</label>
                        <input type="email" name="email" id="email" required placeholder="example@email.com">
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Số điện thoại *</label>
                        <input type="tel" name="phone" id="phone" required placeholder="0905 123 456">
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Nội dung tin nhắn *</label>
                        <textarea name="message" id="message" required placeholder="Hãy chia sẻ với chúng tôi những gì bạn cần hỗ trợ..."></textarea>
                    </div>
                    
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-paper-plane"></i> 
                        Gửi tin nhắn
                    </button>
                </form>
            </div>
            
            <!-- Contact Info Section -->
            <div class="contact-info-section">
                <div class="section-header">
                    <h2>Thông tin liên hệ</h2>
                    <p>Đội ngũ chăm sóc khách hàng của chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7 với sự tận tâm và chuyên nghiệp.</p>
                </div>
                
                <ul class="contact-details">
                    <li>
                        <i class="fas fa-map-marker-alt"></i>
                        <div>
                            <strong>Địa chỉ</strong>
                            Khu Đô Thị FPT, Phường Hòa Hải,<br>
                            Quận Ngũ Hành Sơn, TP. Đà Nẵng
                        </div>
                    </li>
                    <li>
                        <i class="fas fa-envelope"></i>
                        <div>
                            <strong>Email</strong>
                            info@giupviec24h.com
                        </div>
                    </li>
                    <li>
                        <i class="fas fa-phone"></i>
                        <div>
                            <strong>Hotline</strong>
                            +84 123 456 789
                        </div>
                    </li>
                </ul>
                
                <div class="working-hours">
                    <h3><i class="fas fa-clock"></i> Giờ làm việc</h3>
                    <p><strong>Thứ 2 - Thứ 7:</strong> 8:00 - 18:00</p>
                    <p><strong>Chủ nhật:</strong> 9:00 - 17:00</p>
                    <p><strong>Hỗ trợ khẩn cấp:</strong> 24/7</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Map Section -->
    <div class="map-container">
        <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8561681211886!2d108.2583163749018!3d15.968885884696123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2sFPT%20University%20Danang!5e0!3m2!1sen!2s!4v1749699644303!5m2!1sen!2s"
            allowfullscreen="" 
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>

    <!-- Quick Contact CTA -->
    <section class="quick-contact">
        <div class="quick-contact-content">
            <h2>Cần hỗ trợ khẩn cấp?</h2>
            <p>Liên hệ trực tiếp với chúng tôi qua các kênh nhanh chóng nhất</p>
            <div class="quick-contact-buttons">
                <a href="tel:+84123456789" class="btn-white">
                    <i class="fas fa-phone"></i>
                    Gọi ngay
                </a>
                <a href="mailto:info@giupviec24h.com" class="btn-white">
                    <i class="fas fa-envelope"></i>
                    Gửi email
                </a>
                <a href="#" class="btn-white">
                    <i class="fab fa-facebook-messenger"></i>
                    Chat Messenger
                </a>
            </div>
        </div>
    </section>

    <%@ include file="/view/common/web/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Form validation and enhancement
            const form = document.querySelector('form');
            const inputs = form.querySelectorAll('input, textarea');
            
            // Add real-time validation
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    validateField(this);
                });
                
                input.addEventListener('input', function() {
                    if (this.classList.contains('error')) {
                        validateField(this);
                    }
                });
            });
            
            function validateField(field) {
                const value = field.value.trim();
                let isValid = true;
                
                // Remove existing error styling
                field.classList.remove('error');
                
                // Check if required field is empty
                if (field.hasAttribute('required') && !value) {
                    isValid = false;
                }
                
                // Email validation
                if (field.type === 'email' && value) {
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (!emailRegex.test(value)) {
                        isValid = false;
                    }
                }
                
                // Phone validation
                if (field.type === 'tel' && value) {
                    const phoneRegex = /^[0-9+\-\s\(\)]{10,}$/;
                    if (!phoneRegex.test(value)) {
                        isValid = false;
                    }
                }
                
                // Add error styling if invalid
                if (!isValid) {
                    field.classList.add('error');
                    field.style.borderColor = '#e53e3e';
                } else {
                    field.style.borderColor = '#38a169';
                }
                
                return isValid;
            }
            
            // Form submission
            form.addEventListener('submit', function(e) {
                let isFormValid = true;
                
                inputs.forEach(input => {
                    if (!validateField(input)) {
                        isFormValid = false;
                    }
                });
                
                if (!isFormValid) {
                    e.preventDefault();
                    alert('Vui lòng kiểm tra lại thông tin đã nhập');
                }
            });
            
            // Auto-hide messages after 5 seconds
            const messages = document.querySelectorAll('.success-message, .error-message');
            messages.forEach(message => {
                setTimeout(() => {
                    message.style.opacity = '0';
                    setTimeout(() => {
                        message.remove();
                    }, 300);
                }, 5000);
            });
            
            console.log('📞 Contact page loaded successfully');
        });
    </script>
</body>
</html>