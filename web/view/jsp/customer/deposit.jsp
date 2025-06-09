<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nạp Tiền Vào Ví - Thuê Người Giúp Việc Đà Nẵng</title>
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

        .deposit-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            padding: 2.5rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1), 0 0 0 1px rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }

        .deposit-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 35px 70px -12px rgba(0, 0, 0, 0.15);
        }

        .wallet-overview {
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

        .amount-section {
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

        .amount-input-container {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .amount-input {
            width: 100%;
            padding: 1.5rem 4rem 1.5rem 1.5rem;
            border: 3px solid #e5e7eb;
            border-radius: 16px;
            font-size: 1.5rem;
            font-weight: 600;
            color: #1f2937;
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            transition: all 0.3s ease;
        }

        .amount-input:focus {
            outline: none;
            border-color: #1AB394;
            background: white;
            box-shadow: 0 0 0 4px rgba(26, 179, 148, 0.1);
            transform: translateY(-2px);
        }

        .currency-label {
            position: absolute;
            right: 1.5rem;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2rem;
            font-weight: 600;
            color: #1AB394;
        }

        .quick-amounts {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .quick-amount {
            padding: 1rem;
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            border: 2px solid transparent;
            border-radius: 12px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            color: #4b5563;
        }

        .quick-amount:hover {
            border-color: #1AB394;
            background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
            color: #1AB394;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.15);
        }

        .quick-amount.selected {
            border-color: #1AB394;
            background: linear-gradient(135deg, #1AB394, #10b981);
            color: white;
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.3);
        }

        .deposit-methods {
            margin-bottom: 2.5rem;
        }

        .method-option {
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

        .method-option::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(26, 179, 148, 0.1), transparent);
            transition: left 0.5s ease;
        }

        .method-option:hover::before {
            left: 100%;
        }

        .method-option:hover {
            border-color: #1AB394;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.15);
        }

        .method-option.selected {
            border-color: #1AB394;
            background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.15);
        }

        .method-option input[type="radio"] {
            width: 20px;
            height: 20px;
            margin-right: 1rem;
            accent-color: #1AB394;
        }

        .method-content {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex: 1;
        }

        .method-icon {
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

        .method-info h4 {
            font-size: 1.1rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 0.25rem;
        }

        .method-info p {
            font-size: 0.9rem;
            color: #6b7280;
        }

        .method-details {
            display: none;
            margin-top: 1.5rem;
            padding: 1.5rem;
            background: white;
            border-radius: 12px;
            border: 1px solid #e5e7eb;
            animation: slideDown 0.3s ease;
        }

        .method-details.active {
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

        .qr-section {
            text-align: center;
            padding: 2rem;
        }

        .qr-code {
            width: 200px;
            height: 200px;
            background: linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%);
            border-radius: 16px;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid #e5e7eb;
        }

        .qr-code i {
            font-size: 4rem;
            color: #9ca3af;
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

        .btn-submit:disabled {
            background: #9ca3af;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        /* Wallet Overview Styles */
        .wallet-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .wallet-header h2 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .current-balance {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .balance-label {
            font-size: 1rem;
            opacity: 0.8;
            margin-bottom: 0.5rem;
        }

        .balance-amount {
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 1rem;
        }

        .balance-trend {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-size: 0.9rem;
            opacity: 0.8;
        }

        .transaction-preview {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .preview-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
        }

        .preview-row:last-child {
            margin-bottom: 0;
            padding-top: 0.75rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            font-weight: 700;
            font-size: 1.1rem;
        }

        .security-badge {
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
            
            .wallet-overview {
                position: relative;
                top: 0;
                order: -1;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 0.5rem;
            }
            
            .deposit-card, .wallet-overview {
                padding: 1.5rem;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }

            .quick-amounts {
                grid-template-columns: repeat(2, 1fr);
            }

            .balance-amount {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="deposit-card">
            <div class="header">
                <h1>
                    <i class="fas fa-plus-circle"></i>
                    Nạp Tiền Vào Ví
                </h1>
                <p>Thêm tiền vào ví để sử dụng dịch vụ một cách thuận tiện</p>
            </div>

            <div class="amount-section">
                <h3 class="section-title">
                    <i class="fas fa-money-bill-wave"></i>
                    Số tiền nạp
                </h3>
                
                <div class="amount-input-container">
                    <input type="number" id="depositAmount" class="amount-input" placeholder="0" min="10000" step="1000">
                    <span class="currency-label">VNĐ</span>
                </div>

                <div class="quick-amounts">
                    <div class="quick-amount" onclick="selectQuickAmount(50000)">50,000</div>
                    <div class="quick-amount" onclick="selectQuickAmount(100000)">100,000</div>
                    <div class="quick-amount" onclick="selectQuickAmount(200000)">200,000</div>
                    <div class="quick-amount" onclick="selectQuickAmount(500000)">500,000</div>
                    <div class="quick-amount" onclick="selectQuickAmount(1000000)">1,000,000</div>
                    <div class="quick-amount" onclick="selectQuickAmount(2000000)">2,000,000</div>
                </div>
            </div>

            <div class="deposit-methods">
                <h3 class="section-title">
                    <i class="fas fa-credit-card"></i>
                    Phương thức nạp tiền
                </h3>
                
                <div class="method-option" onclick="selectMethod('bank')" id="bankOption">
                    <input type="radio" id="bank" name="depositMethod" value="bank">
                    <div class="method-content">
                        <div class="method-icon">
                            <i class="fas fa-university"></i>
                        </div>
                        <div class="method-info">
                            <h4>Thẻ ngân hàng</h4>
                            <p>Visa, MasterCard, JCB, ATM nội địa</p>
                        </div>
                    </div>
                </div>
                <div class="method-details" id="bankDetails">
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

                <div class="method-option" onclick="selectMethod('transfer')" id="transferOption">
                    <input type="radio" id="transfer" name="depositMethod" value="transfer">
                    <div class="method-content">
                        <div class="method-icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <div class="method-info">
                            <h4>Chuyển khoản ngân hàng</h4>
                            <p>Chuyển khoản qua internet banking</p>
                        </div>
                    </div>
                </div>
                <div class="method-details" id="transferDetails">
                    <div style="background: #f8fafc; padding: 1.5rem; border-radius: 8px; margin-bottom: 1rem;">
                        <h4 style="color: #1AB394; margin-bottom: 1rem;">Thông tin tài khoản nhận</h4>
                        <p><strong>Ngân hàng:</strong> Vietcombank</p>
                        <p><strong>Số tài khoản:</strong> 0123456789</p>
                        <p><strong>Chủ tài khoản:</strong> CONG TY TNHH GIUP VIEC DA NANG</p>
                        <p><strong>Nội dung CK:</strong> NAPVI [SĐT của bạn]</p>
                    </div>
                </div>

                <div class="method-option" onclick="selectMethod('momo')" id="momoOption">
                    <input type="radio" id="momo" name="depositMethod" value="momo">
                    <div class="method-content">
                        <div class="method-icon">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <div class="method-info">
                            <h4>Ví MoMo</h4>
                            <p>Quét mã QR hoặc nhập số điện thoại</p>
                        </div>
                    </div>
                </div>
                <div class="method-details" id="momoDetails">
                    <div class="form-group">
                        <label for="momoPhone">Số điện thoại MoMo</label>
                        <input type="text" id="momoPhone" placeholder="0901234567" maxlength="10">
                    </div>
                    <div class="qr-section">
                        <p style="color: #6b7280; margin-bottom: 1rem;">Hoặc quét mã QR</p>
                        <div class="qr-code">
                            <i class="fas fa-qrcode"></i>
                        </div>
                        <p style="color: #6b7280; font-size: 0.9rem;">Mã QR sẽ được tạo sau khi nhập số tiền</p>
                    </div>
                </div>
            </div>

            <button class="btn-submit" onclick="processDeposit()" id="submitBtn" disabled>
                <i class="fas fa-plus-circle"></i>
                Nạp tiền vào ví
            </button>
        </div>

        <div class="wallet-overview">
            <div class="wallet-header">
                <h2><i class="fas fa-wallet"></i> Thông tin ví</h2>
                <p>Trạng thái tài khoản của bạn</p>
            </div>

            <div class="current-balance">
                <div class="balance-label">Số dư hiện tại</div>
                <div class="balance-amount" id="currentBalance">1,500,000 VNĐ</div>
                <div class="balance-trend">
                    <i class="fas fa-arrow-up"></i>
                    <span>+15% so với tháng trước</span>
                </div>
            </div>

            <div class="transaction-preview" id="transactionPreview" style="display: none;">
                <h4 style="margin-bottom: 1rem; color: rgba(255,255,255,0.9);">
                    <i class="fas fa-receipt"></i> Xem trước giao dịch
                </h4>
                <div class="preview-row">
                    <span>Số tiền nạp:</span>
                    <span id="previewAmount">0 VNĐ</span>
                </div>
                <div class="preview-row">
                    <span>Phí giao dịch:</span>
                    <span id="previewFee">0 VNĐ</span>
                </div>
                <div class="preview-row">
                    <span>Số dư sau nạp:</span>
                    <span id="previewNewBalance">1,500,000 VNĐ</span>
                </div>
            </div>

            <div class="security-badge">
                <i class="fas fa-shield-alt"></i>
                <span>Giao dịch được bảo mật SSL 256-bit</span>
            </div>
        </div>
    </div>

    <script>
        let currentBalance = 1500000; // Current balance in VND

        function selectQuickAmount(amount) {
            // Remove selected class from all quick amounts
            document.querySelectorAll('.quick-amount').forEach(btn => {
                btn.classList.remove('selected');
            });
            
            // Add selected class to clicked button
            event.target.classList.add('selected');
            
            // Set the amount in input
            document.getElementById('depositAmount').value = amount;
            
            // Update preview
            updatePreview();
            
            // Enable submit button
            updateSubmitButton();
        }

        function selectMethod(method) {
            // Remove all selected classes
            document.querySelectorAll('.method-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Hide all method details
            document.querySelectorAll('.method-details').forEach(detail => {
                detail.classList.remove('active');
            });
            
            // Show selected method
            document.getElementById(method + 'Option').classList.add('selected');
            document.getElementById(method + 'Details').classList.add('active');
            document.getElementById(method).checked = true;
            
            // Update submit button
            updateSubmitButton();
        }

        function updatePreview() {
            const amount = parseFloat(document.getElementById('depositAmount').value) || 0;
            const fee = amount * 0.01; // 1% transaction fee
            const newBalance = currentBalance + amount;
            
            if (amount > 0) {
                document.getElementById('previewAmount').textContent = formatCurrency(amount);
                document.getElementById('previewFee').textContent = formatCurrency(fee);
                document.getElementById('previewNewBalance').textContent = formatCurrency(newBalance);
                document.getElementById('transactionPreview').style.display = 'block';
            } else {
                document.getElementById('transactionPreview').style.display = 'none';
            }
        }

        function updateSubmitButton() {
            const amount = parseFloat(document.getElementById('depositAmount').value) || 0;
            const method = document.querySelector('input[name="depositMethod"]:checked');
            const submitBtn = document.getElementById('submitBtn');
            
            if (amount >= 10000 && method) {
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<i class="fas fa-plus-circle"></i> Nạp ' + formatCurrency(amount) + ' vào ví';
            } else {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-plus-circle"></i> Nạp tiền vào ví';
            }
        }

        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN').format(amount) + ' VNĐ';
        }

        function processDeposit() {
            const amount = parseFloat(document.getElementById('depositAmount').value);
            const method = document.querySelector('input[name="depositMethod"]:checked');
            
            if (!amount || amount < 10000) {
                alert('Số tiền nạp tối thiểu là 10,000 VNĐ!');
                return;
            }
            
            if (!method) {
                alert('Vui lòng chọn phương thức nạp tiền!');
                return;
            }

            // Validate form based on selected method
            if (method.value === 'bank') {
                const cardNumber = document.getElementById('cardNumber').value;
                const expiryDate = document.getElementById('expiryDate').value;
                const cvv = document.getElementById('cvv').value;
                const cardName = document.getElementById('cardName').value;

                if (!cardNumber || !expiryDate || !cvv || !cardName) {
                    alert('Vui lòng điền đầy đủ thông tin thẻ ngân hàng!');
                    return;
                }
            }

            if (method.value === 'momo') {
                const momoPhone = document.getElementById('momoPhone').value;
                if (!momoPhone) {
                    alert('Vui lòng nhập số điện thoại MoMo!');
                    return;
                }
            }

            // Simulate processing
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
            submitBtn.disabled = true;

            setTimeout(() => {
                // Update balance
                currentBalance += amount;
                document.getElementById('currentBalance').textContent = formatCurrency(currentBalance);
                
                // Success message