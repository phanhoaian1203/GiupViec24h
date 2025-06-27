package controller.web.wallet;

import dao.DepositRequestDAO;
import dao.WithdrawalRequestDAO;
import dao.WalletDAO;
import model.User;
import model.DepositRequest;
import model.WithdrawalRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;

/**
 * ✅ ENHANCED: Staff Wallet Management Servlet với thông tin chi tiết
 * - Bổ sung thông tin số dư ví khách hàng
 * - Hiển thị thông tin tài khoản ngân hàng để staff chuyển tiền
 * - Enhanced error handling
 */
@WebServlet("/staff/wallet-management/*")
public class StaffWalletManagementServlet extends HttpServlet {
    
    private DepositRequestDAO depositRequestDAO;
    private WithdrawalRequestDAO withdrawalRequestDAO;
    private WalletDAO walletDAO;
    
    @Override
    public void init() throws ServletException {
        try {
            System.out.println("🚀 INITIALIZING Enhanced StaffWalletManagementServlet...");
            
            depositRequestDAO = new DepositRequestDAO();
            withdrawalRequestDAO = new WithdrawalRequestDAO();
            walletDAO = new WalletDAO();
            
            System.out.println("✅ Enhanced StaffWalletManagementServlet initialized successfully");
            
        } catch (Exception e) {
            System.err.println("❌ ERROR initializing StaffWalletManagementServlet: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException("Failed to initialize servlet", e);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n🔍 === ENHANCED STAFF WALLET MANAGEMENT - doGet ===");
        System.out.println("📥 Request URI: " + request.getRequestURI());
        System.out.println("📥 Path Info: " + request.getPathInfo());
        
        // Check staff access
        User currentUser = checkStaffAccess(request, response);
        if (currentUser == null) {
            return;
        }
        
        String pathInfo = request.getPathInfo();
        System.out.println("✅ Staff access granted for user: " + currentUser.getEmail() + ", processing pathInfo: " + pathInfo);
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                showEnhancedWalletManagementPage(request, response, currentUser);
            } else if (pathInfo.equals("/pending-count")) {
                handlePendingCountAPI(request, response);
            } else {
                System.err.println("❌ Path not found: " + pathInfo);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Path not found: " + pathInfo);
            }
        } catch (Exception e) {
            System.err.println("❌ Error in doGet: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n📝 === ENHANCED STAFF WALLET MANAGEMENT - doPost ===");
        
        User currentUser = checkStaffAccess(request, response);
        if (currentUser == null) {
            return;
        }
        
        String action = request.getParameter("action");
        System.out.println("📝 POST Action: " + action + " by user: " + currentUser.getEmail());
        
        if (action == null) {
            System.err.println("❌ No action parameter provided");
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Hành động không hợp lệ.");
            response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
            return;
        }
        
        try {
            switch (action) {
                case "approve_deposit":
                    handleApproveDeposit(request, response, currentUser);
                    break;
                case "reject_deposit":
                    handleRejectDeposit(request, response, currentUser);
                    break;
                case "approve_withdrawal":
                    handleApproveWithdrawal(request, response, currentUser);
                    break;
                case "reject_withdrawal":
                    handleRejectWithdrawal(request, response, currentUser);
                    break;
                default:
                    System.err.println("❌ Unknown action: " + action);
                    HttpSession session = request.getSession();
                    session.setAttribute("errorMessage", "Hành động không được hỗ trợ: " + action);
                    response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                    break;
            }
        } catch (Exception e) {
            System.err.println("❌ Error in doPost: " + e.getMessage());
            e.printStackTrace();
            
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý yêu cầu: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
        }
    }
    
