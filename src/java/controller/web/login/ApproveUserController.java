package controller.web.login;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 *
 * @author TGDD
 */
@WebServlet("/approve-user")
public class ApproveUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDAO dao = new UserDAO();
        dao.activateUser(userId);

        response.sendRedirect(request.getContextPath() + "/pending-users");
    }
}