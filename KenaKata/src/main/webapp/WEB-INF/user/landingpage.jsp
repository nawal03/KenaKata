<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<style>
    .navbar-brand{
        font-family: "Lucida Calligraphy";
    }

    .row{
        display: inline;
    }
    .carousel-inner > .item > img, .carousel-inner > .item > a > img{
        margin: auto;
        border-radius: 12px;
        width: 1520px;
    }
    .centered{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -20%);
        font-size: 36px;
        font-family: Monaco, monospace;
    }
    .navbar-nav .actv{
        border-bottom: 3px solid white;
    }
    .ShopButton{
        background-color: #f2f2f2;
        color: black;
        font-size: 32px;
        margin: 0 auto;
        border: none;
        /*border-radius: 10px;*/
        cursor: pointer;
        opacity: 0.8;
        width: 1500px;
        height: 150px;
        alignment: center;
    }
    .ShopButton:hover{
        cursor: default;
    }
    .filter{
        background-color: #262626;
        opacity: 70%;
        color: white;
        font-size: 16px;
        padding: 8px;
        margin: 8px 0 0 5px;
        border-radius: 8px;
        cursor: pointer;
        width: 16%;
        height: auto;
        opacity: 0.9;
        alignment: center;
        font-family: Monaco, monospace;
    }
    .filter:hover{
        opacity: 1;
    }
    .card{
        padding-left: 60px;
        display: inline-block;
        height: 200px;
        width: 520px;
        margin: 50px 30px 100px 120px;
        position: relative;
    }
    .card-img-top{
        width: 100%;
        height: 100%;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .card-body{
        height: 40px;
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
        height: 280px;
    }
    .footer {
        background-color: #262626;
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 80px;
    }
    legend {
        font-size: 34px;
        padding-bottom: 20px;
    }
    .search{
        float: left;
        margin: 0 auto;
        padding-left: 185px;
        width: 50%;
    }
    .sort{
        float: right;
        padding-right: 170px;
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
</style>
<head>
    <title>Home</title>
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
            <li class="actv"><a href="/" style="color: #f2f2f2; font-family: 'Monaco',monospace"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/register" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="/registershop" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-pencil"></span> Register Shop</a></li>
            <li><a href="/login" style="color: #f2f2f2; font-family: 'Monaco',monospace"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div id="myCarousel" class="carousel slide" data-ride="carousel"
             style="opacity: 0.9; height: 650px; width: 1500px; margin: 0 auto; align-content: center; padding-right: 10px">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
                <li data-target="#myCarousel" data-slide-to="6"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="/images/website%20images/kenakataWelcome.jpeg" style="width: 1500px; height: 650px;">
                    <div class="centered">

                        <button class="ShopButton">Welcome to <div style="display: inline-block; font-weight: bold; font-family: 'Lucida Calligraphy'"> KenaKata! </div> <h3>An Exciting Virtual Shopping Experience</h3></button>
                    </div>
                </div>

                <div class="item">
                    <img src="/images/website%20images/shopping-mall.jpg" style="width: 1500px; height: 650px">
                    <div class="centered">

                        <button class="ShopButton">Shopping Mall Is Now at Your Home</button>
                    </div>
                </div>

                <div class="item">
                    <img src="/images/website%20images/shopping%20mall%202.jpg" style="width: 1500px; height: 650px">
                    <div class="centered">

                        <button class="ShopButton">Host Your Dream Business in Our Platform</button>
                    </div>
                </div>

                <div class="item">
                    <img src="/images/website%20images/carousal2.jpg" style="width: 1500px; height: 650px">
                    <div class="centered">

                        <button class="ShopButton">Variety of Categories and Wide Range of Products</button>
                    </div>
                </div>

                <div class="item">
                    <img src="/images/website%20images/gift.jpeg" style="width: 1500px; height: 650px">
                    <div class="centered">

                        <button class="ShopButton">Buy for Yourself and Gift to Dear Ones</button>
                    </div>
                </div>

                <div class="item">
                    <img src="/images/website%20images/lantern.jpg" style="width: 1500px; height: 650px">
                    <div class="centered">

                        <button class="ShopButton">So, What Are You Waiting For?</button>
                    </div>
                </div>

                <div class="item">
                    <img src="/images/website%20images/click.jpg" style="width: 1500px; height: 650px">
                    <div class="centered">

                        <button class="ShopButton">
                            Shopping Is Now Just a Click Away!
                        </button>
                    </div>
                </div>


            </div>
        </div>
    </div>

    <div class="row">
        <legend style="color: #262626;font-size: 40px; font-family: Monaco, monospace; padding-left: 700px; padding-top: 100px; margin-bottom: 50px">SHOPS</legend>
        <div class="search">
            <form method="get" action="/searchShop">
                <input type="text" name="str" placeholder="Search Shop or Product...">
                <button type="submit" style="border: none">
                    <i class="glyphicon glyphicon-search" style="font-size:24px; color: #262626; float: right"></i>
                </button>
            </form>
        </div>

        <div class="sort">
            <%String order="Ascending";%>
            <form method="get" action="/filterShop">
                <select name="category" style="border: none; border-radius: 5px; height: 40px; width: 200px; padding-left: 15px; font-family: Monaco, monospace">
                    <option value="Women's Clothing" style="font-family: Monaco, monospace">Women's Clothing</option>
                    <option value="Men's Clothing" style="font-family: Monaco, monospace">Men's Clothing</option>
                    <option value="Kid's Clothing" style="font-family: Monaco, monospace">Kid's Clothing</option>
                    <option value="Accessories" style="font-family: Monaco, monospace">Accessories</option>
                    <option value="Health and Beauty" style="font-family: Monaco, monospace">Health and Beauty</option>
                    <option value="Home and Decor" style="font-family: Monaco, monospace">Home and Decor</option>
                    <option value="Others" style="font-family: Monaco, monospace">Others</option>
                </select>
                <select name="delivery_area" style="border: none; border-radius: 5px; height: 40px; width: 150px; padding-left: 15px; font-family: Monaco, monospace">
                    <option value="Dhaka" style="font-family: Monaco, monospace">Dhaka</option>
                    <option value="Rajshahi" style="font-family: Monaco, monospace">Rajshahi</option>
                    <option value="Khulna" style="font-family: Monaco, monospace">Khulna</option>
                    <option value="Chattogram" style="font-family: Monaco, monospace">Chattogram</option>
                    <option value="Sylhet" style="font-family: Monaco, monospace">Sylhet</option>
                    <option value="Barishal" style="font-family: Monaco, monospace">Barishal</option>
                    <option value="Mymensingh" style="font-family: Monaco, monospace">Mymensingh</option>
                    <option value="Rangpur" style="font-family: Monaco, monospace">Rangpur</option>
                </select>
                <button type="submit" class="filter">
                    Filter
                </button>
            </form>
        </div>
    </div>
    <div class="row">
        <c:if test="${shopList.size() == 0}">
            <h2 style="font-family: Monaco, monospace; opacity: 70%; text-align: center; padding-top: 150px">
                No Shop Found!
            </h2>
        </c:if>

        <c:forEach var="shop" items="${shopList}">
            <div class="card">
                <div class="background" style="box-shadow: 3px 3px 12px gray; background-color: rgba(235, 235, 235, 1); border-radius: 5px; padding-bottom: 5px">
                    <img class="card-img-top" src="${shop.shop_logo}" alt="">
                        <div class="card-body">
                            <a href="/viewShop/${shop.shopname}" style="color: #d4122b">
                                <h4 style="font-family: 'oswald'; font-weight: bold; text-align: center; font-size: 28px">${shop.shopname}</h4>
                            </a>
                        </div>
                </div>
            </div>
        </c:forEach>


    </div>
</div>
</div>
<div class="footer" style="font-family: Monaco, monospace">
    <div class="container-fluid" &lt;%&ndash;style="padding-left: 40%"&ndash;%&gt;>
        <div class="temp" style="padding-top: 15px; padding-bottom: 15px; text-align: center; font-size: 14px; color: #f2f2f2;">
            <p style="font-size: 15px"> © KenaKata Unlimited. 2021. All Rights Reserved</p>
            Email: kenakata.unlimited@gmail.com
            |
            <a href="/aboutUs">About Us</a>
        </div>
    </div>
</div>
<c:if test="${scroll==true}">
    <script>
        window.onload= function (){
            window.scrollTo(0, 820);
        }
    </script>
</c:if>
</body>

</html>
