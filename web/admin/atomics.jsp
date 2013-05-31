<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="locationId" value="${param.location}" />
<c:set var="type" value="${param.type}" />
<c:set var="status" value="completed" />

<jsp:useBean id="locationBean" scope="request" class="bean.LocationBean" />
<jsp:useBean id="atomicBean" scope="request" class="bean.AtomicBean" />
<jsp:setProperty name="atomicBean" property="locationId" value="${locationId}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Land List</title>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="span12">
                    <h1>Land List</h1>
                    
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
                                </tr>
                            </thead>
                            <tbody> 
                            <c:forEach var="land" items="${atomicBean.listLand}">
                                <tr>
                                    <td><a href="buildings.jsp?land_id=${land.id}">${land.name}</a></td>
                                    <td>${land.address}</td>
                                    <td>${land.price}</td>
                                    <td>${land.status}</td>
                                    <td>${land.area}</td>
                                    <td>${land.creator}</td>
                                    <td>${land.dateCreated}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </body>
</html>