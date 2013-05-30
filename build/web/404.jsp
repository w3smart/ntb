<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="message" value="${param.status}" />
<jsp:useBean id="locationBean" scope="request" class="bean.LocationBean" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>System Message</title>
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
            <div class="masthead">
                <ul class="nav nav-pills pull-right">
                    <li><a href="admin/">Login</a></li>
                    <li><a href="register.jsp">Register</a></li>
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

            <div class="row">
                <div class="span12">

                    <c:if test="${message == 'denyAccess'}" >
                        <div class="alert alert-error">
                            You don't have permission to access this Page ! Please contact <a href="#"> Administrator </a> if you have any trouble so as to are solved.
                        </div>
                    </c:if>

                    <c:if test="${message == 'register-success'}" >
                        <div class="alert alert-success">
                            Registration successfully! Click <a href="index.jsp">here</a> to continue!
                        </div>
                    </c:if>

                </div>
            </div>
            
            <hr />
            
            <div class="footer">
                <p>&copy; NTB 2013. All rights reserved.</p>
            </div>
        </div>
    </body>
</html>