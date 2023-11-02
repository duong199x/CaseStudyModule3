<%--
  Created by IntelliJ IDEA.
  User: duongson
  Date: 31/10/2023
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Welcome</title>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font online-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

    <!--        Animate.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">


    <link rel="stylesheet" href="../css/login.css" >

    <!-- Google JQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="../js/login.js" charset="UTF-8"></script>

</head>
<body>
<div>
    <div class="panel shadow1">
        <form class="login-form" action="/user">
            <div class="panel-switch animated fadeIn">
                <button type="button" id="sign_up" class="active-button">Sign Up</button>
                <button type="button" id="log_in" class="" disabled>Log in</button>
            </div>
            <h1 class="animated fadeInUp animate1" id="title-login">Welcome Back !</h1>
            <h1 class="animated fadeInUp animate1 hidden" id="title-signup">Welcome !</h1>
            <fieldset id="login-fieldset">
                <input class="login animated fadeInUp animate2" name="username" type="textbox"  required   placeholder="Username" value="" >
                <input class="login animated fadeInUp animate3" name="password" type="password" required placeholder="Password" value="">
            </fieldset>
            <fieldset id="signup-fieldset" class="hidden">
                <input class="login animated fadeInUp animate2" name="username" type="textbox"  required   placeholder="Username" value="" >
                <input class="login animated fadeInUp animate3" name="password" type="password" placeholder="Choose password"  required  value="">
            </fieldset>
            <input type="submit" id="login-form-submit" class="login_form button animated fadeInUp animate4" value="Log in">
            <input type="submit" id="signup-form-submit" class="login_form button animated fadeInUp animate4 hidden" value="Sign up">
            <p><a id="lost-password-link" href="" class="animated fadeIn animate5">I forgot my  login or password (!)</a></p>
        </form>
    </div>
</div>
<script>
    $(document).ready(function(){

//--------- change color value of the form text/password inputs -----

        const textInputs =  $("input[type='textbox']");
        const passwordsInputs =  $("input[type='password']");
        //--------- Login screen swicth -----

        $("button").click(function(event){  //  prevent buttons in form to reload
            event.preventDefault();
        });

        $("a").click(function(event){  //  prevent 'a' links in form to reload
            event.preventDefault();
        });

        $("#sign_up").click(function(){ // when click Sign Up button, hide the Log In elements, and display the Sign Up elements
            $("#title-login").toggleClass("hidden",true);
            $("#login-fieldset").toggleClass("hidden",true);
            $("#login-form-submit").toggleClass("hidden",true);
            $("#lost-password-link").toggleClass("hidden",true);
            $("#sign_up").toggleClass("active-button",false);
            $("#log_in").removeAttr("disabled");

            $("#title-signup").toggleClass("hidden",false);
            $("#signup-fieldset").toggleClass("hidden",false);
            $("#signup-form-submit").toggleClass("hidden",false);
            $("#log_in").toggleClass("active-button",true);
            $("#sign_up").prop('disabled', true);
        });

        $("#log_in").click(function(){ // when click Log In button, hide the Sign Up elements, and display the Log In elements
            $("#title-login").toggleClass("hidden",false);
            $("#login-fieldset").toggleClass("hidden",false);
            $("#login-form-submit").toggleClass("hidden",false);
            $("#lost-password-link").toggleClass("hidden",false);
            $("#sign_up").toggleClass("active-button",true);
            $("#log_in").prop('disabled', true);

            $("#title-signup").toggleClass("hidden",true);
            $("#signup-fieldset").toggleClass("hidden",true);
            $("#signup-form-submit").toggleClass("hidden",true);
            $("#log_in").toggleClass("active-button",false);
            $("#sign_up").removeAttr("disabled");

        });
    });
</script>
</body>
</html>
