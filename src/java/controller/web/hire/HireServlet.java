package controller.web.hire;

import dao.HousekeeperDAO;
import model.Housekeeper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.net.URLEncoder;

@WebServlet(name = "HireServlet", urlPatterns = {"/hire", "/hire/*"})
public class HireServlet extends HttpServlet {
    
    private HousekeeperDAO housekeeperDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        
        try {
            housekeeperDAO = new HousekeeperDAO();
            
            // Test database connection
            if (!housekeeperDAO.testConnection()) {
                throw new ServletException("Database connection failed");
            }
            
            // Debug service coverage
            housekeeperDAO.debugServiceCoverage();
            
            // Ensure we have active housekeepers
            int activeCount = housekeeperDAO.getTotalActiveHousekeepers();
            if (activeCount == 0) {
                System.out.println("⚠️ No active housekeepers found, attempting to activate...");
                housekeeperDAO.activateAllHousekeepers();
            }
            
            System.out.println("✅ HireServlet initialized successfully with " + activeCount + " active housekeepers");
            
        } catch (Exception e) {
            throw new ServletException("Failed to initialize HireServlet: " + e.getMessage(), e);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo != null && pathInfo.length() > 1) {
                // URL pattern: /hire/123 - show housekeeper detail
                try {
                    int housekeeperId = Integer.parseInt(pathInfo.substring(1));
                    showHousekeeperDetail(request, response, housekeeperId);
                } catch (NumberFormatException e) {
                    System.err.println("❌ Invalid housekeeper ID format: " + pathInfo);
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid housekeeper ID");
                }
            } else {
                // URL pattern: /hire - show housekeeper list
                showHousekeeperList(request, response);
            }
        } catch (Exception e) {
            System.err.println("❌ Error in doGet: " + e.getMessage());
            e.printStackTrace();
            
            // Ensure we always forward to JSP even on error
            request.setAttribute("errorMessage", "Đã xảy ra lỗi: " + e.getMessage());
            request.setAttribute("housekeepers", new ArrayList<Housekeeper>());
            request.setAttribute("totalHousekeepers", 0);
            request.setAttribute("searchPerformed", false);
            
            // FIXED: Correct JSP path
            request.getRequestDispatcher("/view/jsp/customer/hire.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        if ("search".equals(action)) {
            handleSearch(request, response);
        } else if ("filterByService".equals(action)) {
            handleServiceFilter(request, response);
        } else {
            doGet(request, response);
        }
    }
    
    /**
     * Hiển thị danh sách housekeeper với khả năng tìm kiếm và lọc
     */
    private void showHousekeeperList(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Housekeeper> housekeepers = new ArrayList<>();
        boolean searchPerformed = false;
        String filterType = "";
        
        try {
            // Check search parameters
            String search = request.getParameter("search");
            String area = request.getParameter("area");
            String district = request.getParameter("district");
            String minPriceStr = request.getParameter("minPrice");
            String maxPriceStr = request.getParameter("maxPrice");
            String skills = request.getParameter("skills");
            String service = request.getParameter("service"); // Service filter
            
            // Use district if area is not provided
            if ((area == null || area.trim().isEmpty()) && district != null && !district.trim().isEmpty()) {
                area = district;
            }
            
            if (hasSearchParameters(search, area, minPriceStr, maxPriceStr, skills, service)) {
                // Perform search
                searchPerformed = true;
                BigDecimal minPrice = parsePrice(minPriceStr);
                BigDecimal maxPrice = parsePrice(maxPriceStr);
                
                // Handle service-based filtering
                if (service != null && !service.trim().isEmpty()) {
                    filterType = "service";
                    housekeepers = housekeeperDAO.getHousekeepersByService(service);
                    System.out.println("🔍 Filtered by service: " + service + " -> " + housekeepers.size() + " results");
                } else {
                    // Regular search
                    filterType = "general";
                    housekeepers = housekeeperDAO.searchHousekeepers(search, area, minPrice, maxPrice, skills);
                    System.out.println("🔍 General search -> " + housekeepers.size() + " results");
                }
                
                // Set search attributes for form retention
                request.setAttribute("searchTerm", search);
                request.setAttribute("selectedArea", area);
                request.setAttribute("selectedDistrict", district);
                request.setAttribute("minPrice", minPriceStr);
                request.setAttribute("maxPrice", maxPriceStr);
                request.setAttribute("selectedSkills", skills);
                request.setAttribute("selectedService", service);
                
            } else {
                // Load all active housekeepers
                filterType = "all";
                housekeepers = housekeeperDAO.getAllActiveHousekeepers();
                System.out.println("📋 Loaded all active housekeepers -> " + housekeepers.size() + " results");
            }
            
            if (housekeepers == null) {
                housekeepers = new ArrayList<>();
            }
            
        } catch (Exception e) {
            housekeepers = new ArrayList<>();
            request.setAttribute("errorMessage", "Lỗi khi tải danh sách nhân viên: " + e.getMessage());
            System.err.println("❌ Error in showHousekeeperList: " + e.getMessage());
            e.printStackTrace();
        }
        
        // Set JSP attributes
        request.setAttribute("housekeepers", housekeepers);
        request.setAttribute("totalHousekeepers", housekeepers.size());
        request.setAttribute("searchPerformed", searchPerformed);
        request.setAttribute("filterType", filterType);
        
        // Calculate statistics
        long topRatedCount = housekeepers.stream()
                .filter(h -> h.getAverageRating() != null && h.getAverageRating().compareTo(new BigDecimal("4.5")) >= 0)
                .count();
        request.setAttribute("topRatedCount", topRatedCount);
        
        // Add service statistics for debugging
        try {
            List<String[]> serviceStats = housekeeperDAO.getServiceStatistics();
            request.setAttribute("serviceStatistics", serviceStats);
        } catch (Exception e) {
            System.err.println("❌ Error getting service statistics: " + e.getMessage());
        }
        
        // FIXED: Correct JSP path for hire list
        request.getRequestDispatcher("/view/jsp/customer/hire.jsp").forward(request, response);
    }
    
    /**
     * NEW: Hiển thị chi tiết housekeeper
     */
    private void showHousekeeperDetail(HttpServletRequest request, HttpServletResponse response, int housekeeperId) 
            throws ServletException, IOException {
        
        try {
            System.out.println("🔍 Looking for housekeeper with ID: " + housekeeperId);
            
            // Get housekeeper details
            Housekeeper housekeeper = housekeeperDAO.getHousekeeperById(housekeeperId);
            
            if (housekeeper == null) {
                System.err.println("❌ Housekeeper not found with ID: " + housekeeperId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy nhân viên");
                return;
            }
            
            System.out.println("✅ Found housekeeper: " + housekeeper.getFullName());
            
            // Set housekeeper attribute
            request.setAttribute("housekeeper", housekeeper);
            
            // Get related housekeepers (same area) - optional
            try {
                List<Housekeeper> relatedHousekeepers = housekeeperDAO.getHousekeepersByArea(housekeeper.getWorkAreas());
                if (relatedHousekeepers != null) {
                    relatedHousekeepers.removeIf(h -> h.getUserId() == housekeeperId); // Remove current housekeeper
                    
                    if (relatedHousekeepers.size() > 4) {
                        relatedHousekeepers = relatedHousekeepers.subList(0, 4);
                    }
                    
                    request.setAttribute("relatedHousekeepers", relatedHousekeepers);
                    System.out.println("✅ Found " + relatedHousekeepers.size() + " related housekeepers");
                }
            } catch (Exception e) {
                System.err.println("⚠️ Error getting related housekeepers: " + e.getMessage());
                // Continue without related housekeepers
            }
            
            // TODO: Get reviews for this housekeeper (if you have reviews table)
            // List<Review> reviews = reviewDAO.getReviewsByHousekeeperId(housekeeperId);
            // request.setAttribute("reviews", reviews);
            
            // NEW: Forward to housekeeper detail page
            request.getRequestDispatcher("/view/jsp/customer/housekeeper-detail.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("❌ Error in showHousekeeperDetail: " + e.getMessage());
            e.printStackTrace();
            
            request.setAttribute("errorMessage", "Lỗi khi tải thông tin nhân viên: " + e.getMessage());
            
            // Redirect back to hire list on error
            response.sendRedirect(request.getContextPath() + "/hire");
        }
    }
    
    /**
     * Xử lý tìm kiếm thông thường
     */
    private void handleSearch(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Redirect to GET with search parameters
        String search = request.getParameter("search");
        String area = request.getParameter("district");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        String skills = request.getParameter("services");
        
        String redirectUrl = buildRedirectUrl(request.getContextPath() + "/hire", 
            search, area, minPrice, maxPrice, skills, null);
        
        response.sendRedirect(redirectUrl);
    }
    
    /**
     * Xử lý lọc theo dịch vụ cụ thể
     */
    private void handleServiceFilter(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String service = request.getParameter("service");
        
        if (service != null && !service.trim().isEmpty()) {
            String redirectUrl = request.getContextPath() + "/hire?service=" + 
                URLEncoder.encode(service, "UTF-8");
            response.sendRedirect(redirectUrl);
        } else {
            response.sendRedirect(request.getContextPath() + "/hire");
        }
    }
    
    /**
     * Helper method để build redirect URL với parameters
     */
    private String buildRedirectUrl(String baseUrl, String search, String area, 
                                   String minPrice, String maxPrice, String skills, String service) {
        StringBuilder redirectUrl = new StringBuilder(baseUrl + "?");
        boolean hasParam = false;
        
        try {
            if (search != null && !search.trim().isEmpty()) {
                redirectUrl.append("search=").append(URLEncoder.encode(search, "UTF-8"));
                hasParam = true;
            }
            
            if (area != null && !area.trim().isEmpty()) {
                if (hasParam) redirectUrl.append("&");
                redirectUrl.append("area=").append(URLEncoder.encode(area, "UTF-8"));
                hasParam = true;
            }
            
            if (minPrice != null && !minPrice.trim().isEmpty()) {
                if (hasParam) redirectUrl.append("&");
                redirectUrl.append("minPrice=").append(minPrice);
                hasParam = true;
            }
            
            if (maxPrice != null && !maxPrice.trim().isEmpty()) {
                if (hasParam) redirectUrl.append("&");
                redirectUrl.append("maxPrice=").append(maxPrice);
                hasParam = true;
            }
            
            if (skills != null && !skills.trim().isEmpty()) {
                if (hasParam) redirectUrl.append("&");
                redirectUrl.append("skills=").append(URLEncoder.encode(skills, "UTF-8"));
                hasParam = true;
            }
            
            if (service != null && !service.trim().isEmpty()) {
                if (hasParam) redirectUrl.append("&");
                redirectUrl.append("service=").append(URLEncoder.encode(service, "UTF-8"));
                hasParam = true;
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error building redirect URL: " + e.getMessage());
        }
        
        return redirectUrl.toString();
    }
    
    /**
     * Helper method để kiểm tra có search parameters không
     */
    private boolean hasSearchParameters(String search, String area, String minPrice, 
                                       String maxPrice, String skills, String service) {
        return (search != null && !search.trim().isEmpty()) ||
               (area != null && !area.trim().isEmpty()) ||
               (minPrice != null && !minPrice.trim().isEmpty()) ||
               (maxPrice != null && !maxPrice.trim().isEmpty()) ||
               (skills != null && !skills.trim().isEmpty()) ||
               (service != null && !service.trim().isEmpty());
    }
    
    /**
     * Helper method để parse price
     */
    private BigDecimal parsePrice(String priceStr) {
        if (priceStr == null || priceStr.trim().isEmpty()) {
            return null;
        }
        
        try {
            return new BigDecimal(priceStr);
        } catch (NumberFormatException e) {
            System.err.println("❌ Invalid price format: " + priceStr);
            return null;
        }
    }
    
    @Override
    public void destroy() {
        super.destroy();
        System.out.println("🔄 HireServlet destroyed");
    }
}