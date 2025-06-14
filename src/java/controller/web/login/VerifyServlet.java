package controller.web.login;

import dao.HousekeeperProfileDAO;
import dao.UserDAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.HousekeeperProfile;
import model.User;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "VerifyServlet", urlPatterns = {"/VerifyServlet"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // Giới hạn 5MB cho mỗi file
public class VerifyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HousekeeperProfileDAO profileDAO;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        profileDAO = new HousekeeperProfileDAO();
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("tempUser");
        if (user == null || user.getUserId() <= 0) {
            request.setAttribute("errorMessage", "Phiên làm việc đã hết hạn hoặc thông tin người dùng không hợp lệ.");
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
            return;
        }

        // Kiểm tra userId tồn tại trong users
        if (!userDAO.emailExists(user.getEmail())) {
            request.setAttribute("errorMessage", "Tài khoản không tồn tại trong hệ thống.");
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
            return;
        }

        // Lấy dữ liệu từ form
        String fullName = request.getParameter("fullName");
        String experienceYearsStr = request.getParameter("experienceYears");
        String hourlyRateStr = request.getParameter("hourlyRate");
        String workAreas = request.getParameter("workAreas");
        String skills = request.getParameter("skills");

        // Validate dữ liệu
        if (fullName == null || fullName.trim().isEmpty() || experienceYearsStr == null || experienceYearsStr.trim().isEmpty() ||
            hourlyRateStr == null || hourlyRateStr.trim().isEmpty() || workAreas == null || workAreas.trim().isEmpty() ||
            skills == null || skills.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin bắt buộc.");
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
            return;
        }

        // Xử lý file upload
        Part docFrontPart = request.getPart("verificationDocFront");
        Part docBackPart = request.getPart("verificationDocBack");
        Part selfiePart = request.getPart("selfie");

        if (docFrontPart == null || docFrontPart.getSize() == 0 || docBackPart == null || docBackPart.getSize() == 0 || 
            selfiePart == null || selfiePart.getSize() == 0) {
            request.setAttribute("errorMessage", "Vui lòng tải lên đầy đủ các file yêu cầu.");
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
            return;
        }

        // Đường dẫn lưu file
        String uploadDir = request.getServletContext().getRealPath("/uploads/verification");
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        // Tạo tên file duy nhất
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
        String timestamp = LocalDateTime.now().format(formatter); // 20250614_1811
        String docFrontName = "doc_front_" + timestamp + "_" + docFrontPart.getSubmittedFileName();
        String docBackName = "doc_back_" + timestamp + "_" + docBackPart.getSubmittedFileName();
        String selfieName = "selfie_" + timestamp + "_" + selfiePart.getSubmittedFileName();

        // Lưu file
        String docFrontPath = uploadDir + File.separator + docFrontName;
        String docBackPath = uploadDir + File.separator + docBackName;
        String selfiePath = uploadDir + File.separator + selfieName;

        try {
            Files.copy(docFrontPart.getInputStream(), Path.of(docFrontPath), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(docBackPart.getInputStream(), Path.of(docBackPath), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(selfiePart.getInputStream(), Path.of(selfiePath), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            request.setAttribute("errorMessage", "Lỗi khi tải lên file: " + e.getMessage());
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng HousekeeperProfile
        HousekeeperProfile profile = new HousekeeperProfile();
        profile.setHousekeeperId(user.getUserId());
        try {
            profile.setExperienceYears(Integer.parseInt(experienceYearsStr));
            profile.setHourlyRate(Double.parseDouble(hourlyRateStr));
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Kinh nghiệm hoặc giá phải là số hợp lệ.");
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
            return;
        }
        profile.setDailyRate(0.0); // Mặc định
        profile.setMonthlyRate(0.0); // Mặc định
        profile.setAverageRating(0.0); // Mặc định
        profile.setBookingCount(0); // Mặc định
        profile.setWorkAreas(workAreas);
        profile.setSkills(skills);
        profile.setProfileImageUrl("uploads/verification/" + selfieName);

        // Lưu thông tin vào verification_requests
        String documentUrlFront = "uploads/verification/" + docFrontName;
        String documentUrlBack = "uploads/verification/" + docBackName;
        try {
            profileDAO.saveVerificationRequest(user.getUserId(), documentUrlFront, documentUrlBack, profile.getProfileImageUrl(), "pending", null, null, null);
            session.setAttribute("pendingProfile_" + user.getUserId(), profile);
            session.removeAttribute("tempUser"); // Xóa user tạm sau khi gửi yêu cầu
            request.setAttribute("successMessage", "Gửi xác minh thành công. Vui lòng chờ duyệt.");
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi gửi yêu cầu xác minh: " + e.getMessage());
            request.getRequestDispatcher("/view/jsp/home/verification.jsp").forward(request, response);
        }
    }
}