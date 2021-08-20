<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<style>
    .navbar-brand{
        font-family: "Lucida Calligraphy";
    }
    .row{
        padding-left: 50px;
    }
    .search{
        float: left;
        margin: 0 auto;
        padding-left: 50px;
        width: 70%;
    }
    .sort{
        float: right;
        padding-right: 150px;
    }
    input[type="text"] {
        width: 60%;
        height: 40px;
        background-color: white;
        /*opacity: 50%;*/
        border: none;
        font-family: Monaco, monospace;
        font-size: 16px;
        color: black;
        border-radius: 12px;
        padding-left: 20px;
    }
    .card{
        display: inline-block;
        height: 300px;
        width: 250px;
        border-radius: 5px;
        box-shadow: 2px 2px 10px gray;
        margin: 50px;
        position: relative;
    }
    .card-img-top{
        width: 100%;
        height: 100%;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .centered{
        position: absolute;
        bottom: 0;
        width: 100%;
        opacity:100%;
        color: #262626;
        font-size: 12px;
        padding-bottom: 150px;
        text-align: center;
    }
    .navbar-nav .active{
        border-bottom: 3px solid #d4122b; !important;
    }
    i{
        color: #d54c4c;
    }
    i:hover{
        color: #ad3e3e;
    }
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
        opacity: 1;
        background-color: #262626;
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 80px;
        font-family: Monaco, monospace;
    }
    .example1 {
        height: 70px;
        overflow: hidden;
        position: relative;
        padding-top: 10px;
        padding-bottom: 50px;
        background-color: rgba(0,0,0,0.05);
    }
    .example1 h4 {
        position: absolute;
        width: 100%;
        height: 100%;
        margin: 0;
        line-height: 50px;
        text-align: left;

        /* Starting position */
        -moz-transform:translateX(100%);
        -webkit-transform:translateX(100%);
        transform:translateX(100%);

        /* Apply animation to this element */
        -moz-animation: example1 20s linear infinite;
        -webkit-animation: example1 20s linear infinite;
        animation: example1 20s linear infinite;
    }
    /* Move it (define the animation) */
    @-moz-keyframes example1 {
        0%   { -moz-transform: translateX(100%); }
        100% { -moz-transform: translateX(-100%); }
    }
    @-webkit-keyframes example1 {
        0%   { -webkit-transform: translateX(100%); }
        100% { -webkit-transform: translateX(-100%); }
    }
    @keyframes example1 {
        0%   {
            -moz-transform: translateX(100%); /* Firefox bug fix */
            -webkit-transform: translateX(100%); /* Firefox bug fix */
            transform: translateX(100%);
        }
        100% {
            -moz-transform: translateX(-100%); /* Firefox bug fix */
            -webkit-transform: translateX(-100%); /* Firefox bug fix */
            transform: translateX(-100%);
        }
    }
    .review{
        font-size: 18px;
        color: #d4122b;
        font-family: Monaco, monospace;
        text-align: right;
        /*style="font-size: 18px; color: #d4122b;
        font-family: 'Monaco',monospace; text-align: right"*/
        text-decoration: underline;
    }
    .review:hover{
        text-decoration: none;
        color: #d4122b;
    }
</style>
<head>
    <title>View Category</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body style="background-color: #f2f2f2; margin: 0 auto; font-family: Monaco, monospace">
<nav class="navbar navbar-default" style="background-color: #262626; margin: 0 auto">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <div class="navbar-2">
            <ul class="nav navbar-nav">
                <li class="actv"><a href="/" style="color: #f2f2f2; font-family: 'Monaco',monospace">Home</a></li>
            </ul>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/register" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="/registershop" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-pencil"></span> Register Shop</a></li>
            <li><a href="/login" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>
<nav class="navbar navbar-classic" style="background-color: white; padding-left: 50px; margin: 0 auto">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" <%--href="/viewShop/${shop.shopname}"--%> style="font-weight: bold; font-size: 28px; color: #262626; font-family: 'Cooper Black',serif"> ${shop.shopname}</a>

        </div>
        <ul class="nav navbar-nav" style="padding-left: 100px">
            <c:forEach var="category" items="${categoryList}">
                <li <c:if test="${cat eq category}">class="active"</c:if>>
                    <a href="/viewShop/${shop.shopname}/viewCategory/${category}" style="font-size: 18px; color: #262626; font-family: 'Monaco',monospace">${category}</a></li>
            </c:forEach>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a class="review" href="/viewShop/${shop.shopname}/reviews">Reviews</a>
            </li>
        </ul>
    </div>
</nav>


<div class="container-fluid">
    <div class="row" style="padding-left: 0px">
        <div class="example1">
            <h4>Welcome to <b>${shop.shopname}!</b> ${shop.about} We deliver to ${shop.delivery_area}. </h4>
        </div>
    </div>
    <div class="row">
        <legend style="color: #262626;font-size: 28px; font-family: Monaco, monospace; padding-left: 650px; padding-top: 20px;">PRODUCTS</legend>
        <div class="search">
            <form method="get" action="/viewShop/${shop.shopname}/searchProductResult/${category}">
                <input type="text" name="str" placeholder="Search Product...">
                <button type="submit" href="/viewShop/${shop.shopname}/searchProductResult/${category}" style="border: none">
                    <i class="fa fa-search" style="font-size:24px; color: #262626; float: right"></i>
                </button>
            </form>
        </div>

        <div class="sort">
            <%String order="Ascending";%>
            <form method="get" action="/viewShop/${shop.shopname}/sortProductResult/${category}">
                <label style="font-family: Monaco, monospace; opacity: 60%">Sort by: </label>
                <select name="param" style="border: none; border-radius: 5px; height: 40px; width: 100px; padding-left: 15px; font-family: Monaco, monospace">
                    <option value="Name" style="font-family: Monaco, monospace">Name</option>
                    <option value="Price" style="font-family: Monaco, monospace">Price</option>
                </select>
                <button type="submit" name="order" value="Ascending" style="border: none">
                    <i class="fa fa-sort-amount-asc" style="font-size:24px; color: #262626"></i>
                </button>
                <button type="submit" name="order" value="Descending" style="border: none">
                    <i class="fa fa-sort-amount-desc" style="font-size:24px; color: #262626"></i>
                </button>
            </form>
        </div>
    </div>


    <div class="row">
        <c:if test="${productList.size() == 0}">
            <h2 style="font-family: Monaco, monospace; opacity: 70%; text-align: center; padding-top: 150px">
                No Products Available Right Now!
            </h2>
        </c:if>
        <c:forEach var="product" items="${productList}">
            <div class="card">
                <c:if test="${product.stock}">
                    <img class="card-img-top" src="${product.image1}" alt="">
                </c:if>
                <c:if test="${!product.stock}">
                    <img class="card-img-top" src="${product.image1}" alt="" style="opacity: 50%">
                    <div class="centered">
                        <h2 style="font-family: 'Monaco',monospace; font-weight: bold; text-align: center; display: inline-block">
                            Out of stock
                        </h2>
                    </div>
                </c:if>
                <div class="card-body">
                    <h4 style="font-family: Monaco, monospace; text-align: left">${product.name}
                        <a href="/viewShop/${shopname}/viewProduct/${product.pid}">
                            <i class="fa fa-shopping-bag" style="font-size:24px; float: right"></i>
                        </a>
                    </h4>
                    <h4 style="font-family: Monaco, monospace; font-weight: bold">&#x09F3 ${product.price}</h4>
                </div>
            </div>
        </c:forEach>
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

