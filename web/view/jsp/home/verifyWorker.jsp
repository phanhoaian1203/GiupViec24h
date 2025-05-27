<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xác minh người giúp việc</title>
</head>
<body>
    <h2>Xác minh người giúp việc</h2>
    <form action="WorkerVerificationServlet" method="post" enctype="multipart/form-data">
        Họ tên: <input type="text" name="name"><br><br>
        Email: <input type="email" name="email"><br><br>
        Số điện thoại: <input type="text" name="phone"><br><br>
        Khu vực làm việc: <input type="text" name="location"><br><br>

        Kỹ năng chuyên môn: <input type="text" name="skills"><br><br>
        Giá dịch vụ đề xuất: <input type="number" name="price"><br><br>
        Khung giờ làm việc: <input type="text" name="timeRange"><br><br>

        Tải CMND/CCCD: <input type="file" name="idDoc"><br><br>
        Hình chân dung: <input type="file" name="avatar"><br><br>

        Vai trò: Người giúp việc (mặc định)<br><br>

        <input type="submit" value="Đăng ký">
    </form>
    <%@ include file="footer.jsp" %>
</body>
</html>
