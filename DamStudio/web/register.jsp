<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css" />
        <title>Đăng Ký Tài Khoản</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .container {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .register-form {
                background: white;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
                backdrop-filter: blur(10px);
            }

            .form-title {
                text-align: center;
                color: #333;
                font-size: 2.5rem;
                margin-bottom: 10px;
                font-weight: 700;
            }

            .form-subtitle {
                text-align: center;
                color: #666;
                margin-bottom: 30px;
                font-size: 1rem;
            }

            .form-row {
                display: flex;
                gap: 20px;
                margin-bottom: 20px;
            }

            .form-group {
                flex: 1;
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                color: #333;
                font-weight: 600;
                font-size: 0.95rem;
            }

            .form-group input,
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 12px 16px;
                border: 2px solid #e1e5e9;
                border-radius: 10px;
                font-size: 1rem;
                transition: all 0.3s ease;
                background-color: #f8f9fa;
            }

            .form-group input:focus,
            .form-group select:focus,
            .form-group textarea:focus {
                outline: none;
                border-color: #667eea;
                background-color: white;
                box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            }

            .gender-options {
                display: flex;
                gap: 20px;
                margin-top: 8px;
            }

            .gender-option {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .gender-option input[type="radio"] {
                width: auto;
                margin: 0;
            }

            .gender-option label {
                margin: 0;
                font-weight: normal;
                cursor: pointer;
            }

            textarea {
                resize: vertical;
                min-height: 80px;
            }

            .btn-register {
                width: 100%;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 15px;
                border: none;
                border-radius: 10px;
                font-size: 1.1rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 20px;
            }

            .btn-register:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            }

            .btn-register:active {
                transform: translateY(0);
            }

            .login-link {
                text-align: center;
                margin-top: 20px;
                color: #666;
            }

            .login-link a {
                color: #667eea;
                text-decoration: none;
                font-weight: 600;
            }

            .login-link a:hover {
                text-decoration: underline;
            }

            .required {
                color: #e74c3c;
            }

            @media (max-width: 768px) {
                .form-row {
                    flex-direction: column;
                    gap: 0;
                }
                
                .register-form {
                    padding: 30px 20px;
                    margin: 10px;
                }
                
                .form-title {
                    font-size: 2rem;
                }
                
                .gender-options {
                    flex-direction: column;
                    gap: 10px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
        <div class="container">
            <form class="register-form" action="register" method="post">
                <h2 class="form-title">Đăng Ký</h2>
                <p class="form-subtitle">Tạo tài khoản mới để bắt đầu</p>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập <span class="required">*</span></label>
                        <input type="text" id="username" name="username" required 
                               placeholder="Nhập tên đăng nhập">
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu <span class="required">*</span></label>
                        <input type="password" id="password" name="password" required 
                               placeholder="Nhập mật khẩu">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">Tên <span class="required">*</span></label>
                        <input type="text" id="firstName" name="firstName" required 
                               placeholder="Nhập tên của bạn">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Họ <span class="required">*</span></label>
                        <input type="text" id="lastName" name="lastName" required 
                               placeholder="Nhập họ của bạn">
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Giới tính <span class="required">*</span></label>
                    <div class="gender-options">
                        <div class="gender-option">
                            <input type="radio" id="male" name="gender" value="male" required>
                            <label for="male">Nam</label>
                        </div>
                        <div class="gender-option">
                            <input type="radio" id="female" name="gender" value="female" required>
                            <label for="female">Nữ</label>
                        </div>
                        <div class="gender-option">
                            <input type="radio" id="other" name="gender" value="other" required>
                            <label for="other">Khác</label>
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="email">Email <span class="required">*</span></label>
                        <input type="email" id="email" name="email" required 
                               placeholder="example@email.com">
                    </div>
                    <div class="form-group">
                        <label for="mobile">Số điện thoại <span class="required">*</span></label>
                        <input type="tel" id="mobile" name="mobile" required 
                               placeholder="0123456789">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="address">Địa chỉ</label>
                    <textarea id="address" name="address" 
                              placeholder="Nhập địa chỉ của bạn (tùy chọn)"></textarea>
                </div>
                
                <button type="submit" class="btn-register">Đăng Ký</button>
                
                <div class="login-link">
                    Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
                </div>
            </form>
        </div>
        
        <jsp:include page="footer.jsp"/>
        
        <script>
            // Validate form trước khi submit
            document.querySelector('.register-form').addEventListener('submit', function(e) {
                const password = document.getElementById('password').value;
                const email = document.getElementById('email').value;
                const mobile = document.getElementById('mobile').value;
                
                // Kiểm tra độ dài mật khẩu
                if (password.length < 6) {
                    alert('Mật khẩu phải có ít nhất 6 ký tự!');
                    e.preventDefault();
                    return;
                }
                
                // Kiểm tra format email
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert('Vui lòng nhập email hợp lệ!');
                    e.preventDefault();
                    return;
                }
                
                // Kiểm tra số điện thoại (10-11 số)
                const mobileRegex = /^[0-9]{10,11}$/;
                if (!mobileRegex.test(mobile)) {
                    alert('Số điện thoại phải có 10-11 chữ số!');
                    e.preventDefault();
                    return;
                }
            });
            
            // Thêm hiệu ứng focus cho các input
            const inputs = document.querySelectorAll('input, select, textarea');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });
        </script>
    </body>
</html>
