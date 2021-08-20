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
    .description{
        float: right;
        grid-column: 5/span 2;
        padding-top: 80px;
        transform: translate(150px, 0);
        font-family: Monaco, monospace;
        text-align: left;
    }
    .edit{
        background-color: #262626;
        color: white;
        font-size: 22px;
        padding: 12px 20px;
        /*margin: 8px 0;*/
        border-radius: 8px;
        cursor: pointer;
        width: 80%;
        height: auto;
        opacity: 0.9;
        alignment: center;
        font-family: Monaco, monospace;
    }
    .edit:hover {
        opacity:1;
    }
    label span{
        position: relative;
        left: -30px;
        color: #262626;
    }
    i{
        color: #262626;
        padding-top: 10px;
        padding-left: 5px;
        opacity: 0.7;
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
        height: 150px; /* Set same as footer's height */
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
    <title>Edit Product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body style="background-color: #f2f2f2; margin: 0 auto">
<nav class="navbar navbar-default" style="background-color: #262626; margin: 0 auto">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: #f2f2f2; font-family: 'Lucida Calligraphy',cursive"><span class="glyphicon glyphicon-shopping-cart"></span> KenaKata</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/shop/home" style="color: white; font-family: 'Monaco',monospace;">Home</a></li>
            <li><a href="/shop/addProduct" style="color: white; font-family: 'Monaco',monospace;">Add Product</a></li>


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
            <a class="navbar-brand" style="font-weight: bold; font-size: 28px; color: #262626; font-family: 'Cooper Black',serif"> ${shop.shopname}</a>
        </div>
        <ul class="nav navbar-nav" style="padding-left: 150px">
            <c:forEach var="category" items="${categoryList}">
                <li><a href="/shop/viewCategory/${category}" style="font-size: 18px; color: #262626; font-family: 'Monaco',monospace">${category}</a></li>
            </c:forEach>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="mb-3" align="center">
        <div id="error" style="font-family: Monaco, monospace; color: #d4122b; margin: 0 auto;
                                padding-bottom: 10px; padding-top: 20px"></div>
    </div>
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
                        <img src="${product.image1}" style="width:500px; height: 580px">
                    </div>

                    <div class="item">
                        <img src="${product.image2}" style="width:500px; height: 580px">
                    </div>

                    <div class="item">
                        <img src="${product.image3}" style="width:500px; height: 580px">
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
                <form method="post" id="form" enctype="multipart/form-data">
                    <h1 style="font-family: Monaco, monospace; font-weight: bold; opacity: 70%">&#x09F3
                        <input type="text" name="price" value="${product.price}" id="price"
                               placeholder="Price"
                               style="font-family: Monaco, monospace; font-weight: bold; opacity: 70%; font-size: 22px; width: 150px">
                        <i class="fa fa-pencil-square-o" style="font-size:24px; float: right; opacity: 1"></i>
                    </h1>
                    <br>
                    <h4 style="opacity: 70%">${product.description}</h4>
                    <h4 style="opacity: 70%">Color: ${product.color}</h4>
                    <br>
                    <h4 style="display: inline-block">Size:
                        <input type="text" id="size" name="size" placeholder="i.e. s,m,l..." value="${product.size}"style="font-family: Monaco, monospace; font-weight: bold; opacity: 70%; font-size: 18px; width: 150px">
                        <i class="fa fa-pencil-square-o" style="font-size:24px; float: right"></i>
                    </h4>
                    <h4>
                        In Stock:
                        <c:if test="${product.stock}">
                            <input type="checkbox" name="stock" id="stock" checked="checked">
                        </c:if>
                        <c:if test="${!product.stock}">
                            <input type="checkbox" name="stock" id="stock">
                        </c:if>
                    </h4>
                    <br>
                    <br>
                    <button type="submit" class="edit" id="confirm">Save</button>
                </form>
            </div>
        </div>
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
<script>
    const form = document.getElementById("form");
    const errorElement = document.getElementById("error");
    const price = document.getElementById("price");
    const size = document.getElementById("size");

    form.addEventListener('submit', (e)=>{
        let message=[]
        if (price.value.length == 0 || size.value.length == 0) {
            message.push("*Price or Size field cannot be empty!")
        }
        if(message.length>0){
            e.preventDefault()
            errorElement.innerText = message.join(',')
        }
    })
</script>
</html>
