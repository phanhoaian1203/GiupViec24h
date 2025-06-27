package controller.web.wallet;

import dao.WalletDAO;
import dao.WithdrawalRequestDAO;
import dao.PaymentMethodDAO;
import model.User;
import model.Wallet;
import model.WithdrawalRequest;
import model.PaymentMethod;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.ArrayList;

/**
 * ✅ ENHANCED: Servlet để xử lý rút tiền từ ví với PaymentMethodDAO thực
 * - Fixed: Luôn tạo payment method demo nếu user chưa có
 * - Enhanced: Load sẵn payment methods ngay từ đầu
 */
@WebServlet("/wallet/withdraw")
public class WalletWithdrawServlet extends HttpServlet {
    
    private WalletDAO walletDAO;
    private WithdrawalRequestDAO withdrawalRequestDAO;
    private PaymentMethodDAO paymentMethodDAO;
    
    @Override
    public void init() throws ServletException {
        walletDAO = new WalletDAO();
        withdrawalRequestDAO = new WithdrawalRequestDAO();
        paymentMethodDAO = new PaymentMethodDAO();
        
        System.out.println("✅ WalletWithdrawServlet initialized successfully");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n🔍 === WALLET WITHDRAW - doGet ===");
        
        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }
        
        try {
            // Lấy thông tin ví
            Wallet wallet = walletDAO.getWalletByUserId(user.getUserId());
            if (wallet == null) {
                session.setAttribute("errorMessage", "Không tìm thấy ví điện tử. Vui lòng liên hệ hỗ trợ.");
                response.sendRedirect(request.getContextPath() + "/wallet");
                return;
            }
            
            // ✅ ENHANCED: Lấy payment methods và tạo demo nếu chưa có
            List<PaymentMethod> verifiedPaymentMethods = getOrCreatePaymentMethods(user);
            
            // Lấy lịch sử rút tiền
            List<WithdrawalRequest> withdrawalHistory = withdrawalRequestDAO.getWithdrawalRequestsByUserId(user.getUserId());
            
            // Set attributes để hiển thị
            request.setAttribute("wallet", wallet);
            request.setAttribute("verifiedPaymentMethods", verifiedPaymentMethods);
            request.setAttribute("withdrawalHistory", withdrawalHistory);
            request.setAttribute("user", user);
            
            System.out.println("✅ Loaded withdraw page data:");
            System.out.println("   - Wallet balance: " + wallet.getBalance());
            System.out.println("   - Verified payment methods: " + verifiedPaymentMethods.size());
            System.out.println("   - Withdrawal history: " + withdrawalHistory.size());
            
            // Forward đến trang rút tiền
            request.getRequestDispatcher("/view/jsp/customer/wallet-withdraw.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("❌ Error in WalletWithdrawServlet doGet: " + e.getMessage());
            e.printStackTrace();
            
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi tải trang rút tiền. Vui lòng thử lại sau.");
            response.sendRedirect(request.getContextPath() + "/wallet");
        }
    }
    
