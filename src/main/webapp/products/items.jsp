<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 10/31/2023
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>WindowShop-Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="../css/items.css"/>">
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
            <div class="row">
                <div class="col-3 nodata"></div>
                <div class="col-3 slide">
                    <div id="carouselExampleControlsNoTouching" class="carousel slide" data-touch="false" data-interval="false">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../assets/nike/air%20force%201.PNG" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/adidas/adidas-yeezy-boost-350-v2-core-black-red.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/nike/air%20force%201.PNG" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-3 information">
                    <div class="describe">
                        <div class="describe-name">
                            <h6>Tên sản Phẩm</h6>
                            <p>Mô tả</p>
                        </div>
                        <div class="describe-price">
                            <p>Giá</p>
                        </div>
                        <div class="describe-attention">
                            <p>Quý khách vui lòng kiểm tra kĩ size giày sao cho phù hợp. Nếu không biết hãy liên hệ bên chăm sóc khác hàng.</p>
                        </div>
                        <div class="add-card">
                            <select name="Size">
                                <option>-size-</option>
                                <option>36</option>
                                <option>37</option>
                                <option>38</option>
                                <option>39</option>
                                <option>40</option>
                                <option>41</option>
                                <option>42</option>
                                <option>43</option>
                                <option>44</option>
                            </select>
                            <button type="submit">Thêm giỏ hàng</button>
                        </div>
                    </div>
                </div>
                <div class="col-3 nodata"></div>
            </div>
        </div>
    </center>
    <div class="footer">
        <div class="row">
            <div class="col-3 nodata"></div>
            <div class="col-3">
                <div>
                    <a href="/products/home.jsp">home</a>
                    <p> >  </p>
                    <a href="/products/collections.jsp">shop</a>
                </div>
            </div>
            <div class="col-3">
                <div>
                    <a href="/products/size.jsp" class="size">size</a>
                    <p> |</p>
                    <a href="/products/customercare.jsp" class="contact">chăm sóc khách hàng</a>
                </div>
            </div>
            <div class="col-3 nodata"></div>
        </div>
    </div>

</div>
</body>
</html>
