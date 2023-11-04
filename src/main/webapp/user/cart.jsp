<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 31/10/2023
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Giỏ Hàng - WS</title>
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
    <div class="login">
        <div class="row">
            <div class="col-8"></div>
            <div class="col-4">
                <div class="button-login">
                    <a href="" class="login-user">Đăng Nhập</a>
                    <a href="" class="register">Đăng Kí</a>
                </div>
            </div>
        </div>

    </div>
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
                        <h3 href="#" class="tab-list active">Giỏ Hàng </h3>
                    </div>
                    <div class="product-size-table-box">
                        <table class="product-size-table-bd-1-white">
                            <thead>
                            <tr>
                                <th>Tên Sản Phẩm</th>
                                <th>Hình Ảnh</th>
                                <th>Số Lượng</th>
                                <th>Giá</th>
                                <th>Thành Tiền</th>
                                <th style="width: 20px;">
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <form>
                                <tr>
                                    <td>Jordan1</td>
                                    <td></td>
                                    <img src="">
                                    <td>1</td>
                                    <td>500</td>
                                    <td>500</td>
                                    <th>
                                        <button class="btn-danger ">Hủy</button>
                                    </th>
                                </tr>

                            </form>
                            </tbody>
                            <tfoot>
                            <th colspan="4">Tổng Tiền</th>
                            <th>500</th>
                            </tfoot>

                        </table>
                        <div class="row mt-5">
                            <div class="col-6"></div>
                            <div class="col-3">
                                <a>
                                    <button class="btn-white">Quay Lại</button>
                                </a>
                                <button type="submit" class="btn-danger">Xác Nhận</button>
                            </div>
                            <div class="col-3"></div>
                        </div>
                        <!----></div>
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
</body>
</html>
