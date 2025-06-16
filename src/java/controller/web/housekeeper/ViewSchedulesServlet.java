/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web.housekeeper;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import dao.HousekeeperScheduleDAO;
import java.util.List;
import model.HousekeeperSchedule;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ViewSchedulesServlet", urlPatterns = {"/ViewSchedulesServlet"})
public class ViewSchedulesServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
    private HousekeeperScheduleDAO scheduleDAO;

    @Override
    public void init() throws ServletException {
        scheduleDAO = new HousekeeperScheduleDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null && session.getAttribute("user") != null) 
                    ? (User) session.getAttribute("user") : null;

        if (user == null || !"housekeeper".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }

        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String status = request.getParameter("status");

        List<HousekeeperSchedule> schedules = scheduleDAO.getSchedulesByHousekeeperId(
            user.getUserId(), startDate, endDate, status
        );

        request.setAttribute("schedules", schedules);
        request.getRequestDispatcher("/view/jsp/housekeeper/viewSchedules.jsp").forward(request, response);
    }
}