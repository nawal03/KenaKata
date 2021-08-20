<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Verification Failed</title>
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
        /* Overwrite default styles of hr */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
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
            <li><a href="/login" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="container" align="center" style="font-family: Monaco, monospace">
    <div class="row" style="padding-top: 50px">
        <h3 style="color: firebrick">
            Email Verficiation failed <span class="glyphicon glyphicon-exclamation-sign"></span>
            <hr/>
            Your account is already verified or you've entered incorrect verification url.
        </h3>

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