    /**
     * ✅ ENHANCED: Show wallet management page với thông tin chi tiết
     */
    private void showEnhancedWalletManagementPage(HttpServletRequest request, HttpServletResponse response, User currentUser) 
            throws ServletException, IOException {
        
        try {
            System.out.println("📊 === LOADING ENHANCED WALLET MANAGEMENT DATA ===");
            
            // Lấy data cơ bản
            List<DepositRequest> pendingDeposits = depositRequestDAO.getDepositRequestsByStatus("pending");
            List<WithdrawalRequest> pendingWithdrawals = withdrawalRequestDAO.getWithdrawalRequestsByStatus("pending");
            int pendingDepositCount = depositRequestDAO.countPendingDepositRequests();
            int pendingWithdrawalCount = withdrawalRequestDAO.countPendingWithdrawalRequests();
            
            // ✅ ENHANCED: Bổ sung thông tin ví cho từng withdrawal request
            for (WithdrawalRequest withdrawal : pendingWithdrawals) {
                try {
                    // Lấy thông tin ví hiện tại
                    model.Wallet customerWallet = walletDAO.getWalletByUserId(withdrawal.getUserId());
                    if (customerWallet != null) {
                        // Set thông tin số dư ví vào withdrawal request để hiển thị
                        withdrawal.setUserEmail(withdrawal.getUserEmail() + " | Số dư: " + 
                            java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(customerWallet.getBalance()));
                        
                        System.out.println("💰 Customer " + withdrawal.getUserFullName() + " wallet balance: " + customerWallet.getBalance());
                    }
                } catch (Exception e) {
                    System.err.println("⚠️ Could not get wallet info for user: " + withdrawal.getUserId());
                }
            }
            
            // Set attributes
            request.setAttribute("pendingDeposits", pendingDeposits);
            request.setAttribute("pendingWithdrawals", pendingWithdrawals);
            request.setAttribute("pendingDepositCount", pendingDepositCount);
            request.setAttribute("pendingWithdrawalCount", pendingWithdrawalCount);
            request.setAttribute("currentUser", currentUser);
            
            System.out.println("✅ Enhanced data loaded:");
            System.out.println("   - Pending deposits: " + pendingDepositCount);
            System.out.println("   - Pending withdrawals: " + pendingWithdrawalCount);
            System.out.println("   - Enhanced withdrawal info with wallet balances");
            
            String jspPath = "/view/jsp/staff/wallet-management.jsp";
            request.getRequestDispatcher(jspPath).forward(request, response);
            
        } catch (Exception e) {
            System.err.println("❌ Error in showEnhancedWalletManagementPage: " + e.getMessage());
            e.printStackTrace();
            
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi tải dữ liệu ví điện tử: " + e.getMessage());
            
            response.sendRedirect(request.getContextPath() + "/view/jsp/staff/staffDashboard.jsp");
        }
    }
    
