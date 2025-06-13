<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ - Giúp Việc 24h</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <%@ include file="/view/common/web/add_css.jsp" %>
</head>
<body>
    <%@ include file="/view/common/web/header.jsp" %>

    <div class="contact-wrapper">
        <div class="contact-hero">
            <h1>Liên hệ với chúng tôi</h1>
            <p>Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn mọi lúc. Hãy chia sẻ với chúng tôi những gì bạn cần!</p>
        </div>

        <div class="contact-container">
            <div class="contact-content">
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
                            <i class="fas fa-paper-plane"></i> Gửi tin nhắn
                        </button>
                    </form>
                </div>
                
                <div class="contact-info-section">
                    <div class="contact-info">
                        <div class="section-header">
                            <h2>Thông tin liên hệ</h2>
                            <p>Đội ngũ chăm sóc khách hàng của chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7 với sự tận tâm và chuyên nghiệp.</p>
                        </div>
                        
                        <ul class="contact-details">
                            <li>
                                <i class="fas fa-map-marker-alt"></i>
                                <div>
                                    <strong>Địa chỉ</strong><br>
                                    123 Đường Nguyễn Văn Linh,<br>
                                    Hải Châu, Đà Nẵng
                                </div>
                            </li>
                            <li>
                                <i class="fas fa-envelope"></i>
                                <div>
                                    <strong>Email</strong><br>
                                    hotro@giupviec24h.com
                                </div>
                            </li>
                            <li>
                                <i class="fas fa-phone"></i>
                                <div>
                                    <strong>Hotline</strong><br>
                                    0905 123 456
                                </div>
                            </li>
                        </ul>
                        
                        <div class="working-hours">
                            <h3><i class="fas fa-clock"></i> Giờ làm việc</h3>
                            <p><strong>Thứ 2 - Thứ 7:</strong> 8:00 - 17:00</p>
                            <p><strong>Chủ nhật:</strong> 9:00 - 16:00</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="map-container">
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8561681211886!2d108.2583163749018!3d15.968885884696123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2sFPT%20University%20Danang!5e0!3m2!1sen!2s!4v1749699644303!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" 
                allowfullscreen="" 
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>

    <%@ include file="/view/common/web/footer.jsp" %>
    <%@ include file="/view/common/web/add_js.jsp" %>
</body>
</html>