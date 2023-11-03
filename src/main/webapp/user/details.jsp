<%--
  Created by IntelliJ IDEA.
  User: toand
  Date: 03/11/2023
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>UserDetails</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="../css/size.css"/>">
</head>
<body>
<div class="container-fluid">
    <center style="height: fit-content">
        <div class="header">
            <div class="row">
                <div class="logo">
                    <img src="../assets/logo.png"><br>
                    <p><span id="clock"></span> HN</p>
                    <script type="text/javascript">
                        function updateClock() {
                            var now = new Date();
                            var day = now.getDate();
                            var month = now.getMonth() + 1;
                            var year = now.getFullYear();
                            var hours = now.getHours();
                            var minutes = now.getMinutes();
                            var seconds = now.getSeconds();
                            var timeString = day + "/" + month + "/" + year + " " + hours + ":" + minutes + ":" + seconds;
                            document.getElementById("clock").innerHTML = timeString;
                        }

                        setInterval(updateClock, 1000);
                    </script>
                </div>
            </div>
        </div>
        <div class="body">
            <div class="product-acd-content product-content-size">
                <div class="product-size-wrapper">
                    <div class="product-size-tab">
                        <p href="#" class="tab-list active">Thay Đổi Thông Tin Tài Khoản</p>
                    </div>
                    <div class="product-size-table-box">
                        <table class="product-size-table">
                            <tbody>
                            <form method="post" name="form1" onsubmit="return myValidate()" action="http://localhost:8080/user">
                                <input type="hidden" name="action" value="edit"><br>
                                <p class="text-white font-courier">Email</p>
                                <input type="text" name="email" value="${email}" disabled><br>
                                <br>
                                <p class="text-white font-courier">Tên Tài Khoản</p>
                                <input type="text" name="nickname" value="${nickname}"><br>
                                <br>
                                <p class="text-white font-courier">Số Điện Thoại</p>
                                <input type="text" name="phone" value="${phone}" disabled><br>
                                <br>
                                <p class="text-white font-courier">Địa chỉ</p>
                                <input type="text" name="address" value="${address}"><br>
                                <br>
                                <button type="submit">Lưu Thay Đổi</button>
                            </form>
                            </tbody>
                        </table> <!----></div>
                    <div class="product-size-tab">
                        <p href="#" class="tab-list">Thay Đổi Mật Khẩu</p>
                        <div class="product-size-table-box">
                            <table class="product-size-table">
                                <tbody>
                                <form method="post" name="form2" onsubmit="return vaidatePassword()" action="http://localhost:8080/user">
                                    <input type="hidden" name="action" value="changePassword"><br>
                                    <input type="password" name="oldPassword" placeholder="Mật khẩu cũ"><br>
                                    <input type="password" name="newPassword" placeholder="Mật khẩu mới"><br>
                                    <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu"><br>
                                    <button type="submit">Thay đổi mật khẩu</button>
                                </form>
                                </tbody>
                            </table> <!----></div>
                    </div>
                </div>
            </div>

        </div>
    </center>
    <div class="footer">
        <div class="row">
            <div class="col-3 nodata"></div>
            <div class="col-3">
                <div>
                    <a href="/products/home.jsp">home</a>
                    <p> > </p>
                    <a href="/products/collections.jsp">shop</a>
                </div>
            </div>
            <div class="col-6 nodata"></div>
        </div>
    </div>

</div>
<%--<span class="error" id="msg1"></span>--%>
<%--<form method="post" name="form1" onsubmit="return myValidate()" action="http://localhost:8080/user">--%>

<%--    <input type="hidden" name="action" value="edit">--%>
<%--    <input type="text" name="email" value="${email}" disabled>--%>
<%--    <input type="text" name="nickname" value="${nickname}">--%>
<%--    <input type="text" name="phone" value="${phone}" disabled>--%>
<%--    <input type="text" name="address" value="${address}">--%>
<%--    <button type="submit">Lưu Thay Đổi</button>--%>
<%--</form>--%>
<%--<span class="error" id="msg2"></span>--%>
<%--<form method="post" name="form2" onsubmit="return vaidatePassword()" action="http://localhost:8080/user">--%>
<%--    <input type="hidden" name="action" value="changePassword">--%>
<%--    <input type="password" name="oldPassword" placeholder="Mật khẩu cũ">--%>
<%--    <input type="password" name="newPassword" placeholder="Mật khẩu mới">--%>
<%--    <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu">--%>
<%--    <button type="submit">Thay đổi mật khẩu</button>--%>
<%--</form>--%>

<%--script validate cho form--%>
<script>
    function myValidate() {
        let nickname = document.form1.nickname;
        let address = document.form1.address;
        let msg = document.getElementById('msg1');

        if (nickname.value == "") {
            msg.style.display = 'block';
            msg.innerHTML = "Vui lòng nhập tên hiển thị";
            nickname.focus();
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
    }

    function vaidatePassword() {
        let oldPassword = document.form2.oldPassword;
        let newPassword = document.form2.newPassword;
        let confirmPassword = document.form2.confirmPassword;
        let msg = document.getElementById("msg2");
        if (oldPassword.value === "") {
            msg.innerHTML = "Không được để trống";
            oldPassword.focus();
            return false
        } else {
            msg.innerHTML = "";
        }
        if (newPassword.value === "") {
            msg.innerHTML = "Mật khẩu mới khồn được để trống";
            newPassword.focus();
            return false
        } else {
            msg.innerHTML = "";
        }
        let ps = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (!ps.test(newPassword.value)) {
            msg.style.display = 'block';
            msg.innerHTML = "Mật khẩu tối thiểu 8 ký tự\nMật khẩu phải có chữ và số";
            newPassword.focus();
            return false;
        } else {
            msg.innerHTML = "";
        }

        if (newPassword.value !== confirmPassword.value) {
            msg.innerHTML = "Mật khẩu không khớp";
            confirmPassword.focus();
            return false
        } else {
            msg.innerHTML = "";
        }
    }
</script>
</body>
</html>
