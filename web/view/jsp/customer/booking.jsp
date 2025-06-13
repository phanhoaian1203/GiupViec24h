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
        * {
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #f8fffe 0%, #e6f3f2 100%);
            color: #333;
            font-family: 'Montserrat', 'Roboto', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        .main-container {
            padding: 80px 20px 40px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 0.5rem;
            position: relative;
        }

        .page-subtitle {
            font-size: 1.1rem;
            color: #666;
            font-weight: 400;
        }

        .booking-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            align-items: start;
        }

        .booking-form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(26, 179, 148, 0.1);
            border: 1px solid rgba(26, 179, 148, 0.08);
            padding: 2rem;
            position: relative;
            overflow: hidden;
        }

        .booking-form-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #1AB394, #20d4aa, #1AB394);
        }

        .info-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.06);
            border: 1px solid rgba(0, 0, 0, 0.05);
            padding: 2rem;
            height: fit-content;
        }

        .form-section {
            margin-bottom: 1.5rem;
        }

        .section-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-label {
            display: block;
            font-size: 0.95rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.4rem;
        }

        .form-input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid rgba(26, 179, 148, 0.15);
            border-radius: 12px;
            font-size: 0.95rem;
            color: #555;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
        }

        .form-input:focus {
            border-color: #1AB394;
            outline: none;
            box-shadow: 0 0 0 3px rgba(26, 179, 148, 0.1);
            background: rgba(255, 255, 255, 1);
        }

        .service-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 0.8rem;
        }

        .service-item {
            display: flex;
            align-items: center;
            gap: 0.6rem;
            padding: 0.6rem 0.8rem;
            border-radius: 10px;
            background: rgba(26, 179, 148, 0.05);
            border: 1px solid rgba(26, 179, 148, 0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
        }

        .service-item:hover {
            background: rgba(26, 179, 148, 0.1);
            border-color: rgba(26, 179, 148, 0.2);
        }

        .service-item input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #1AB394;
            margin: 0;
        }

        .service-item label {
            color: #555;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            flex: 1;
        }

        .service-price {
            font-size: 0.85rem;
            color: #1AB394;
            font-weight: 600;
            margin-left: auto;
        }

        /* Pricing Section */
        .pricing-summary {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 15px;
            padding: 1.5rem;
            margin: 1.5rem 0;
            border: 2px solid rgba(26, 179, 148, 0.1);
        }

        .pricing-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .pricing-row:last-child {
            border-bottom: none;
            font-weight: 600;
            font-size: 1.1rem;
            color: #1AB394;
            padding-top: 1rem;
            border-top: 2px solid rgba(26, 179, 148, 0.2);
        }

        .pricing-label {
            color: #555;
        }

        .pricing-value {
            font-weight: 600;
            color: #2c3e50;
        }

        /* Payment Methods */
        .payment-methods {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .payment-option {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            padding: 1rem;
            border: 2px solid rgba(26, 179, 148, 0.15);
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.8);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .payment-option:hover {
            border-color: rgba(26, 179, 148, 0.3);
            background: rgba(26, 179, 148, 0.05);
        }

        .payment-option.selected {
            border-color: #1AB394;
            background: rgba(26, 179, 148, 0.1);
        }

        .payment-option input[type="radio"] {
            width: 20px;
            height: 20px;
            accent-color: #1AB394;
        }

        .payment-info {
            flex: 1;
        }

        .payment-title {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.2rem;
        }

        .payment-desc {
            font-size: 0.85rem;
            color: #666;
        }

        .payment-icon {
            font-size: 1.5rem;
            color: #1AB394;
        }

        /* Wallet options */
        .wallet-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 0.8rem;
            margin-top: 0.8rem;
        }

        .wallet-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0.8rem;
            border: 1px solid rgba(26, 179, 148, 0.2);
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.9);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .wallet-item:hover {
            background: rgba(26, 179, 148, 0.05);
            border-color: #1AB394;
        }

        .wallet-item.selected {
            background: rgba(26, 179, 148, 0.1);
            border-color: #1AB394;
        }

        .wallet-logo {
            width: 40px;
            height: 40px;
            margin-bottom: 0.5rem;
            font-size: 1.8rem;
        }

        .wallet-name {
            font-size: 0.8rem;
            font-weight: 500;
            color: #2c3e50;
        }

        .btn-submit {
            background: linear-gradient(135deg, #1AB394, #20d4aa);
            color: #fff;
            padding: 1rem 2rem;
            border-radius: 50px;
            border: none;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 1.5rem;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(26, 179, 148, 0.3);
        }

        .btn-submit:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            margin-bottom: 1rem;
            background: rgba(245, 245, 245, 0.8);
            border-radius: 12px;
            border-left: 4px solid #1AB394;
        }

        .info-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #1AB394, #20d4aa);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.1rem;
        }

        .info-content h4 {
            margin: 0 0 0.2rem 0;
            color: #2c3e50;
            font-weight: 600;
        }

        .info-content p {
            margin: 0;
            color: #666;
            font-size: 0.9rem;
        }

        .highlight-box {
            background: linear-gradient(135deg, #1AB394, #20d4aa);
            color: white;
            padding: 1.5rem;
            border-radius: 15px;
            text-align: center;
            margin-top: 1.5rem;
        }

        .highlight-box h3 {
            margin: 0 0 0.5rem 0;
            font-size: 1.4rem;
        }

        .highlight-box p {
            margin: 0;
            opacity: 0.9;
        }

        .price-table {
            margin-top: 1rem;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            padding: 0.5rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .price-row:last-child {
            border-bottom: none;
        }

        @media (max-width: 1024px) {
            .booking-container {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
            
            .page-title {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 768px) {
            .main-container {
                padding: 60px 15px 30px;
            }

            .page-title {
                font-size: 1.8rem;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0.8rem;
            }

            .service-grid {
                grid-template-columns: 1fr;
            }

            .payment-methods {
                grid-template-columns: 1fr;
            }

            .wallet-options {
                grid-template-columns: repeat(3, 1fr);
            }

            .booking-form-card,
            .info-card {
                padding: 1.5rem;
            }

            .section-title {
                font-size: 1.2rem;
            }
        }

        @media (max-width: 480px) {
            .page-title {
                font-size: 1.6rem;
            }

            .form-input {
                padding: 0.7rem 0.8rem;
                font-size: 0.9rem;
            }

            .btn-submit {
                padding: 0.8rem 1.5rem;
                font-size: 1rem;
            }

            .wallet-options {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <%@ include file="/view/common/web/header.jsp" %>

    <div class="main-container">
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-calendar-check" style="margin-right: 0.5rem; color: #1AB394;"></i>
                Đặt Lịch Thuê Người Giúp Việc
            </h1>
            <p class="page-subtitle">Điền thông tin để đặt lịch dịch vụ giúp việc nhà chuyên nghiệp</p>
        </div>

        <div class="booking-container">
            <div class="info-card">
                <h3 class="section-title">
                    <i class="fas fa-broom"></i>
                    Chọn Dịch Vụ
                </h3>
                <div class="service-grid">
                    <div class="service-item">
                        <input type="checkbox" id="hourly-side" name="services" value="Giúp việc theo giờ" data-price="50000">
                        <label for="hourly-side">Giúp việc theo giờ</label>
                        <span class="service-price">50,000₫/giờ</span>
                    </div>
                    <div class="service-item">
                        <input type="checkbox" id="daily-side" name="services" value="Giúp việc theo ngày" data-price="350000">
                        <label for="daily-side">Giúp việc theo ngày</label>
                        <span class="service-price">350,000₫/ngày</span>
                    </div>
                    <div class="service-item">
                        <input type="checkbox" id="monthly-side" name="services" value="Giúp việc theo tháng" data-price="8500000">
                        <label for="monthly-side">Giúp việc theo tháng</label>
                        <span class="service-price">8,500,000₫/tháng</span>
                    </div>
                    <div class="service-item">
                        <input type="checkbox" id="sofa-side" name="services" value="Vệ sinh sofa, thảm, đệm, rèm" data-price="150000">
                        <label for="sofa-side">Vệ sinh sofa, thảm, đệm</label>
                        <span class="service-price">150,000₫</span>
                    </div>
                    <div class="service-item">
                        <input type="checkbox" id="washingMachine-side" name="services" value="Vệ sinh máy giặt" data-price="80000">
                        <label for="washingMachine-side">Vệ sinh máy giặt</label>
                        <span class="service-price">80,000₫</span>
                    </div>
                    <div class="service-item">
                        <input type="checkbox" id="special-side" name="services" value="Dịch vụ đặc biệt" data-price="0">
                        <label for="special-side">Dịch vụ đặc biệt</label>
                        <span class="service-price">Liên hệ</span>
                    </div>
                </div>

                <div class="highlight-box">
                    <h3>🎉 Ưu đãi đặc biệt</h3>
                    <p>Giảm 15% cho khách hàng đặt lịch định kỳ</p>
                </div>
            </div>

            <div class="booking-form-card">
                <form action="${pageContext.request.contextPath}/bookingServlet" method="post" id="bookingForm">
                    <div class="form-section">
                        <h3 class="section-title">
                            <i class="far fa-clock"></i>
                            Thời gian & Địa điểm
                        </h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label" for="date">Ngày làm việc</label>
                                <input type="date" id="date" name="date" class="form-input" required>
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="time">Thời gian</label>
                                <input type="time" id="time" name="time" class="form-input" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="location">Địa chỉ làm việc</label>
                            <input type="text" id="location" name="location" class="form-input" 
                                   placeholder="Nhập địa chỉ cụ thể (số nhà, đường, quận/huyện...)" required>
                        </div>
                    </div>



                    <div class="form-section">
                        <h3 class="section-title">
                            <i class="fas fa-calculator"></i>
                            Tổng kết chi phí
                        </h3>
                        <div class="pricing-summary">
                            <div class="pricing-row">
                                <span class="pricing-label">Tổng dịch vụ:</span>
                                <span class="pricing-value" id="subtotal">0₫</span>
                            </div>
                            
                            <div class="pricing-row">
                                <span class="pricing-label">Giảm giá:</span>
                                <span class="pricing-value" id="discount">0₫</span>
                            </div>
                            <div class="pricing-row">
                                <span class="pricing-label">Tổng thanh toán:</span>
                                <span class="pricing-value" id="total">0₫</span>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3 class="section-title">
                            <i class="fas fa-credit-card"></i>
                            Phương thức thanh toán
                        </h3>
                        <div class="payment-methods">
                            <div class="payment-option" data-payment="wallet">
                                <input type="radio" id="wallet" name="paymentMethod" value="wallet" required>
                                <div class="payment-info">
                                    <div class="payment-title">Thanh toán qua ví điện tử</div>
                                    <div class="payment-desc">Nhanh chóng, an toàn</div>
                                </div>
                                <i class="fas fa-wallet payment-icon"></i>
                            </div>
                            <div class="payment-option" data-payment="online">
                                <input type="radio" id="online" name="paymentMethod" value="online" required>
                                <div class="payment-info">
                                    <div class="payment-title">Thanh toán trực tuyến</div>
                                    <div class="payment-desc">Thẻ tín dụng, ATM</div>
                                </div>
                                <i class="fas fa-credit-card payment-icon"></i>
                            </div>
                        </div>

                        <div id="walletOptions" class="wallet-options" style="display: none;">
                            <div class="wallet-item" data-wallet="momo">
                                <div class="wallet-logo" style="color: #d82d8b;">
                                    <i class="fas fa-mobile-alt"></i>
                                </div>
                                <div class="wallet-name">MoMo</div>
                            </div>
                            <div class="wallet-item" data-wallet="zalopay">
                                <div class="wallet-logo" style="color: #0068ff;">
                                    <i class="fas fa-money-check-alt"></i>
                                </div>
                                <div class="wallet-name">ZaloPay</div>
                            </div>
                            <div class="wallet-item" data-wallet="vnpay">
                                <div class="wallet-logo" style="color: #1a5490;">
                                    <i class="fas fa-university"></i>
                                </div>
                                <div class="wallet-name">VNPay</div>
                            </div>
                            <div class="wallet-item" data-wallet="airpay">
                                <div class="wallet-logo" style="color: #ff6600;">
                                    <i class="fas fa-plane"></i>
                                </div>
                                <div class="wallet-name">AirPay</div>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3 class="section-title">
                            <i class="far fa-comment"></i>
                            Yêu cầu thêm
                        </h3>
                        <div class="form-group">
                            <label class="form-label" for="notes">Ghi chú chi tiết</label>
                            <textarea id="notes" name="notes" class="form-input" rows="4" 
                                      placeholder="Mô tả thêm về yêu cầu đặc biệt, khu vực cần tập trung làm sạch..."></textarea>
                        </div>
                    </div>

                    <input type="hidden" name="totalAmount" id="totalAmountInput" value="20000">
                    <input type="hidden" name="selectedWallet" id="selectedWalletInput" value="">

                    <button type="submit" class="btn-submit" id="submitBtn">
                        <i class="fas fa-check-circle"></i>
                        Xác nhận đặt lịch
                    </button>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="/view/common/web/footer.jsp" %>

    <script>
        // Set minimum date to today
        document.getElementById('date').min = new Date().toISOString().split('T')[0];
        
        // Auto-focus first input
        document.getElementById('date').focus();
        
        // Service prices
        const servicePrices = {
            'hourly-side': 50000,
            'daily-side': 350000,
            'monthly-side': 8500000,
            'sofa-side': 150000,
            'washingMachine-side': 80000,
            'special-side': 0
        };
        
        // Add click handlers for service items
        document.querySelectorAll('.service-item').forEach(item => {
            item.addEventListener('click', function(e) {
                if (e.target.tagName !== 'INPUT') {
                    const checkbox = this.querySelector('input[type="checkbox"]');
                    checkbox.checked = !checkbox.checked;
                    updatePricing();
                }
            });
        });
        
        // Add change handlers for service checkboxes
        document.querySelectorAll('input[name="services"]').forEach(checkbox => {
            checkbox.addEventListener('change', updatePricing);
        });
        
        // Payment method handlers
        document.querySelectorAll('.payment-option').forEach(option => {
            option.addEventListener('click', function() {
                const radio = this.querySelector('input[type="radio"]');
                radio.checked = true;
                
                // Remove selected class from all options
                document.querySelectorAll('.payment-option').forEach(opt =>