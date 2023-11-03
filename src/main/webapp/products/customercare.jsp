<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 01/11/2023
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>WindowShop-Danh Sách Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="../css/collections.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="../css/customercare.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="../css/items.css"/>">
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
            <h3>Chăm Sóc Khách Hàng</h3>
           <form>
                   <div class="form-group">
                       <label for="exampleFormControlInput1">Email Của Bạn</label>
                       <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                   </div>
                   <div class="form-group">
                       <label for="exampleFormControlSelect1">Chủ Đề Thắc Mắc</label>
                       <select class="form-control" id="exampleFormControlSelect1">
                           <option>Sao Shop Bán Giày Rẻ Đẹp Thế?</option>
                           <option>Địa Chỉ Shop Ở Đâu?</option>
                           <option>Có Ship COD Không ?</option>
                           <option>Lấy Tiền Ở Đâu Để Mua ?</option>
                           <option>Hỏi Như Hỏi ?</option>
                       </select>
                   </div>
                   <div class="form-group">
                       <label for="exampleFormControlTextarea1">Thắc Mắc Thêm</label>
                       <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                   </div>
               <button type="submit">Gửi</button>
           </form>
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
                    </div>
                    <div class="col-3 nodata"></div>
                </div>
            </div>
        </div>
    </center>

</div>
</body>
</html>
