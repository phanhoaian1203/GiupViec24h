<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dịch Vụ - Giúp Việc 24h</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1000px;
            margin: 100px auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #1AB394;
            margin-bottom: 50px;
        }
        .service-list {
            display: flex;
            flex-direction: column;
            gap: 40px;
        }
        .service-item {
            background-color: #fff;
            padding: 30px;
            border-left: 6px solid #1AB394;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }
        .service-item h2 {
            margin-top: 0;
            color: #1AB394;
        }
        .nav {
            position: fixed;
            top: 70px;
            left: 0;
            width: 100%;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
            z-index: 100;
        }
        .nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 10px;
            margin: 0;
        }
        .nav li {
            margin: 0 15px;
        }
        .nav a {
            text-decoration: none;
            color: #1AB394;
            font-weight: bold;
            transition: color 0.3s;
        }
        .nav a:hover {
            color: #138f77;
        }
        html {
            scroll-behavior: smooth;
        }
    </style>
</head>
<body>
    <div class="nav">
        <ul>
            <li><a href="#gio">Theo giờ</a></li>
            <li><a href="#ngay">Theo ngày</a></li>
            <li><a href="#thang">Theo tháng</a></li>
            <li><a href="#sofa">Vệ sinh sofa, thảm</a></li>
            <li><a href="#maygiat">Vệ sinh máy giặt</a></li>
        </ul>
    </div>

    <div class="container">
        <h1>DANH SÁCH DỊCH VỤ</h1>
        <div class="service-list">
            <div class="service-item" id="gio">
                <h2>Thuê giúp việc theo giờ</h2>
                <p>Dịch vụ giúp bạn tiết kiệm chi phí, linh hoạt thời gian, phù hợp cho công việc nhà ngắn hạn.</p>
            </div>

            <div class="service-item" id="ngay">
                <h2>Thuê giúp việc theo ngày</h2>
                <p>Phù hợp cho những công việc dọn dẹp định kỳ trong ngày, chăm sóc nhà cửa trọn vẹn.</p>
            </div>

            <div class="service-item" id="thang">
                <h2>Thuê giúp việc theo tháng</h2>
                <p>Lựa chọn kinh tế và ổn định, giúp bạn có người hỗ trợ thường xuyên trong gia đình.</p>
            </div>

            <div class="service-item" id="sofa">
                <h2>Vệ sinh sofa, thảm</h2>
                <p>Giúp khử mùi, diệt khuẩn và làm sạch sâu bề mặt sofa, thảm trải sàn chuyên nghiệp.</p>
            </div>

            <div class="service-item" id="maygiat">
                <h2>Vệ sinh máy giặt</h2>
                <p>Loại bỏ cặn bẩn, vi khuẩn trong máy giặt giúp bảo vệ sức khỏe gia đình và kéo dài tuổi thọ thiết bị.</p>
            </div>
        </div>
    </div>
</body>
</html>
