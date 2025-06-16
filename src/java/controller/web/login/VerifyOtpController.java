/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


/**
 *
 * @author TGDD
 */
@WebServlet("/verify-otp")
public class VerifyOtpController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String inputOtp = request.getParameter("otp");

        HttpSession session = request.getSession();
        String sessionOtp = (String) session.getAttribute("otp");

        if (sessionOtp != null && sessionOtp.equals(inputOtp)) {
            session.setAttribute("resetEmail", email); // Gán email vào session để reset-password dùng
            request.getRequestDispatcher("/view/jsp/home/resetPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Mã OTP không đúng hoặc đã hết hạn.");
            request.setAttribute("email", email); // để giữ lại giá trị email đã nhập
            request.getRequestDispatcher("/view/jsp/home/enterOtp.jsp").forward(request, response);
        }
    }
}