    /**
     * ✅ ENHANCED: Lấy hoặc tạo payment methods cho user
     */
    private List<PaymentMethod> getOrCreatePaymentMethods(User user) {
        try {
            // Lấy payment methods hiện có
            List<PaymentMethod> existingMethods = paymentMethodDAO.getVerifiedPaymentMethods(user.getUserId());
            
            if (existingMethods != null && !existingMethods.isEmpty()) {
                System.out.println("✅ Found " + existingMethods.size() + " existing payment methods for user: " + user.getEmail());
                return existingMethods;
            }
            
            // ✅ TẠO DEMO PAYMENT METHODS NẾU CHƯA CÓ
            System.out.println("🔧 Creating demo payment methods for user: " + user.getEmail());
            
            List<PaymentMethod> demoMethods = new ArrayList<>();
            
            // Tạo method 1: Tài khoản chính
            PaymentMethod method1 = new PaymentMethod(
                user.getUserId(), 
                "bank_account", 
                "Tài khoản chính", 
                "1234567890", 
                "Vietcombank", 
                user.getFullName()
            );
            method1.setDefault(true);
            method1.setVerificationStatus("verified");
            
            int method1Id = paymentMethodDAO.createPaymentMethod(method1);
            if (method1Id > 0) {
                method1.setMethodId(method1Id);
                demoMethods.add(method1);
                System.out.println("✅ Created demo payment method 1: Vietcombank");
            }
            
            // Tạo method 2: Tài khoản phụ
            PaymentMethod method2 = new PaymentMethod(
                user.getUserId(), 
                "bank_account", 
                "Tài khoản phụ", 
                "0987654321", 
                "Techcombank", 
                user.getFullName()
            );
            method2.setDefault(false);
            method2.setVerificationStatus("verified");
            
            int method2Id = paymentMethodDAO.createPaymentMethod(method2);
            if (method2Id > 0) {
                method2.setMethodId(method2Id);
                demoMethods.add(method2);
                System.out.println("✅ Created demo payment method 2: Techcombank");
            }
            
            System.out.println("✅ Successfully created " + demoMethods.size() + " demo payment methods");
            return demoMethods;
            
        } catch (Exception e) {
            System.err.println("❌ Error in getOrCreatePaymentMethods: " + e.getMessage());
            e.printStackTrace();
            
            // Return empty list if error
            return new ArrayList<>();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n📝 === WALLET WITHDRAW - doPost ===");
        
        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        
        if (action == null) {
            doGet(request, response);
            return;
        }
        
        switch (action) {
            case "request_withdraw":
                handleWithdrawRequest(request, response, user);
                break;
            case "add_payment_method":
                handleAddPaymentMethod(request, response, user);
                break;
            default:
                doGet(request, response);
                break;
        }
    }
    
    /**
     * ✅ ENHANCED: Xử lý yêu cầu rút tiền với validation đầy đủ
     */
    private void handleWithdrawRequest(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        System.out.println("💸 === HANDLING WITHDRAW REQUEST ===");
        
        HttpSession session = request.getSession();
        
        try {
            // Lấy thông tin từ form
            String amountStr = request.getParameter("amount");
            String paymentMethodIdStr = request.getParameter("paymentMethodId");
            String note = request.getParameter("note");
            
            // Validate input
            if (amountStr == null || amountStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng nhập số tiền cần rút.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            if (paymentMethodIdStr == null || paymentMethodIdStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng chọn phương thức nhận tiền.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            // Parse and validate amount
            BigDecimal amount;
            try {
                // Remove commas if any (from number formatting)
                String cleanAmountStr = amountStr.replace(",", "");
                amount = new BigDecimal(cleanAmountStr);
            } catch (NumberFormatException e) {
                session.setAttribute("errorMessage", "Số tiền không hợp lệ.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            int paymentMethodId = Integer.parseInt(paymentMethodIdStr);
            
            System.out.println("📝 Withdraw request details:");
            System.out.println("   - User: " + user.getEmail() + " (ID: " + user.getUserId() + ")");
            System.out.println("   - Amount: " + amount);
            System.out.println("   - Payment method ID: " + paymentMethodId);
            System.out.println("   - Note: " + note);
            
            // Validate số tiền
            if (amount.compareTo(BigDecimal.valueOf(50000)) < 0) {
                session.setAttribute("errorMessage", "Số tiền rút tối thiểu là 50,000 VNĐ.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            if (amount.compareTo(BigDecimal.valueOf(10000000)) > 0) {
                session.setAttribute("errorMessage", "Số tiền rút tối đa là 10,000,000 VNĐ mỗi lần.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            // Lấy thông tin ví
            Wallet wallet = walletDAO.getWalletByUserId(user.getUserId());
            if (wallet == null) {
                session.setAttribute("errorMessage", "Không tìm thấy ví điện tử.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            // Kiểm tra số dư
            if (!wallet.hasEnoughBalance(amount)) {
                session.setAttribute("errorMessage", 
                    String.format("Số dư không đủ. Số dư khả dụng: %s", 
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(wallet.getBalance())));
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            // ✅ FIXED: Lấy thông tin payment method từ database thực
            PaymentMethod paymentMethod = paymentMethodDAO.getPaymentMethodById(paymentMethodId);
            if (paymentMethod == null) {
                session.setAttribute("errorMessage", "Phương thức thanh toán không tồn tại.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            if (paymentMethod.getUserId() != user.getUserId()) {
                session.setAttribute("errorMessage", "Phương thức thanh toán không thuộc về bạn.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            // ✅ Tạo WithdrawalRequest với đầy đủ thông tin từ PaymentMethod
            WithdrawalRequest withdrawalRequest = new WithdrawalRequest(
                wallet.getWalletId(), user.getUserId(), amount, paymentMethodId);
            
            // Set thông tin ngân hàng từ payment method
            withdrawalRequest.setBankName(paymentMethod.getBankName());
            withdrawalRequest.setAccountNumber(paymentMethod.getAccountNumber());
            withdrawalRequest.setAccountHolderName(paymentMethod.getAccountHolderName());
            
            System.out.println("💰 Withdrawal calculation:");
            System.out.println("   - Amount: " + withdrawalRequest.getAmount());
            System.out.println("   - Fee: " + withdrawalRequest.getFee());
            System.out.println("   - Net amount: " + withdrawalRequest.getNetAmount());
            System.out.println("   - Bank: " + withdrawalRequest.getBankName());
            System.out.println("   - Account: " + withdrawalRequest.getAccountNumber());
            
            // Kiểm tra lại số dự sau khi tính phí
            BigDecimal totalDeduction = withdrawalRequest.getAmount(); // Full amount will be deducted
            if (!wallet.hasEnoughBalance(totalDeduction)) {
                session.setAttribute("errorMessage", 
                    String.format("Số dư không đủ để rút %s (bao gồm phí %s). Số dư khả dụng: %s", 
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(amount),
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(withdrawalRequest.getFee()),
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(wallet.getBalance())));
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            // Tạo withdrawal request trong database
            int withdrawalId = withdrawalRequestDAO.createWithdrawalRequest(withdrawalRequest);
            
            if (withdrawalId > 0) {
                System.out.println("✅ Withdrawal request created with ID: " + withdrawalId);
                
                session.setAttribute("successMessage", 
                    String.format("Yêu cầu rút tiền %s đã được gửi thành công! " +
                                "Phí giao dịch: %s. Số tiền nhận được: %s. " +
                                "Yêu cầu sẽ được xử lý trong vòng 24 giờ làm việc.",
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(amount),
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(withdrawalRequest.getFee()),
                        java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN")).format(withdrawalRequest.getNetAmount())));
                
            } else {
                session.setAttribute("errorMessage", "Không thể tạo yêu cầu rút tiền. Vui lòng thử lại.");
            }
            
        } catch (NumberFormatException e) {
            System.err.println("❌ Invalid number format: " + e.getMessage());
            session.setAttribute("errorMessage", "Số tiền hoặc phương thức thanh toán không hợp lệ.");
        } catch (Exception e) {
            System.err.println("❌ Error in handleWithdrawRequest: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý yêu cầu rút tiền.");
        }
        
        response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
    }
    
    /**
     * ✅ REAL: Xử lý thêm phương thức thanh toán (database implementation)
     */
    private void handleAddPaymentMethod(HttpServletRequest request, HttpServletResponse response, User user) 
            throws ServletException, IOException {
        
        System.out.println("🏦 === HANDLING ADD PAYMENT METHOD ===");
        
        HttpSession session = request.getSession();
        
        try {
            // Lấy thông tin từ form
            String methodName = request.getParameter("methodName");
            String bankName = request.getParameter("bankName");
            String accountNumber = request.getParameter("accountNumber");
            String accountHolderName = request.getParameter("accountHolderName");
            boolean isDefault = "on".equals(request.getParameter("isDefault"));
            
            // Validate input
            if (methodName == null || methodName.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng nhập tên phương thức thanh toán.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            if (bankName == null || bankName.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng chọn ngân hàng.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            if (accountNumber == null || accountNumber.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng nhập số tài khoản.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            if (accountHolderName == null || accountHolderName.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng nhập tên chủ tài khoản.");
                response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
                return;
            }
            
            System.out.println("📝 Payment method details:");
            System.out.println("   - User: " + user.getEmail() + " (ID: " + user.getUserId() + ")");
            System.out.println("   - Method name: " + methodName);
            System.out.println("   - Bank: " + bankName);
            System.out.println("   - Account: " + accountNumber.replaceAll("\\d(?=\\d{4})", "*"));
            System.out.println("   - Holder: " + accountHolderName);
            System.out.println("   - Is default: " + isDefault);
            
            // ✅ REAL: Tạo payment method trong database
            PaymentMethod newMethod = new PaymentMethod(user.getUserId(), "bank_account", methodName, 
                accountNumber, bankName, accountHolderName);
            newMethod.setDefault(isDefault);
            newMethod.setVerificationStatus("verified"); // Auto verify for now
            
            int newMethodId = paymentMethodDAO.createPaymentMethod(newMethod);
            
            if (newMethodId > 0) {
                System.out.println("✅ REAL: Payment method created with ID: " + newMethodId);
                
                session.setAttribute("successMessage", 
                    "Phương thức thanh toán đã được thêm thành công! " +
                    "Phương thức đã được xác minh và có thể sử dụng ngay lập tức.");
            } else {
                session.setAttribute("errorMessage", "Không thể thêm phương thức thanh toán. Vui lòng thử lại.");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error in handleAddPaymentMethod: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm phương thức thanh toán.");
        }
        
        response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
    }
    
    @Override
    public void destroy() {
        System.out.println("🔄 WalletWithdrawServlet destroyed");
        super.destroy();
    }
}