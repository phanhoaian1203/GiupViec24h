<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Hỗ Trợ - Giúp Việc 24H</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: #2d3748;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .main-content {
            margin-left: 280px;
            width: calc(100% - 280px);
            min-height: 100vh;
        }

        .header {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            border-bottom: 1px solid rgba(226, 232, 240, 0.8);
            position: sticky;
            top: 0;
            z-index: 50;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 20px rgba(0,0,0,0.08);
        }

        .header .breadcrumb {
            display: flex;
            align-items: center;
            color: #64748b;
            font-size: 0.9rem;
        }

        .header .breadcrumb i {
            margin: 0 0.5rem;
            color: #1AB394;
        }

        .header .user-section {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .notification-badge {
            position: relative;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 50%;
            background: rgba(26, 179, 148, 0.1);
            color: #1AB394;
            transition: all 0.3s ease;
        }

        .notification-badge:hover {
            background: rgba(26, 179, 148, 0.2);
            transform: scale(1.1);
        }

        .notification-badge .badge {
            position: absolute;
            top: 0;
            right: 0;
            background: #ef4444;
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid white;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            cursor: pointer;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            transition: all 0.3s ease;
        }

        .user-profile:hover {
            background: rgba(26, 179, 148, 0.1);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1AB394 0%, #16a085 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }

        .content {
            padding: 2rem;
            display: flex;
            flex-direction: column;
            height: calc(100vh - 64px); /* Adjust for header height */
        }

        .page-title {
            margin-bottom: 2rem;
        }

        .page-title h1 {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }

        .page-title p {
            color: #64748b;
            font-size: 1rem;
        }

        .chat-container {
            display: flex;
            flex: 1;
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            overflow: hidden;
        }

        .contact-list {
            width: 300px;
            background: #f8fafc;
            padding: 1rem;
            border-right: 1px solid #e5e7eb;
            overflow-y: auto;
        }

        .contact-list h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 1rem;
        }

        .contact-item {
            display: flex;
            align-items: center;
            padding: 0.75rem;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .contact-item:hover {
            background: rgba(26, 179, 148, 0.1);
        }

        .contact-item .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 0.75rem;
        }

        .contact-item .status {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #10b981;
            margin-left: 0.5rem;
        }

        .contact-item .status.offline {
            background: #64748b;
        }

        .chat-area {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .chat-messages {
            flex: 1;
            padding: 1rem;
            overflow-y: auto;
            background: #f1f5f9;
        }

        .message {
            max-width: 60%;
            margin-bottom: 1rem;
            padding: 0.75rem 1rem;
            border-radius: 8px;
        }

        .message.staff {
            background: #1AB394;
            color: white;
            margin-left: auto;
        }

        .message.helper, .message.customer {
            background: #e5e7eb;
            color: #2d3748;
        }

        .message-time {
            font-size: 0.75rem;
            color: #64748b;
            margin-top: 0.25rem;
        }

        .chat-input {
            padding: 1rem;
            border-top: 1px solid #e5e7eb;
            background: white;
        }

        .chat-input form {
            display: flex;
            gap: 0.5rem;
        }

        .chat-input input {
            flex: 1;
            padding: 0.75rem;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 1rem;
        }

        .chat-input button {
            background: linear-gradient(135deg, #1AB394, #16a085);
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .chat-input button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 179, 148, 0.3);
        }

        @media (max-width: 1024px) {
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            .contact-list {
                width: 100%;
                border-right: none;
                border-bottom: 1px solid #e5e7eb;
            }
            .chat-container {
                flex-direction: column;
            }
        }

        @media (max-width: 768px) {
            .content {
                padding: 1rem;
            }
            .chat-messages {
                padding: 0.5rem;
            }
            .chat-input input {
                padding: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <jsp:include page="/view/common/staff/staff-sidebar.jsp">
            <jsp:param name="activePage" value="chat"/>
        </jsp:include>
        <div class="main-content">
            <div class="header">
                <div class="breadcrumb">
                    <span>Trang Chủ</span>
                    <i class="fas fa-chevron-right"></i>
                    <span>Chat Hỗ Trợ</span>
                </div>
                <div class="user-section">
                    <div class="notification-badge">
                        <i class="fas fa-bell"></i>
                        <span class="badge">5</span>
                    </div>
                    <div class="notification-badge">
                        <i class="fas fa-envelope"></i>
                        <span class="badge">12</span>
                    </div>
                    <div class="user-profile">
                        <div class="user-avatar">S</div>
                        <div>
                            <div style="font-weight: 600; font-size: 0.875rem; color: #1a202c;">Staff</div>
                            <div style="font-size: 0.75rem; color: #64748b;">Nhân viên hỗ trợ</div>
                        </div>
                        <i class="fas fa-chevron-down" style="color: #64748b; font-size: 0.75rem;"></i>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="page-title">
                    <h1>Chat Hỗ Trợ</h1>
                    <p>Hỗ trợ trực tuyến cho người giúp việc và khách hàng tại Đà Nẵng</p>
                </div>

                <div class="chat-container">
                    <div class="contact-list">
                        <h3>Danh Sách Liên Hệ</h3>
                        <div class="contact-item" onclick="selectContact('Trần Văn A')">
                            <div class="avatar">TVA</div>
                            <span>Trần Văn A (Người Giúp Việc)</span>
                            <div class="status"></div>
                        </div>
                        <div class="contact-item" onclick="selectContact('Nguyễn Thị B')">
                            <div class="avatar">NTB</div>
                            <span>Nguyễn Thị B (Khách Hàng)</span>
                            <div class="status offline"></div>
                        </div>
                        <div class="contact-item" onclick="selectContact('Lê Văn C')">
                            <div class="avatar">LVC</div>
                            <span>Lê Văn C (Người Giúp Việc)</span>
                            <div class="status"></div>
                        </div>
                    </div>
                    <div class="chat-area">
                        <div class="chat-messages" id="chatMessages">
                            <div class="message helper">
                                Chào bạn, tôi cần hỗ trợ về lịch làm việc.
                                <div class="message-time">12:00 AM, 11/06/2025</div>
                            </div>
                            <div class="message staff">
                                Chào bạn! Tôi sẽ kiểm tra và hỗ trợ ngay.
                                <div class="message-time">12:05 AM, 11/06/2025</div>
                            </div>
                            <div class="message customer">
                                Cảm ơn bạn, tôi có vấn đề với voucher.
                                <div class="message-time">12:10 AM, 11/06/2025</div>
                            </div>
                        </div>
                        <div class="chat-input">
                            <form onsubmit="sendMessage(); return false;">
                                <input type="text" id="messageInput" placeholder="Nhập tin nhắn...">
                                <button type="submit"><i class="fas fa-paper-plane"></i> Gửi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Xử lý navigation sidebar
        document.querySelectorAll('.sidebar ul li').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.sidebar ul li.active').forEach(li => {
                    li.classList.remove('active');
                });
                this.classList.add('active');
            });
        });

        // Responsive sidebar toggle (cho mobile)
        function toggleSidebar() {
            const sidebar = document.querySelector('.sidebar');
            sidebar.classList.toggle('open');
        }

        // Chọn liên hệ
        function selectContact(name) {
            document.querySelectorAll('.contact-item').forEach(item => item.classList.remove('active'));
            event.currentTarget.classList.add('active');
            // Cập nhật tiêu đề hoặc nội dung chat nếu cần (tĩnh ở đây)
            document.getElementById('chatMessages').innerHTML = `
                <div class="message helper">
                    Chào bạn, tôi cần hỗ trợ về lịch làm việc.
                    <div class="message-time">12:00 AM, 11/06/2025</div>
                </div>
                <div class="message staff">
                    Chào bạn! Tôi sẽ kiểm tra và hỗ trợ ngay.
                    <div class="message-time">12:05 AM, 11/06/2025</div>
                </div>
            `;
            if (name === 'Nguyễn Thị B') {
                document.getElementById('chatMessages').innerHTML += `
                    <div class="message customer">
                        Cảm ơn bạn, tôi có vấn đề với voucher.
                        <div class="message-time">12:10 AM, 11/06/2025</div>
                    </div>
                `;
            }
        }

        // Gửi tin nhắn (tĩnh)
        function sendMessage() {
            const input = document.getElementById('messageInput');
            const message = input.value.trim();
            if (message) {
                const messagesDiv = document.getElementById('chatMessages');
                const now = new Date();
                const time = now.toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' }) + ', ' + now.toLocaleDateString('vi-VN');
                messagesDiv.innerHTML += `
                    <div class="message staff">
                        ${message}
                        <div class="message-time">${time}</div>
                    </div>
                `;
                messagesDiv.scrollTop = messagesDiv.scrollHeight; // Cuộn xuống cuối
                input.value = '';
            }
        }

        // Thêm animation cho stat cards khi load (dùng placeholder)
        document.addEventListener('DOMContentLoaded', function() {
            const statCards = document.querySelectorAll('.stat-card'); // Placeholder, không có stat cards
            statCards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    card.style.transition = 'all 0.6s ease';
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, 100);
                }, index * 150);
            });
        });
    </script>
</body>
</html>