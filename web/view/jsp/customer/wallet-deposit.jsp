<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User, model.Wallet, service.VietQRService.BankTransferInfo, java.text.NumberFormat, java.util.Locale, java.math.BigDecimal" %>
<%
    User user = (User) request.getAttribute("user");
    Wallet wallet = (Wallet) request.getAttribute("wallet");
    String transactionId = (String) request.getAttribute("transactionId");
    BigDecimal amount = (BigDecimal) request.getAttribute("amount");
    String qrUrl = (String) request.getAttribute("qrUrl");
    String mobileUrl = (String) request.getAttribute("mobileUrl");
    BankTransferInfo bankInfo = (BankTransferInfo) request.getAttribute("bankInfo");
    
    NumberFormat vnCurrency = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán QR - Giúp Việc 24H</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: #f8fafc;
            min-height: 100vh;
            color: #334155;
            padding-top: 70px;
        }

        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: white;
            border-bottom: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #334155;
            font-size: 1.25rem;
            font-weight: 700;
        }

        .logo i {
            margin-right: 0.5rem;
            font-size: 1.4rem;
            color: #c0a987;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .nav-link {
            color: #64748b;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.2s ease;
            font-size: 0.9rem;
        }

        .nav-link.active {
            color: #c0a987;
            background: rgba(192, 169, 135, 0.1);
        }

        .nav-link:hover {
            color: #c0a987;
            background: rgba(192, 169, 135, 0.05);
        }

        .nav-link.logout {
            color: #dc3545;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 2rem;
        }

        .page-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .page-header h1 {
            font-size: 1.75rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }

        .page-header p {
            color: #64748b;
            font-size: 0.95rem;
        }

        /* Timer warning */
        .timer-warning {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            color: #92400e;
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            text-align: center;
            border: 1px solid rgba(251, 191, 36, 0.3);
        }

        .timer {
            font-weight: 700;
            font-size: 1.1rem;
            color: #7c2d12;
        }

        /* Main layout */
        .main-content {
            display: grid;
            grid-template-columns: 1fr 350px;
            gap: 2rem;
        }

        .left-section {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .right-section {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        /* Cards */
        .card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            border: 1px solid #e2e8f0;
        }

        .card h3 {
            font-size: 1.125rem;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 1rem;
        }

        /* Amount display */
        .amount-display {
            text-align: center;
            padding: 1.5rem;
            background: linear-gradient(135deg, #c0a987 0%, #a68e6e 100%);
            border-radius: 12px;
            color: white;
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
        }

        .amount-display::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 30% 70%, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
            pointer-events: none;
        }

        .amount-display h2 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .amount-display p {
            font-size: 0.95rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        /* QR section */
        .qr-section {
            text-align: center;
        }

        .qr-code {
            max-width: 250px;
            width: 100%;
            height: auto;
            border: 6px solid #f8fafc;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 1rem;
        }

        /* Instructions */
        .instructions {
            background: #f8fafc;
            border-radius: 8px;
            padding: 1.25rem;
            border-left: 4px solid #c0a987;
        }

        .instruction-step {
            display: flex;
            align-items: center;
            margin-bottom: 0.75rem;
            font-size: 0.9rem;
        }

        .instruction-step:last-child {
            margin-bottom: 0;
        }

        .step-number {
            width: 24px;
            height: 24px;
            background: linear-gradient(135deg, #c0a987, #a68e6e);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 0.75rem;
            flex-shrink: 0;
            font-size: 0.8rem;
        }

        /* Bank info */
        .bank-info {
            background: #f1f5f9;
            border-radius: 8px;
            padding: 1.25rem;
            border: 1px solid #e2e8f0;
        }

        .bank-detail {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
            padding: 0.75rem;
            background: white;
            border-radius: 6px;
            font-size: 0.9rem;
        }

        .bank-detail:last-child {
            margin-bottom: 0;
        }

        .bank-label {
            color: #64748b;
            font-weight: 500;
        }

        .bank-value {
            color: #1e293b;
            font-weight: 600;
            font-family: 'JetBrains Mono', monospace;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .copy-btn {
            background: linear-gradient(135deg, #c0a987, #a68e6e);
            color: white;
            border: none;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.7rem;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .copy-btn:hover {
            background: linear-gradient(135deg, #a68e6e, #8f7860);
        }

        /* Action buttons */
        .action-buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .btn {
            padding: 0.875rem 1.25rem;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
            text-decoration: none;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #c0a987, #a68e6e);
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #a68e6e, #8f7860);
            transform: translateY(-1px);
        }

        .btn-secondary {
            background: white;
            color: #64748b;
            border: 2px solid #e2e8f0;
        }

        .btn-secondary:hover {
            background: #f8fafc;
            color: #475569;
            border-color: #c0a987;
        }

        /* Warning box */
        .warning-box {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            border-radius: 8px;
            padding: 1rem;
            border: 1px solid rgba(251, 191, 36, 0.3);
            font-size: 0.85rem;
            color: #92400e;
        }

        /* Info box */
        .info-box {
            background: #f8fafc;
            border-radius: 8px;
            padding: 1.25rem;
            border-left: 4px solid #c0a987;
        }

        .info-box h4 {
            margin-bottom: 0.75rem;
            color: #1e293b;
            font-weight: 600;
            font-size: 1rem;
        }

        .info-box ul {
            color: #64748b;
            line-height: 1.5;
            margin-left: 1.25rem;
            font-size: 0.9rem;
        }

        .info-box li {
            margin-bottom: 0.5rem;
        }

        .info-box strong {
            color: #1e293b;
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
        }

        .modal.active {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            max-width: 450px;
            width: 90%;
            max-height: 80vh;
            overflow-y: auto;
        }

        .modal-header {
            text-align: center;
            margin-bottom: 1rem;
        }

        .modal-header h3 {
            font-size: 1.125rem;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #374151;
            font-size: 0.9rem;
        }

        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e2e8f0;
            border-radius: 6px;
            font-size: 0.9rem;
            resize: vertical;
            min-height: 80px;
            transition: border-color 0.2s ease;
        }

        .form-group textarea:focus {
            outline: none;
            border-color: #c0a987;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .main-content {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .amount-display h2 {
                font-size: 1.5rem;
            }

            .action-buttons {
                grid-template-columns: 1fr;
            }

            .bank-detail {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }

            .nav {
                padding: 1rem;
            }

            .nav-links {
                flex-wrap: wrap;
                gap: 0.5rem;
            }
        }

        /* Copy success animation */
        .copy-success {
            position: fixed;
            top: 20px;
            right: 20px;
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 0.75rem 1rem;
            border-radius: 6px;
            font-weight: 600;
            z-index: 10000;
            font-size: 0.9rem;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <nav class="nav">
            <a href="${pageContext.request.contextPath}/" class="logo">
                <i class="fas fa-broom"></i>
                <span>Giúp Việc 24h</span>
            </a>
            
            <div class="nav-links">
                <% if (session.getAttribute("user") != null) { %>
                    <a href="${pageContext.request.contextPath}/hire" class="nav-link">
                        <i class="fas fa-handshake"></i> Thuê
                    </a>
                    <a href="${pageContext.request.contextPath}/wallet" class="nav-link active">
                        <i class="fas fa-wallet"></i> Ví của tôi
                    </a>
                    <a href="${pageContext.request.contextPath}/LogoutServlet" class="nav-link logout">
                        <i class="fas fa-sign-out-alt"></i> Đăng xuất
                    </a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/view/jsp/home/login.jsp" class="nav-link">
                        <i class="fas fa-sign-in-alt"></i> Đăng nhập
                    </a>
                <% } %>
            </div>
        </nav>
    </header>

    <div class="container">
        <div class="page-header">
            <h1>Thanh Toán QR Code</h1>
            <p>Quét mã QR hoặc chuyển khoản thủ công để nạp tiền vào ví</p>
        </div>

        <!-- Timer Warning -->
        <div class="timer-warning">
            <i class="fas fa-clock"></i>
            <strong>Thời gian thanh toán còn lại: <span class="timer" id="countdown">02:00:00</span></strong>
        </div>

        <div class="main-content">
            <div class="left-section">
                <!-- Amount Display -->
                <div class="amount-display">
                    <h2><%= vnCurrency.format(amount) %></h2>
                    <p>Mã giao dịch: <strong><%= transactionId %></strong></p>
                </div>

                <!-- QR Code Section -->
                <div class="card">
                    <h3>Quét mã QR để thanh toán</h3>
                    <div class="qr-section">
                        <% if (qrUrl != null) { %>
                        <img src="<%= qrUrl %>" alt="QR Code thanh toán" class="qr-code" id="qrImage">
                        <% } %>
                        <p style="color: #64748b; margin-top: 0.75rem; font-size: 0.9rem;">
                            Mở app ngân hàng và quét mã QR này để thanh toán
                        </p>
                    </div>
                </div>

                <!-- Instructions -->
                <div class="card">
                    <h3>Hướng dẫn thanh toán</h3>
                    <div class="instructions">
                        <div class="instruction-step">
                            <div class="step-number">1</div>
                            <div>Mở ứng dụng ngân hàng trên điện thoại</div>
                        </div>
                        <div class="instruction-step">
                            <div class="step-number">2</div>
                            <div>Chọn tính năng "Quét QR" hoặc "QR Pay"</div>
                        </div>
                        <div class="instruction-step">
                            <div class="step-number">3</div>
                            <div>Quét mã QR bên trên</div>
                        </div>
                        <div class="instruction-step">
                            <div class="step-number">4</div>
                            <div>Xác nhận thông tin và thực hiện chuyển khoản</div>
                        </div>
                        <div class="instruction-step">
                            <div class="step-number">5</div>
                            <div>Nhấn nút "Tôi đã chuyển khoản" bên dưới</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="right-section">
                <!-- Bank Transfer Info -->
                <div class="card">
                    <h3>Hoặc chuyển khoản thủ công</h3>
                    <div class="bank-info">
                        <div class="bank-detail">
                            <span class="bank-label">Ngân hàng:</span>
                            <span class="bank-value">
                                <%= bankInfo.getBankName() %>
                                <button class="copy-btn" onclick="copyToClipboard('<%= bankInfo.getBankName() %>')">
                                    <i class="fas fa-copy"></i>
                                </button>
                            </span>
                        </div>
                        <div class="bank-detail">
                            <span class="bank-label">Số tài khoản:</span>
                            <span class="bank-value">
                                <%= bankInfo.getAccountNumber() %>
                                <button class="copy-btn" onclick="copyToClipboard('<%= bankInfo.getAccountNumber() %>')">
                                    <i class="fas fa-copy"></i>
                                </button>
                            </span>
                        </div>
                        <div class="bank-detail">
                            <span class="bank-label">Tên chủ TK:</span>
                            <span class="bank-value">
                                <%= bankInfo.getAccountName() %>
                                <button class="copy-btn" onclick="copyToClipboard('<%= bankInfo.getAccountName() %>')">
                                    <i class="fas fa-copy"></i>
                                </button>
                            </span>
                        </div>
                        <div class="bank-detail">
                            <span class="bank-label">Số tiền:</span>
                            <span class="bank-value">
                                <%= vnCurrency.format(bankInfo.getAmount()) %>
                                <button class="copy-btn" onclick="copyToClipboard('<%= bankInfo.getAmount().toPlainString() %>')">
                                    <i class="fas fa-copy"></i>
                                </button>
                            </span>
                        </div>
                        <div class="bank-detail">
                            <span class="bank-label">Nội dung:</span>
                            <span class="bank-value">
                                <%= bankInfo.getMemo() %>
                                <button class="copy-btn" onclick="copyToClipboard('<%= bankInfo.getMemo() %>')">
                                    <i class="fas fa-copy"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                    
                    <div class="warning-box" style="margin-top: 1rem;">
                        <i class="fas fa-exclamation-triangle"></i>
                        <strong>Lưu ý:</strong> Bạn phải chuyển khoản ĐÚNG nội dung như trên để hệ thống có thể xác nhận giao dịch.
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="card">
                    <h3>Xác nhận thanh toán</h3>
                    <div class="action-buttons">
                        <button type="button" class="btn btn-primary" onclick="showConfirmModal()">
                            <i class="fas fa-check-circle"></i>
                            Tôi đã chuyển khoản
                        </button>
                        <a href="<%= request.getContextPath() %>/wallet" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i>
                            Quay lại ví
                        </a>
                    </div>
                </div>

                <!-- Additional Info -->
                <div class="info-box">
                    <h4>Thông tin quan trọng</h4>
                    <ul>
                        <li>Yêu cầu nạp tiền sẽ hết hạn sau 2 giờ</li>
                        <li>Sau khi chuyển khoản, vui lòng nhấn "Tôi đã chuyển khoản"</li>
                        <li>Nhân viên sẽ kiểm tra và duyệt giao dịch trong vòng 24 giờ</li>
                        <li>Nếu có vấn đề, liên hệ hotline: <strong>0385299310</strong></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Confirm Modal -->
    <div class="modal" id="confirmModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Xác nhận đã chuyển khoản</h3>
                <p style="color: #64748b; font-size: 0.9rem;">Vui lòng xác nhận bạn đã chuyển khoản thành công</p>
            </div>
            
            <form action="<%= request.getContextPath() %>/wallet/confirm-deposit" method="post">
                <div class="form-group">
                    <label for="userNote">Ghi chú (tùy chọn):</label>
                    <textarea name="userNote" id="userNote" placeholder="Thêm ghi chú về giao dịch của bạn..."></textarea>
                </div>
                
                <div class="action-buttons">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-check-circle"></i>
                        Xác nhận đã chuyển
                    </button>
                    <button type="button" class="btn btn-secondary" onclick="hideConfirmModal()">
                        <i class="fas fa-times"></i>
                        Hủy
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Countdown timer (2 hours = 7200 seconds)
        let timeLeft = 7200;
        const countdownElement = document.getElementById('countdown');

        function updateCountdown() {
            const hours = Math.floor(timeLeft / 3600);
            const minutes = Math.floor((timeLeft % 3600) / 60);
            const seconds = timeLeft % 60;

            const display = String(hours).padStart(2, '0') + ':' + 
                           String(minutes).padStart(2, '0') + ':' + 
                           String(seconds).padStart(2, '0');
            
            countdownElement.textContent = display;

            if (timeLeft <= 0) {
                alert('Yêu cầu nạp tiền đã hết hạn. Vui lòng tạo yêu cầu mới.');
                window.location.href = '<%= request.getContextPath() %>/wallet';
                return;
            }

            // Change color when time is running low (last 30 minutes)
            if (timeLeft <= 1800) {
                countdownElement.style.color = '#dc2626';
                const timerWarning = countdownElement.closest('.timer-warning');
                timerWarning.style.background = 'linear-gradient(135deg, #fecaca, #fca5a5)';
                timerWarning.style.color = '#991b1b';
                timerWarning.style.borderColor = 'rgba(220, 38, 38, 0.3)';
            }

            timeLeft--;
        }

        // Start countdown
        updateCountdown();
        const countdownInterval = setInterval(updateCountdown, 1000);

        // Modal functions
        function showConfirmModal() {
            document.getElementById('confirmModal').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function hideConfirmModal() {
            document.getElementById('confirmModal').classList.remove('active');
            document.body.style.overflow = 'auto';
        }

        // Close modal when clicking outside
        document.getElementById('confirmModal').addEventListener('click', function(e) {
            if (e.target === this) {
                hideConfirmModal();
            }
        });

        // Copy to clipboard function
        function copyToClipboard(text) {
            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(text).then(function() {
                    showCopySuccess();
                }, function() {
                    fallbackCopyTextToClipboard(text);
                });
            } else {
                fallbackCopyTextToClipboard(text);
            }
        }

        function fallbackCopyTextToClipboard(text) {
            const textArea = document.createElement("textarea");
            textArea.value = text;
            textArea.style.top = "0";
            textArea.style.left = "0";
            textArea.style.position = "fixed";

            document.body.appendChild(textArea);
            textArea.focus();
            textArea.select();

            try {
                const successful = document.execCommand('copy');
                if (successful) {
                    showCopySuccess();
                }
            } catch (err) {
                console.error('Fallback: Could not copy text: ', err);
            }

            document.body.removeChild(textArea);
        }

        function showCopySuccess() {
            const successMsg = document.createElement('div');
            successMsg.textContent = 'Đã sao chép!';
            successMsg.className = 'copy-success';
            
            document.body.appendChild(successMsg);
            
            setTimeout(() => {
                successMsg.remove();
            }, 2000);
        }

        // Auto refresh QR code every 5 minutes
        setInterval(function() {
            const qrImage = document.getElementById('qrImage');
            if (qrImage) {
                const timestamp = new Date().getTime();
                const currentSrc = qrImage.src;
                const separator = currentSrc.includes('?') ? '&' : '?';
                qrImage.src = currentSrc + separator + 'refresh=' + timestamp;
            }
        }, 300000); // 5 minutes

        // Form submission handling
        let isFormSubmitting = false;

        // Mark when form is being submitted
        document.querySelector('form').addEventListener('submit', function() {
            isFormSubmitting = true;
            
            const submitBtn = this.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
            }
        });

        // Only warn if not submitting form
        window.addEventListener('beforeunload', function(e) {
            if (!isFormSubmitting) {
                const confirmationMessage = 'Bạn có chắc muốn rời khỏi trang? Giao dịch chưa hoàn thành sẽ bị hủy.';
                (e || window.event).returnValue = confirmationMessage;
                return confirmationMessage;
            }
        });

        console.log('✅ Deposit QR page loaded successfully');
        console.log('📋 Transaction ID: <%= transactionId %>');
        console.log('💰 Amount: <%= amount %>');
    </script>
</body>
</html>