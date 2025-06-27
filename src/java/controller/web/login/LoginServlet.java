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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email và mật khẩu không được để trống.");
            request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.getUserByEmailAndPassword(email, password);

        if (user != null && user.isActive()) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role_id", user.getRoleId()); // Lưu role_id
            session.setAttribute("role", user.getRole()); // Lưu role name
            session.setMaxInactiveInterval(30 * 60); // Timeout 30 phút

            String contextPath = request.getContextPath();
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
                case "support":
                    response.sendRedirect(contextPath + "/view/jsp/staff/staffDashboard.jsp");
                    break;
                default:
                    session.invalidate();
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
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            String role = (String) session.getAttribute("role");
            String contextPath = request.getContextPath();
            switch (role) {
                case "admin":
                    response.sendRedirect(contextPath + "/view/jsp/admin/adminDashboard.jsp");
                    break;
                case "customer":
                    response.sendRedirect(contextPath + "/view/jsp/customer/customerDashboard.jsp");
                    break;
                case "housekeeper":
                    response.sendRedirect(contextPath + "/view/jsp/housekeeper/housekeeperDashboard.jsp");
                    break;
                case "support":
                    response.sendRedirect(contextPath + "/view/jsp/staff/staffDashboard.jsp");
                    break;
                default:
                    session.invalidate();
                    request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
        }
    }
}