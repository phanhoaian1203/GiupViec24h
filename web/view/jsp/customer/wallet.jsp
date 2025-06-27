<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User, model.Wallet, model.DepositRequest, java.util.List, java.text.NumberFormat, java.util.Locale" %>
<%
    User user = (User) request.getAttribute("user");
    Wallet wallet = (Wallet) request.getAttribute("wallet");
    List<DepositRequest> depositHistory = (List<DepositRequest>) request.getAttribute("depositHistory");
    
    NumberFormat vnCurrency = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
    
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    String warningMessage = (String) session.getAttribute("warningMessage");
    
    // Clear messages after displaying
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
    session.removeAttribute("warningMessage");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ví Điện Tử - Giúp Việc 24H</title>
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

        .alert-warning {
            background: #fffbeb;
            color: #d97706;
            border-color: #fbbf24;
        }

        /* Main Layout */
        .main-content {
            display: grid;
            grid-template-columns: 1fr 400px;
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

        /* Balance Overview */
        .balance-overview {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }

        .balance-item {
            text-align: center;
            padding: 1rem;
            border-radius: 8px;
            background: linear-gradient(135deg, #c0a987 0%, #a68e6e 100%);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .balance-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 30% 70%, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
            pointer-events: none;
        }

        .balance-item .icon {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            opacity: 0.9;
        }

        .balance-item .amount {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }

        .balance-item .label {
            font-size: 0.8rem;
            opacity: 0.9;
        }

        /* Action Buttons */
        .action-buttons {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1rem;
        }

        .action-btn {
            padding: 1rem;
            text-align: center;
            background: white;
            border: 2px solid #c0a987;
            border-radius: 8px;
            text-decoration: none;
            color: #c0a987;
            font-weight: 600;
            transition: all 0.2s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }

        .action-btn:hover {
            background: #c0a987;
            color: white;
            transform: translateY(-1px);
        }

        .action-btn i {
            font-size: 1.25rem;
        }

        /* Deposit Form */
        .deposit-form {
            display: none;
        }

        .deposit-form.active {
            display: block;
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

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e2e8f0;
            border-radius: 6px;
            font-size: 0.95rem;
            transition: border-color 0.2s ease;
        }

        .form-group input:focus {
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

        .btn-secondary {
            background: #6b7280;
            margin-left: 0.75rem;
        }

        .btn-secondary:hover {
            background: #4b5563;
        }

        /* Transaction History */
        .transaction-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .transaction-table th,
        .transaction-table td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
            font-size: 0.85rem;
        }

        .transaction-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .transaction-table td {
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

        .status-approved {
            background: #d1fae5;
            color: #065f46;
        }

        .status-rejected {
            background: #fecaca;
            color: #991b1b;
        }

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

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .main-content {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .balance-overview {
                grid-template-columns: repeat(2, 1fr);
            }

            .action-buttons {
                grid-template-columns: 1fr;
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

        /* Validation styles */
        .validation-error {
            color: #dc2626;
            font-size: 0.8rem;
            margin-top: 0.25rem;
            padding: 0.5rem;
            background: #fef2f2;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .validation-success {
            color: #059669;
            font-size: 0.8rem;
            margin-top: 0.25rem;
            padding: 0.5rem;
            background: #f0fdf4;
            border-radius: 4px;
            display: flex;
            align-items: center;
            gap: 0.25rem;
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
            <h1>Ví Điện Tử</h1>
            <p>Quản lý số dư và giao dịch của bạn</p>
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

        <% if (warningMessage != null) { %>
        <div class="alert alert-warning">
            <i class="fas fa-exclamation-triangle"></i>
            <%= warningMessage %>
        </div>
        <% } %>

        <div class="main-content">
            <div class="left-section">
                <!-- Wallet Overview -->
                <% if (wallet != null) { %>
                <div class="card">
                    <h3>Tổng quan tài khoản</h3>
                    <div class="balance-overview">
                        <div class="balance-item">
                            <div class="icon"><i class="fas fa-wallet"></i></div>
                            <div class="amount"><%= vnCurrency.format(wallet.getBalance()) %></div>
                            <div class="label">Số dư khả dụng</div>
                        </div>
                        <div class="balance-item">
                            <div class="icon"><i class="fas fa-arrow-down"></i></div>
                            <div class="amount"><%= vnCurrency.format(wallet.getTotalDeposited()) %></div>
                            <div class="label">Tổng đã nạp</div>
                        </div>
                        <div class="balance-item">
                            <div class="icon"><i class="fas fa-arrow-up"></i></div>
                            <div class="amount"><%= vnCurrency.format(wallet.getTotalWithdrawn()) %></div>
                            <div class="label">Tổng đã rút</div>
                        </div>
                    </div>
                </div>
                <% } else { %>
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    Không tìm thấy thông tin ví. Vui lòng thử lại sau.
                </div>
                <% } %>

                <!-- Transaction History -->
                <div class="card">
                    <h3>Lịch Sử Nạp Tiền</h3>
                    
                    <% if (depositHistory != null && !depositHistory.isEmpty()) { %>
                    <div style="overflow-x: auto;">
                        <table class="transaction-table">
                            <thead>
                                <tr>
                                    <th>Mã GD</th>
                                    <th>Số Tiền</th>
                                    <th>Trạng Thái</th>
                                    <th>Thời Gian</th>
                                    <th>Ghi Chú</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (DepositRequest deposit : depositHistory) { %>
                                <tr>
                                    <td><%= deposit.getGatewayTransactionId() %></td>
                                    <td><%= vnCurrency.format(deposit.getAmount()) %></td>
                                    <td>
                                        <span class="status-badge status-<%= deposit.getDepositStatus() %>">
                                            <%= deposit.getDepositStatus().toUpperCase() %>
                                        </span>
                                    </td>
                                    <td>
                                        <%= deposit.getRequestedAt() != null ? 
                                            deposit.getRequestedAt().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) : 
                                            "" %>
                                    </td>
                                    <td>
                                        <%= deposit.getAdminNote() != null ? deposit.getAdminNote() : "" %>
                                        <% if (deposit.getRejectionReason() != null) { %>
                                            <br><span style="color: #dc2626; font-size: 0.75rem;">
                                                Lý do từ chối: <%= deposit.getRejectionReason() %>
                                            </span>
                                        <% } %>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } else { %>
                    <div class="empty-state">
                        <i class="fas fa-receipt"></i>
                        <p>Chưa có giao dịch nạp tiền nào</p>
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="right-section">
                <!-- Action Buttons -->
                <div class="card">
                    <h3>Thao tác nhanh</h3>
                    <div class="action-buttons">
                        <a href="javascript:void(0)" class="action-btn" onclick="showDepositForm()">
                            <i class="fas fa-plus-circle"></i>
                            <span>Nạp Tiền</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/wallet/withdraw" class="action-btn">
                            <i class="fas fa-minus-circle"></i>
                            <span>Rút Tiền</span>
                        </a>
                        <a href="#transaction-history" class="action-btn">
                            <i class="fas fa-history"></i>
                            <span>Lịch Sử</span>
                        </a>
                    </div>
                </div>

                <!-- Deposit Form -->
                <div class="card deposit-form" id="depositForm">
                    <h3>Nạp Tiền Vào Ví</h3>
                    <form action="<%= request.getContextPath() %>/wallet" method="post" id="depositFormElement">
                        <input type="hidden" name="action" value="create_qr">
                        
                        <div class="form-group">
                            <label for="amount">Số tiền cần nạp (VNĐ)</label>
                            <input type="text" 
                                   id="amount" 
                                   name="amount" 
                                   placeholder="Nhập số tiền (tối thiểu 10,000 VNĐ)"
                                   pattern="[0-9,]+"
                                   required>
                            <input type="hidden" id="actualAmount" name="actualAmount">
                        </div>

                        <div class="form-group">
                            <p style="color: #64748b; font-size: 0.85rem;">
                                <i class="fas fa-info-circle"></i>
                                Số tiền nạp từ 10,000 VNĐ đến 50,000,000 VNĐ
                            </p>
                        </div>

                        <button type="submit" class="btn">
                            <i class="fas fa-qrcode"></i>
                            Tạo Mã QR Thanh Toán
                        </button>
                        <button type="button" class="btn btn-secondary" onclick="hideDepositForm()">
                            Hủy
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const amountInput = document.getElementById('amount');
            const actualAmountInput = document.getElementById('actualAmount');
            const depositForm = document.getElementById('depositFormElement');
            
            // Format number with thousand separators
            function formatNumber(num) {
                return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            }
            
            // Remove formatting from number
            function unformatNumber(str) {
                return str.replace(/,/g, '');
            }
            
            // Handle input formatting
            amountInput.addEventListener('input', function(e) {
                let value = e.target.value;
                value = value.replace(/[^\d,]/g, '');
                let numericValue = unformatNumber(value);
                
                if (numericValue && !isNaN(numericValue)) {
                    let formattedValue = formatNumber(numericValue);
                    e.target.value = formattedValue;
                    actualAmountInput.value = numericValue;
                    
                    // Real-time validation
                    const messageElement = document.getElementById('validationMessage');
                    if (messageElement) {
                        messageElement.remove();
                    }
                    
                    let message = '';
                    let messageClass = '';
                    
                    const amount = parseInt(numericValue);
                    if (amount < 10000) {
                        message = 'Số tiền tối thiểu là 10,000 VNĐ';
                        messageClass = 'validation-error';
                    } else if (amount > 50000000) {
                        message = 'Số tiền tối đa là 50,000,000 VNĐ';
                        messageClass = 'validation-error';
                    } else {
                        message = 'Số tiền hợp lệ ✓';
                        messageClass = 'validation-success';
                    }
                    
                    const msgDiv = document.createElement('div');
                    msgDiv.id = 'validationMessage';
                    msgDiv.className = messageClass;
                    msgDiv.innerHTML = `<i class="fas fa-${amount >= 10000 && amount <= 50000000 ? 'check-circle' : 'exclamation-triangle'}"></i> ${message}`;
                    
                    e.target.parentNode.appendChild(msgDiv);
                } else if (value === '') {
                    actualAmountInput.value = '';
                    const messageElement = document.getElementById('validationMessage');
                    if (messageElement) {
                        messageElement.remove();
                    }
                }
            });
            
            // Handle form submission
            depositForm.addEventListener('submit', function(e) {
                const amount = parseInt(actualAmountInput.value || unformatNumber(amountInput.value));
                
                if (!amount || isNaN(amount)) {
                    e.preventDefault();
                    alert('Vui lòng nhập số tiền hợp lệ');
                    return false;
                }
                
                if (amount < 10000) {
                    e.preventDefault();
                    alert('Số tiền nạp tối thiểu là 10,000 VNĐ');
                    return false;
                }
                
                if (amount > 50000000) {
                    e.preventDefault();
                    alert('Số tiền nạp tối đa là 50,000,000 VNĐ');
                    return false;
                }
                
                amountInput.value = amount;
                
                const submitBtn = this.querySelector('button[type="submit"]');
                if (submitBtn) {
                    submitBtn.disabled = true;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
                }
                
                return true;
            });
        });

        function showDepositForm() {
            document.getElementById('depositForm').classList.add('active');
            document.getElementById('depositForm').scrollIntoView({ behavior: 'smooth' });
            setTimeout(() => {
                document.getElementById('amount').focus();
            }, 300);
        }

        function hideDepositForm() {
            document.getElementById('depositForm').classList.remove('active');
            document.getElementById('depositFormElement').reset();
            document.getElementById('actualAmount').value = '';
            const messageElement = document.getElementById('validationMessage');
            if (messageElement) {
                messageElement.remove();
            }
        }

        console.log('✅ Wallet page loaded successfully');
    </script>
</body>
</html>