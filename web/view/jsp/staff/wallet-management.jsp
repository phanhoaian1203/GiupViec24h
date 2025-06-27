<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DepositRequest, model.WithdrawalRequest, java.util.List, java.text.NumberFormat, java.util.Locale" %>
<%
    List<DepositRequest> pendingDeposits = (List<DepositRequest>) request.getAttribute("pendingDeposits");
    List<WithdrawalRequest> pendingWithdrawals = (List<WithdrawalRequest>) request.getAttribute("pendingWithdrawals");
    Integer pendingDepositCount = (Integer) request.getAttribute("pendingDepositCount");
    Integer pendingWithdrawalCount = (Integer) request.getAttribute("pendingWithdrawalCount");
    
    NumberFormat vnCurrency = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
    
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    String warningMessage = (String) session.getAttribute("warningMessage");
    
    // Clear messages
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
    session.removeAttribute("warningMessage");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Ví Điện Tử - Staff Enhanced</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

        .content {
            padding: 2rem;
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

        /* Alerts */
        .alert {
            padding: 1rem 1.5rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            border-left: 4px solid;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border-color: #28a745;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border-color: #dc3545;
        }

        .alert-warning {
            background: #fff3cd;
            color: #856404;
            border-color: #ffc107;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(226, 232, 240, 0.5);
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
        }

        .stat-card .icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            margin-bottom: 1rem;
        }

        .stat-card.pending .icon {
            background: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .stat-card.withdrawal .icon {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
        }

        .stat-card h3 {
            font-size: 1.8rem;
            font-weight: 800;
            color: #1a202c;
            margin-bottom: 0.5rem;
        }

        .stat-card p {
            color: #64748b;
            font-weight: 500;
        }

        /* Table Styles */
        .table-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .table-header {
            padding: 1.5rem;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-header h3 {
            font-size: 1.3rem;
            font-weight: 700;
            color: #1a202c;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th,
        .data-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        .data-table th {
            background: #f8fafc;
            font-weight: 600;
            color: #374151;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .data-table td {
            color: #64748b;
        }

        .data-table tr:hover {
            background: #f8fafc;
        }

        /* ✅ ENHANCED: Wallet balance display */
        .wallet-balance {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            margin-top: 0.25rem;
            display: inline-block;
        }

        /* ✅ ENHANCED: Bank account info display */
        .bank-info {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 0.75rem;
            margin-top: 0.5rem;
            font-size: 0.85rem;
        }

        .bank-info .bank-name {
            font-weight: 600;
            color: #1a202c;
            margin-bottom: 0.25rem;
        }

        .bank-info .account-details {
            color: #64748b;
        }

        .bank-info .copy-btn {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.75rem;
            cursor: pointer;
            margin-left: 0.5rem;
        }

        .bank-info .copy-btn:hover {
            background: #2563eb;
        }

        /* Status Badge */
        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }

        .btn-approve {
            background: #10b981;
            color: white;
        }

        .btn-approve:hover {
            background: #059669;
        }

        .btn-reject {
            background: #ef4444;
            color: white;
        }

        .btn-reject:hover {
            background: #dc2626;
        }

        /* Modal Styles */
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
            padding: 2rem;
            max-width: 500px;
            width: 90%;
            max-height: 80vh;
            overflow-y: auto;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .modal-header h3 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a202c;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #64748b;
        }

        .close-btn:hover {
            color: #374151;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #374151;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e5e7eb;
            border-radius: 6px;
            font-size: 0.875rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #3b82f6;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }

        .modal-actions {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            margin-top: 2rem;
        }

        .btn-modal {
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-modal-primary {
            background: #3b82f6;
            color: white;
        }

        .btn-modal-primary:hover {
            background: #2563eb;
        }

        .btn-modal-secondary {
            background: #f3f4f6;
            color: #374151;
        }

        .btn-modal-secondary:hover {
            background: #e5e7eb;
        }

        .btn-modal-danger {
            background: #ef4444;
            color: white;
        }

        .btn-modal-danger:hover {
            background: #dc2626;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #64748b;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #cbd5e0;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .content {
                padding: 1rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .data-table {
                font-size: 0.8rem;
            }

            .data-table th,
            .data-table td {
                padding: 0.5rem;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="/view/common/staff/staff-sidebar.jsp" %>
        <div class="main-content">
            <div class="content">
                <div class="page-title">
                    <h1>Quản Lý Ví Điện Tử - Enhanced</h1>
                    <p>Duyệt yêu cầu nạp tiền và rút tiền của khách hàng với thông tin chi tiết</p>
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

                <!-- Stats -->
                <div class="stats-grid">
                    <div class="stat-card pending">
                        <div class="icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h3><%= pendingDepositCount != null ? pendingDepositCount : 0 %></h3>
                        <p>Yêu cầu nạp tiền chờ duyệt</p>
                    </div>

                    <div class="stat-card withdrawal">
                        <div class="icon">
                            <i class="fas fa-arrow-up"></i>
                        </div>
                        <h3><%= pendingWithdrawalCount != null ? pendingWithdrawalCount : 0 %></h3>
                        <p>Yêu cầu rút tiền chờ duyệt</p>
                    </div>
                </div>

                <!-- Pending Deposits Table -->
                <div class="table-container">
                    <div class="table-header">
                        <h3>Yêu cầu nạp tiền chờ duyệt</h3>
                    </div>
                    
                    <% if (pendingDeposits != null && !pendingDeposits.isEmpty()) { %>
                    <div class="table-wrapper">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Mã GD</th>
                                    <th>Khách hàng</th>
                                    <th>Số tiền</th>
                                    <th>Thời gian</th>
                                    <th>Trạng thái</th>
                                    <th>Ghi chú</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (DepositRequest deposit : pendingDeposits) { %>
                                <tr>
                                    <td><%= deposit.getGatewayTransactionId() %></td>
                                    <td>
                                        <strong><%= deposit.getUserFullName() %></strong><br>
                                        <small style="color: #9ca3af;"><%= deposit.getUserEmail() %></small>
                                    </td>
                                    <td><strong><%= vnCurrency.format(deposit.getAmount()) %></strong></td>
                                    <td>
                                        <%= deposit.getRequestedAt() != null ? 
                                            deposit.getRequestedAt().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) : 
                                            "" %>
                                    </td>
                                    <td>
                                        <span class="status-badge status-<%= deposit.getDepositStatus() %>">
                                            <%= deposit.getDepositStatus().toUpperCase() %>
                                        </span>
                                    </td>
                                    <td>
                                        <% if (deposit.getAdminNote() != null && !deposit.getAdminNote().trim().isEmpty()) { %>
                                            <small><%= deposit.getAdminNote().length() > 50 ? 
                                                deposit.getAdminNote().substring(0, 50) + "..." : 
                                                deposit.getAdminNote() %></small>
                                        <% } else { %>
                                            <small style="color: #9ca3af;">Chưa có ghi chú</small>
                                        <% } %>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <button class="btn btn-approve" 
                                                    onclick="approveDeposit(<%= deposit.getDepositId() %>, '<%= deposit.getGatewayTransactionId() %>', '<%= vnCurrency.format(deposit.getAmount()) %>')">
                                                <i class="fas fa-check"></i>
                                                Duyệt
                                            </button>
                                            <button class="btn btn-reject" 
                                                    onclick="rejectDeposit(<%= deposit.getDepositId() %>, '<%= deposit.getGatewayTransactionId() %>', '<%= vnCurrency.format(deposit.getAmount()) %>')">
                                                <i class="fas fa-times"></i>
                                                Từ chối
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } else { %>
                    <div class="empty-state">
                        <i class="fas fa-inbox"></i>
                        <p>Không có yêu cầu nạp tiền nào chờ duyệt</p>
                    </div>
                    <% } %>
                </div>

                <!-- ✅ ENHANCED: Pending Withdrawals Table với thông tin chi tiết -->
                <div class="table-container">
                    <div class="table-header">
                        <h3>Yêu cầu rút tiền chờ duyệt - Enhanced</h3>
                        <small style="color: #64748b;">Bao gồm thông tin số dư ví và tài khoản ngân hàng</small>
                    </div>
                    
                    <% if (pendingWithdrawals != null && !pendingWithdrawals.isEmpty()) { %>
                    <div class="table-wrapper">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Khách hàng & Số dư ví</th>
                                    <th>Số tiền</th>
                                    <th>Phí</th>
                                    <th>Nhận được</th>
                                    <th>Thông tin ngân hàng</th>
                                    <th>Thời gian</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (WithdrawalRequest withdrawal : pendingWithdrawals) { %>
                                <tr>
                                    <td>
                                        <strong><%= withdrawal.getUserFullName() %></strong><br>
                                        <small style="color: #9ca3af;"><%= withdrawal.getUserEmail().split("\\|")[0].trim() %></small>
                                        <% if (withdrawal.getUserEmail().contains("|")) { %>
                                            <div class="wallet-balance">
                                                <i class="fas fa-wallet"></i>
                                                <%= withdrawal.getUserEmail().split("\\|")[1].trim() %>
                                            </div>
                                        <% } %>
                                    </td>
                                    <td><%= vnCurrency.format(withdrawal.getAmount()) %></td>
                                    <td><%= vnCurrency.format(withdrawal.getFee()) %></td>
                                    <td><strong style="color: #10b981;"><%= vnCurrency.format(withdrawal.getNetAmount()) %></strong></td>
                                    <td>
                                        <!-- ✅ ENHANCED: Hiển thị thông tin ngân hàng chi tiết -->
                                        <div class="bank-info">
                                            <div class="bank-name">
                                                <i class="fas fa-university"></i>
                                                <%= withdrawal.getBankName() != null ? withdrawal.getBankName() : "N/A" %>
                                            </div>
                                            <div class="account-details">
                                                <strong>STK:</strong> 
                                                <span id="account_<%= withdrawal.getWithdrawalId() %>">
                                                    <%= withdrawal.getAccountNumber() != null ? withdrawal.getAccountNumber() : "N/A" %>
                                                </span>
                                                <% if (withdrawal.getAccountNumber() != null) { %>
                                                    <button class="copy-btn" onclick="copyToClipboard('account_<%= withdrawal.getWithdrawalId() %>')">
                                                        <i class="fas fa-copy"></i>
                                                    </button>
                                                <% } %>
                                                <br>
                                                <strong>Chủ TK:</strong> 
                                                <span id="holder_<%= withdrawal.getWithdrawalId() %>">
                                                    <%= withdrawal.getAccountHolderName() != null ? withdrawal.getAccountHolderName() : "N/A" %>
                                                </span>
                                                <% if (withdrawal.getAccountHolderName() != null) { %>
                                                    <button class="copy-btn" onclick="copyToClipboard('holder_<%= withdrawal.getWithdrawalId() %>')">
                                                        <i class="fas fa-copy"></i>
                                                    </button>
                                                <% } %>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <%= withdrawal.getRequestedAt() != null ? 
                                            withdrawal.getRequestedAt().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) : 
                                            "" %>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <button class="btn btn-approve" 
                                                    onclick="approveWithdrawal(<%= withdrawal.getWithdrawalId() %>, '<%= vnCurrency.format(withdrawal.getNetAmount()) %>', '<%= withdrawal.getBankName() %>', '<%= withdrawal.getAccountNumber() %>', '<%= withdrawal.getAccountHolderName() %>')">
                                                <i class="fas fa-check"></i>
                                                Đã chuyển khoản
                                            </button>
                                            <button class="btn btn-reject" 
                                                    onclick="rejectWithdrawal(<%= withdrawal.getWithdrawalId() %>, '<%= vnCurrency.format(withdrawal.getAmount()) %>')">
                                                <i class="fas fa-times"></i>
                                                Từ chối
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    <% } else { %>
                    <div class="empty-state">
                        <i class="fas fa-arrow-up"></i>
                        <p>Không có yêu cầu rút tiền nào chờ duyệt</p>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <!-- Approve Deposit Modal -->
    <div class="modal" id="approveDepositModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Duyệt yêu cầu nạp tiền</h3>
                <button type="button" class="close-btn" onclick="closeModal('approveDepositModal')">&times;</button>
            </div>
            <form action="<%= request.getContextPath() %>/staff/wallet-management" method="post">
                <input type="hidden" name="action" value="approve_deposit">
                <input type="hidden" name="depositId" id="approveDepositId">
                
                <div class="form-group">
                    <label>Mã giao dịch:</label>
                    <input type="text" id="approveTransactionId" readonly>
                </div>
                
                <div class="form-group">
                    <label>Số tiền:</label>
                    <input type="text" id="approveAmount" readonly>
                </div>
                
                <div class="form-group">
                    <label for="approveNote">Ghi chú (tùy chọn):</label>
                    <textarea name="adminNote" id="approveNote" placeholder="Ghi chú về việc duyệt..."></textarea>
                </div>
                
                <div class="modal-actions">
                    <button type="button" class="btn-modal btn-modal-secondary" onclick="closeModal('approveDepositModal')">
                        Hủy
                    </button>
                    <button type="submit" class="btn-modal btn-modal-primary">
                        <i class="fas fa-check"></i>
                        Duyệt yêu cầu
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Reject Deposit Modal -->
    <div class="modal" id="rejectDepositModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Từ chối yêu cầu nạp tiền</h3>
                <button type="button" class="close-btn" onclick="closeModal('rejectDepositModal')">&times;</button>
            </div>
            <form action="<%= request.getContextPath() %>/staff/wallet-management" method="post">
                <input type="hidden" name="action" value="reject_deposit">
                <input type="hidden" name="depositId" id="rejectDepositId">
                
                <div class="form-group">
                    <label>Mã giao dịch:</label>
                    <input type="text" id="rejectTransactionId" readonly>
                </div>
                
                <div class="form-group">
                    <label>Số tiền:</label>
                    <input type="text" id="rejectAmount" readonly>
                </div>
                
                <div class="form-group">
                    <label for="rejectionReason">Lý do từ chối *:</label>
                    <textarea name="rejectionReason" id="rejectionReason" placeholder="Nhập lý do từ chối..." required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="rejectNote">Ghi chú thêm (tùy chọn):</label>
                    <textarea name="adminNote" id="rejectNote" placeholder="Ghi chú về việc từ chối..."></textarea>
                </div>
                
                <div class="modal-actions">
                    <button type="button" class="btn-modal btn-modal-secondary" onclick="closeModal('rejectDepositModal')">
                        Hủy
                    </button>
                    <button type="submit" class="btn-modal btn-modal-danger">
                        <i class="fas fa-times"></i>
                        Từ chối yêu cầu
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- ✅ ENHANCED: Approve Withdrawal Modal với thông tin ngân hàng -->
    <div class="modal" id="approveWithdrawalModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Duyệt yêu cầu rút tiền - Enhanced</h3>
                <button type="button" class="close-btn" onclick="closeModal('approveWithdrawalModal')">&times;</button>
            </div>
            <form action="<%= request.getContextPath() %>/staff/wallet-management" method="post">
                <input type="hidden" name="action" value="approve_withdrawal">
                <input type="hidden" name="withdrawalId" id="approveWithdrawalId">
                
                <div class="form-group">
                    <label>Số tiền khách hàng nhận được:</label>
                    <input type="text" id="approveWithdrawalAmount" readonly style="background: #f0fdf4; color: #166534; font-weight: bold;">
                </div>
                
                <!-- ✅ ENHANCED: Thông tin ngân hàng để staff copy -->
                <div class="form-group">
                    <label>🏦 Thông tin chuyển khoản:</label>
                    <div class="bank-info">
                        <div class="bank-name" id="modalBankName">Tên ngân hàng</div>
                        <div class="account-details">
                            <strong>Số tài khoản:</strong> 
                            <span id="modalAccountNumber">N/A</span>
                            <button type="button" class="copy-btn" onclick="copyModalField('modalAccountNumber')">
                                <i class="fas fa-copy"></i>
                            </button>
                            <br>
                            <strong>Tên chủ tài khoản:</strong> 
                            <span id="modalAccountHolder">N/A</span>
                            <button type="button" class="copy-btn" onclick="copyModalField('modalAccountHolder')">
                                <i class="fas fa-copy"></i>
                            </button>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="bankTransactionId">Mã giao dịch ngân hàng:</label>
                    <input type="text" name="bankTransactionId" id="bankTransactionId" placeholder="Nhập mã GD ngân hàng sau khi chuyển...">
                </div>
                
                <div class="form-group">
                    <label for="approveWithdrawalNote">Ghi chú (tùy chọn):</label>
                    <textarea name="adminNote" id="approveWithdrawalNote" placeholder="Ghi chú về việc duyệt..."></textarea>
                </div>
                
                <div class="modal-actions">
                    <button type="button" class="btn-modal btn-modal-secondary" onclick="closeModal('approveWithdrawalModal')">
                        Hủy
                    </button>
                    <button type="submit" class="btn-modal btn-modal-primary">
                        <i class="fas fa-check"></i>
                        Đã chuyển khoản
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Reject Withdrawal Modal -->
    <div class="modal" id="rejectWithdrawalModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Từ chối yêu cầu rút tiền</h3>
                <button type="button" class="close-btn" onclick="closeModal('rejectWithdrawalModal')">&times;</button>
            </div>
            <form action="<%= request.getContextPath() %>/staff/wallet-management" method="post">
                <input type="hidden" name="action" value="reject_withdrawal">
                <input type="hidden" name="withdrawalId" id="rejectWithdrawalId">
                
                <div class="form-group">
                    <label>Số tiền:</label>
                    <input type="text" id="rejectWithdrawalAmount" readonly>
                </div>
                
                <div class="form-group">
                    <label for="withdrawalRejectionReason">Lý do từ chối *:</label>
                    <textarea name="rejectionReason" id="withdrawalRejectionReason" placeholder="Nhập lý do từ chối..." required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="rejectWithdrawalNote">Ghi chú thêm (tùy chọn):</label>
                    <textarea name="adminNote" id="rejectWithdrawalNote" placeholder="Ghi chú về việc từ chối..."></textarea>
                </div>
                
                <div class="modal-actions">
                    <button type="button" class="btn-modal btn-modal-secondary" onclick="closeModal('rejectWithdrawalModal')">
                        Hủy
                    </button>
                    <button type="submit" class="btn-modal btn-modal-danger">
                        <i class="fas fa-times"></i>
                        Từ chối yêu cầu
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // ===== ENHANCED JAVASCRIPT FUNCTIONS =====
        
        // Deposit functions
        function approveDeposit(depositId, transactionId, amount) {
            document.getElementById('approveDepositId').value = depositId;
            document.getElementById('approveTransactionId').value = transactionId;
            document.getElementById('approveAmount').value = amount;
            document.getElementById('approveNote').value = '';
            
            showModal('approveDepositModal');
        }

        function rejectDeposit(depositId, transactionId, amount) {
            document.getElementById('rejectDepositId').value = depositId;
            document.getElementById('rejectTransactionId').value = transactionId;
            document.getElementById('rejectAmount').value = amount;
            document.getElementById('rejectionReason').value = '';
            document.getElementById('rejectNote').value = '';
            
            showModal('rejectDepositModal');
        }

        // ✅ ENHANCED: Withdrawal functions với thông tin ngân hàng
        function approveWithdrawal(withdrawalId, amount, bankName, accountNumber, accountHolder) {
            document.getElementById('approveWithdrawalId').value = withdrawalId;
            document.getElementById('approveWithdrawalAmount').value = amount;
            document.getElementById('bankTransactionId').value = '';
            document.getElementById('approveWithdrawalNote').value = '';
            
            // ✅ Set bank information for staff reference
            document.getElementById('modalBankName').textContent = bankName || 'N/A';
            document.getElementById('modalAccountNumber').textContent = accountNumber || 'N/A';
            document.getElementById('modalAccountHolder').textContent = accountHolder || 'N/A';
            
            showModal('approveWithdrawalModal');
        }

        function rejectWithdrawal(withdrawalId, amount) {
            document.getElementById('rejectWithdrawalId').value = withdrawalId;
            document.getElementById('rejectWithdrawalAmount').value = amount;
            document.getElementById('withdrawalRejectionReason').value = '';
            document.getElementById('rejectWithdrawalNote').value = '';
            
            showModal('rejectWithdrawalModal');
        }

        // ✅ ENHANCED: Copy to clipboard functions
        function copyToClipboard(elementId) {
            const element = document.getElementById(elementId);
            const text = element.textContent || element.innerText;
            
            if (navigator.clipboard) {
                navigator.clipboard.writeText(text).then(function() {
                    showToast('Đã copy: ' + text, 'success');
                }).catch(function(err) {
                    console.error('Copy failed:', err);
                    fallbackCopy(text);
                });
            } else {
                fallbackCopy(text);
            }
        }

        function copyModalField(elementId) {
            const element = document.getElementById(elementId);
            const text = element.textContent || element.innerText;
            
            if (navigator.clipboard) {
                navigator.clipboard.writeText(text).then(function() {
                    showToast('Đã copy: ' + text, 'success');
                }).catch(function(err) {
                    console.error('Copy failed:', err);
                    fallbackCopy(text);
                });
            } else {
                fallbackCopy(text);
            }
        }

        function fallbackCopy(text) {
            const textArea = document.createElement('textarea');
            textArea.value = text;
            textArea.style.position = 'fixed';
            textArea.style.left = '-999999px';
            textArea.style.top = '-999999px';
            document.body.appendChild(textArea);
            textArea.focus();
            textArea.select();
            
            try {
                document.execCommand('copy');
                showToast('Đã copy: ' + text, 'success');
            } catch (err) {
                console.error('Fallback copy failed:', err);
                showToast('Không thể copy. Vui lòng copy thủ công.', 'error');
            }
            
            document.body.removeChild(textArea);
        }

        // ✅ FIXED: Toast notification function
        function showToast(message, type) {
            type = type || 'info';
            
            // Remove existing toast
            const existingToast = document.querySelector('.toast');
            if (existingToast) {
                existingToast.remove();
            }
            
            // Create toast
            const toast = document.createElement('div');
            toast.className = 'toast toast-' + type;
            
            // Set styles based on type
            let backgroundColor;
            if (type === 'success') {
                backgroundColor = '#10b981';
            } else if (type === 'error') {
                backgroundColor = '#ef4444';
            } else {
                backgroundColor = '#3b82f6';
            }
            
            toast.style.position = 'fixed';
            toast.style.top = '20px';
            toast.style.right = '20px';
            toast.style.background = backgroundColor;
            toast.style.color = 'white';
            toast.style.padding = '12px 20px';
            toast.style.borderRadius = '8px';
            toast.style.zIndex = '10000';
            toast.style.fontSize = '14px';
            toast.style.fontWeight = '500';
            toast.style.boxShadow = '0 4px 20px rgba(0,0,0,0.15)';
            toast.style.animation = 'slideInRight 0.3s ease';
            
            toast.textContent = message;
            
            // Add CSS animation if not exists
            if (!document.querySelector('#toastStyle')) {
                const style = document.createElement('style');
                style.id = 'toastStyle';
                style.textContent = '@keyframes slideInRight { from { transform: translateX(100%); opacity: 0; } to { transform: translateX(0); opacity: 1; } }';
                document.head.appendChild(style);
            }
            
            document.body.appendChild(toast);
            
            // Auto remove after 3 seconds
            setTimeout(function() {
                if (toast && toast.parentNode) {
                    toast.style.animation = 'slideInRight 0.3s ease reverse';
                    setTimeout(function() {
                        if (toast.parentNode) {
                            toast.remove();
                        }
                    }, 300);
                }
            }, 3000);
        }

        // Modal functions
        function showModal(modalId) {
            document.getElementById(modalId).classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('active');
            document.body.style.overflow = 'auto';
        }

        // Close modal when clicking outside
        document.querySelectorAll('.modal').forEach(function(modal) {
            modal.addEventListener('click', function(e) {
                if (e.target === this) {
                    closeModal(this.id);
                }
            });
        });

        // Close modal with Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                document.querySelectorAll('.modal.active').forEach(function(modal) {
                    closeModal(modal.id);
                });
            }
        });

        // Form validation and confirmation
        document.querySelectorAll('form').forEach(function(form) {
            form.addEventListener('submit', function(e) {
                const action = this.querySelector('input[name="action"]').value;
                let message = '';
                
                if (action === 'approve_deposit') {
                    message = 'Bạn có chắc chắn muốn duyệt yêu cầu nạp tiền này?';
                } else if (action === 'reject_deposit') {
                    message = 'Bạn có chắc chắn muốn từ chối yêu cầu nạp tiền này?';
                } else if (action === 'approve_withdrawal') {
                    message = 'Bạn có chắc chắn đã chuyển khoản và muốn duyệt yêu cầu rút tiền này?';
                } else if (action === 'reject_withdrawal') {
                    message = 'Bạn có chắc chắn muốn từ chối yêu cầu rút tiền này?';
                }
                
                if (message && !confirm(message)) {
                    e.preventDefault();
                    return false;
                }
                
                // Show loading state
                const submitBtn = this.querySelector('button[type="submit"]');
                if (submitBtn) {
                    submitBtn.disabled = true;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
                }
                
                return true;
            });
        });

        // Auto refresh page every 30 seconds to check for new requests
        setInterval(function() {
            // Only refresh if no modal is open
            if (!document.querySelector('.modal.active')) {
                window.location.reload();
            }
        }, 30000);

        console.log('✅ Enhanced Staff Wallet Management loaded successfully');
    </script>
</body>
</html>