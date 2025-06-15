/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web.login;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.EmailUtils;

import model.User;

/**
 *
 * @author TGDD
 */
@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);

        if (user != null) {
            String otp = String.valueOf((int)(Math.random() * 900000) + 100000); // mã 6 chữ số

            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("resetEmail", email);
            session.setMaxInactiveInterval(15 * 60); // hết hạn trong 15 phút

            EmailUtils.sendEmail(email, "Mã OTP Đặt Lại Mật Khẩu", 
                "Xin chào,\n\nMã OTP của bạn là: " + otp + "\nHiệu lực trong 15 phút.\n\nGiúp Việc 24h");

            request.setAttribute("message", "Đã gửi OTP đến email của bạn.");
            request.getRequestDispatcher("/view/jsp/home/enterOtp.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Email không tồn tại!");
            request.getRequestDispatcher("/view/jsp/home/forgotPassword.jsp").forward(request, response);
        }
    }
}
