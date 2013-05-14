<%-- 
    Document   : header
    Created on : May 13, 2013, 2:02:02 PM
    Author     : fpoly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="location" value="${param.location}" />
<c:set var="status" value="pending" />
<c:set var="land_id" value="${param.land_id}" />
<c:set var="building_id" value="${param.building_id}" />
<jsp:useBean id="locationBean" scope="request" class="bean.LocationBean" />
<jsp:useBean id="landBean" scope="request" class="bean.LandBean" />
<jsp:setProperty name="landBean" property="location" value="${location}" />
<jsp:setProperty name="landBean" property="status" value="pending" />

<jsp:useBean id="buildingBean" scope="request" class="bean.BuildingBean" />
<jsp:setProperty name="buildingBean" property="parentId" value="${land_id}" />

<jsp:useBean id="roomBean" scope="request" class="bean.RoomBean" />
<jsp:setProperty name="roomBean" property="parentId" value="${building_id}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NTB - Home</title>
        <script type="text/javascript" src="bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row" id="header">
                <div class="navbar span12">
                    <div class="navbar-inner">
                        <a class="brand" href="#">NTB</a>
                        <ul class="nav">
                            <c:forEach var="oLocation" items="${locationBean.list}">
                                <li><a href="?location=${oLocation.id}">${oLocation.location}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row" id="main">
                <div class="span3">
                    <h4>Lands</h4>
                    
                    <ul class="nav nav-list">
                        <c:forEach var="land" items="${landBean.listLand}">
                        <li><a href="?land_id=${land.id}">${land.name}</a></li>
                        </c:forEach>
                    </ul>
                    
                </div>

                <div class="span3">
                    <h4>Buildings</h4>
                    <ul class="nav nav-list">
                        <c:forEach var="building" items="${buildingBean.listBuilding}">
                        <li><a href="?land_id=${land_id}&building_id=${building.id}">${building.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                
                <div class="span6">
                    <h4>Constructions</h4>
                    
                    <ul class="nav nav-list">
                        <c:forEach var="atomic" items="${roomBean.listRoom}">
                        <li><a href="atomic.jsp?id=${atomic.id}">${atomic.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            
            <hr />
            <div class="row" id="footer">
                <div class="span12">Copyright &copy; NTB. All rights reserved</div>
            </div>
        </div>
    </body>
</html>
