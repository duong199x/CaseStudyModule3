<%--
  Created by IntelliJ IDEA.
  User: toand
  Date: 31/10/2023
  Time: 4:21 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>404</title>
    <style>
        .page_404{
            padding:40px 0;
            background:#fff;
            font-family: 'Arvo', serif;
            text-align: center;
        }

        .page_404  img{ width:100%;}

        .four_zero_four_bg{

            background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
            height: 400px;
            background-position: center;
        }

        .four_zero_four_bg h1{
            font-size:80px;
        }

        .four_zero_four_bg h3{
            font-size:80px;
        }

        .link_404{
            color: #fff!important;
            padding: 10px 20px;
            background: #39ac31;
            margin: 20px 0;
            display: inline-block;}
        .contant_box_404{ margin-top:-50px;}
    </style>
</head>
<body>
<section class="page_404">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 ">
                <div class="col-sm-10 col-sm-offset-1  text-center">
                    <div class="four_zero_four_bg">
                        <h1 class="text-center ">404</h1>


                    </div>

                    <div class="contant_box_404">
                        <h3 class="h2">
                            Look like you're lost
                        </h3>

                        <p>the page you are looking for not avaible!</p>

                        <a href="" class="link_404">Go to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
