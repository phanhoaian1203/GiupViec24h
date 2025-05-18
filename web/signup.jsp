<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký - Giúp Việc 24h</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        :root {
            --primary-color: #27ae60;
            --primary-dark: #219150;
            --light-bg: #f4fef7;
            --text-color: #2c3e50;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--light-bg);
            padding: 20px;
            color: var(--text-color);
        }

        .signup-container {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--primary-dark);
        }

        .form-group {
            margin-bottom: 1.2rem;
        }

        label {
            display: block;
            margin-bottom: 0.4rem;
            font-weight: 500;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        select {
            width: 100%;
            padding: 0.7rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border-color 0.3s ease;
        }

        input:focus, select:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .btn-submit {
            width: 100%;
            padding: 0.9rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: var(--primary-dark);
        }

        .form-footer {
            text-align: center;
            margin-top: 1.5rem;
        }

        .form-footer a {
            color: var(--primary-dark);
            text-decoration: none;
            font-weight: 500;
        }

        .form-footer a:hover {
            color: var(--primary-color);
        }
    </style>
</head>
<body>

    <div class="signup-container">
        <h2>Đăng ký tài khoản</h2>
        <form action="SignupServlet" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" required>
            </div>

            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <input type="password" name="password" id="password" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Xác nhận mật khẩu:</label>
                <input type="password" name="confirmPassword" id="confirmPassword" required>
            </div>

            <div class="form-group">
                <label for="dob">Ngày sinh:</label>
                <input type="date" name="dob" id="dob">
            </div>

            <div class="form-group">
                <label for="gender">Giới tính:</label>
                <select name="gender" id="gender">
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                </select>
            </div>

            <div class="form-group">
                <label for="phone">Số điện thoại:</label>
                <input type="text" name="phone" id="phone">
            </div>

            <div class="form-group">
                <label for="area">Khu vực sống:</label>
                <input type="text" name="area" id="area">
            </div>

            <div class="form-group">
                <label for="role">Tôi là:</label>
                <select name="role" id="role" onchange="confirmRole(this)">
                    <option value="customer">Khách hàng</option>
                    <option value="worker">Người giúp việc</option>
                </select>
            </div>

            <input type="submit" value="Xác nhận đăng ký" class="btn-submit">
        </form>

        <div class="form-footer">
            <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        function confirmRole(select) {
            const role = select.value;
            const message = (role === 'worker') 
                ? "Bạn muốn đăng ký là người giúp việc, tiếp tục?" 
                : "Bạn muốn đăng ký là khách hàng, tiếp tục?";
            if (!confirm(message)) {
                select.value = "";
            }
        }
    </script>
</body>
</html>
