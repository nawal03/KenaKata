<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .navbar-brand{
        font-family: "Lucida Calligraphy";
    }

    .navbar-nav .actv{
        border-bottom: 3px solid white;
    }
    body{
        background-image: url("${shop.shop_logo}");
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        background-attachment: fixed;
    }
    .wrap {
        margin: 50px auto;
    }

    html,
    body {
        height: 100%;
    }
    img{
        width: 100%;
    }

    .card{
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 15px;
        width: fit-content;
        margin-left: 60px;
        /*margin-right: 10px;*/
        display: inline-block;
        box-shadow: 4px 4px 12px gray;
        margin-bottom: 50px;
    }
    .nav navbar-nav:hover{
        text-underline: #d4122b;
        display: inline-block;
    }
    .dropbtn {
        font-family: Monaco, monospace;
        background-color: #262626;
        color: #f2f2f2;
        padding-top: 14px;
        /*padding: 16px;*/
        font-size: 16px;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        width: fit-content;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 12px;
        text-decoration: none;
        display: inline-block;
        width: 150px;
        font-size: 14px;
    }

    .dropdown-content a:hover {background-color: #ddd;}

    .dropdown:hover .dropdown-content {display: block;}
    .temp a{
        text-decoration: underline;
        color: #f2f2f2;
    }
    .temp a:hover{
        color: #f2f2f2;
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
        height: 120px; /* Set same as footer's height */
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
    <title>Reviews</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f2f2f2; font-family: Monaco, monospace">
<%--<div class="img-container">

</div>--%>
<div class="content">
    <nav class="navbar navbar-default" style="background-color: #262626; margin: 0 auto">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="color: #f2f2f2; font-family: 'Lucida Calligraphy',cursive"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="actv"><a href="/shop/home" style="color: white; font-family: 'Monaco',monospace;">Home</a></li>
                <li><a href="/shop/addProduct" style="color: white; font-family: 'Monaco',monospace;">Add Product</a></li>

                <li class="nav-item dropdown" style="width: fit-content">
                    <div class="dropdown">
                        <button class="dropbtn" style="font-size:14px; font-family: Monaco, monospace">View Categories</button>
                        <div class="dropdown-content">
                            <c:forEach var="category" items="${categoryList}">
                                <a  href="/shop/viewCategory/${category}" style="font-size: 14px; color: #262626; font-family: 'Monaco',monospace">${category}</a>
                            </c:forEach>
                        </div>
                    </div>
                </li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/shop/settings" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                    <span class="glyphicon glyphicon-cog"></span> ${shop.shopname}</a></li>
                <li><a href="/shop/orders" style="color: #f2f2f2; font-family: Monaco, monospace">
                    <span class="glyphicon glyphicon-list"></span> Orders</a><li>
                <li><a href="/logout" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            </ul>
        </div>

    </nav>
    <nav class="navbar navbar-classic" style="background-color: white; padding-left: 50px; margin: 0 auto">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/shop/home" style="font-weight: bold; font-size: 28px; color: #262626; font-family: 'Cooper Black',serif"> ${shop.shopname}</a>

            </div>
            <ul class="nav navbar-nav" style="padding-left: 460px; transform: translate(0px, -8px); color: #d4122b;">
                <li>
                    <h3 align="center"><span class="glyphicon glyphicon-star-empty"></span>
                        User Reviews <span class="glyphicon glyphicon-star-empty"></span></h3>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="reviews">
            <div class="row" style="margin-bottom: 50px">
            </div>
            <div class="row">
                <c:forEach var="order" items="${orderList}">
                    <c:if test="${order.review!=null}">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <div class="card-body">
                                <blockquote class="blockquote mb-0">
                                    <p>${order.review}</p>
                                    <footer class="blockquote-footer"> ${order.username} <cite title="Source Title"> ${order.time} </cite></footer>
                                </blockquote>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

    </div>
</div>
<div class="footer" style="opacity: 0.8">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            <a href="/shop/complain/add">Contact Us</a>
            |
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
</body>
</html>
