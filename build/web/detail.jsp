<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="locationId" value="${param.location}" />
<c:set var="landId" value="${param.land_id}" />
<c:set var="buildingId" value="${param.building_id}" />
<c:set var="roomId" value="${param.room_id}" />

<jsp:useBean id="locationBean" scope="request" class="bean.LocationBean" />
<jsp:useBean id="atomicBean" scope="request" class="bean.AtomicBean" />
<jsp:setProperty name="atomicBean" property="locationId" value="${locationId}" />
<%--<jsp:setProperty name="atomicBean" property="status" value="completed" />--%>
<jsp:setProperty name="atomicBean" property="landId" value="${landId}" />
<jsp:setProperty name="atomicBean" property="buildingId" value="${buildingId}" />
<jsp:setProperty name="atomicBean" property="roomId" value="${roomId}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detail</title>
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
                    <%= userOutput%>
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

            <div class="row-fluid">
                <div class="span12">
                    <jsp:setProperty name="locationBean" property="id" value="${locationId}" />

                    <h5>Lands in ${locationBean.location.location}</h5>
                    <ul class="nav nav-pills">
                        <c:forEach var="land" items="${atomicBean.listLand}">
                            <li><a href="detail.jsp?location=${locationId}&land_id=${land.id}">${land.name}</a></li>
                        </c:forEach>
                    </ul>
                    <c:if test="${landId > 0}">
                        <h6>Detail for ${atomicBean.land.name}</h6>
                        <table class="table table-bordered table-striped table-condensed">
                            <tbody>
                                <tr>
                                    <th>Area</th>
                                    <td>${atomicBean.land.area}</td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td>${atomicBean.land.status}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row-fluid">
                    <div class="span12">
                        <h5>Building in ${atomicBean.land.name}</h5>

                        <ul class="nav nav-pills">
                            <c:forEach var="building" items="${atomicBean.listBuilding}">
                                <li><a href="detail.jsp?location=${locationId}&land_id=${landId}&building_id=${building.id}">${building.name}</a></li>
                            </c:forEach>
                        </ul>

                        <c:if test="${buildingId > 0}">
                            <table class="table table-bordered table-striped table-condensed">
                                <tr>
                                    <th>Area</th>
                                    <td>${atomicBean.building.area}</td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td>${atomicBean.building.status}</td>
                                </tr>
                                <tr>
                                    <th>Num of floor</th>
                                    <td>${atomicBean.building.numOfFloor}</td>
                                </tr>
                                <tr>
                                    <th>Room each floor</th>
                                    <td>${atomicBean.building.roomEachFloor}</td>
                                </tr>
                            </table>

                        </div>
                    </div>

                    <div class="row">
                        <div class="span12">
                            <h5>Room in ${atomicBean.building.name}</h5>
                            <ul class="nav nav-pills">
                                <c:forEach var="room" items="${atomicBean.listRoom}">
                                    <li><a href="detail.jsp?location=${locationId}&land_id=${landId}&building_id=${buildingId}&room_id=${room.id}">${room.name}</a></li>
                                </c:forEach>
                            </ul>
                            <c:if test="${roomId > 0}">
                                <table class="table table-bordered table-striped table-condensed table-hover">
                                    <tr>
                                        <th>Area</th>
                                        <td>${atomicBean.room.area}</td>

                                    </tr>
                                    <tr>
                                        <th>Price</th>
                                        <td>
                                            <p>One Time: $ ${atomicBean.room.price*atomicBean.room.area}</p>
                                            <p>Monthly: $ ${(atomicBean.room.price*atomicBean.room.area)+(atomicBean.room.price*atomicBean.room.area*5/100)}</p>
                                            <p>Yearly: $ ${(atomicBean.room.price*atomicBean.room.area)+(atomicBean.room.price*atomicBean.room.area*3/100)}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Floor no</th>
                                        <td>${atomicBean.room.floorNumber}</td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td>${atomicBean.room.status}</td>
                                    </tr>
                                </table>

                                <form method="post" name="formOrder" action="con">
                                    <div>
                                        Select payment type:
                                        <select name="inputPaymentType">
                                            <option value="onetime">One Time $ ${atomicBean.room.price*atomicBean.room.area} (Best value)</option>
                                            <option value="monthly">Monthly $ ${(atomicBean.room.price*atomicBean.room.area)+(atomicBean.room.price*atomicBean.room.area*5/100)}</option>
                                            <option value="yearly">Yearly $ ${(atomicBean.room.price*atomicBean.room.area)+(atomicBean.room.price*atomicBean.room.area*3/100)}</option>
                                        </select>
                                    </div>
                                    <input type="hidden" name="control" value="Order" />
                                    <input type="hidden" name="inputProductId" value="${roomId}" />
                                    <%= registerOutput %>
                                </form>
                            </div>
                        </div> 

                        <hr>
                    </c:if>
                </c:if>
            </c:if>

            <div class="footer">
                <p>&copy; NTB 2013. All rights reserved.</p>
            </div>

        </div> <!-- /container -->

    </body>
</html>