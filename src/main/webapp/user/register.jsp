<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 31/10/2023
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Đăng Ký Tài Khoản</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700"/>
    <!-- Nucleo Icons -->
    <link href="../css/admin/nucleo-icons.css" rel="stylesheet"/>
    <link href="../css/admin/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <!-- CSS Files -->
    <link id="pagestyle" href="../css/admin/material-dashboard.css?v=3.1.0" rel="stylesheet"/>
    <!-- Nepcha Analytics (nepcha.com) -->
    <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
    <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
    <style>
        .error {
            text-align: center;
            width: 100%;
            height: 30px;
            padding: 2px;
            margin: 10px auto 10px;
            position: relative;
            color: red;
            font-size: 12px;
            display: none;
        }
    </style>
</head>

<body class="">
<main class="main-content  mt-0">
    <section>
        <div class="page-header min-vh-100">
            <div class="container">
                <div class="row">
                    <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
                        <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center"
                             style="background-image: url('../assets/logo.png'); background-size: cover;">
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
                        <div class="card card-plain">
                            <div class="card-header">
                                <h4 class="font-weight-bolder">Đăng Ký</h4>
                                <p class="mb-0">Điền thông tin đăng ký tài khoản</p>
                            </div>
                            <div class="card-body">
                                <c:if test="${error != null}"><span class="error animate tada" style="display: block" id="msg">${error}</span></c:if>
                                <c:if test="${error ==null}"><span class="error animate tada" id="msg"></span></c:if>
                                <form role="form" name="form1" onsubmit="return myValidate()" method="post"
                                      action="http://localhost:8080/login" autocomplete="off">
                                    <input hidden="hidden" name="action" value="register">
                                    <div class="input-group input-group-outline mb-3">
                                        <label class="form-label" for="email">Email</label>
                                        <input type="text" id="email" name="email" class="form-control">
                                    </div>
                                    <div class="input-group input-group-outline mb-3">
                                        <label class="form-label">Tên hiển thị</label>
                                        <input type="text" name="nickname" class="form-control">
                                    </div>
                                    <div class="input-group input-group-outline mb-3">
                                        <label class="form-label">Số Điện Thoại</label>
                                        <input type="text" name="phone" class="form-control">
                                    </div>
                                    <div class="input-group input-group-outline mb-3">
                                        <label class="form-label">Địa chỉ</label>
                                        <input type="text" name="address" class="form-control">
                                    </div>
                                    <div class="input-group input-group-outline mb-3">
                                        <label class="form-label">Mật khẩu</label>
                                        <input type="password" name="password" class="form-control">
                                    </div>
                                    <div class="input-group input-group-outline mb-3">
                                        <label class="form-label">Nhập lại mật khẩu</label>
                                        <input type="password" name="confirmPassword" class="form-control">
                                    </div>
                                    <div class="form-check form-check-info text-start ps-0">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"
                                               checked>
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Tôi đồng ý <a href="javascript:;" class="text-dark font-weight-bolder">
                                           các điều khoản</a>
                                        </label>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit"
                                                class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0">Đăng Ký
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center pt-0 px-lg-2 px-1">
                                <p class="mb-2 text-sm mx-auto">
                                    Đã có tài khoản?
                                    <a href="http://localhost:8080/login"
                                       class="text-primary text-gradient font-weight-bold">Đăng Nhập</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!--   Core JS Files   -->
<script src="../js/admin/core/popper.min.js"></script>
<script src="../js/admin/core/bootstrap.min.js"></script>
<script src="../js/admin/plugins/perfect-scrollbar.min.js"></script>
<script src="../js/admin/plugins/smooth-scrollbar.min.js"></script>
<script>
    function myValidate() {
        let email = document.form1.email;
        let password = document.form1.password;
        let confirmPassword = document.form1.confirmPassword;
        let nickname = document.form1.nickname;
        let address = document.form1.address;
        let phone = document.form1.phone;
        let msg = document.getElementById('msg');

        if (email.value == "") {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng nhập email";
            email.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }


        if (nickname.value == "") {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng nhập tên hiển thị";
            nickname.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        if (phone.value == "") {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng nhập số điện thoại";
            phone.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        if (address.value == "") {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng nhập địa chỉ";
            address.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        if (password.value == "") {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng nhập mật khẩu";
            password.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        if (confirmPassword.value == "") {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng xác nhận lai mật khẩu";
            confirmPassword.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        let re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!re.test(email.value)) {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng nhập đúng định dạng email";
            email.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        let ph = /(84|0[3|5|7|8|9])+([0-9]{8})\b/g;
        if (!ph.test(phone.value)) {
            msg.style.display = 'block';
            msg.innerHTML = "sai định dạnh số điện thoại";
            phone.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        let ps = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (!ps.test(password.value)) {
            msg.style.display = 'block';
            msg.innerHTML = "Mật khẩu tối thiểu 8 ký tự\nMật khẩu phải có chữ và số";
            password.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
        if (password.value !== confirmPassword.value) {
            msg.style.display = 'block';
            msg.innerHTML = "Mật khẩu không trùng";
            confirmPassword.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }
    }
</script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="../js/admin/material-dashboard.min.js?v=3.1.0"></script>
</body>

</html>
