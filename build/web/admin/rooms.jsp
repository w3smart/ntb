<%-- 
    Document   : atomics
    Created on : May 17, 2013, 4:19:05 PM
    Author     : fpoly
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="buildingId" value="${param.building_id}" />
<jsp:useBean id="atomicBean" scope="request" class="bean.AtomicBean" />
<jsp:setProperty name="atomicBean" property="buildingId" value="${buildingId}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Building List</title>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body> 
        <div class="container">
            <div class="row">
                <div class="span12">
                    <h1>Building List</h1>
                    <form name="formLand" method="post" action="con">
                        
                        <table class="table table-bordered table-striped table-condensed table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Location</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Area</th>
                                    <th>Creator</th>
                                    <th>Date Created</th>
                                    <th>Floor No</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="room" items="${atomicBean.listRoom}">
                                <tr>
                                    <td>
                                        <p><a href="room.jsp?action=edit&id=${room.id}">${room.name}</a></p>
                                    </td>
                                    <td>${building.address}</td>
                                    <td>${building.price}</td>
                                    <td>${building.status}</td>
                                    <td>${building.area}</td>
                                    <td>${building.creator}</td>
                                    <td>${building.dateCreated}</td>
                                    <td>${building.floorNumber}</td>
                                    <td><span class="label">${land.status}</span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>