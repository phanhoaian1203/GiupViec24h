package controller.web.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;
import utils.DBContext;

@WebServlet("/update-profile")
@MultipartConfig
public class UpdateCustomerProServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "view/assets/profile/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }

        try {
            // Get form parameters
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            int birthYear = Integer.parseInt(request.getParameter("birthYear"));
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            Part filePart = request.getPart("avatar");

            // Validate input
            if (fullName == null || fullName.trim().length() < 2) {
                request.setAttribute("errorMessage", "Họ và tên không hợp lệ");
                request.getRequestDispatcher("/view/jsp/customer/customer-profile.jsp").forward(request, response);
                return;
            }

            if (phone == null || !phone.matches("^[0-9]{10}$")) {
                request.setAttribute("errorMessage", "Số điện thoại không hợp lệ");
                request.getRequestDispatcher("/view/jsp/customer/customer-profile.jsp").forward(request, response);
                return;
            }

            int currentYear = java.time.Year.now().getValue();
            if (birthYear < 1900 || birthYear > currentYear) {
                request.setAttribute("errorMessage", "Năm sinh không hợp lệ");
                request.getRequestDispatcher("/view/jsp/customer/customer-profile.jsp").forward(request, response);
                return;
            }

            if (!gender.equals("male") && !gender.equals("female") && !gender.equals("other")) {
                request.setAttribute("errorMessage", "Giới tính không hợp lệ");
                request.getRequestDispatcher("/view/jsp/customer/customer-profile.jsp").forward(request, response);
                return;
            }

            String profileImageUrl = user.getProfileImageUrl();
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = user.getUserId() + "_" + System.currentTimeMillis() + ".jpg";
                String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR;
                Files.createDirectories(Paths.get(uploadPath));
                
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, Paths.get(uploadPath + fileName), StandardCopyOption.REPLACE_EXISTING);
                }
                profileImageUrl = UPLOAD_DIR + fileName;
            }

            // Update database
            try (Connection conn = DBContext.getConnection()) {
                String sql = "UPDATE users SET full_name = ?, phone_number = ?, birth_year = ?, gender = ?, address = ? WHERE user_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, fullName);
                    stmt.setString(2, phone);
                    stmt.setInt(3, birthYear);
                    stmt.setString(4, gender);
                    stmt.setString(5, address);
                    stmt.setInt(6, user.getUserId());

                    int rowsUpdated = stmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        user.setFullName(fullName);
                        user.setPhoneNumber(phone);
                        user.setBirthYear(birthYear);
                        user.setGender(gender);
                        user.setAddress(address);
                        if (profileImageUrl != null) {
                            user.setProfileImageUrl(profileImageUrl);
                        }
                        session.setAttribute("user", user);
                        request.setAttribute("successMessage", "Cập nhật thông tin thành công!");
                    } else {
                        request.setAttribute("errorMessage", "Không thể cập nhật thông tin");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
            }

            request.getRequestDispatcher("/view/jsp/customer/customer-profile.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý yêu cầu");
            request.getRequestDispatcher("/view/jsp/customer/customer-profile.jsp").forward(request, response);
        }
    }
}