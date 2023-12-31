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
    <title>Nike - WS</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="../css/collections.css"/>">
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
                            <a href="/user"><button class="btn btn-success">${nickname}</button></a>
                            <a href="/user?action=cart" ><button class="btn btn-danger">Cart</button></a>
                            <a href="/login?action=logout"><button class="btn btn-primary">Đăng Xuất</button></a>
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
            <div class="nike" style="color: white;font-family: Courier New, Courier, Monaco"><h3>${category}</h3></div>
            <div class="row">
                <div class="col-3">
                    <a href="/home?action=collections" style="color: white;font-family: Courier New, Courier, Monaco"> <=Quay Lại</a>
                </div>
                <div class="col-6">
                    <div class="main-center">
                        <c:forEach items="${listproduct}" var="item">
                            <div class="item">
                                <a href="/home?action=items&id=${item.id}">
                                    <div class="image-product"><img src="${item.originImage}"></div>
                                    <div class="describe"><p>${item.name} - ${item.price}</p></div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-3">
                    <div class="main-right"></div>
                </div>
            </div>
        </div>
        <div class="footer">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </center>

</div>
</body>
</html>
