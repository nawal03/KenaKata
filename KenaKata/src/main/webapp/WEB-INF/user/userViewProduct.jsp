<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar-brand{
            font-family: "Lucida Calligraphy";
        }
        .description{
            float: right;
            grid-column: 5/span 2;
            padding-top: 80px;
            transform: translate(150px, 0);
            font-family: Monaco, monospace;
            text-align: left;
        }
        button{
            background-color: #262626;
            opacity: 70%;
            color: white;
            font-size: 18px;
            padding: 12px 20px;
            /*margin: 8px 0;*/
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            height: auto;
            opacity: 0.9;
            alignment: center;
            font-family: Monaco, monospace;
        }
        button:hover {
            opacity:1;
        }
        button[disabled]{
            cursor: not-allowed !important;
        }
        label span{
            position: relative;
            left: -30px;
            color: #262626;
        }
        .radio-btn {
            display: inline-block;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            font-family: Monaco, monospace;

        }
        /* Hide the browser's default radio button */
        .radio-btn input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        /* Create a custom radio button */
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 25px;
            width: 25px;
            font-size: 12px;
            padding-top: 4px;
            border: 1px #262626 solid;
            border-radius: 50%;
            transform: scale(1.2);
            text-align: center;
        }

        /* On mouse-over, add a grey background color */
        .radio-btn:hover input ~ .checkmark {
            background-color: #ccc;
        }

        /* When the radio button is checked, add a blue background */
        .radio-btn input:checked ~ .checkmark {
            background-color: lightsalmon;
            color: darkred;
        }

        /* Create the indicator (the dot/circle - hidden when not checked) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        /* Show the indicator (dot/circle) when checked */
        .radio-btn input:checked ~ .checkmark:after {
            display: block;
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
            height: 180px; /* Set same as footer's height */
        }
        .footer {
            background-color: #262626;
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 80px;
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
</head>
<body style="background-color: #f2f2f2; margin: 0 auto">
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
            <a class="navbar-brand" href="/viewShop/${shopname}" style="font-weight: bold; font-size: 28px; color: #262626; font-family: 'Cooper Black',serif"> ${shopname}</a>

        </div>
        <ul class="nav navbar-nav" style="padding-left: 100px">
            <c:forEach var="category" items="${categoryList}">
                <li><a href="/viewShop/${shopname}/viewCategory/${category}" style="font-size: 18px; color: #262626; font-family: 'Monaco',monospace">${category}</a></li>
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
    <div class="row">
        <div class="col-md-4">
            <div id="myCarousel" class="carousel slide" data-ride="carousel"
                 style="transform: translate(300px, 20px); height: 580px; width: 500px; box-shadow: 2px 2px 10px gray">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="${product.image1}" style="width: 500px; height: 580px">
                    </div>

                    <div class="item">
                        <img src="${product.image2}" style="width: 500px; height: 580px">
                    </div>

                    <div class="item">
                        <img src="${product.image3}"  style="width: 500px; height: 580px">
                    </div>
                </div>
            </div>
        </div>




        <div class="col-md-4">
            <div class="description">
                <c:if test="${!product.stock}">
                    <h2 style="color: #d4122b">OUT OF STOCK!!!</h2>
                </c:if>
                <h6 style="opacity: 0.7; font-family: Monaco, monospace">#${product.pid}</h6>
                <h2>${product.name}</h2>
                <h1 style="font-family: Monaco, monospace; font-weight: bold; opacity: 70%">&#x09F3 ${product.price}</h1>
                <br>
                <h4 style="opacity: 70%">${product.description}</h4>
                <h4 style="opacity: 70%">Color: ${product.color}</h4>
                <br>
                <form action="/customer/cart/addProduct/${product.pid}">
                    <h4 id="size" style="display: inline-block">Select Size:
                        <br>
                        <br>
                        <%--<br>--%>
                        <c:forEach var="sz" items="${sizeList}">
                             <label class="radio-btn">
                            <input type="radio" id="${sz}" name="size" value="${sz}"/>
                            <span class="checkmark">${sz}</span>
                            </label>
                        </c:forEach>
                    </h4>
                    <br>
                    <br>
                    <h4>Quantity:
                        <select name="quantity" id="quantity" style="padding-left: 10px; width: 80px; border: none">
                            <c:forEach var="quantity" items="${quantityList}">
                                <option value=${quantity}>${quantity}</option>
                            </c:forEach>
                        </select>
                    </h4>
                    <br>
                    <button type="submit" disabled="disabled">Add to Cart</button>
                    <h5 style="color: #d4122b">*Please login to proceed</h5>
                </form>
            </div>
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
