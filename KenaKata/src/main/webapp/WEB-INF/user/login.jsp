<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar-brand{
            font-family: "Lucida Calligraphy";
        }
        /* Add padding to containers */
        .container {
            padding: 50px;
            alignment: center;
            align-content: center;
            opacity: 100%;
        }


        .alert-danger {
            width: 50%;
        }
        .alert-success {
            width: 50%;
        }
        /* Full-width input fields */
        input[type=text], input[type=email], input[type=password] {
            width: 50%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            border-bottom: #262626;
            background: #f1f1f1;
            font-family: Monaco, monospace;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }
        .navbar-nav .actv{
            border-bottom: 3px solid white;
        }

        /* Set a style for the submit/register button */
        .signin {
            background-color: #262626;
            opacity: 70%;
            color: white;
            font-size: 22px;
            padding: 12px 20px;
            margin: 8px 0;
            border-radius: 8px;
            cursor: pointer;
            width: 20%;
            height: auto;
            opacity: 0.9;
            alignment: center;
            font-family: Monaco, monospace;
        }

        .signin:hover {
            opacity:1;
        }
        .temp a{
            text-decoration: underline;
            color: #f2f2f2;
        }
        .temp a:hover{
            text-decoration: none;
        }
        body{
            font-family: Monaco, monospace;
            margin: 0 auto;
            position: relative;
        }
        body::after {
            content: '';
            display: block;
            height: 80px; /* Set same as footer's height */
        }
        .footer {
            background-color: #262626;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 80px;
        }
    </style>
</head>
<body style="background-color: #f2f2f2">
<nav class="navbar navbar-default" style="background-color: #262626">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <div class="navbar-2">
            <ul class="nav navbar-nav">
                <li><a href="/" style="color: #f2f2f2; font-family: 'Monaco',monospace">Home</a></li>
            </ul>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/register" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="/registershop" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-pencil"></span> Register Shop</a></li>
            <li class="actv"><a href="/login" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="container" align="center" style="font-family: Monaco, monospace">
    <div class="row">

        <c:if test="${verified != null}">
            <h5 style="color: lightseagreen; font-family: Monaco, monospace">
                <span class="glyphicon glyphicon-ok"></span>
                Your email is verified.</h5>
            <br>
        </c:if>

        <legend style="color: #262626; font-family: Monaco, monospace">Login</legend>

        <form:form method="POST" modelAttribute="user" class="form-signin">

            <div class="mb-3">
                <form:input type="text"
                            path="username"
                            class="form-control"
                            placeholder="Enter User Name/ Shop Name"
                            autofocus="true"/>
            </div>

            <div class="mb-3">
                <form:input type="password"
                            path="password"
                            class="form-control"
                            placeholder="Enter Password"/>
            </div>
            <div class="mb-3">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                            ${error} <span class="glyphicon glyphicon-exclamation-sign"></span>
                    </div>
                </c:if>

                <c:if test="${logout != null}">
                    <div class="alert alert-success" role="alert">
                            ${logout}
                    </div>
                </c:if>
            </div>

            <button class="signin" type="submit">Login</button>
        </form:form>

        <div class="mb-3" style="margin-top: 20px">
            <a href="/forgotPassword">Forgot password?</a><br>
            <br>
            <a href="/register">Not a registered user? Register here!</a><br>

        </div>

    </div>
</div>
<div class="footer">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            Email: kenakata.unlimited@gmail.com
            |
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
</body>
</html>