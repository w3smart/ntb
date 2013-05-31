<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="locationId" value="${param.location}" />
<c:set var="land_status" value="${param.land_status}" />
<c:set var="status" value="${param.status}" />
<jsp:useBean id="locationBean" scope="request" class="bean.LocationBean" />
<jsp:useBean id="atomicBean" scope="request" class="bean.AtomicBean" />
<jsp:setProperty name="atomicBean" property="locationId" value="${locationId}" />
<jsp:setProperty name="atomicBean" property="name" value="${param.s}" />
<jsp:setProperty name="atomicBean" property="status" value="${land_status}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Land List</title>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <%@include file="menu.jsp" %>

        <div class="container" id="main">

            <div class="row">
                <div class="span12">
                    <c:choose>
                        <c:when test="${status == 'delete-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Land was deleted successfully!
                            </div>
                        </c:when>
                        <c:when test="${status == 'delete-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during deleting land
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <form name="formLands" id="formLands" method="get">
                <div class="row">
                    
                    <div class="span12">
                        <h1>Land List</h1>
                        Location
                        <select name="selectLocation" id="selectLocation">
                            <option value="0">All</option>
                            <c:forEach var="oLocation" items="${locationBean.list}">
                                <c:choose>
                                    <c:when test="${oLocation.id == locationId}">
                                        <option value="${oLocation.id}" selected="selected">${oLocation.location}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${oLocation.id}">${oLocation.location}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>

                        Status
                        <select name="selectStatus" id="selectStatus">
                            <option value="">All</option>
                            <c:forEach var="status" items="waiting permit,completed permit">
                                <c:choose>
                                    <c:when test="${status == land_status}">
                                        <option value="${status}" selected="selected">${status}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${status}">${status}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>

                        Name
                        <input type="text" name="search" id="search" value="${param.s}" placeholder="Search..." />
                        <input type="button" value="Search" id="submitSearch" class="btn" />
                    </div>
                </div>
                <div class="row">
                    <div class="span12">
                        
                       
                        <table class="table table-bordered table-striped table-condensed table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Location</th>
                                    <th>Price Per Meter (USD)</th>
                                    <th>Area</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="land" items="${atomicBean.listLand}">
                                    <tr>
                                        <td>
                                            <p><a href="land.jsp?action=edit&id=${land.id}" title="View Land and Buildings">${land.name}</a></p>
                                        </td>
                                        <td>
                                            <jsp:setProperty name="locationBean" property="id" value="${land.location}" />
                                            ${locationBean.location.location}
                                        </td>
                                        <td>$ ${land.price}</td>
                                        <td>${land.area}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${land.status == 'waiting permit'}">
                                                    <span class="label">${land.status}</span>
                                                </c:when>
                                                <c:when test="${land.status == 'completed permit'}">
                                                    <span class="label label-success">${land.status}</span>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a class="btn btn-mini" role="button" href="land.jsp?action=edit&id=${land.id}"><i class="icon icon-pencil"></i> Edit</a>
                                            <a class="btn btn-danger btn-mini delete-land" href="../con?control=deleteAtomic&object=land&id=${land.id}"><i class="icon icon-trash icon-white"></i> Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                        <a href="land.jsp?action=add" class="btn">Add New Land</a>
                    </div>
                </div>
            </form>
        </div>

        <script type="text/javascript">
            jQuery(document).ready(function($){
                $('#submitSearch').click(function(e){
                    filter();
                    return false;
                });
                  
                $('#formLands').submit(function(e){
                    filter();
                    return false;
                });
                  
                function filter(){
                    var  search = $('#search').val(),
                    status = $('#selectStatus').val(),
                    location = $('#selectLocation').val();
                    window.location.href = 'lands.jsp?s='+search+'&land_status='+status+'&location='+location;
                }
                
                $('.delete-land').click(function(){
                   return confirm("Are you sure want to delete?");
                });
            })
        </script>
        
        <%@include file="footer.jsp" %>
    </body>
</html>