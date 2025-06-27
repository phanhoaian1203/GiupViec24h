<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User, java.util.List, model.Booking" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
    User user = (request.getSession(false) != null && request.getSession(false).getAttribute("user") != null) 
                ? (User) request.getSession(false).getAttribute("user") : null;
    if (user == null || !"housekeeper".equals(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/view/jsp/home/login.jsp");
        return;
    }
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xem Đặt Lịch - Giúp Việc 24h</title>
    <%@ include file="/view/common/web/add_css.jsp" %>
    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary-color: #64748b;
            --success-color: #059669;
            --danger-color: #dc2626;
            --warning-color: #d97706;
            --light-bg: #f8fafc;
            --white: #ffffff;
            --border-light: #e2e8f0;
            --text-primary: #0f172a;
            --text-secondary: #475569;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --radius-xl: 1rem;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--light-bg);
            color: var(--text-primary);
            line-height: 1.6;
            min-height: 100vh;
        }

        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
            min-height: 100vh;
        }

        /* Header Section */
        .page-header {
            background: var(--white);
            border-radius: var(--radius-xl);
            padding: 2.5rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-md);
            border: 1px solid var(--border-light);
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
        }

        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .header-icon {
            width: 3.5rem;
            height: 3.5rem;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            border-radius: var(--radius-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--white);
            font-size: 1.5rem;
        }

        .header-text h1 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.25rem;
        }

        .header-text p {
            color: var(--text-secondary);
            font-size: 1rem;
            font-weight: 400;
        }

        .header-stats {
            display: flex;
            gap: 1.5rem;
        }

        .stat-item {
            text-align: center;
            padding: 0.75rem 1rem;
            background: var(--light-bg);
            border-radius: var(--radius-md);
            border: 1px solid var(--border-light);
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .stat-label {
            font-size: 0.875rem;
            color: var(--text-secondary);
            margin-top: 0.25rem;
        }

        /* Filter Section */
        .filter-panel {
            background: var(--white);
            border-radius: var(--radius-lg);
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-light);
        }

        .filter-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border-light);
        }

        .filter-header i {
            color: var(--primary-color);
            font-size: 1.125rem;
        }

        .filter-header h3 {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text-primary);
        }

        .filter-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            align-items: end;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }

        .form-input, .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-light);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            background: var(--white);
            transition: all 0.2s ease;
        }

        .form-input:focus, .form-select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgb(37 99 235 / 0.1);
        }

        .filter-btn {
            padding: 0.75rem 1.5rem;
            background: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            height: fit-content;
        }

        .filter-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        /* Table Section */
        .table-container {
            background: var(--white);
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-light);
        }

        .table-header {
            padding: 1.5rem;
            background: var(--light-bg);
            border-bottom: 1px solid var(--border-light);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .table-title {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .table-title i {
            color: var(--primary-color);
            font-size: 1.125rem;
        }

        .table-title h3 {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text-primary);
        }

        .table-info {
            font-size: 0.875rem;
            color: var(--text-secondary);
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            background: var(--light-bg);
            padding: 1rem 1.5rem;
            text-align: left;
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-primary);
            border-bottom: 1px solid var(--border-light);
            white-space: nowrap;
        }

        .data-table td {
            padding: 1rem 1.5rem;
            border-bottom: 1px solid var(--border-light);
            font-size: 0.875rem;
            color: var(--text-secondary);
        }

        .data-table tr:hover {
            background: rgba(37, 99, 235, 0.02);
        }

        .data-table tr:last-child td {
            border-bottom: none;
        }

        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.375rem;
            padding: 0.375rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .status-pending {
            background: rgba(217, 119, 6, 0.1);
            color: var(--warning-color);
        }

        .status-accepted {
            background: rgba(5, 150, 105, 0.1);
            color: var(--success-color);
        }

        .status-rejected {
            background: rgba(220, 38, 38, 0.1);
            color: var(--danger-color);
        }

        .status-completed {
            background: rgba(59, 130, 246, 0.1);
            color: var(--primary-color);
        }

        .status-cancelled {
            background: rgba(107, 114, 128, 0.1);
            color: var(--secondary-color);
        }

        .status-dot {
            width: 0.5rem;
            height: 0.5rem;
            border-radius: 50%;
        }

        .status-pending .status-dot { background: var(--warning-color); }
        .status-accepted .status-dot { background: var(--success-color); }
        .status-rejected .status-dot { background: var(--danger-color); }
        .status-completed .status-dot { background: var(--primary-color); }
        .status-cancelled .status-dot { background: var(--secondary-color); }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--text-secondary);
        }

        .empty-state i {
            font-size: 3rem;
            color: var(--border-light);
            margin-bottom: 1rem;
        }

        .empty-state h4 {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }

        .empty-state p {
            font-size: 0.875rem;
        }

        /* Action Button */
        .action-panel {
            margin-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            background: var(--white);
            color: var(--text-primary);
            text-decoration: none;
            border: 1px solid var(--border-light);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .back-button:hover {
            background: var(--light-bg);
            transform: translateY(-1px);
            box-shadow: var(--shadow-sm);
        }

        .table-actions {
            display: flex;
            gap: 0.75rem;
        }

        .action-btn {
            padding: 0.5rem;
            background: var(--light-bg);
            border: 1px solid var(--border-light);
            border-radius: var(--radius-sm);
            color: var(--text-secondary);
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .action-btn:hover {
            background: var(--primary-color);
            color: var(--white);
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .main-container {
                padding: 1.5rem;
            }

            .header-content {
                flex-direction: column;
                text-align: center;
            }

            .header-stats {
                justify-content: center;
            }
        }

        @media (max-width: 769px) {
            .main-container {
                padding: 1rem;
            }

            .page-header {
                padding: 1.5rem;
            }

            .header-text h1 {
                font-size: 1.5rem;
            }

            .filter-grid {
                grid-template-columns: 1fr;
            }

            .table-container {
                overflow-x: auto;
            }

            .data-table {
                min-width: 1400px; /* Điều chỉnh để phù hợp với số cột nhiều */
            }

            .action-panel {
                flex-direction: column;
            }

            .back-button {
                width: 100%;
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            .header-left {
                flex-direction: column;
                text-align: center;
            }

            .header-stats {
                flex-direction: column;
                width: 100%;
            }

            .stat-item {
                width: 100%;
            }

            .table-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
        }
    </style>
</head>

<body>
    <div class="main-container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="header-content">
                <div class="header-left">
                    <div class="header-icon">
                        <i class="fas fa-bookmark"></i>
                    </div>
                <div class="header-text">
                    <h1>Đặt Lịch</h1>
                    <p>Quản lý và theo dõi các đặt lịch được giao cho bạn</p>
                </div>
            </div>
            <div class="header-stats">
                <div class="stat-item">
                    <div class="stat-value">${bookings != null ? bookings.size() : 0}</div>
                    <div class="stat-label">Tổng đặt lịch</div>
                </div>
                <div class="stat-item">
                    <div class="stat-value">
                        <c:set var="acceptedCount" value="0" />
                        <c:forEach var="booking" items="${bookings}">
                            <c:if test="${booking.status == 'accepted'}">
                                <c:set var="acceptedCount" value="${acceptedCount + 1}" />
                            </c:if>
                        </c:forEach>
                        ${acceptedCount}
                    </div>
                    <div class="stat-label">Đã chấp nhận</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Filter Panel -->
    <div class="filter-panel">
        <div class="filter-header">
            <i class="fas fa-filter"></i>
            <h3>Bộ lọc tìm kiếm</h3>
        </div>
        <div class="filter-grid">
            <div class="form-group">
                <label class="form-label" for="startDate">
                    <i class="far fa-calendar-alt"></i> Từ ngày
                </label>
                <input type="date" id="startDate" name="startDate" class="form-input" value="${param.startDate}">
            </div>
            <div class="form-group">
                <label class="form-label" for="endDate">
                    <i class="far fa-calendar-alt"></i> Đến ngày
                </label>
                <input type="date" id="endDate" name="endDate" class="form-input" value="${param.endDate}">
            </div>
            <div class="form-group">
                <label class="form-label" for="status">
                    <i class="fas fa-toggle-on"></i> Trạng thái
                </label>
                <select id="status" name="status" class="form-select">
                    <option value="" ${param.status == '' ? 'selected' : ''}>Tất cả trạng thái</option>
                    <option value="pending" ${param.status == 'pending' ? 'selected' : ''}>Đang chờ</option>
                    <option value="accepted" ${param.status == 'accepted' ? 'selected' : ''}>Đã chấp nhận</option>
                    <option value="rejected" ${param.status == 'rejected' ? 'selected' : ''}>Đã từ chối</option>
                    <option value="completed" ${param.status == 'completed' ? 'selected' : ''}>Đã hoàn thành</option>
                    <option value="cancelled" ${param.status == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                </select>
            </div>
            <div class="form-group">
                <button class="filter-btn" onclick="filterBookings()">
                    <i class="fas fa-search"></i>
                    Áp dụng bộ lọc
                </button>
            </div>
        </div>
    </div>

    <!-- Table Container -->
    <div class="table-container">
        <div class="table-header">
            <div class="table-title">
                <i class="fas fa-list-ul"></i>
                <h3>Danh sách đặt lịch</h3>
            </div>
            <div class="table-info">
                Hiển thị ${bookings != null ? bookings.size() : 0} kết quả
            </div>
        </div>
        
        <c:choose>
            <c:when test="${empty bookings}">
                <div class="empty-state">
                    <i class="far fa-bookmark"></i>
                    <h4>Không có đặt lịch</h4>
                    <p>Hiện tại chưa có đặt lịch nào phù hợp với bộ lọc của bạn.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Khách hàng</th>
                            <th>Thời gian bắt đầu</th>
                            <th>Thời gian kết thúc</th>
                            <th>Địa chỉ</th>
                            <th>Dịch vụ</th>
                            <th>Trạng thái</th>
                            <th>Yêu cầu đặc biệt</th>
                            <th>Tổng giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookings}" varStatus="loop">
                            <tr>
                                <td>
                                    <span style="font-weight: 500; color: var(--text-primary);">
                                        ${loop.index + 1}
                                    </span>
                                </td>
                                <td>
                                    <c:out value="${booking.customerName}" />
                                </td>
                                <td>
                                    <c:if test="${not empty booking.startTimeAsDate}">
                                        <div style="display: flex; flex-direction: column; gap: 0.25rem;">
                                            <span style="font-weight: 500; color: var(--text-primary);">
                                                <fmt:formatDate value="${booking.startTimeAsDate}" pattern="dd/MM/yyyy" />
                                            </span>
                                            <span style="font-size: 0.75rem; color: var(--text-secondary);">
                                                <fmt:formatDate value="${booking.startTimeAsDate}" pattern="HH:mm" />
                                            </span>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty booking.startTimeAsDate}">
                                        <span style="color: var(--text-secondary);">N/A</span>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${not empty booking.endTimeAsDate}">
                                        <div style="display: flex; flex-direction: column; gap: 0.25rem;">
                                            <span style="font-weight: 500; color: var(--text-primary);">
                                                <fmt:formatDate value="${booking.endTimeAsDate}" pattern="dd/MM/yyyy" />
                                            </span>
                                            <span style="font-size: 0.75rem; color: var(--text-secondary);">
                                                <fmt:formatDate value="${booking.endTimeAsDate}" pattern="HH:mm" />
                                            </span>
                                        </div>
                                    </c:if>
                                    <c:if test="${empty booking.endTimeAsDate}">
                                        <span style="color: var(--text-secondary);">N/A</span>
                                    </c:if>
                                </td>
                                <td>
                                    <c:out value="${booking.customerAddress}" default="N/A" />
                                </td>
                                <td>
                                    <c:out value="${booking.serviceNames}" default="N/A" />
                                </td>
                                <td>
                                    <span class="status-badge status-${booking.status}">
                                        <span class="status-dot"></span>
                                        <c:choose>
                                            <c:when test="${booking.status == 'pending'}">Đang chờ</c:when>
                                            <c:when test="${booking.status == 'accepted'}">Đã chấp nhận</c:when>
                                            <c:when test="${booking.status == 'rejected'}">Đã từ chối</c:when>
                                            <c:when test="${booking.status == 'completed'}">Đã hoàn thành</c:when>
                                            <c:when test="${booking.status == 'cancelled'}">Đã hủy</c:when>
                                            <c:otherwise>${booking.status}</c:otherwise>
                                        </c:choose>
                                    </span>
                                </td>
                                <td>
                                    <c:out value="${booking.specialRequests}" default="Không có" />
                                </td>
                                <td>
                                    <fmt:formatNumber value="${booking.totalPrice}" type="currency" currencySymbol="₫" groupingUsed="true" />
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Action Panel -->
    <div class="action-panel">
        <a href="${pageContext.request.contextPath}/view/jsp/housekeeper/housekeeperDashboard.jsp" class="back-button">
            <i class="fas fa-arrow-left"></i>
            Quay lại Dashboard
        </a>
        <div class="table-actions">
            <button class="action-btn" title="Xuất Excel" onclick="exportToExcel()">
                <i class="fas fa-file-excel"></i>
            </button>
            <button class="action-btn" title="In báo cáo" onclick="printReport()">
                <i class="fas fa-print"></i>
            </button>
            <button class="action-btn" title="Làm mới" onclick="refreshPage()">
                <i class="fas fa-sync-alt"></i>
            </button>
        </div>
    </div>
</div>

<%@ include file="/view/common/web/footer.jsp" %>
<%@ include file="/view/common/web/add_js.jsp" %>

<script>
    function filterBookings() {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;
        const status = document.getElementById('status').value;
        const url = `${window.location.pathname}?startDate=${encodeURIComponent(startDate)}&endDate=${encodeURIComponent(endDate)}&status=${encodeURIComponent(status)}`;
        window.location.href = url;
    }

    function exportToExcel() {
        alert('Chức năng xuất Excel sẽ được triển khai sau.');
    }

    function printReport() {
        window.print();
    }

    function refreshPage() {
        window.location.reload();
    }

    // Add loading state to filter button
    document.querySelector('.filter-btn').addEventListener('click', function() {
        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang tải...';
        this.disabled = true;
    });
</script>
</body>
</html>