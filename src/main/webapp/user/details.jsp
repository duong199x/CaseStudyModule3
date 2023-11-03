<%--
  Created by IntelliJ IDEA.
  User: toand
  Date: 03/11/2023
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>UserDetails</title>
</head>
<body>
<span class="erro" id="msg1"></span>
<form method="post" name="form1" onsubmit="return myValidate()" action="http://localhost:8080/user">

    <input type="hidden" name="action" value="edit">
    <input type="text" name="email" value="${email}" disabled>
    <input type="text" name="nickname" value="${nickname}">
    <input type="text" name="phone" value="${phone}" disabled>
    <input type="text" name="address" value="${address}">
    <button type="submit">Lưu Thay Đổi</button>
</form>
<span class="erro" id="msg2"></span>
<form method="post" name="form2" onsubmit="return vaidatePassword()" action="http://localhost:8080/user">
    <input type="hidden" name="action" value="changePassword">
    <input type="password" name="oldPassword" placeholder="Mật khẩu cũ">
    <input type="password" name="newPassword" placeholder="Mật khẩu mới">
    <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu">
    <button type="submit">Thay đổi mật khẩu</button>
</form>

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
