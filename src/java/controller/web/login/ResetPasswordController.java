/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


package controller.web.login;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

@WebServlet("/reset-password")
public class ResetPasswordController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        System.out.println("New password: " + newPassword);
        System.out.println("Confirm password: " + confirmPassword);

        if (!newPassword.equals(confirmPassword)) {
            System.out.println("\u274c Mật khẩu không khớp.");
            request.setAttribute("error", "Mật khẩu không khớp.");
            request.getRequestDispatcher("/view/jsp/home/resetPassword.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");

        System.out.println("Session resetEmail: " + email);

        if (email != null) {
            UserDAO dao = new UserDAO();
            System.out.println("\ud83d\udd0d Gọi updatePassword...");
            dao.updatePassword(email, newPassword);
            System.out.println("\u2705 Mật khẩu đã được cập nhật cho: " + email);

            session.removeAttribute("otp");
            session.removeAttribute("resetEmail");

            request.setAttribute("message", "Mật khẩu đã được cập nhật thành công!");
            request.getRequestDispatcher("/view/jsp/home/login.jsp").forward(request, response);
        } else {
            System.out.println("\u274c Email null trong session. Redirect về forgot-password.jsp");
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/forgotPassword.jsp");
        }
    }
}
