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
    <title>Orders</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f2f2f2">

<nav class="navbar navbar-default" style="background-color: #262626">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/customer/home" style="color: #f2f2f2; font-family: 'Monaco',monospace"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/customer/settings" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-cog"></span> ${customer.username}</a></li>
            <li><a href="/customer/cart/view" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
            <li class="actv"><a href="/customer/orders" style="color: #f2f2f2; font-family: Monaco, monospace">
                <span class="glyphicon glyphicon-list"></span> Orders</a><li>
            <li><a href="/logout" style="color: #f2f2f2; font-family: 'Monaco',monospace">
                <span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <h2 style="text-align: center; font-family: Monaco, monospace;">Your Orders</h2>
    <br>
    <div class="row">
        <table class="table table-striped" id="myTable" style="width:90%; margin: auto; font-size: 16px; font-family: Monaco, monospace">
            <thead>
            <tr>
                <th width="120px">Order ID</th>
                <th width="180px">Shop Name</th>
                <th width="250px">Product Details</th>
                <th width="200px" align="center" style="padding-left: 30px">Total Amount</th>
                <th width="200px">Shipping Address</th>
                <th width="250px" style="padding-left: 20px">Timestamp</th>
                <th width="120px">Status</th>
                <th width="80px">Review</th>
            </tr>
            </thead>
            <tbody id="myTableBody">
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.oid}</td>
                    <td>${order.shopname}</td>
                    <td style="font-size: 15px; opacity: 0.9;">${order.details}</td>
                    <td style="padding-left: 30px">${order.totalprice} &#x09F3</td>
                    <td style="font-size: 15px; opacity: 0.8; text-justify: inter-word">${order.address}</td>
                    <td style="font-size: 15px; padding-left: 20px">${order.time}</td>
                    <td>${order.status}</td>
                    <td>
                        <c:if test="${order.status.equals('pending')}">
                            N/A
                        </c:if>
                        <c:if test="${!order.status.equals('pending')}">
                            <c:if test="${order.review==null}">
                                <form action="/customer/order/review/${order.oid}">
                                    <input type="text" id="in" name="review" style="opacity: 0; height: 0px; width: 0px">
                                    <button onclick="myFunction()" type="submit"
                                            style="background-color: #f2f2f2; border: none; font-family: Monaco, monospace">
                                        Add <span class="glyphicon glyphicon-plus"></span>
                                    </button>
                                </form>
                            </c:if>
                            <c:if test="${order.review!=null}">
                                <p id="tooltip1"><a href="#">Review added<span>${order.review}</span></a></p>
                            </c:if>
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
            <a href="/customer/complain/add">Contact Us</a>
            |
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
</body>
<script>
    function myFunction() {
        let review = prompt("Enter your review for this order.");
        if (review == null || review == "") {

        } else {
            var x= document.getElementById("in");
            x.value=review;
        }
    }
</script>
</html>