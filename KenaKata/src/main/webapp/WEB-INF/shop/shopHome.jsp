<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<style>
  .navbar-brand{
    font-family: "Lucida Calligraphy";
  }
  .regShopButton{
    background-color: darkcyan;
    color: white;
    font-size: 16px;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    width: 20%;
    opacity: 0.9;
    alignment: center;
    font-size: 20px;
  }
  .navbar-nav .actv{
    border-bottom: 3px solid white;
  }
  .container-fluid img{
    padding-top: 20px;
    height: 560px;
    width: 100%;
    background-size: cover;
    margin: 0 auto;
    opacity: 0.9;
  }
  .centered{
    position: absolute;
    bottom: 0;
    width: 98%;
    opacity:100%;
    color: #f2f2f2;
    font-size: 12px;
    text-align: center;
    animation-name: transition;
    animation-duration: 2s;
    background-color: rgba(0,0,0, 0.5);
    transform: translate(0px, -400px);
  }

  @keyframes transition {
    from {opacity: 0;
      background-color: rgb(0,0,0);
      transform: translate(0px, -200px);}
    to {opacity: 1;
      background-color: rgba(0,0,0, 0.5);
      transform: translate(0px, -400px);}
  }
  .about{
    font-family: Monaco, monospace;
    font-size: 18px;
    text-align: left;
    padding-top: 20px;
    padding-left: 50px;
  }
  .about a{
    font-size: 17px;
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
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

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

<div class="container-fluid" align="center">

  <img src="${shop.shop_logo}">
  <div class="centered">
    <h1 style="font-family: Monaco, monospace"><b>Welcome to ${shop.shopname}</b></h1>
    <h2 style="font-family: 'Monaco',monospace; font-weight: bold; text-align: center; display: inline-block">
      ${shop.about}
    </h2>
  </div>
  <div class="about">
    <p>
      We deliver to: ${shop.delivery_area}
    </p>
    <a href="/shop/reviews"> Click here to view our User Reviews! </a>
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
