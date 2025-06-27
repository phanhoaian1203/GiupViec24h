package controller.web.login;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.User;

@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String area = request.getParameter("area");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");

        // Validate input
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty() || fullName == null || fullName.trim().isEmpty() ||
            dob == null || dob.trim().isEmpty() || gender == null || gender.trim().isEmpty() || role == null || role.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ các trường bắt buộc.");
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra mật khẩu
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu và xác nhận mật khẩu không khớp.");
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra email đã tồn tại
        if (userDAO.emailExists(email)) {
            request.setAttribute("errorMessage", "Email đã được sử dụng.");
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra vai trò
        if (!role.equals("customer") && !role.equals("housekeeper")) {
            request.setAttribute("errorMessage", "Vai trò không hợp lệ.");
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra giới tính
        if (!gender.equals("male") && !gender.equals("female") && !gender.equals("other")) {
            request.setAttribute("errorMessage", "Giới tính không hợp lệ.");
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra và parse năm sinh
        int birthYear;
        try {
            LocalDate dobDate = LocalDate.parse(dob);
            LocalDate currentDate = LocalDate.now();
            if (dobDate.isAfter(currentDate)) {
                request.setAttribute("errorMessage", "Ngày sinh không thể lớn hơn ngày hiện tại.");
                request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
                return;
            }
            birthYear = dobDate.getYear();
            if (birthYear <= 1900 || birthYear > currentDate.getYear()) {
                request.setAttribute("errorMessage", "Năm sinh không hợp lệ.");
                request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Ngày sinh không hợp lệ.");
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra số điện thoại
        if (!phone.matches("0[0-9]{9,10}")) {
            request.setAttribute("errorMessage", "Số điện thoại không hợp lệ (phải bắt đầu bằng 0 và có 10-11 số).");
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng User
        User user = new User();
        user.setEmail(email);
        user.setPassword(password); // Nên mã hóa password trong thực tế
        user.setFullName(fullName);
        user.setPhoneNumber(phone);
        user.setAddress(area);
        user.setGender(gender);
        user.setRole(role);
        user.setBirthYear(birthYear);
        user.setHometown(area); // Có thể cần trường riêng cho hometown nếu khác area

        // Không cần setActive, để trigger SQL xử lý
        try {
            HttpSession session = request.getSession();
            // Lưu vào database và lấy userId
            User savedUser = userDAO.saveUser(user);
            if (savedUser != null && savedUser.getUserId() > 0) {
                if ("housekeeper".equalsIgnoreCase(role)) {
                    // Chuyển đến trang xác minh để upload tài liệu
                    session.setAttribute("tempUser", savedUser);
                    response.sendRedirect(request.getContextPath() + "/view/jsp/home/verification.jsp");
                } else { // customer
                    session.removeAttribute("tempUser");
                    request.setAttribute("successMessage", "Đăng ký thành công, vui lòng đăng nhập.");
                    request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Không thể lấy thông tin user sau khi lưu.");
                request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/view/jsp/home/signup.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/view/jsp/home/signup.jsp");
    }
}