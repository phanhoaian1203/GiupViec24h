<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User, model.Wallet, model.WithdrawalRequest, model.PaymentMethod, java.util.List, java.text.NumberFormat, java.util.Locale" %>
<%
    User user = (User) request.getAttribute("user");
    Wallet wallet = (Wallet) request.getAttribute("wallet");
    List<PaymentMethod> verifiedPaymentMethods = (List<PaymentMethod>) request.getAttribute("verifiedPaymentMethods");
    List<WithdrawalRequest> withdrawalHistory = (List<WithdrawalRequest>) request.getAttribute("withdrawalHistory");
    
    NumberFormat vnCurrency = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
    
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    
    // Clear messages after displaying
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rút Tiền - Giúp Việc 24H</title>
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        .page-header {
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

        /* Alerts */
        .alert {
            padding: 0.875rem 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            border-left: 4px solid;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
        }

        .alert-success {
            background: #f0fdf4;
            color: #15803d;
            border-color: #c0a987;
        }

        .alert-error {
            background: #fef2f2;
            color: #dc2626;
            border-color: #dc3545;
        }

        /* Main Layout */
        .main-layout {
            display: grid;
            grid-template-columns: 1fr 350px;
            gap: 2rem;
            margin-bottom: 2rem;
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

        /* Balance card */
        .balance-card {
            background: linear-gradient(135deg, #c0a987 0%, #a68e6e 100%);
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .balance-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 30% 70%, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
            pointer-events: none;
        }

        .balance-amount {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .balance-label {
            font-size: 0.95rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        /* Form styles */
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

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e2e8f0;
            border-radius: 6px;
            font-size: 0.95rem;
            transition: border-color 0.2s ease;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #c0a987;
        }

        .btn {
            background: linear-gradient(135deg, #c0a987, #a68e6e);
            color: white;
            border: none;
            padding: 0.75rem 1.25rem;
            border-radius: 6px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn:hover {
            background: linear-gradient(135deg, #a68e6e, #8f7860);
            transform: translateY(-1px);
        }

        .btn:disabled {
            background: #94a3b8;
            cursor: not-allowed;
            transform: none;
        }

        .btn-secondary {
            background: #6b7280;
            margin-left: 0.75rem;
        }

        .btn-secondary:hover {
            background: #4b5563;
        }

        /* Fee calculation */
        .fee-info {
            background: #f8fafc;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
            border-left: 4px solid #c0a987;
        }

        .fee-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .fee-row:last-child {
            margin-bottom: 0;
            padding-top: 0.5rem;
            border-top: 1px solid #e2e8f0;
            font-weight: 600;
        }

        /* Payment methods */
        .payment-method-card {
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 0.75rem;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .payment-method-card:hover {
            border-color: #c0a987;
        }

        .payment-method-card.selected {
            border-color: #c0a987;
            background: rgba(192, 169, 135, 0.05);
        }

        .payment-method-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .payment-method-icon {
            width: 36px;
            height: 36px;
            background: linear-gradient(135deg, #c0a987, #a68e6e);
            color: white;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
        }

        .payment-method-details h4 {
            font-weight: 600;
            margin-bottom: 0.25rem;
            font-size: 0.9rem;
        }

        .payment-method-details p {
            color: #64748b;
            font-size: 0.8rem;
            margin-bottom: 0.25rem;
        }

        .default-badge {
            color: #c0a987;
            font-weight: 600;
            font-size: 0.7rem;
            background: rgba(192, 169, 135, 0.1);
            padding: 0.125rem 0.375rem;
            border-radius: 4px;
            display: inline-block;
        }

        /* History table */
        .history-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .history-table th,
        .history-table td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
            font-size: 0.85rem;
        }

        .history-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .history-table td {
            color: #64748b;
        }

        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.5rem;
            border-radius: 12px;
            font-size: 0.7rem;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-processing {
            background: #dbeafe;
            color: #1e40af;
        }

        .status-completed {
            background: #d1fae5;
            color: #065f46;
        }

        .status-rejected {
            background: #fecaca;
            color: #991b1b;
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 2rem;
            color: #64748b;
        }

        .empty-state i {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            color: #cbd5e0;
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

        .modal-content h3 {
            margin-bottom: 1rem;
            font-size: 1.125rem;
            font-weight: 600;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .main-layout {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .payment-method-info {
                flex-direction: column;
                text-align: center;
                gap: 0.5rem;
            }

            .nav {
                padding: 1rem;
            }

            .nav-links {
                flex-wrap: wrap;
                gap: 0.5rem;
            }

            .btn-secondary {
                margin-left: 0;
                margin-top: 0.5rem;
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
            <h1>Rút Tiền Từ Ví</h1>
            <p>Rút tiền về tài khoản ngân hàng của bạn</p>
        </div>

        <!-- Success/Error Messages -->
        <% if (successMessage != null) { %>
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            <%= successMessage %>
        </div>
        <% } %>

        <% if (errorMessage != null) { %>
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            <%= errorMessage %>
        </div>
        <% } %>

        <!-- Balance Card -->
        <% if (wallet != null) { %>
        <div class="card balance-card">
            <div class="balance-amount"><%= vnCurrency.format(wallet.getAvailableBalance()) %></div>
            <div class="balance-label">Số dư khả dụng</div>
        </div>
        <% } %>

        <div class="main-layout">
            <div class="left-section">
                <!-- Withdraw Form -->
                <div class="card">
                    <h3>Yêu cầu rút tiền</h3>
                    
                    <% if (verifiedPaymentMethods != null && !verifiedPaymentMethods.isEmpty()) { %>
                    <form action="<%= request.getContextPath() %>/wallet/withdraw" method="post" id="withdrawForm">
                        <input type="hidden" name="action" value="request_withdraw">
                        
                        <div class="form-group">
                            <label for="amount">Số tiền cần rút (VNĐ)</label>
                            <input type="text" 
                                   id="amount" 
                                   name="amount" 
                                   placeholder="Nhập số tiền (tối thiểu 50,000 VNĐ)"
                                   pattern="[0-9,]+"
                                   required>
                            <input type="hidden" id="actualAmount" name="actualAmount">
                        </div>

                        <div class="form-group">
                            <label>Chọn phương thức nhận tiền</label>
                            <% for (PaymentMethod method : verifiedPaymentMethods) { %>
                            <div class="payment-method-card" onclick="selectPaymentMethod(<%= method.getMethodId() %>)">
                                <input type="radio" name="paymentMethodId" value="<%= method.getMethodId() %>" id="method_<%= method.getMethodId() %>" style="display: none;">
                                <div class="payment-method-info">
                                    <div class="payment-method-icon">
                                        <i class="fas fa-university"></i>
                                    </div>
                                    <div class="payment-method-details">
                                        <h4><%= method.getMethodName() %></h4>
                                        <p><%= method.getBankName() %> - **** **** **** <%= method.getAccountNumber().substring(Math.max(0, method.getAccountNumber().length() - 4)) %></p>
                                        <p><%= method.getAccountHolderName() %></p>
                                        <% if (method.isDefault()) { %>
                                        <span class="default-badge">✓ MẶC ĐỊNH</span>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>

                        <div class="form-group">
                            <label for="note">Ghi chú (tùy chọn)</label>
                            <textarea name="note" id="note" rows="3" placeholder="Ghi chú về yêu cầu rút tiền..."></textarea>
                        </div>

                        <!-- Fee Calculation -->
                        <div class="fee-info" id="feeInfo" style="display: none;">
                            <h4 style="margin-bottom: 0.75rem; font-size: 0.95rem;">Chi tiết giao dịch:</h4>
                            <div class="fee-row">
                                <span>Số tiền rút:</span>
                                <span id="withdrawAmount">0 VNĐ</span>
                            </div>
                            <div class="fee-row">
                                <span>Phí giao dịch (0.5%):</span>
                                <span id="feeAmount">0 VNĐ</span>
                            </div>
                            <div class="fee-row">
                                <span>Số tiền nhận được:</span>
                                <span id="netAmount">0 VNĐ</span>
                            </div>
                        </div>

                        <div style="margin-top: 1.5rem;">
                            <button type="submit" class="btn">
                                <i class="fas fa-paper-plane"></i>
                                Gửi yêu cầu rút tiền
                            </button>
                            <a href="<%= request.getContextPath() %>/wallet" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i>
                                Quay lại ví
                            </a>
                        </div>
                    </form>
                    <% } else { %>
                    <div class="empty-state">
                        <i class="fas fa-credit-card"></i>
                        <p>Bạn chưa có phương thức thanh toán nào được xác minh.</p>
                        <button onclick="showAddPaymentMethodModal()" class="btn" style="margin-top: 1rem;">
                            <i class="fas fa-plus"></i>
                            Thêm phương thức thanh toán
                        </button>
                    </div>
                    <% } %>
                </div>

                <!-- Withdrawal History -->
                <div class="card">
                    <h3>Lịch sử rút tiền</h3>
                    
                    <% if (withdrawalHistory != null && !withdrawalHistory.isEmpty()) { %>
                    <div style="overflow-x: auto;">
                        <table class="history-table">
                            <thead>
                                <tr>
                                    <th>Thời gian</th>
                                    <th>Số tiền</th>
                                    <th>Phí</th>
                                    <th>Nhận được</th>
                                    <th>Ngân hàng</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (WithdrawalRequest withdrawal : withdrawalHistory) { %>
                                <tr>
                                    <td>
                                        <%= withdrawal.getRequestedAt() != null ? 
                                            withdrawal.getRequestedAt().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) : 
                                            "" %>
                                    </td>
                                    <td><%= vnCurrency.format(withdrawal.getAmount()) %></td>
                                    <td><%= vnCurrency.format(withdrawal.getFee()) %></td>
                                    <td><%= vnCurrency.format(withdrawal.getNetAmount()) %></td>
                                    <td>
                                        <%= withdrawal.getBankName() != null ? withdrawal.getBankName() : "" %>
                                        <% if (withdrawal.getAccountNumber() != null) { %>
                                            <br><small>**** <%= withdrawal.getAccountNumber().substring(Math.max(0, withdrawal.getAccountNumber().length() - 4)) %></small>
                                        <% } %>
                                    </td>
                                    <td>
                                        <span class="status-badge status-<%= withdrawal.getWithdrawalStatus() %>">
                                            <%= withdrawal.getWithdrawalStatus().toUpperCase() %>
                                        </span>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } else { %>
                    <div class="empty-state">
                        <i class="fas fa-history"></i>
                        <p>Chưa có lịch sử rút tiền nào</p>
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="right-section">
                <!-- Payment Method Management -->
                <div class="card">
                    <h3>Phương thức thanh toán</h3>
                    
                    <% if (verifiedPaymentMethods != null && !verifiedPaymentMethods.isEmpty()) { %>
                        <% for (PaymentMethod method : verifiedPaymentMethods) { %>
                        <div class="payment-method-card">
                            <div class="payment-method-info">
                                <div class="payment-method-icon">
                                    <i class="fas fa-university"></i>
                                </div>
                                <div class="payment-method-details">
                                    <h4><%= method.getMethodName() %></h4>
                                    <p><%= method.getBankName() %> - <%= method.getMaskedAccountNumber() %></p>
                                    <p><%= method.getAccountHolderName() %></p>
                                    <% if (method.isDefault()) { %>
                                    <span class="default-badge">✓ MẶC ĐỊNH</span>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    <% } %>

                    <button onclick="showAddPaymentMethodModal()" class="btn" style="width: 100%; margin-top: 1rem;">
                        <i class="fas fa-plus"></i>
                        Thêm phương thức thanh toán mới
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Payment Method Modal -->
    <div class="modal" id="addPaymentMethodModal">
        <div class="modal-content">
            <h3>Thêm phương thức thanh toán</h3>
            
            <form action="<%= request.getContextPath() %>/wallet/withdraw" method="post">
                <input type="hidden" name="action" value="add_payment_method">
                
                <div class="form-group">
                    <label for="methodName">Tên phương thức</label>
                    <input type="text" name="methodName" id="methodName" placeholder="Ví dụ: Tài khoản chính" required>
                </div>
                
                <div class="form-group">
                    <label for="bankName">Tên ngân hàng</label>
                    <select name="bankName" id="bankName" required>
                        <option value="">Chọn ngân hàng</option>
                        <option value="Vietcombank">Vietcombank</option>
                        <option value="VietinBank">VietinBank</option>
                        <option value="BIDV">BIDV</option>
                        <option value="Agribank">Agribank</option>
                        <option value="Techcombank">Techcombank</option>
                        <option value="MBBank">MBBank</option>
                        <option value="ACB">ACB</option>
                        <option value="VPBank">VPBank</option>
                        <option value="TPBank">TPBank</option>
                        <option value="Sacombank">Sacombank</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="accountNumber">Số tài khoản</label>
                    <input type="text" name="accountNumber" id="accountNumber" placeholder="Nhập số tài khoản" required>
                </div>
                
                <div class="form-group">
                    <label for="accountHolderName">Tên chủ tài khoản</label>
                    <input type="text" name="accountHolderName" id="accountHolderName" placeholder="Tên theo CMND/CCCD" required>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" name="isDefault" style="margin-right: 0.5rem;"> Đặt làm phương thức mặc định
                    </label>
                </div>
                
                <div style="display: flex; gap: 0.75rem; margin-top: 1.5rem;">
                    <button type="submit" class="btn">
                        <i class="fas fa-plus"></i>
                        Thêm phương thức
                    </button>
                    <button type="button" onclick="hideAddPaymentMethodModal()" class="btn btn-secondary">
                        Hủy
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Format number with thousand separators
        function formatNumber(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        }
        
        // Remove formatting from number
        function unformatNumber(str) {
            return str.replace(/,/g, '');
        }
        
        // Calculate fee (0.5% with min 5,000 and max 50,000)
        function calculateFee(amount) {
            const feePercentage = 0.005; // 0.5%
            const minFee = 5000;
            const maxFee = 50000;
            
            let fee = amount * feePercentage;
            
            if (fee < minFee) fee = minFee;
            if (fee > maxFee) fee = maxFee;
            
            return Math.round(fee);
        }
        
        // Format currency
        function formatCurrency(amount) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(amount);
        }
        
        // Handle amount input
        document.getElementById('amount').addEventListener('input', function(e) {
            let value = e.target.value;
            value = value.replace(/[^\d,]/g, '');
            let numericValue = unformatNumber(value);
            
            if (numericValue && !isNaN(numericValue)) {
                let formattedValue = formatNumber(numericValue);
                e.target.value = formattedValue;
                document.getElementById('actualAmount').value = numericValue;
                
                const amount = parseInt(numericValue);
                if (amount >= 50000) {
                    const fee = calculateFee(amount);
                    const netAmount = amount - fee;
                    
                    document.getElementById('withdrawAmount').textContent = formatCurrency(amount);
                    document.getElementById('feeAmount').textContent = formatCurrency(fee);
                    document.getElementById('netAmount').textContent = formatCurrency(netAmount);
                    document.getElementById('feeInfo').style.display = 'block';
                } else {
                    document.getElementById('feeInfo').style.display = 'none';
                }
            } else {
                document.getElementById('actualAmount').value = '';
                document.getElementById('feeInfo').style.display = 'none';
            }
        });
        
        // Select payment method
        function selectPaymentMethod(methodId) {
            document.querySelectorAll('.payment-method-card').forEach(card => {
                card.classList.remove('selected');
            });
            
            event.currentTarget.classList.add('selected');
            document.getElementById('method_' + methodId).checked = true;
        }
        
        // Modal functions
        function showAddPaymentMethodModal() {
            document.getElementById('addPaymentMethodModal').classList.add('active');
            document.body.style.overflow = 'hidden';
        }
        
        function hideAddPaymentMethodModal() {
            document.getElementById('addPaymentMethodModal').classList.remove('active');
            document.body.style.overflow = 'auto';
        }
        
        // Close modal when clicking outside
        document.getElementById('addPaymentMethodModal').addEventListener('click', function(e) {
            if (e.target === this) {
                hideAddPaymentMethodModal();
            }
        });
        
        // Form validation
        document.getElementById('withdrawForm').addEventListener('submit', function(e) {
            const amount = parseInt(document.getElementById('actualAmount').value || unformatNumber(document.getElementById('amount').value));
            const selectedMethod = document.querySelector('input[name="paymentMethodId"]:checked');
            
            if (!amount || isNaN(amount)) {
                e.preventDefault();
                alert('Vui lòng nhập số tiền hợp lệ');
                return false;
            }
            
            if (amount < 50000) {
                e.preventDefault();
                alert('Số tiền rút tối thiểu là 50,000 VNĐ');
                return false;
            }
            
            if (amount > 10000000) {
                e.preventDefault();
                alert('Số tiền rút tối đa là 10,000,000 VNĐ');
                return false;
            }
            
            if (!selectedMethod) {
                e.preventDefault();
                alert('Vui lòng chọn phương thức nhận tiền');
                return false;
            }
            
            document.getElementById('amount').value = amount;
            
            const submitBtn = this.querySelector('button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
            }
            
            return true;
        });
        
        console.log('✅ Wallet withdraw page loaded successfully');
    </script>
</body>
</html>