package controller.web.login;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmailAndPassword(email, password);

        if (user != null && user.isStatus()) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            String contextPath = request.getContextPath();
            switch (user.getRoleId()) {
                case 1: // Admin
                    response.sendRedirect(contextPath + "/view/jsp/admin/adminDashboard.jsp");
                    break;
                case 2: // Customer
                    response.sendRedirect(contextPath + "/view/jsp/admin/customerDashboard.jsp");
                    break;
                case 3: // Worker
                    response.sendRedirect(contextPath + "/view/jsp/admin/workerDashboard.jsp");
                    break;
                default:
                    request.setAttribute("errorMessage", "Role not recognized.");
                    request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email, password, or account is inactive.");
            request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
        }
    }
}