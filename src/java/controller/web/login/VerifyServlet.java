/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web.login;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;
import dao.UserDAO;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "VerifyServlet", urlPatterns = {"/VerifyServlet"})
@MultipartConfig(maxFileSize = 10485760) // Giới hạn 10MB cho mỗi file
public class VerifyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        try {
            userDAO = new UserDAO();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize UserDAO: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Lấy session và kiểm tra tempUser
        HttpSession session = request.getSession();
        User tempUser = (User) session.getAttribute("tempUser");

        if (tempUser == null) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/signup.jsp");
            return;
        }

        // Lấy dữ liệu từ form
        String fullName = request.getParameter("fullName");
        String experience = request.getParameter("experience");
        String skills = request.getParameter("skills");
        String pricePerHourStr = request.getParameter("pricePerHour");
        String availableHours = request.getParameter("availableHours");

        // Kiểm tra dữ liệu cơ bản
        if (fullName == null || fullName.trim().isEmpty() || pricePerHourStr == null || pricePerHourStr.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Họ tên và giá dịch vụ là bắt buộc.");
            request.getRequestDispatcher("/view/jsp/verification.jsp").forward(request, response);
            return;
        }

        // Chuyển đổi pricePerHour từ String sang double
        double pricePerHour = 0.0;
        try {
            pricePerHour = Double.parseDouble(pricePerHourStr);
            if (pricePerHour <= 0) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Giá dịch vụ phải là số dương hợp lệ.");
            request.getRequestDispatcher("/view/jsp/verification.jsp").forward(request, response);
            return;
        }

        // Xử lý file upload (verificationDocs và selfie)
        Part verificationDocsPart = request.getPart("verificationDocs");
        Part selfiePart = request.getPart("selfie");

        if (verificationDocsPart == null || selfiePart == null || verificationDocsPart.getSize() == 0 || selfiePart.getSize() == 0) {
            request.setAttribute("errorMessage", "Vui lòng tải lên cả giấy tờ và ảnh selfie.");
            request.getRequestDispatcher("/view/jsp/verification.jsp").forward(request, response);
            return;
        }

        // Kiểm tra định dạng file
        String verificationDocsContentType = verificationDocsPart.getContentType();
        String selfieContentType = selfiePart.getContentType();
        if (!verificationDocsContentType.startsWith("image/") && !verificationDocsContentType.equals("application/pdf") ||
            !selfieContentType.startsWith("image/")) {
            request.setAttribute("errorMessage", "Giấy tờ phải là ảnh hoặc PDF, selfie phải là ảnh.");
            request.getRequestDispatcher("/view/jsp/verification.jsp").forward(request, response);
            return;
        }

        // Lưu file vào thư mục trên server
        String uploadDir = request.getServletContext().getRealPath("/uploads");
        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        String verificationDocsFileName = System.currentTimeMillis() + "_" + Paths.get(verificationDocsPart.getSubmittedFileName()).getFileName().toString();
        String selfieFileName = System.currentTimeMillis() + "_" + Paths.get(selfiePart.getSubmittedFileName()).getFileName().toString();

        try {
            verificationDocsPart.write(uploadPath + "/" + verificationDocsFileName);
            selfiePart.write(uploadPath + "/" + selfieFileName);
        } catch (IOException e) {
            request.setAttribute("errorMessage", "Lỗi khi lưu file: " + e.getMessage());
            request.getRequestDispatcher("/view/jsp/verification.jsp").forward(request, response);
            return;
        }

        // Cập nhật thông tin user
        tempUser.setFullName(fullName);
        tempUser.setExperience(experience != null ? experience.trim() : "");
        tempUser.setSkills(skills != null ? skills.trim() : "");
        tempUser.setPricePerHour(pricePerHour);
        tempUser.setAvailableHours(availableHours != null ? availableHours.trim() : "");
        tempUser.setVerificationDocs(verificationDocsFileName);
        tempUser.setSelfie(selfieFileName);

        // Lưu thông tin vào cơ sở dữ liệu
        try {
            userDAO.saveUser(tempUser);
            session.removeAttribute("tempUser");
            request.setAttribute("successMessage", "Hồ sơ đã được gửi. Vui lòng đợi duyệt trong 24-48 giờ.");
            request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Lỗi khi lưu hồ sơ vào cơ sở dữ liệu: " + e.getMessage());
            // Xóa file đã tải lên nếu lưu thất bại
            try {
                Files.deleteIfExists(Paths.get(uploadPath + "/" + verificationDocsFileName));
                Files.deleteIfExists(Paths.get(uploadPath + "/" + selfieFileName));
            } catch (IOException ex) {
                // Bỏ qua lỗi xóa file nếu có
            }
            request.getRequestDispatcher("/view/jsp/verification.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Chuyển hướng GET request về trang verification.jsp
        response.sendRedirect(request.getContextPath() + "/view/jsp/verification.jsp");
    }
}
