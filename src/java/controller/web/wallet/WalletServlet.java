package controller.web.wallet;

import dao.WalletDAO;
import dao.DepositRequestDAO;
import model.User;
import model.Wallet;
import model.DepositRequest;
import service.VietQRService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

/**
 * ✅ FIXED: Servlet chính để xử lý các chức năng ví điện tử
 * - Sửa lỗi: Chỉ tạo DepositRequest khi user nhấn "Tôi đã chuyển khoản"
 * - Tách riêng việc tạo QR và tạo deposit request
 */
@WebServlet("/wallet")
public class WalletServlet extends HttpServlet {
    
    private WalletDAO walletDAO;
    private DepositRequestDAO depositRequestDAO;
    private VietQRService vietQRService;
    
    @Override
    public void init() throws ServletException {
        walletDAO = new WalletDAO();
        depositRequestDAO = new DepositRequestDAO();
        vietQRService = new VietQRService();
        
        System.out.println("✅ WalletServlet initialized successfully");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n🔍 === WALLET SERVLET - doGet ===");
        
        // Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }
        
        try {
            // Lấy thông tin ví của user
            Wallet wallet = walletDAO.getWalletByUserId(user.getUserId());
            
            // Nếu chưa có ví, tạo ví mới
            if (wallet == null) {
                wallet = new Wallet(user.getUserId());
                boolean created = walletDAO.createWallet(wallet);
                
                if (created) {
                    wallet = walletDAO.getWalletByUserId(user.getUserId());
                } else {
                    request.setAttribute("error", "Không thể tạo ví điện tử. Vui lòng thử lại sau.");
                    request.getRequestDispatcher("/view/jsp/error.jsp").forward(request, response);
                    return;
                }
            }
            
            // Lấy lịch sử giao dịch nạp tiền
            List<DepositRequest> depositHistory = depositRequestDAO.getDepositRequestsByUserId(user.getUserId());
            
            // Set attributes để hiển thị
            request.setAttribute("wallet", wallet);
            request.setAttribute("depositHistory", depositHistory);
            request.setAttribute("user", user);
            
            System.out.println("✅ Loaded wallet page data:");
            System.out.println("   - Wallet balance: " + wallet.getBalance());
            System.out.println("   - Deposit history: " + depositHistory.size() + " records");
            
            // Forward đến trang ví
            request.getRequestDispatcher("/view/jsp/customer/wallet.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("❌ Error in WalletServlet doGet: " + e.getMessage());
            e.printStackTrace();
            
            request.setAttribute("error", "Có lỗi xảy ra khi tải thông tin ví. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/view/jsp/error.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n📝 === WALLET SERVLET - doPost ===");
        
        // Xử lý các action khác nhau
        String action = request.getParameter("action");
        
        if (action == null) {
            doGet(request, response);
            return;
        }
        
        System.out.println("📝 POST Action: " + action);
        
        switch (action) {
            case "create_qr":
                handleCreateQR(request, response);
                break;
            case "confirm_deposit":
                handleConfirmDeposit(request, response);
                break;
            case "withdraw":
                handleWithdraw(request, response);
                break;
            case "view_history":
                handleViewHistory(request, response);
                break;
            default:
                doGet(request, response);
                break;
        }
    }
    
    /**
     * ✅ NEW: Xử lý tạo mã QR mà KHÔNG tạo DepositRequest
     * Chỉ tạo QR để hiển thị cho user
     */
    private void handleCreateQR(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("🔥 === HANDLING CREATE QR (NO DEPOSIT REQUEST YET) ===");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }
        
        try {
            // Lấy số tiền từ form
            String amountStr = request.getParameter("amount");
            if (amountStr == null || amountStr.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Vui lòng nhập số tiền cần nạp.");
                response.sendRedirect(request.getContextPath() + "/wallet");
                return;
            }
            
            BigDecimal amount = new BigDecimal(amountStr);
            
            // Validate số tiền
            if (amount.compareTo(BigDecimal.valueOf(10000)) < 0) {
                session.setAttribute("errorMessage", "Số tiền nạp tối thiểu là 10,000 VNĐ.");
                response.sendRedirect(request.getContextPath() + "/wallet");
                return;
            }
            
            if (amount.compareTo(BigDecimal.valueOf(50000000)) > 0) {
                session.setAttribute("errorMessage", "Số tiền nạp tối đa là 50,000,000 VNĐ.");
                response.sendRedirect(request.getContextPath() + "/wallet");
                return;
            }
            
            // Lấy ví của user
            Wallet wallet = walletDAO.getWalletByUserId(user.getUserId());
            if (wallet == null) {
                session.setAttribute("errorMessage", "Không tìm thấy ví điện tử.");
                response.sendRedirect(request.getContextPath() + "/wallet");
                return;
            }
            
            // ✅ CHỈ TẠO TRANSACTION ID VÀ QR - KHÔNG TẠO DEPOSIT REQUEST
            String transactionId = vietQRService.generateTransactionId(user.getUserId());
            
            System.out.println("✅ Generated QR info (NO DEPOSIT REQUEST):");
            System.out.println("   - User: " + user.getEmail());
            System.out.println("   - Amount: " + amount);
            System.out.println("   - Transaction ID: " + transactionId);
            
            // Tạo QR code URL và bank info
            String description = "Nap tien vao vi Giup Viec 24h";
            String qrUrl = vietQRService.generateVietQRUrl(amount, transactionId, description);
            String mobileUrl = vietQRService.generateVietQRMobileUrl(amount, transactionId, description);
            VietQRService.BankTransferInfo bankInfo = vietQRService.generateBankTransferInfo(amount, transactionId, description);
            
            // ✅ LƯU THÔNG TIN VÀO SESSION ĐỂ SỬ DỤNG KHI CONFIRM
            session.setAttribute("pendingDeposit_amount", amount);
            session.setAttribute("pendingDeposit_transactionId", transactionId);
            session.setAttribute("pendingDeposit_walletId", wallet.getWalletId());
            
            // Set attributes cho trang deposit
            request.setAttribute("transactionId", transactionId);
            request.setAttribute("amount", amount);
            request.setAttribute("qrUrl", qrUrl);
            request.setAttribute("mobileUrl", mobileUrl);
            request.setAttribute("bankInfo", bankInfo);
            request.setAttribute("user", user);
            request.setAttribute("wallet", wallet);
            
            System.out.println("✅ QR created successfully - forwarding to deposit page");
            
            // Forward đến trang hiển thị QR
            request.getRequestDispatcher("/view/jsp/customer/wallet-deposit.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "Số tiền không hợp lệ.");
            response.sendRedirect(request.getContextPath() + "/wallet");
        } catch (Exception e) {
            System.err.println("❌ Error in handleCreateQR: " + e.getMessage());
            e.printStackTrace();
            
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi tạo mã QR.");
            response.sendRedirect(request.getContextPath() + "/wallet");
        }
    }
    
    /**
     * ✅ NEW: Xử lý xác nhận đã chuyển khoản
     * CHỈ TẠI ĐÂY MỚI TẠO DEPOSIT REQUEST
     */
    private void handleConfirmDeposit(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("🔥 === HANDLING CONFIRM DEPOSIT (CREATE DEPOSIT REQUEST) ===");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }
        
        try {
            // ✅ LẤY THÔNG TIN TỪ SESSION (đã lưu khi tạo QR)
            BigDecimal amount = (BigDecimal) session.getAttribute("pendingDeposit_amount");
            String transactionId = (String) session.getAttribute("pendingDeposit_transactionId");
            Integer walletId = (Integer) session.getAttribute("pendingDeposit_walletId");
            
            if (amount == null || transactionId == null || walletId == null) {
                session.setAttribute("errorMessage", "Thông tin giao dịch không hợp lệ hoặc đã hết hạn.");
                response.sendRedirect(request.getContextPath() + "/wallet");
                return;
            }
            
            System.out.println("✅ Confirming deposit with session data:");
            System.out.println("   - User: " + user.getEmail());
            System.out.println("   - Amount: " + amount);
            System.out.println("   - Transaction ID: " + transactionId);
            System.out.println("   - Wallet ID: " + walletId);
            
            // ✅ BÂY GIỜ MỚI TẠO DEPOSIT REQUEST
            DepositRequest depositRequest = new DepositRequest(walletId, user.getUserId(), amount);
            depositRequest.setGatewayTransactionId(transactionId);
            depositRequest.setGatewayName("vietqr");
            
            int depositId = depositRequestDAO.createDepositRequest(depositRequest);
            
            if (depositId > 0) {
                // ✅ XÓA THÔNG TIN KHỎI SESSION SAU KHI TẠO THÀNH CÔNG
                session.removeAttribute("pendingDeposit_amount");
                session.removeAttribute("pendingDeposit_transactionId");
                session.removeAttribute("pendingDeposit_walletId");
                
                session.setAttribute("successMessage", 
                    "Đã xác nhận chuyển khoản thành công! Yêu cầu nạp tiền đang được xử lý bởi nhân viên. Mã giao dịch: " + transactionId);
                
                System.out.println("✅ Deposit request created successfully with ID: " + depositId);
                
            } else {
                session.setAttribute("errorMessage", "Không thể tạo yêu cầu nạp tiền. Vui lòng thử lại.");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error in handleConfirmDeposit: " + e.getMessage());
            e.printStackTrace();
            
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi xác nhận giao dịch.");
        }
        
        response.sendRedirect(request.getContextPath() + "/wallet");
    }
    
    /**
     * Xử lý yêu cầu rút tiền
     */
    private void handleWithdraw(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Redirect đến trang rút tiền riêng
        response.sendRedirect(request.getContextPath() + "/wallet/withdraw");
    }
    
    /**
     * Xử lý xem lịch sử giao dịch
     */
    private void handleViewHistory(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Redirect đến trang lịch sử giao dịch
        response.sendRedirect(request.getContextPath() + "/wallet/history");
    }
}