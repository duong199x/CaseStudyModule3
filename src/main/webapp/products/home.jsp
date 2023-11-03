<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 31/10/2023
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Window-ShopShoes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="../css/homeCss.css"/>">
</head>
<body>
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
            <div id="carouselExampleDark" class="list-nike">
                <div class="carousel slide" data-ride="carousel">

                    <div class="carousel-inner" style="margin-top: 32px">
                        <div class="carousel-item active">
                            <img class="d-block" src="../assets/adidas/adidas-yeezy-boost-350-v2-core-black-red.jpg" alt="First slide">
                            <h4>Adidas</h4>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block" src="../assets/air%20force%201.PNG" alt="Second slide">
                            <h4>Nike</h4>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block" src="../assets/vans%20old%20school.PNG" alt="Third slide">
                            <h4>Vans</h4>
                        </div>
                    </div>
                    <ol class="carousel-indicators" style="position: static!important;">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                       data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                       data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

        <div><a href="/products/collections.jsp" class="list-product">Danh sách sản phẩm</a></div>
    </center>
    <div class="footer">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-4">
                <div class="information">
                    <p>Địa chỉ : Hàm Nghi 2- Nam Từ Niêm - Hà Nội</p>
                    <p>SDT: 0567-667-677</p>
                </div>
            </div>
            <div class="col-2"></div>
            <div class="col-2">
                <a href="/products/size.jsp" class="size">size</a>
                <a href="/products/customercare.jsp" class="contact">chăm sóc khách hàng</a>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
</div>

</body>
</html>
