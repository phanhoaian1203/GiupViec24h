<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Lịch Thuê Người Giúp Việc</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="${pageContext.request.contextPath}/js/cscripts.js"></script>
    <%@ include file="/view/common/web/add_css.jsp" %>
    <style>
        .booking-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            box-shadow: 0 20px 40px rgba(26, 179, 148, 0.12);
            border: 1px solid rgba(26, 179, 148, 0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            padding: 2.5rem;
            max-width: 800px;
            margin: 2rem auto;
        }

        .booking-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(90deg, #1AB394, #20d4aa, #1AB394);
        }

        .booking-title {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-size: 1.1rem;
            font-weight: 600;
            color: #1AB394;
            margin-bottom: 0.5rem;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid rgba(26, 179, 148, 0.2);
            border-radius: 12px;
            font-size: 1rem;
            color: #555;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: #1AB394;
            outline: none;
            box-shadow: 0 0 10px rgba(26, 179, 148, 0.2);
        }

        .service-options {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .service-checkbox {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .service-checkbox input {
            margin: 0;
        }

        .service-checkbox label {
            color: #666;
            font-weight: 500;
        }

        .btn-submit {
            background: linear-gradient(135deg, #1AB394, #20d4aa);
            color: #fff;
            padding: 1rem 2.5rem;
            border-radius: 30px;
            text-decoration: none;
            text-align: center;
            font-weight: 600;
            font-size: 1.05rem;
            transition: all 0.3s ease;
            width: 100%;
            border: none;
            cursor: pointer;
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.4);
        }

        .content-wrapper {
            background: transparent;
            padding: 2rem;
            margin: 2rem auto;
            max-width: 1000px;
            flex: 1;
            padding-top: 100px;
        }

        @media (max-width: 768px) {
            .booking-card {
                padding: 1.5rem;
                margin: 1rem;
            }

            .booking-title {
                font-size: 1.8rem;
            }

            .form-input {
                font-size: 0.95rem;
            }

            .btn-submit {
                padding: 0.75rem 1.5rem;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body style="background: linear-gradient(135deg, #f8fffe 0%, #e6f3f2 100%); color: #333; font-family: 'Montserrat', 'Roboto', sans-serif; line-height: 1.6; margin: 0; padding: 0; display: flex; flex-direction: column; min-height: 100vh;">
    <%@ include file="/view/common/web/header.jsp" %>

    <div class="content-wrapper">
        <div class="booking-card">
            <h1 class="booking-title">Đặt Lịch Thuê Người Giúp Việc</h1>

            <form action="${pageContext.request.contextPath}/bookingServlet" method="post">
                <div class="form-group">
                    <label class="form-label" for="date">Ngày làm việc:</label>
                    <input type="date" id="date" name="date" class="form-input" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="time">Thời gian:</label>
                    <input type="time" id="time" name="time" class="form-input" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="location">Địa điểm:</label>
                    <input type="text" id="location" name="location" class="form-input" placeholder="Nhập địa chỉ cụ thể" required>
                </div>

                <div class="form-group">
                    <label class="form-label">Dịch vụ mong muốn:</label>
                    <div class="service-options">
                        <div class="service-checkbox">
                            <input type="checkbox" id="hourly" name="services" value="Giúp việc theo giờ">
                            <label for="hourly">Giúp việc theo giờ</label>
                        </div>
                        <div class="service-checkbox">
                            <input type="checkbox" id="daily" name="services" value="Giúp việc theo ngày">
                            <label for="daily">Giúp việc theo ngày</label>
                        </div>
                        <div class="service-checkbox">
                            <input type="checkbox" id="monthly" name="services" value="Giúp việc theo tháng">
                            <label for="monthly">Giúp việc theo tháng</label>
                        </div>
                        <div class="service-checkbox">
                            <input type="checkbox" id="sofa" name="services" value="Vệ sinh sofa, thảm, đệm, rèm">
                            <label for="sofa">Vệ sinh sofa, thảm, đệm, rèm</label>
                        </div>
                        <div class="service-checkbox">
                            <input type="checkbox" id="washingMachine" name="services" value="Vệ sinh máy giặt">
                            <label for="washingMachine">Vệ sinh máy giặt</label>
                        </div>
                        <div class="service-checkbox">
                            <input type="checkbox" id="special" name="services" value="Dịch vụ đặc biệt">
                            <label for="special">Dịch vụ đặc biệt</label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="notes">Ghi chú (nếu có):</label>
                    <textarea id="notes" name="notes" class="form-input" rows="4" placeholder="Ví dụ: Yêu cầu đặc biệt..."></textarea>
                </div>

                <button type="submit" class="btn-submit">
                    <i class="fas fa-check-circle" style="margin-right: 0.5rem;"></i>
                    Xác nhận đặt lịch
                </button>
            </form>
        </div>
    </div>

    <%@ include file="/view/common/web/footer.jsp" %>
</body>
</html>