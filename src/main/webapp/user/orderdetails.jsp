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
                    <c:choose>
                        <c:when test="${nickname != null}">
                            <a href="/user">${nickname}</a>
                            <a href="/login?action=logout">Đăng Xuất</a>
                        </c:when>
                        <c:otherwise>
                            <a href="http://localhost:8080/login" class="login-user">Đăng Nhập</a>
                            <a href="http://localhost:8080/login?action=register" class="register">Đăng Kí</a>
                        </c:otherwise>
                    </c:choose>
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
                        <h3 href="#" class="tab-list active">Đơn Hàng </h3>
                    </div>
                    <div class="product-size-table-box">
                        <table class="product-size-table-bd-1-white">
                            <thead>
                            <tr>
                                <th>
                                    Thời Gian
                                </th>
                                <th>
                                    Tổng Tiền
                                </th>
                                <th>
                                    Số Diện Thoại
                                </th>
                                <th>
                                    Địa Chỉ
                                </th>
                                <th>
                                    Trạng Thái
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${order.time}</td>
                                <td>${order.total}</td>
                                <td>${order.user.phone}</td>
                                <td>${order.user.address}</td>
                                <td>
                                    <c:if test="${order.status == 1}"> <span>Chưa Xác Nhận</span></c:if>
                                    <c:if test="${order.status == 2}"> <span>Đã Xác Nhận</span></c:if>
                                    <c:if test="${order.status == 3}"> <span>Chưa Giao Hàng</span></c:if>
                                    <c:if test="${order.status == 4}"> <span>Đã Giao Hàng</span></c:if>
                                </td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <th colspan="4">Tổng Tiền</th>
                            <th>${total}</th>
                            </tfoot>

                        </table>
                    </div>
                </div>
                <div class="product-size-wrapper">
                    <div class="product-size-tab">
                        <h3 href="#" class="tab-list active">Chi Tiết Đơn Hàng </h3>
                    </div>
                    <div class="product-size-table-box">
                        <table class="product-size-table-bd-1-white">
                            <thead>
                            <tr>
                                <th>Tên Sản Phẩm</th>
                                <th>Hình Ảnh</th>
                                <th>Giá</th>
                                <th>Size</th>
                                <th style="width: 20px;">
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${orderDetails}" >
                                <tr>
                                        <td>${item.product.name}</td>
                                        <td><img src="${item.product.originImage}" style="width: 150px"></td>
                                        <td>${item.product.price}</td>
                                        <td>${item.size.size}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
