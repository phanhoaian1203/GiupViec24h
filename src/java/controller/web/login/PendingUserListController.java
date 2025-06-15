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
import java.io.IOException;
import java.util.List;

import model.User;

/**
 *
 * @author TGDD
 */
@WebServlet("/pending-users")
public class PendingUserListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        List<User> pendingUsers = dao.getPendingUsers();
        request.setAttribute("pendingUsers", pendingUsers);
        request.getRequestDispatcher("/view/jsp/admin/pendingUsers.jsp").forward(request, response);
    }
}
