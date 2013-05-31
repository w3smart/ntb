<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="locationId" value="${param.location}" />
<jsp:useBean id="locationBean" scope="request" class="bean.LocationBean" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NTB - Home</title>
        <script type="text/javascript" src="bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
            <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 60px;
      }

      /* Custom container */
      .container {
        margin: 0 auto;
        max-width: 1000px;
      }
      .container > hr {
        margin: 60px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 80px 0;
        text-align: center;
      }
      .jumbotron h2 {
        font-size: 60px;
        line-height: 1;
      }
      .jumbotron .lead {
        font-size: 24px;
        line-height: 1.25;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }


      /* Customize the navbar links to be fill the entire space of the .navbar */
      .navbar .navbar-inner {
        padding: 0;
      }
      .navbar .nav {
        margin: 0;
        display: table;
        width: 100%;
      }
      .navbar .nav li {
        display: table-cell;
        width: 1%;
        float: none;
      }
      .navbar .nav li a {
        font-weight: bold;
        text-align: center;
        border-left: 1px solid rgba(255,255,255,.75);
        border-right: 1px solid rgba(0,0,0,.1);
      }
      .navbar .nav li:first-child a {
        border-left: 0;
        border-radius: 3px 0 0 3px;
      }
      .navbar .nav li:last-child a {
        border-right: 0;
        border-radius: 0 3px 3px 0;
      }
    </style>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <%@include file="header.jsp" %>
            
            <div class="masthead">
                <ul class="nav nav-pills pull-right">
                    <%= userOutput %>
                </ul>
                <h1 class="muted"><a href="index.jsp">NTB Services</a></h1>
                
                <div class="clearfix"></div>
                
                <div class="navbar">
                    <div class="navbar-inner">
                        <div class="container">
                            <ul class="nav">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                
                                <c:forEach var="oLocation" items="${locationBean.list}">
                                    <li><a href="detail.jsp?location=${oLocation.id}">${oLocation.location}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div><!-- /.navbar -->
            </div>

            <!-- Jumbotron -->
            <div class="jumbotron">
                <h2>Welcome to NTB</h2>
                <p class="lead">Welcome to NTB, you can browse our Lands, Buildings and Rooms now. If you are new here, take these actions</p>
                
                <a class="btn btn-large btn-success" href="admin/">Login</a>
                <a class="btn btn-large btn-warning" href="register.jsp">Register</a>
            </div>

            <hr>

            <div class="footer">
                <p>&copy; NTB 2013. All rights reserved.</p>
            </div>

        </div> <!-- /container -->
    </body>
</html>