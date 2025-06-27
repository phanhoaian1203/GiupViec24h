package controller.web.wallet;

import dao.DepositRequestDAO;
import model.User;
import model.DepositRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;

/**
 * ✅ FIXED: Servlet xử lý xác nhận đã chuyển khoản
 * - Chỉ tạo DepositRequest khi user xác nhận đã chuyển tiền
 * - Lấy thông tin từ session thay vì tạo mới
 */
@WebServlet("/wallet/confirm-deposit")
public class DepositConfirmServlet extends HttpServlet {
    
    private DepositRequestDAO depositRequestDAO;
    
    @Override
    public void init() throws ServletException {
        depositRequestDAO = new DepositRequestDAO();
        System.out.println("✅ DepositConfirmServlet initialized");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n🔥 === DEPOSIT CONFIRM SERVLET - doPost ===");
        
        // Kiểm tra đăng nhập
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
                session.setAttribute("errorMessage", "Phiên giao dịch đã hết hạn. Vui lòng tạo yêu cầu nạp tiền mới.");
                response.sendRedirect(request.getContextPath() + "/wallet");
                return;
            }
            
            // Lấy ghi chú từ user (nếu có)
            String userNote = request.getParameter("userNote");
            if (userNote == null) {
                userNote = "";
            }
            
            System.out.println("✅ Creating deposit request from session:");
            System.out.println("   - User: " + user.getEmail() + " (ID: " + user.getUserId() + ")");
            System.out.println("   - Amount: " + amount);
            System.out.println("   - Transaction ID: " + transactionId);
            System.out.println("   - Wallet ID: " + walletId);
            System.out.println("   - User note: " + userNote);
            
            // ✅ TẠO DEPOSIT REQUEST
            DepositRequest depositRequest = new DepositRequest(walletId, user.getUserId(), amount);
            depositRequest.setGatewayTransactionId(transactionId);
            depositRequest.setGatewayName("vietqr");
            
            int depositId = depositRequestDAO.createDepositRequest(depositRequest);
            
            if (depositId > 0) {
                // ✅ XÓA THÔNG TIN KHỎI SESSION SAU KHI TẠO THÀNH CÔNG
                session.removeAttribute("pendingDeposit_amount");
                session.removeAttribute("pendingDeposit_transactionId");
                session.removeAttribute("pendingDeposit_walletId");
                
                // Cập nhật admin note với thông tin xác nhận
                String adminNote = String.format("Khách hàng xác nhận đã chuyển khoản lúc %s. Ghi chú: %s", 
                    java.time.LocalDateTime.now().toString(), userNote);
                
                boolean noteUpdated = depositRequestDAO.updateDepositRequestStatus(
                    depositId, "pending", null, adminNote, null);
                
                if (noteUpdated) {
                    session.setAttribute("successMessage", 
                        "Đã xác nhận chuyển khoản thành công! Yêu cầu nạp tiền đang được xử lý bởi nhân viên. Mã giao dịch: " + transactionId);
                    
                    System.out.println("✅ Deposit request created and confirmed successfully:");
                    System.out.println("   - Deposit ID: " + depositId);
                    System.out.println("   - Transaction ID: " + transactionId);
                    System.out.println("   - Status: pending (waiting for staff approval)");
                } else {
                    session.setAttribute("warningMessage", 
                        "Yêu cầu nạp tiền đã được tạo nhưng không thể cập nhật ghi chú. Mã giao dịch: " + transactionId);
                }
                
            } else {
                session.setAttribute("errorMessage", "Không thể tạo yêu cầu nạp tiền. Vui lòng thử lại.");
                System.err.println("❌ Failed to create deposit request");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error in DepositConfirmServlet: " + e.getMessage());
            e.printStackTrace();
            
            session.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý yêu cầu xác nhận.");
        }
        
        response.sendRedirect(request.getContextPath() + "/wallet");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Không cho phép GET, redirect về trang ví
        response.sendRedirect(request.getContextPath() + "/wallet");
    }
}