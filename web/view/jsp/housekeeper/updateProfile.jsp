<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User, model.HousekeeperProfile" %>
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
    HousekeeperProfile profile = (HousekeeperProfile) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập Nhật Hồ Sơ - Giúp Việc 24h</title>
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
            max-width: 800px;
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

        /* Form Section */
        .form-container {
            background: var(--white);
            border-radius: var(--radius-lg);
            padding: 2rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-light);
        }

        .form-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border-light);
        }

        .form-header i {
            color: var(--primary-color);
            font-size: 1.125rem;
        }

        .form-header h3 {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text-primary);
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
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
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .form-input, .form-textarea {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-light);
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            background: var(--white);
            transition: all 0.2s ease;
        }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-input:focus, .form-textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgb(37 99 235 / 0.1);
        }

        .form-error {
            color: var(--danger-color);
            font-size: 0.75rem;
            margin-top: 0.25rem;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .submit-btn, .cancel-btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: var(--radius-md);
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .submit-btn {
            background: var(--primary-color);
            color: var(--white);
        }

        .submit-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .cancel-btn {
            background: var(--light-bg);
            color: var(--text-primary);
            border: 1px solid var(--border-light);
        }

        .cancel-btn:hover {
            background: var(--white);
            transform: translateY(-1px);
            box-shadow: var(--shadow-sm);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-container {
                padding: 1rem;
            }

            .page-header {
                padding: 1.5rem;
            }

            .header-text h1 {
                font-size: 1.5rem;
            }

            .form-container {
                padding: 1.5rem;
            }

            .form-actions {
                flex-direction: column;
            }

            .submit-btn, .cancel-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="header-content">
                <div class="header-icon">
                    <i class="fas fa-user-edit"></i>
                </div>
                <div class="header-text">
                    <h1>Cập Nhật Hồ Sơ</h1>
                    <p>Chỉnh sửa thông tin cá nhân và nghề nghiệp của bạn</p>
                </div>
            </div>
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <div class="form-header">
                <i class="fas fa-pen"></i>
                <h3>Thông Tin Hồ Sơ</h3>
            </div>
            <form id="profileForm" action="${pageContext.request.contextPath}/UpdateProfileServlet" method="POST">
                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label" for="fullName">
                            <i class="fas fa-user"></i> Họ và tên
                        </label>
                        <input type="text" id="fullName" name="fullName" class="form-input" 
                               value="<c:out value='${profile.fullName}' />" required>
                        <c:if test="${not empty errors.fullName}">
                            <span class="form-error">${errors.fullName}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="email">
                            <i class="fas fa-envelope"></i> Email
                        </label>
                        <input type="email" id="email" name="email" class="form-input" 
                               value="<c:out value='${profile.email}' />" readonly>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="phoneNumber">
                            <i class="fas fa-phone"></i> Số điện thoại
                        </label>
                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-input" 
                               value="<c:out value='${profile.phoneNumber}' />" required>
                        <c:if test="${not empty errors.phoneNumber}">
                            <span class="form-error">${errors.phoneNumber}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="address">
                            <i class="fas fa-map-marker-alt"></i> Địa chỉ
                        </label>
                        <input type="text" id="address" name="address" class="form-input" 
                               value="<c:out value='${profile.address}' />" required>
                        <c:if test="${not empty errors.address}">
                            <span class="form-error">${errors.address}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="birthYear">
                            <i class="fas fa-birthday-cake"></i> Năm sinh
                        </label>
                        <input type="number" id="birthYear" name="birthYear" class="form-input" 
                               value="${profile.birthYear}" min="1901" max="2025">
                        <c:if test="${not empty errors.birthYear}">
                            <span class="form-error">${errors.birthYear}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="hometown">
                            <i class="fas fa-home"></i> Quê quán
                        </label>
                        <input type="text" id="hometown" name="hometown" class="form-input" 
                               value="<c:out value='${profile.hometown}' />">
                        <c:if test="${not empty errors.hometown}">
                            <span class="form-error">${errors.hometown}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="experienceYears">
                            <i class="fas fa-briefcase"></i> Kinh nghiệm (năm)
                        </label>
                        <input type="number" id="experienceYears" name="experienceYears" class="form-input" 
                               value="${profile.experienceYears}" min="0" step="0.5">
                        <c:if test="${not empty errors.experienceYears}">
                            <span class="form-error">${errors.experienceYears}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="hourlyRate">
                            <i class="fas fa-money-bill-wave"></i> Mức giá/giờ (₫)
                        </label>
                        <input type="number" id="hourlyRate" name="hourlyRate" class="form-input" 
                               value="${profile.hourlyRate}" min="0" step="1000">
                        <c:if test="${not empty errors.hourlyRate}">
                            <span class="form-error">${errors.hourlyRate}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="dailyRate">
                            <i class="fas fa-money-bill-wave"></i> Mức giá/ngày (₫)
                        </label>
                        <input type="number" id="dailyRate" name="dailyRate" class="form-input" 
                               value="${profile.dailyRate}" min="0" step="1000">
                        <c:if test="${not empty errors.dailyRate}">
                            <span class="form-error">${errors.dailyRate}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="monthlyRate">
                            <i class="fas fa-money-bill-wave"></i> Mức giá/tháng (₫)
                        </label>
                        <input type="number" id="monthlyRate" name="monthlyRate" class="form-input" 
                               value="${profile.monthlyRate}" min="0" step="1000">
                        <c:if test="${not empty errors.monthlyRate}">
                            <span class="form-error">${errors.monthlyRate}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="workAreas">
                            <i class="fas fa-map"></i> Khu vực làm việc (phân cách bằng dấu phẩy)
                        </label>
                        <input type="text" id="workAreas" name="workAreas" class="form-input" 
                               value="<c:out value='${profile.workAreas}' />">
                        <c:if test="${not empty errors.workAreas}">
                            <span class="form-error">${errors.workAreas}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="skills">
                            <i class="fas fa-tools"></i> Kỹ năng (phân cách bằng dấu phẩy)
                        </label>
                        <input type="text" id="skills" name="skills" class="form-input" 
                               value="<c:out value='${profile.skills}' />">
                        <c:if test="${not empty errors.skills}">
                            <span class="form-error">${errors.skills}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="profileImageUrl">
                            <i class="fas fa-image"></i> URL ảnh hồ sơ
                        </label>
                        <input type="text" id="profileImageUrl" name="profileImageUrl" class="form-input" 
                               value="<c:out value='${profile.profileImageUrl}' />" readonly>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-save"></i> Lưu thay đổi
                    </button>
                    <a href="${pageContext.request.contextPath}/view/jsp/housekeeper/housekeeperDashboard.jsp" class="cancel-btn">
                        <i class="fas fa-times"></i> Hủy
                    </a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="/view/common/web/footer.jsp" %>
    <%@ include file="/view/common/web/add_js.jsp" %>
    <script>
        document.getElementById('profileForm').addEventListener('submit', function(e) {
            const submitBtn = this.querySelector('.submit-btn');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang lưu...';
            submitBtn.disabled = true;
        });
    </script>
</body>
</html>