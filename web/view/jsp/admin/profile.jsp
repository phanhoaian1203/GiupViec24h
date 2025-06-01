<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giúp Việc 24h - Hồ Sơ Cá Nhân</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1AB394;
            --primary-dark: #18a085;
            --primary-light: #e8f8f5;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --gray: #e0e0e0;
            --text-dark: #333333;
            --accent: #FF7043;
        }

        body {
            font-family: 'Montserrat', 'Roboto', sans-serif;
            background-color: var(--white);
            color: var(--text-dark);
            line-height: 1.7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: var(--white);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--primary-light);
        }

        .profile-info {
            margin-bottom: 20px;
        }

        .profile-info h2 {
            color: var(--primary-dark);
            margin-bottom: 10px;
        }

        .profile-info p {
            margin: 5px 0;
            color: #666;
        }

        .btn {
            display: inline-block;
            padding: 0.8rem 1.8rem;
            background-color: var(--primary-color);
            color: var(--white);
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            cursor: pointer;
        }

        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            margin-left: 10px;
        }

        .btn-secondary:hover {
            background-color: var(--primary-light);
            color: var(--primary-dark);
        }

        .edit-form, .delete-confirm, .forgot-password {
            display: none;
            margin-top: 20px;
            padding: 20px;
            background-color: var(--gray-light);
            border-radius: 10px;
        }

        .edit-form.active, .delete-confirm.active, .forgot-password.active {
            display: block;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid var(--gray);
            border-radius: 5px;
            font-size: 1rem;
        }

        .error {
            color: #FF7043;
            font-size: 0.9rem;
            display: none;
        }

        .error.active {
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="profile-header">
            <img src="path/to/profile-image.jpg" alt="Profile Image" id="profileImage">
            <h2 id="username">username123</h2>
        </div>
        <div class="profile-info">
            <h2>Thông Tin Cá Nhân</h2>
            <p><strong>Họ và tên:</strong> <span id="fullName">Nguyen Van A</span></p>
            <p><strong>Số điện thoại:</strong> <span id="phone">+84 123 456 789</span></p>
            <p><strong>Giới tính:</strong> <span id="gender">Nam</span></p>
            <p><strong>Email:</strong> <span id="email">nguyenvana@example.com</span></p>
            <p><strong>CCCD/CMND:</strong> <span id="cccd">123456789</span></p>
            <p><strong>Địa chỉ:</strong> <span id="address">123 Đường ABC, Quận XYZ, TP. Hồ Chí Minh</span></p>
        </div>
        <button class="btn" id="deleteBtn">Xóa tài khoản</button>
        <button class="btn btn-secondary" id="editBtn">Chỉnh sửa</button>

        <!-- Delete Confirmation -->
        <div class="delete-confirm" id="deleteConfirm">
            <h3>Bạn có chắc muốn xóa tài khoản không?</h3>
            <p>Tài khoản của bạn sẽ được xóa trong 60 ngày tính từ lúc bạn xác nhận. Sau khi xóa, bạn sẽ được chuyển về trang chủ và đăng xuất.</p>
            <button class="btn" id="confirmDelete">Có</button>
            <button class="btn btn-secondary" id="cancelDelete">Không</button>
        </div>

        <!-- Edit Form -->
        <div class="edit-form" id="editForm">
            <div class="form-group">
                <label for="editImage">Ảnh đại diện:</label>
                <input type="file" id="editImage" accept="image/*">
            </div>
            <div class="form-group">
                <label for="editPhone">Số điện thoại:</label>
                <input type="text" id="editPhone" value="+84 123 456 789">
            </div>
            <div class="form-group">
                <label for="editEmail">Email:</label>
                <input type="email" id="editEmail" value="nguyenvana@example.com">
            </div>
            <div class="form-group">
                <label for="editPassword">Mật khẩu mới:</label>
                <input type="password" id="editPassword">
            </div>
            <div class="form-group">
                <label for="editAddress">Địa chỉ:</label>
                <input type="text" id="editAddress" value="123 Đường ABC, Quận XYZ, TP. Hồ Chí Minh">
            </div>
            <div class="form-group">
                <label for="confirmPassword">Nhập mật khẩu để xác nhận:</label>
                <input type="password" id="confirmPassword">
                <span class="error" id="passwordError">Mật khẩu không đúng. Vui lòng nhập lại.</span>
            </div>
            <button class="btn" id="saveChanges">Xác nhận</button>
            <button class="btn btn-secondary" id="cancelEdit">Hủy</button>
            <a href="#" class="btn btn-secondary" id="forgotPasswordLink">Quên mật khẩu?</a>
        </div>

        <!-- Forgot Password Form -->
        <div class="forgot-password" id="forgotPassword">
            <h3>Quên mật khẩu</h3>
            <div class="form-group">
                <label for="forgotEmail">Email:</label>
                <input type="email" id="forgotEmail" placeholder="Nhập email của bạn">
            </div>
            <button class="btn" id="submitForgot">Gửi yêu cầu</button>
            <button class="btn btn-secondary" id="cancelForgot">Hủy</button>
        </div>
    </div>

    <script>
        const profileImage = document.getElementById('profileImage');
        const username = document.getElementById('username');
        const fullName = document.getElementById('fullName');
        const phone = document.getElementById('phone');
        const gender = document.getElementById('gender');
        const email = document.getElementById('email');
        const cccd = document.getElementById('cccd');
        const address = document.getElementById('address');
        const deleteBtn = document.getElementById('deleteBtn');
        const editBtn = document.getElementById('editBtn');
        const deleteConfirm = document.getElementById('deleteConfirm');
        const cancelDelete = document.getElementById('cancelDelete');
        const editForm = document.getElementById('editForm');
        const saveChanges = document.getElementById('saveChanges');
        const cancelEdit = document.getElementById('cancelEdit');
        const confirmPassword = document.getElementById('confirmPassword');
        const passwordError = document.getElementById('passwordError');
        const forgotPasswordLink = document.getElementById('forgotPasswordLink');
        const forgotPassword = document.getElementById('forgotPassword');
        const submitForgot = document.getElementById('submitForgot');
        const cancelForgot = document.getElementById('cancelForgot');

        // Delete Account
        deleteBtn.addEventListener('click', () => {
            deleteConfirm.classList.add('active');
        });

        cancelDelete.addEventListener('click', () => {
            deleteConfirm.classList.remove('active');
        });

        confirmDelete.addEventListener('click', () => {
            alert('Tài khoản của bạn sẽ được xóa trong 60 ngày. Bạn sẽ được chuyển về trang chủ và đăng xuất.');
            window.location.href = 'index.jsp'; // Redirect to homepage and logout
        });

        // Edit Profile
        editBtn.addEventListener('click', () => {
            editForm.classList.add('active');
        });

        cancelEdit.addEventListener('click', () => {
            editForm.classList.remove('active');
            passwordError.classList.remove('active');
        });

        saveChanges.addEventListener('click', () => {
            const correctPassword = 'password123'; // Replace with actual password verification logic
            if (confirmPassword.value === correctPassword) {
                // Update profile information
                phone.textContent = document.getElementById('editPhone').value;
                email.textContent = document.getElementById('editEmail').value;
                address.textContent = document.getElementById('editAddress').value;
                // Handle image upload (requires backend)
                editForm.classList.remove('active');
                passwordError.classList.remove('active');
            } else {
                passwordError.classList.add('active');
            }
        });

        // Forgot Password
        forgotPasswordLink.addEventListener('click', (e) => {
            e.preventDefault();
            editForm.classList.remove('active');
            forgotPassword.classList.add('active');
        });

        cancelForgot.addEventListener('click', () => {
            forgotPassword.classList.remove('active');
        });

        submitForgot.addEventListener('click', () => {
            alert('Yêu cầu khôi phục mật khẩu đã được gửi. Vui lòng kiểm tra email của bạn.');
            forgotPassword.classList.remove('active');
        });
    </script>
</body>
</html>