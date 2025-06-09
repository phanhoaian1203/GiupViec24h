<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán - Thuê Người Giúp Việc Đà Nẵng</title>
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
            background: linear-gradient(135deg, #f0fdfa 0%, #ccfbf1 50%, #a7f3d0 100%);
            min-height: 100vh;
            padding: 1rem;
            color: #1f2937;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="50" cy="50" r="0.5" fill="%23ffffff" opacity="0.1"/><circle cx="20" cy="20" r="0.3" fill="%23ffffff" opacity="0.05"/><circle cx="80" cy="30" r="0.4" fill="%23ffffff" opacity="0.08"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
            z-index: 0;
        }

        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 2rem;
            position: relative;
            z-index: 1;
        }

        .payment-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            padding: 2.5rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1), 0 0 0 1px rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }

        .payment-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 35px 70px -12px rgba(0, 0, 0, 0.15);
        }

        .order-summary {
            background: linear-gradient(135deg, #1AB394 0%, #10b981 100%);
            color: white;
            border-radius: 24px;
            padding: 2.5rem;
            box-shadow: 0 25px 50px -12px rgba(26, 179, 148, 0.3);
            position: sticky;
            top: 2rem;
            height: fit-content;
        }

        .header {
            text-align: center;
            margin-bottom: 2.5rem;
            position: relative;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: -1rem;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, #1AB394, #10b981);
            border-radius: 2px;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: 800;
            color: #1AB394;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }

        .header p {
            font-size: 1.1rem;
            color: #6b7280;
            font-weight: 500;
        }

        .payment-methods {
            margin-bottom: 2.5rem;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .payment-option {
            display: flex;
            align-items: center;
            padding: 1.5rem;
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            border: 2px solid transparent;
            border-radius: 16px;
            margin-bottom: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .payment-option::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(26, 179, 148, 0.1), transparent);
            transition: left 0.5s ease;
        }

        .payment-option:hover::before {
            left: 100%;
        }

        .payment-option:hover {
            border-color: #1AB394;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.15);
        }

        .payment-option.selected {
            border-color: #1AB394;
            background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.15);
        }

        .payment-option input[type="radio"] {
            width: 20px;
            height: 20px;
            margin-right: 1rem;
            accent-color: #1AB394;
        }

        .payment-option-content {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex: 1;
        }

        .payment-icon {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, #1AB394, #10b981);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
        }

        .payment-info h4 {
            font-size: 1.1rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 0.25rem;
        }

        .payment-info p {
            font-size: 0.9rem;
            color: #6b7280;
        }

        .payment-details {
            display: none;
            margin-top: 1.5rem;
            padding: 1.5rem;
            background: white;
            border-radius: 12px;
            border: 1px solid #e5e7eb;
            animation: slideDown 0.3s ease;
        }

        .payment-details.active {
            display: block;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-size: 0.9rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .form-group input {
            width: 100%;
            padding: 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f9fafb;
        }

        .form-group input:focus {
            outline: none;
            border-color: #1AB394;
            background: white;
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.1);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 120px;
            gap: 1rem;
        }

        .wallet-info {
            padding: 1.5rem;
            background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
            border: 1px solid #1AB394;
            border-radius: 12px;
        }

        .balance-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .balance-item:last-child {
            margin-bottom: 0;
            font-weight: 600;
            color: #1AB394;
        }

        .btn-submit {
            background: linear-gradient(135deg, #1AB394 0%, #10b981 100%);
            color: white;
            padding: 1.25rem 2rem;
            border: none;
            border-radius: 16px;
            font-weight: 700;
            font-size: 1.1rem;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-submit::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .btn-submit:hover::before {
            left: 100%;
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(26, 179, 148, 0.4);
        }

        .btn-submit:active {
            transform: translateY(-1px);
        }

        /* Order Summary Styles */
        .summary-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .summary-header h2 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .order-item {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .service-info {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .service-icon {
            width: 48px;
            height: 48px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }

        .service-details h3 {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .service-details p {
            opacity: 0.8;
            font-size: 0.9rem;
        }

        .cost-breakdown {
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            padding-top: 1rem;
        }

        .cost-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .cost-item:last-child {
            margin-bottom: 0;
            font-size: 1.2rem;
            font-weight: 700;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            padding-top: 0.5rem;
            margin-top: 0.5rem;
        }

        .security-info {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 1.5rem;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            font-size: 0.9rem;
            opacity: 0.8;
        }

        @media (max-width: 1024px) {
            .main-container {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
            
            .order-summary {
                position: relative;
                top: 0;
                order: -1;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 0.5rem;
            }
            
            .payment-card, .order-summary {
                padding: 1.5rem;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="payment-card">
            <div class="header">
                <h1>
                    <i class="fas fa-credit-card"></i>
                    Thanh Toán
                </h1>
                <p>Hoàn tất thanh toán để đặt dịch vụ giúp việc</p>
            </div>

            <div class="payment-methods">
                <h3 class="section-title">
                    <i class="fas fa-wallet"></i>
                    Phương thức thanh toán
                </h3>
                
                <div class="payment-option" onclick="selectPayment('wallet')" id="walletOption">
                    <input type="radio" id="wallet" name="paymentMethod" value="wallet">
                    <div class="payment-option-content">
                        <div class="payment-icon">
                            <i class="fas fa-wallet"></i>
                        </div>
                        <div class="payment-info">
                            <h4>Thanh toán bằng ví điện tử</h4>
                            <p>Thanh toán nhanh chóng và bảo mật</p>
                        </div>
                    </div>
                </div>
                <div class="payment-details" id="walletDetails">
                    <div class="wallet-info">
                        <div class="balance-item">
                            <span>Số dư hiện tại:</span>
                            <span>1,500,000 VNĐ</span>
                        </div>
                        <div class="balance-item">
                            <span>Số tiền thanh toán:</span>
                            <span>-400,000 VNĐ</span>
                        </div>
                        <div class="balance-item">
                            <span>Số dư còn lại:</span>
                            <span>1,100,000 VNĐ</span>
                        </div>
                    </div>
                </div>

                <div class="payment-option" onclick="selectPayment('bank')" id="bankOption">
                    <input type="radio" id="bank" name="paymentMethod" value="bank">
                    <div class="payment-option-content">
                        <div class="payment-icon">
                            <i class="fas fa-university"></i>
                        </div>
                        <div class="payment-info">
                            <h4>Thanh toán qua ngân hàng</h4>
                            <p>Chuyển khoản trực tuyến an toàn</p>
                        </div>
                    </div>
                </div>
                <div class="payment-details" id="bankDetails">
                    <div class="form-group">
                        <label for="cardNumber">Số thẻ ngân hàng</label>
                        <input type="text" id="cardNumber" placeholder="0000 0000 0000 0000" maxlength="19">
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="expiryDate">Ngày hết hạn</label>
                            <input type="text" id="expiryDate" placeholder="MM/YY" maxlength="5">
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <input type="text" id="cvv" placeholder="123" maxlength="3">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cardName">Tên chủ thẻ</label>
                        <input type="text" id="cardName" placeholder="NGUYEN VAN A">
                    </div>
                </div>

                <div class="payment-option" onclick="selectPayment('momo')" id="momoOption">
                    <input type="radio" id="momo" name="paymentMethod" value="momo">
                    <div class="payment-option-content">
                        <div class="payment-icon">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <div class="payment-info">
                            <h4>Thanh toán qua MoMo</h4>
                            <p>Quét mã QR hoặc nhập số điện thoại</p>
                        </div>
                    </div>
                </div>
                <div class="payment-details" id="momoDetails">
                    <div class="form-group">
                        <label for="momoPhone">Số điện thoại MoMo</label>
                        <input type="text" id="momoPhone" placeholder="0901234567" maxlength="10">
                    </div>
                    <div style="text-align: center; margin-top: 1rem;">
                        <p style="color: #6b7280; margin-bottom: 1rem;">Hoặc quét mã QR</p>
                        <div style="width: 150px; height: 150px; background: #f3f4f6; border-radius: 8px; margin: 0 auto; display: flex; align-items: center; justify-content: center;">
                            <i class="fas fa-qrcode" style="font-size: 3rem; color: #9ca3af;"></i>
                        </div>
                    </div>
                </div>
            </div>

            <button class="btn-submit" onclick="processPayment()">
                <i class="fas fa-lock"></i>
                Xác nhận thanh toán
            </button>
        </div>

        <div class="order-summary">
            <div class="summary-header">
                <h2><i class="fas fa-receipt"></i> Chi tiết đơn hàng</h2>
                <p>Mã đơn: #DV2024001</p>
            </div>

            <div class="order-item">
                <div class="service-info">
                    <div class="service-icon">
                        <i class="fas fa-broom"></i>
                    </div>
                    <div class="service-details">
                        <h3>Dịch vụ giúp việc theo giờ</h3>
                        <p>4 giờ làm việc • Dọn dẹp nhà cửa</p>
                    </div>
                </div>
                
                <div class="cost-breakdown">
                    <div class="cost-item">
                        <span>Giá dịch vụ:</span>
                        <span>80,000 VNĐ/giờ</span>
                    </div>
                    <div class="cost-item">
                        <span>Thời gian:</span>
                        <span>4 giờ</span>
                    </div>
                    <div class="cost-item">
                        <span>Phí dịch vụ:</span>
                        <span>80,000 VNĐ</span>
                    </div>
                    <div class="cost-item">
                        <span><strong>Tổng cộng:</strong></span>
                        <span><strong>400,000 VNĐ</strong></span>
                    </div>
                </div>
            </div>

            <div class="security-info">
                <i class="fas fa-shield-alt"></i>
                <span>Thanh toán được bảo mật bằng mã hóa SSL 256-bit</span>
            </div>
        </div>
    </div>

    <script>
        function selectPayment(method) {
            // Remove all selected classes
            document.querySelectorAll('.payment-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Hide all payment details
            document.querySelectorAll('.payment-details').forEach(detail => {
                detail.classList.remove('active');
            });
            
            // Show selected payment method
            document.getElementById(method + 'Option').classList.add('selected');
            document.getElementById(method + 'Details').classList.add('active');
            document.getElementById(method).checked = true;
        }

        function processPayment() {
            const selectedMethod = document.querySelector('input[name="paymentMethod"]:checked');
            
            if (!selectedMethod) {
                alert('Vui lòng chọn phương thức thanh toán!');
                return;
            }

            // Validate form based on selected method
            if (selectedMethod.value === 'bank') {
                const cardNumber = document.getElementById('cardNumber').value;
                const expiryDate = document.getElementById('expiryDate').value;
                const cvv = document.getElementById('cvv').value;
                const cardName = document.getElementById('cardName').value;

                if (!cardNumber || !expiryDate || !cvv || !cardName) {
                    alert('Vui lòng điền đầy đủ thông tin thẻ ngân hàng!');
                    return;
                }
            }

            if (selectedMethod.value === 'momo') {
                const momoPhone = document.getElementById('momoPhone').value;
                if (!momoPhone) {
                    alert('Vui lòng nhập số điện thoại MoMo!');
                    return;
                }
            }

            // Simulate payment processing
            const button = document.querySelector('.btn-submit');
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
            button.disabled = true;

            setTimeout(() => {
                alert('Thanh toán thành công! Đơn hàng của bạn đã được xác nhận.');
                button.innerHTML = '<i class="fas fa-check"></i> Thanh toán thành công';
                button.style.background = 'linear-gradient(135deg, #10b981, #059669)';
            }, 2000);
        }

        // Format card number input
        document.getElementById('cardNumber').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
            let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
            e.target.value = formattedValue;
        });

        // Format expiry date input
        document.getElementById('expiryDate').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            e.target.value = value;
        });

        // Format CVV input
        document.getElementById('cvv').addEventListener('input', function(e) {
            e.target.value = e.target.value.replace(/\D/g, '');
        });

        // Format MoMo phone input
        document.getElementById('momoPhone').addEventListener('input', function(e) {
            e.target.value = e.target.value.replace(/\D/g, '');
        });

        // Initialize default selection
        document.addEventListener('DOMContentLoaded', function() {
            selectPayment('wallet');
        });
    </script>
</body>
</html>