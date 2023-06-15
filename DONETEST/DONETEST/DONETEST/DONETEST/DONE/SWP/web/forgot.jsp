<%-- 
    Document   : forgot
    Created on : May 24, 2023, 3:49:58 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Khôi phục mật khẩu</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="images/fg-img.png" alt="IMG">
                    </div>
                    <div class="login100-form">
                        <span class="login100-form-title">
                            <b>KHÔI PHỤC MẬT KHẨU</b>
                        </span>
                        <form action="ForgotServlet" method="POST">
                            <div class="wrap-input100">
                                <input class="input100" type="text" placeholder="Nhập email" name="emailInput"
                                       id="emailInput" value="" />
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class='bx bx-mail-send' ></i>
                                </span>
                            </div>
                            <div class="container-login100-form-btn">
                                <input type="submit" onclick="return RegexEmail('emailInput')" value="Lấy mật khẩu" />
                            </div>

                            <div class="text-center p-t-12">
                                <a class="txt2" href="login.jsp">
                                    Trở về đăng nhập
                                </a>
                            </div>
                            <p style="color: red">${messForgot}</p>
                        </form>
                        <div class="text-center p-t-70 txt2">
                            Phần mềm quản lý bán hàng <i class="far fa-copyright" aria-hidden="true"></i>
                            <script type="text/javascript">document.write(new Date().getFullYear());</script> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
