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
import dao.BookingDAO;
import java.util.List;
import model.Booking;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ViewBookingsServlet", urlPatterns = {"/ViewBookingsServlet"})
public class ViewBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
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

        List<Booking> bookings = bookingDAO.getBookingsByHousekeeperId(
            user.getUserId(), startDate, endDate, status
        );

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/view/jsp/housekeeper/viewBookings.jsp").forward(request, response);
    }
}
