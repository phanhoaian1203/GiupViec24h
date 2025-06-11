package controller.web.login;

import java.io.IOException; 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
import jakarta.servlet.http.HttpSession; 
import dao.UserDAO; 
import model.User;

@WebServlet("/LoginServlet") public class LoginServlet extends HttpServlet { private static final long serialVersionUID = 1L; private UserDAO userDAO;

@Override
public void init() throws ServletException {
    userDAO = new UserDAO();
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    // Lấy tham số từ form đăng nhập
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Kiểm tra dữ liệu đầu vào
    if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
        request.setAttribute("errorMessage", "Email và mật khẩu không được để trống.");
        request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
        return;
    }

    // Xác thực người dùng
    User user = userDAO.getUserByEmailAndPassword(email, password);

    if (user != null && user.isActive()) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        String contextPath = request.getContextPath();
        // Điều hướng dựa trên vai trò
        switch (user.getRole()) {
            case "admin":
                response.sendRedirect(contextPath + "/view/jsp/admin/adminDashboard.jsp");
                break;
            case "customer":
                response.sendRedirect(contextPath + "/view/jsp/customer/customerDashboard.jsp");
                break;
            case "housekeeper":
                response.sendRedirect(contextPath + "/view/jsp/housekeeper/housekeeperDashboard.jsp");
                break;
            case "staff":
                response.sendRedirect(contextPath + "/view/jsp/staff/staffDashboard.jsp");
                break;
            default:
                request.setAttribute("errorMessage", "Vai trò không được công nhận.");
                request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
        }
    } else {
        request.setAttribute("errorMessage", "Email, mật khẩu không hợp lệ hoặc tài khoản chưa được kích hoạt.");
        request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
    }
}

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    // Chuyển hướng đến trang login khi truy cập bằng GET
    request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
}

}
