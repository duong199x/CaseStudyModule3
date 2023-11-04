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
    <title>Tài Khoản- WS</title>
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
                        <h3 href="#" class="tab-list active">Thông Tin Khách Hàng </h3>
                    </div>
                    <div class="product-size-table-box">
                        <center>
                        <table class="product-size-table-bd-1-white">
                            <thead>
                            <tr>
                                <th></th>
                                <th>Thông Tin</th>
                            </tr>
                            </thead>
                            <tbody>
                            <form>
                                <tr>
                                    <th>Email</th>
                                    <td>toandoan98@gmail.com</td>
                                </tr>
                                <tr>
                                    <th>Tên Tài Khoản</th>
                                    <td>Toan Dep Trai</td>
                                </tr>
                                <tr>
                                    <th>Số Điện Thoại</th>
                                    <td>098********</td>
                                </tr>
                                <tr>
                                    <th>Địa chỉ</th>
                                    <td>Long Bien - Ha Noi</td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <th>
                                        <a href="../user/details.jsp"><button class="text-white bg-danger">Thay Đổi</button></a>
                                    </th>
                                </tr>
                            </form>

                        </table>
                        </center>
                        <div>
                            <h4 class="font-courier mt-3 text-white">Lịch Sử Mua Hàng</h4>
                        </div>
                        <table class="bd-1-white">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ngày Mua</th>
                                <th>Giá Trị</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <td>1</td>
                            <td>1-1-2023 10:25:30</td>
                            <td>100000</td>
                            <td><a href="" class="text-danger">chi tiết</a></td>
                            </tbody>
                        </table>
                        </tbody>


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
</body>
</html>
