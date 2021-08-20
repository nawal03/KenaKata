<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    .navbar-brand{
        font-family: "Lucida Calligraphy";
    }
    table{
        table-layout: fixed;
    }

    .row{
        display: inline;
    }
    .navbar-nav .actv{
        border-bottom: 3px solid white;
    }
    #tooltip1 {
        position: relative;
    }
    #tooltip1 a{
        text-decoration: underline;
    }
    #tooltip1 a span {
        display: none; color: #FFFFFF;
    }
    #tooltip1 a:hover{
        text-decoration: none;
    }
    #tooltip1 a:hover span {
        display: block;
        position: absolute;
        width: fit-content;
        background: #aaa;
        height: fit-content;
        left: 100px;
        top: -10px;
        color: #FFFFFF;
        padding: 0 5px;
        transform: translate(-220px, -50px);
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
    .confirm{
        background-color: rgba(0,0,0,0.1);
        border: none;
        border-radius: 5px;
        width: 80px;
        height: 30px;
        font-family: Monaco, monospace;
    }
    .confirm:hover{
        background-color: rgba(0,0,0,0.2);

    }
    select{
        border: none;
        font-family: Monaco, monospace;
        width: 80px;
        height: 40px;
        border-radius: 5px;
    }
    input{
        font-family: Monaco, monospace;
    }
    .dropdown-content a:hover {background-color: #ddd;}

    .dropdown:hover .dropdown-content {display: block;}
    /*Footer styling*/
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
    <title>My Orders</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f2f2f2">
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
<div class="container-fluid">
    <h2 style="text-align: center; font-family: Monaco, monospace;">Your Orders</h2>

    <br>
    <div class="row">
        <table class="table table-striped" id="mytableID" style="width:90%; margin: auto; font-size: 16px; font-family: Monaco, monospace">
            <thead>
            <tr>
                <th width="120px">Order ID</th>
                <th width="180px">Customer</th>
                <th width="250px">Product Details</th>
                <th width="200px" align="center" style="padding-left: 30px">Total Amount</th>
                <th width="200px">Shipping Address</th>
                <th width="230px" style="padding-left: 20px">Timestamp</th>
                <th width="200px">Status</th>
            </tr>
            <br>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.oid}</td>
                    <td>${order.username}</td>
                    <td style="font-size: 15px; opacity: 0.9;">${order.details}</td>
                    <td style="padding-left: 30px">${order.totalprice} &#x09F3</td>
                    <td style="font-size: 15px; opacity: 0.8; text-justify: inter-word">${order.address}</td>
                    <td style="font-size: 15px; padding-left: 20px">${order.time}</td>
                    <td>
                        <c:if test="${order.status.equals('pending')}">
                            <form action="/shop/order/status/${order.oid}">

                                <select name="status">
                                    <option value="accepted">Accept</option>
                                    <option value="rejected">Reject</option>
                                </select>
                                <button type="submit" class="confirm">Confirm</button>
                            </form>
                        </c:if>
                        <c:if test="${!order.status.equals('pending')}">
                            ${order.status}
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${orderList.size()==0}">
            <div style="font-family: Monaco, monospace; font-size: 20px; opacity: 0.8; padding-left: 650px; padding-top: 150px;" >
                You have no orders.
            </div>

        </c:if>
    </div>
</div>
<div class="footer" style="font-family: Monaco, monospace">
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