<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<style>
    .navbar-brand{
        font-family: "Lucida Calligraphy";
    }
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
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }
    .signin {
        background-color: #262626;
        opacity: 70%;
        color: white;
        font-size: 18px;
        padding: 12px 16px;
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
    .container{
        padding: 50px;
        alignment: center;
        align-content: center;
        opacity: 100%;
    }
    legend {
        font-size: 36px;
        padding-bottom: 20px;
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
<head>
    <title>Forgot Password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body style="background-color: #f2f2f2; font-family: Monaco, monospace">

<nav class="navbar navbar-default" style="background-color: #262626">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/" style="color: #f2f2f2; font-family: 'Monaco',monospace"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/register" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="/registershop" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-pencil"></span> Register Shop</a></li>
            <li><a href="/login" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="container" align="center">
    <legend style="color: #262626; font-family: Monaco, monospace; font-size: 32px">Password Reset</legend>
    <c:if test="${msg!=null}">
        <h5 style="color: #d4122b">*No such user found.</h5>
    </c:if>
    <form method="post">
        <div class="mb-3">
            <input type="text"
                   placeholder="Enter User Name/ Shop Name"
                   name="username"
                   autofocus="true" style="border-radius: 8px;"/>
            <h5 style="color: #d4122b">*We will send your new password to your registered email address</h5>
        </div>
        <%--<input type="text" placeholder="Enter your username" name="username">--%>
        <button class="signin" type="submit">Get New Password</button>
        <%--<button type="submit">Get New Password</button>--%>
    </form>
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
