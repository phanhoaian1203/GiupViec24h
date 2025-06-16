/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web.housekeeper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.HousekeeperProfile;
import dao.HousekeeperProfileDAO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HousekeeperProfileDAO profileDAO;

    @Override
    public void init() throws ServletException {
        profileDAO = new HousekeeperProfileDAO();
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

        HousekeeperProfile profile = profileDAO.getHousekeeperProfileById(user.getUserId());
        request.setAttribute("profile", profile);
        request.getRequestDispatcher("/view/jsp/housekeeper/updateProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null && session.getAttribute("user") != null) 
                    ? (User) session.getAttribute("user") : null;

        if (user == null || !"housekeeper".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
            return;
        }

        Map<String, String> errors = new HashMap<>();
        HousekeeperProfile profile = new HousekeeperProfile();
        profile.setHousekeeperId(user.getUserId());

        // Validate input
        String fullName = request.getParameter("fullName");
        if (fullName == null || fullName.trim().isEmpty()) {
            errors.put("fullName", "Họ và tên không được để trống");
        } else if (fullName.length() > 100) {
            errors.put("fullName", "Họ và tên không được vượt quá 100 ký tự");
        } else {
            profile.setFullName(fullName.trim());
        }

        String phoneNumber = request.getParameter("phoneNumber");
        if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            errors.put("phoneNumber", "Số điện thoại không được để trống");
        } else if (!phoneNumber.matches("\\d{10,12}")) {
            errors.put("phoneNumber", "Số điện thoại phải có 10-12 chữ số");
        } else {
            profile.setPhoneNumber(phoneNumber.trim());
        }

        String address = request.getParameter("address");
        if (address == null || address.trim().isEmpty()) {
            errors.put("address", "Địa chỉ không được để trống");
        } else if (address.length() > 500) {
            errors.put("address", "Địa chỉ không được vượt quá 500 ký tự");
        } else {
            profile.setAddress(address.trim());
        }

        try {
            String birthYearStr = request.getParameter("birthYear");
            int birthYear = birthYearStr != null && !birthYearStr.isEmpty() ? Integer.parseInt(birthYearStr) : 0;
            if (birthYear != 0 && (birthYear <= 1900 || birthYear > 2025)) {
                errors.put("birthYear", "Năm sinh phải từ 1901 đến 2025");
            } else {
                profile.setBirthYear(birthYear);
            }
        } catch (NumberFormatException e) {
            errors.put("birthYear", "Năm sinh phải là số hợp lệ");
        }

        String hometown = request.getParameter("hometown");
        if (hometown != null && hometown.length() > 100) {
            errors.put("hometown", "Quê quán không được vượt quá 100 ký tự");
        } else {
            profile.setHometown(hometown != null ? hometown.trim() : null);
        }

        try {
            String experienceYearsStr = request.getParameter("experienceYears");
            int experienceYears = experienceYearsStr != null && !experienceYearsStr.isEmpty() ? Integer.parseInt(experienceYearsStr) : 0;
            if (experienceYears < 0) {
                errors.put("experienceYears", "Kinh nghiệm không được âm");
            } else if (experienceYears > 100) {
                errors.put("experienceYears", "Kinh nghiệm không được vượt quá 100 năm");
            } else {
                profile.setExperienceYears(experienceYears);
            }
        } catch (NumberFormatException e) {
            errors.put("experienceYears", "Kinh nghiệm phải là số hợp lệ");
        }

        try {
            String hourlyRateStr = request.getParameter("hourlyRate");
            double hourlyRate = hourlyRateStr != null && !hourlyRateStr.isEmpty() ? Double.parseDouble(hourlyRateStr) : 0;
            if (hourlyRate < 0) {
                errors.put("hourlyRate", "Mức giá/giờ không được âm");
            } else {
                profile.setHourlyRate(hourlyRate);
            }
        } catch (NumberFormatException e) {
            errors.put("hourlyRate", "Mức giá/giờ phải là số hợp lệ");
        }

        try {
            String dailyRateStr = request.getParameter("dailyRate");
            double dailyRate = dailyRateStr != null && !dailyRateStr.isEmpty() ? Double.parseDouble(dailyRateStr) : 0;
            if (dailyRate < 0) {
                errors.put("dailyRate", "Mức giá/ngày không được âm");
            } else {
                profile.setDailyRate(dailyRate);
            }
        } catch (NumberFormatException e) {
            errors.put("dailyRate", "Mức giá/ngày phải là số hợp lệ");
        }

        try {
            String monthlyRateStr = request.getParameter("monthlyRate");
            double monthlyRate = monthlyRateStr != null && !monthlyRateStr.isEmpty() ? Double.parseDouble(monthlyRateStr) : 0;
            if (monthlyRate < 0) {
                errors.put("monthlyRate", "Mức giá/tháng không được âm");
            } else {
                profile.setMonthlyRate(monthlyRate);
            }
        } catch (NumberFormatException e) {
            errors.put("monthlyRate", "Mức giá/tháng phải là số hợp lệ");
        }

        String workAreas = request.getParameter("workAreas");
        if (workAreas != null && workAreas.length() > 200) {
            errors.put("workAreas", "Khu vực làm việc không được vượt quá 200 ký tự");
        } else {
            profile.setWorkAreas(workAreas != null ? workAreas.trim() : null);
        }

        String skills = request.getParameter("skills");
        if (skills != null && skills.length() > 200) {
            errors.put("skills", "Kỹ năng không được vượt quá 200 ký tự");
        } else {
            profile.setSkills(skills != null ? skills.trim() : null);
        }

        // Fetch current profile for readonly fields
        HousekeeperProfile currentProfile = profileDAO.getHousekeeperProfileById(user.getUserId());
        if (currentProfile != null) {
            profile.setEmail(currentProfile.getEmail());
            profile.setProfileImageUrl(currentProfile.getProfileImageUrl());
            profile.setAverageRating(currentProfile.getAverageRating());
            profile.setBookingCount(currentProfile.getBookingCount());
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("profile", profile);
            request.getRequestDispatcher("/view/jsp/housekeeper/updateProfile.jsp").forward(request, response);
            return;
        }

        try {
            profileDAO.updateProfile(profile);
            session.setAttribute("successMessage", "Cập nhật hồ sơ thành công!");
            response.sendRedirect(request.getContextPath() + "/view/jsp/housekeeper/housekeeperDashboard.jsp");
        } catch (SQLException e) {
            errors.put("database", "Lỗi khi cập nhật hồ sơ: " + e.getMessage());
            request.setAttribute("errors", errors);
            request.setAttribute("profile", profile);
            request.getRequestDispatcher("/view/jsp/housekeeper/updateProfile.jsp").forward(request, response);
        }
    }
}