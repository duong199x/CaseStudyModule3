<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 03/11/2023
  Time: 08:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Bảng Size - WS</title>
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
            <label class="product-info-acd-label size">
                <span class="product-content-acd-title">Bảng Size/
                    <span class="product-content-acd-title-en">SIZE GUIDE
                    </span>
                </span>
            </label>
            <div class="product-acd-content product-content-size">
                <div class="product-size-brand">
                    ナイキ/ジョーダン
                    <div class="product-size-brand-logo"><img
                            src="https://assets.snkrdunk.com/f1efaddd0fd604c/img/product/product-size-brand-nike.png"
                            data-src="https://assets.snkrdunk.com/f1efaddd0fd604c/img/product/product-size-brand-nike.png"
                            alt="ナイキ/ジョーダン" class=" ls-is-cached lazyloaded"></div>
                </div>
                <div class="product-size-wrapper">
                    <div class="product-size-tab">
                        <p href="#" class="tab-list active">Nam</p>
                    </div>
                    <div class="product-size-table-box">
                        <table class="product-size-table">
                            <tbody>
                            <tr>
                                <th>CM(センチ)</th>
                                <th>US</th>
                                <th>UK</th>
                                <th>EU</th>
                            </tr>
                            <tr>
                                <td>22.5</td>
                                <td>3.5</td>
                                <td>3</td>
                                <td>35.5</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>4</td>
                                <td>3.5</td>
                                <td>36</td>
                            </tr>
                            <tr>
                                <td>23.5</td>
                                <td>4.5</td>
                                <td>4</td>
                                <td>36.5</td>
                            </tr>
                            <tr>
                                <td>23.5</td>
                                <td>5</td>
                                <td>4.5</td>
                                <td>37.5</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>5.5</td>
                                <td>5</td>
                                <td>38</td>
                            </tr>
                            <tr>
                                <td>24</td>
                                <td>6</td>
                                <td>5.5</td>
                                <td>38.5</td>
                            </tr>
                            <tr>
                                <td>24.5</td>
                                <td>6.5</td>
                                <td>6</td>
                                <td>39</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>7</td>
                                <td>6</td>
                                <td>40</td>
                            </tr>
                            <tr>
                                <td>25.5</td>
                                <td>7.5</td>
                                <td>6.5</td>
                                <td>40.5</td>
                            </tr>
                            <tr>
                                <td>26</td>
                                <td>8</td>
                                <td>7</td>
                                <td>41</td>
                            </tr>
                            <tr>
                                <td>26.5</td>
                                <td>8.5</td>
                                <td>7.5</td>
                                <td>42</td>
                            </tr>
                            <tr>
                                <td>27</td>
                                <td>9</td>
                                <td>8</td>
                                <td>42.5</td>
                            </tr>
                            <tr>
                                <td>27.5</td>
                                <td>9.5</td>
                                <td>8.5</td>
                                <td>43</td>
                            </tr>
                            <tr>
                                <td>28</td>
                                <td>10</td>
                                <td>9</td>
                                <td>44</td>
                            </tr>
                            <tr>
                                <td>28.5</td>
                                <td>10.5</td>
                                <td>9.5</td>
                                <td>44.5</td>
                            </tr>
                            <tr>
                                <td>29</td>
                                <td>11</td>
                                <td>10</td>
                                <td>45</td>
                            </tr>
                            <tr>
                                <td>29.5</td>
                                <td>11.5</td>
                                <td>10.5</td>
                                <td>45.5</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>12</td>
                                <td>11</td>
                                <td>46</td>
                            </tr>
                            <tr>
                                <td>30.5</td>
                                <td>12.5</td>
                                <td>11.5</td>
                                <td>46.5</td>
                            </tr>
                            <tr>
                                <td>31</td>
                                <td>13</td>
                                <td>12</td>
                                <td>47.5</td>
                            </tr>
                            <tr>
                                <td>31.5</td>
                                <td>13.5</td>
                                <td>12.5</td>
                                <td>48</td>
                            </tr>
                            <tr>
                                <td>32</td>
                                <td>14</td>
                                <td>13</td>
                                <td>48.5</td>
                            </tr>
                            </tbody>
                        </table> <!----></div>
                    <div class="product-size-tab">
                        <p href="#" class="tab-list">Nữ</p>
                        <div class="product-size-table-box">
                            <table class="product-size-table">
                                <tbody>
                                <tr>
                                    <th>CM(センチ)</th>
                                    <th>US</th>
                                    <th>UK</th>
                                    <th>EU</th>
                                </tr>
                                <tr>
                                    <td>22</td>
                                    <td>5</td>
                                    <td>2.5</td>
                                    <td>35.5</td>
                                </tr>
                                <tr>
                                    <td>22.5</td>
                                    <td>5.5</td>
                                    <td>3</td>
                                    <td>36</td>
                                </tr>
                                <tr>
                                    <td>23</td>
                                    <td>6</td>
                                    <td>3.5</td>
                                    <td>36.5</td>
                                </tr>
                                <tr>
                                    <td>23.5</td>
                                    <td>6.5</td>
                                    <td>4</td>
                                    <td>37.5</td>
                                </tr>
                                <tr>
                                    <td>24</td>
                                    <td>7</td>
                                    <td>4.5</td>
                                    <td>38</td>
                                </tr>
                                <tr>
                                    <td>24.5</td>
                                    <td>7.5</td>
                                    <td>5</td>
                                    <td>38.5</td>
                                </tr>
                                <tr>
                                    <td>25</td>
                                    <td>8</td>
                                    <td>5.5</td>
                                    <td>39</td>
                                </tr>
                                <tr>
                                    <td>25.5</td>
                                    <td>8.5</td>
                                    <td>6</td>
                                    <td>40</td>
                                </tr>
                                <tr>
                                    <td>26</td>
                                    <td>9</td>
                                    <td>6.5</td>
                                    <td>40.5</td>
                                </tr>
                                <tr>
                                    <td>26.5</td>
                                    <td>9.5</td>
                                    <td>7</td>
                                    <td>41</td>
                                </tr>
                                <tr>
                                    <td>27</td>
                                    <td>10</td>
                                    <td>7.5</td>
                                    <td>42</td>
                                </tr>
                                <tr>
                                    <td>27.5</td>
                                    <td>10.5</td>
                                    <td>8</td>
                                    <td>42.5</td>
                                </tr>
                                <tr>
                                    <td>28</td>
                                    <td>11</td>
                                    <td>8.5</td>
                                    <td>43</td>
                                </tr>
                                <tr>
                                    <td>28.5</td>
                                    <td>11.5</td>
                                    <td>9</td>
                                    <td>44</td>
                                </tr>
                                <tr>
                                    <td>29</td>
                                    <td>12</td>
                                    <td>9.5</td>
                                    <td>44.5</td>
                                </tr>
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
</body>
</html>