    /**
     * ✅ ENHANCED: Handle approve deposit với better logging
     */
    private void handleApproveDeposit(HttpServletRequest request, HttpServletResponse response, User staff) 
            throws ServletException, IOException {
        
        System.out.println("\n🔥 === ENHANCED APPROVE DEPOSIT ===");
        
        HttpSession session = request.getSession();
        
        try {
            String depositIdStr = request.getParameter("depositId");
            String adminNote = request.getParameter("adminNote");
            
            if (depositIdStr == null || depositIdStr.trim().isEmpty()) {
                System.err.println("❌ ERROR: No depositId parameter");
                session.setAttribute("errorMessage", "Không tìm thấy ID yêu cầu nạp tiền.");
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            int depositId = Integer.parseInt(depositIdStr);
            
            System.out.println("📝 STEP 1: Getting deposit request details");
            System.out.println("   - Deposit ID: " + depositId);
            System.out.println("   - Staff: " + staff.getEmail() + " (ID: " + staff.getUserId() + ")");
            System.out.println("   - Admin note: " + adminNote);
            
            DepositRequest depositRequest = depositRequestDAO.getDepositRequestById(depositId);
            
            if (depositRequest == null) {
                System.err.println("❌ ERROR: Deposit request not found for ID: " + depositId);
                session.setAttribute("errorMessage", "Không tìm thấy yêu cầu nạp tiền với ID: " + depositId);
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            if (!depositRequest.isPending()) {
                System.err.println("❌ ERROR: Deposit request already processed. Current status: " + depositRequest.getDepositStatus());
                session.setAttribute("warningMessage", "Yêu cầu này đã được xử lý trước đó. Trạng thái: " + depositRequest.getDepositStatus());
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            System.out.println("💰 Deposit details validated:");
            System.out.println("   - Customer ID: " + depositRequest.getUserId());
            System.out.println("   - Amount: " + depositRequest.getAmount());
            System.out.println("   - Transaction ID: " + depositRequest.getGatewayTransactionId());
            System.out.println("   - Current status: " + depositRequest.getDepositStatus());
            
            // Update deposit status to APPROVED
            String noteWithStaff = String.format("Đã duyệt bởi %s (ID: %d) lúc %s. %s", 
                staff.getFullName(), 
                staff.getUserId(),
                java.time.LocalDateTime.now().toString(),
                adminNote != null ? adminNote : "");
            
            System.out.println("🔄 STEP 2: Updating status to 'approved'");
            
            boolean statusUpdated = depositRequestDAO.updateDepositRequestStatus(
                depositId, "approved", staff.getUserId(), noteWithStaff, null);
            
            if (!statusUpdated) {
                System.err.println("❌ FAILED to update deposit status to approved");
                session.setAttribute("errorMessage", "Không thể cập nhật trạng thái yêu cầu nạp tiền. Vui lòng kiểm tra database.");
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            System.out.println("✅ Status updated to 'approved' successfully");
            
            // Add money to customer wallet AFTER status update
            System.out.println("💰 STEP 3: Adding money to customer wallet");
            
            boolean walletUpdated = walletDAO.depositToWallet(
                depositRequest.getUserId(),
                depositRequest.getAmount(),
                depositRequest.getGatewayTransactionId(),
                "vietqr",
                "Nạp tiền được duyệt bởi " + staff.getFullName()
            );
            
            if (walletUpdated) {
                System.out.println("✅ Money added to customer wallet successfully");
                
                session.setAttribute("successMessage", 
                    String.format("Đã duyệt yêu cầu nạp tiền %s thành công! Số tiền %s đã được cộng vào ví khách hàng.",
                        depositRequest.getGatewayTransactionId(),
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(depositRequest.getAmount())));
                        
                System.out.println("✅ === APPROVE DEPOSIT COMPLETED SUCCESSFULLY ===");
                
            } else {
                System.err.println("⚠️ Status updated but wallet update failed - attempting rollback");
                
                boolean rollbackSuccess = depositRequestDAO.updateDepositRequestStatus(
                    depositId, "pending", null, "Rollback - wallet update failed", null);
                
                if (rollbackSuccess) {
                    System.out.println("✅ Rollback successful");
                    session.setAttribute("errorMessage", "Không thể cộng tiền vào ví khách hàng. Yêu cầu đã được rollback về trạng thái chờ duyệt.");
                } else {
                    System.err.println("❌ Rollback failed - manual intervention needed");
                    session.setAttribute("errorMessage", "Lỗi nghiêm trọng: Không thể cộng tiền vào ví và không thể rollback. Vui lòng kiểm tra database thủ công.");
                }
            }
            
        } catch (NumberFormatException e) {
            System.err.println("❌ Invalid deposit ID format: " + e.getMessage());
            session.setAttribute("errorMessage", "ID yêu cầu không hợp lệ.");
            
        } catch (Exception e) {
            System.err.println("❌ Unexpected error in approve deposit:");
            System.err.println("   - Error class: " + e.getClass().getSimpleName());
            System.err.println("   - Error message: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi duyệt yêu cầu: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
    }
    
    /**
     * ✅ ENHANCED: Handle reject deposit 
     */
    private void handleRejectDeposit(HttpServletRequest request, HttpServletResponse response, User staff) 
            throws ServletException, IOException {
        
        System.out.println("\n❌ === ENHANCED REJECT DEPOSIT ===");
        
        HttpSession session = request.getSession();
        
        try {
            String depositIdStr = request.getParameter("depositId");
            String rejectionReason = request.getParameter("rejectionReason");
            String adminNote = request.getParameter("adminNote");
            
            if (depositIdStr == null || depositIdStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Không tìm thấy ID yêu cầu nạp tiền.");
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            if (rejectionReason == null || rejectionReason.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng nhập lý do từ chối.");
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            int depositId = Integer.parseInt(depositIdStr);
            
            DepositRequest depositRequest = depositRequestDAO.getDepositRequestById(depositId);
            
            if (depositRequest == null) {
                session.setAttribute("errorMessage", "Không tìm thấy yêu cầu nạp tiền với ID: " + depositId);
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            if (!depositRequest.isPending()) {
                session.setAttribute("warningMessage", "Yêu cầu này đã được xử lý trước đó. Trạng thái: " + depositRequest.getDepositStatus());
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            String noteWithStaff = String.format("Đã từ chối bởi %s (ID: %d) lúc %s. Lý do: %s. %s", 
                staff.getFullName(), 
                staff.getUserId(),
                java.time.LocalDateTime.now().toString(),
                rejectionReason,
                adminNote != null ? adminNote : "");
            
            boolean statusUpdated = depositRequestDAO.updateDepositRequestStatus(
                depositId, "rejected", staff.getUserId(), noteWithStaff, rejectionReason);
            
            if (statusUpdated) {
                System.out.println("✅ Deposit status updated to rejected");
                
                session.setAttribute("successMessage", 
                    String.format("Đã từ chối yêu cầu nạp tiền %s. Lý do: %s",
                        depositRequest.getGatewayTransactionId(),
                        rejectionReason));
                
            } else {
                System.err.println("❌ Failed to update deposit status");
                session.setAttribute("errorMessage", "Không thể cập nhật trạng thái yêu cầu nạp tiền.");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error rejecting deposit: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi từ chối yêu cầu: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
    }
    
    /**
     * ✅ ENHANCED: Handle approve withdrawal với better info
     */
    private void handleApproveWithdrawal(HttpServletRequest request, HttpServletResponse response, User staff) 
            throws ServletException, IOException {
        
        System.out.println("\n✅ === ENHANCED APPROVE WITHDRAWAL ===");
        
        HttpSession session = request.getSession();
        
        try {
            String withdrawalIdStr = request.getParameter("withdrawalId");
            String adminNote = request.getParameter("adminNote");
            String bankTransactionId = request.getParameter("bankTransactionId");
            
            if (withdrawalIdStr == null || withdrawalIdStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Không tìm thấy ID yêu cầu rút tiền.");
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            int withdrawalId = Integer.parseInt(withdrawalIdStr);
            
            WithdrawalRequest withdrawalRequest = withdrawalRequestDAO.getWithdrawalRequestById(withdrawalId);
            
            if (withdrawalRequest == null) {
                session.setAttribute("errorMessage", "Không tìm thấy yêu cầu rút tiền với ID: " + withdrawalId);
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            if (!withdrawalRequest.isPending()) {
                session.setAttribute("warningMessage", "Yêu cầu này đã được xử lý trước đó. Trạng thái: " + withdrawalRequest.getWithdrawalStatus());
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            // ✅ ENHANCED: Kiểm tra số dư ví trước khi duyệt
            model.Wallet customerWallet = walletDAO.getWalletByUserId(withdrawalRequest.getUserId());
            if (customerWallet == null || customerWallet.getBalance().compareTo(withdrawalRequest.getAmount()) < 0) {
                session.setAttribute("errorMessage", 
                    String.format("Số dư ví không đủ để rút tiền. Số dư hiện tại: %s, Số tiền yêu cầu: %s",
                        customerWallet != null ? java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(customerWallet.getBalance()) : "0 VNĐ",
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(withdrawalRequest.getAmount())));
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            System.out.println("💰 Withdrawal validation passed:");
            System.out.println("   - Customer wallet balance: " + customerWallet.getBalance());
            System.out.println("   - Withdrawal amount: " + withdrawalRequest.getAmount());
            System.out.println("   - Net amount to customer: " + withdrawalRequest.getNetAmount());
            System.out.println("   - Bank account: " + withdrawalRequest.getBankName() + " - " + withdrawalRequest.getAccountNumber());
            
            // Update withdrawal status to completed
            String noteWithStaff = String.format("Đã duyệt và chuyển khoản bởi %s (ID: %d) lúc %s. Bank Transaction ID: %s. %s", 
                staff.getFullName(), 
                staff.getUserId(),
                java.time.LocalDateTime.now().toString(),
                bankTransactionId != null ? bankTransactionId : "",
                adminNote != null ? adminNote : "");
            
            boolean statusUpdated = withdrawalRequestDAO.updateWithdrawalRequestStatus(
                withdrawalId, "completed", staff.getUserId(), noteWithStaff, bankTransactionId);
            
            if (statusUpdated) {
                // Deduct money from customer wallet AFTER status update
                boolean walletUpdated = walletDAO.withdrawFromWallet(
                    withdrawalRequest.getUserId(),
                    withdrawalRequest.getAmount(),
                    withdrawalRequest.getPaymentMethodId(),
                    "Rút tiền được duyệt bởi " + staff.getFullName()
                );
                
                if (walletUpdated) {
                    session.setAttribute("successMessage", 
                        String.format("Đã duyệt và hoàn thành yêu cầu rút tiền thành công! Số tiền %s đã được chuyển cho khách hàng.",
                            java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(withdrawalRequest.getNetAmount())));
                } else {
                    // Rollback if wallet update failed
                    withdrawalRequestDAO.updateWithdrawalRequestStatus(
                        withdrawalId, "pending", null, "Rollback - wallet update failed", null);
                    session.setAttribute("errorMessage", "Không thể trừ tiền từ ví khách hàng. Yêu cầu đã được rollback.");
                }
            } else {
                session.setAttribute("errorMessage", "Không thể cập nhật trạng thái yêu cầu rút tiền.");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error approving withdrawal: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi duyệt yêu cầu: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
    }
    
    /**
     * ✅ ENHANCED: Handle reject withdrawal
     */
    private void handleRejectWithdrawal(HttpServletRequest request, HttpServletResponse response, User staff) 
            throws ServletException, IOException {
        
        System.out.println("\n❌ === ENHANCED REJECT WITHDRAWAL ===");
        
        HttpSession session = request.getSession();
        
        try {
            String withdrawalIdStr = request.getParameter("withdrawalId");
            String rejectionReason = request.getParameter("rejectionReason");
            String adminNote = request.getParameter("adminNote");
            
            if (withdrawalIdStr == null || withdrawalIdStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Không tìm thấy ID yêu cầu rút tiền.");
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            if (rejectionReason == null || rejectionReason.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng nhập lý do từ chối.");
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            int withdrawalId = Integer.parseInt(withdrawalIdStr);
            
            WithdrawalRequest withdrawalRequest = withdrawalRequestDAO.getWithdrawalRequestById(withdrawalId);
            
            if (withdrawalRequest == null) {
                session.setAttribute("errorMessage", "Không tìm thấy yêu cầu rút tiền với ID: " + withdrawalId);
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            if (!withdrawalRequest.isPending()) {
                session.setAttribute("warningMessage", "Yêu cầu này đã được xử lý trước đó. Trạng thái: " + withdrawalRequest.getWithdrawalStatus());
                response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
                return;
            }
            
            String noteWithStaff = String.format("Đã từ chối bởi %s (ID: %d) lúc %s. Lý do: %s. %s", 
                staff.getFullName(), 
                staff.getUserId(),
                java.time.LocalDateTime.now().toString(),
                rejectionReason,
                adminNote != null ? adminNote : "");
            
            boolean statusUpdated = withdrawalRequestDAO.updateWithdrawalRequestStatus(
                withdrawalId, "rejected", staff.getUserId(), noteWithStaff, null);
            
            if (statusUpdated) {
                session.setAttribute("successMessage", 
                    String.format("Đã từ chối yêu cầu rút tiền. Lý do: %s", rejectionReason));
            } else {
                session.setAttribute("errorMessage", "Không thể cập nhật trạng thái yêu cầu rút tiền.");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error rejecting withdrawal: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi từ chối yêu cầu: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/staff/wallet-management");
    }
    
    // ===== UTILITY METHODS =====
    
    private User checkStaffAccess(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session == null) {
            redirectToLogin(request, response, "No session");
            return null;
        }
        
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            redirectToLogin(request, response, "No user in session");
            return null;
        }
        
        // Check staff roles: 3 (support) OR 4 (admin)
        int roleId = user.getRoleId();
        boolean isStaff = (roleId == 3 || roleId == 4);
        
        if (!isStaff) {
            showAccessDeniedPage(request, response, user);
            return null;
        }
        
        return user;
    }
    
    private void redirectToLogin(HttpServletRequest request, HttpServletResponse response, String reason) 
            throws IOException {
        
        HttpSession session = request.getSession(true);
        session.setAttribute("errorMessage", "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.");
        
        response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
    }
    
    private void showAccessDeniedPage(HttpServletRequest request, HttpServletResponse response, User user) 
            throws IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        out.println("<!DOCTYPE html>");
        out.println("<html lang='vi'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Không có quyền truy cập</title>");
        out.println("<style>body { font-family: Arial, sans-serif; text-align: center; margin: 2rem; }</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Không có quyền truy cập</h1>");
        out.println("<p>Bạn không có quyền truy cập vào trang quản lý ví điện tử.</p>");
        out.println("<p>Chức năng này chỉ dành cho nhân viên hỗ trợ và quản trị viên.</p>");
        out.println("<a href='" + request.getContextPath() + "/view/jsp/staff/staffDashboard.jsp'>Quay lại Dashboard</a>");
        out.println("</body>");
        out.println("</html>");
    }
    
    private void handlePendingCountAPI(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            int pendingDeposits = depositRequestDAO.countPendingDepositRequests();
            int pendingWithdrawals = withdrawalRequestDAO.countPendingWithdrawalRequests();
            int totalPending = pendingDeposits + pendingWithdrawals;
            
            String jsonResponse = String.format(
                "{\"success\":true,\"pending_deposits\":%d,\"pending_withdrawals\":%d,\"total_pending\":%d}",
                pendingDeposits, pendingWithdrawals, totalPending
            );
            
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
            
        } catch (Exception e) {
            System.err.println("❌ Error in handlePendingCountAPI: " + e.getMessage());
            e.printStackTrace();
            
            String errorResponse = "{\"success\":false,\"error\":\"" + e.getMessage().replace("\"", "\\\"") + "\"}";
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            
            PrintWriter out = response.getWriter();
            out.print(errorResponse);
            out.flush();
        }
    }
}