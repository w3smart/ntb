<%-- 
    Document   : atomics
    Created on : May 17, 2013, 4:19:05 PM
    Author     : fpoly
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${param.id}" />
<c:set var="action" value="${param.action}" />
<c:set var="status" value="${param.status}" />
<jsp:useBean id="locationBean" scope="request" class="bean.LocationBean" />
<jsp:setProperty name="locationBean" property="id" value="${id}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Land List</title>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <form name="formLocation" method="post" action="../con">
                <h2>Locations</h2>
                
                <c:choose>
                    <c:when test="${status == 'add-success'}">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            Location was added successfully!
                        </div>
                    </c:when>
                    <c:when test="${status == 'add-error'}">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>Error! </strong> Error during add new location
                        </div>
                    </c:when>
                   <c:when test="${status == 'edit-success'}">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            Location was updated successfully!
                        </div>
                    </c:when>
                    <c:when test="${status == 'edit-error'}">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>Error! </strong> Error during updating new location
                        </div>
                    </c:when>
                   <c:when test="${status == 'delete-success'}">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            Location was deleted successfully!
                        </div>
                    </c:when>
                    <c:when test="${status == 'delete-error'}">
                        <div class="alert alert-error">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>Error! </strong> Error during deleting new location
                        </div>
                    </c:when>
                </c:choose>
                <div class="row">
                   
                    <div class="span6">
                        <c:choose>
                            <c:when test="${action == 'edit'}">
                                <h4>Edit Location</h4>
                                <div class="control-group">
                                    <label class="control-label" for="inputLocation">Location name</label>
                                    <div class="controls">
                                        <input type="text" id="inputLocation" name="inputLocation" value="${locationBean.location.location}" />
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <input type="hidden" name="inputId" value="${id}" />
                                    <input type="hidden" name="control" value="editLocation" />
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                    <a class="btn" href="locations.jsp">Cancel</a>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <h4>Add Location</h4>
                                <div class="control-group">
                                    <label class="control-label" for="inputLocation">Location name</label>
                                    <div class="controls">
                                        <input type="text" id="inputLocation" name="inputLocation" placeholder="Location" />
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <input type="hidden" name="control" value="addLocation" />
                                    <button type="submit" class="btn btn-primary">Add Location</button>
                                    <a class="btn" href="locations.jsp">Cancel</a>
                                </div>
                                
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="span6">
                        <h4>List Location</h4>
                        <table class="table table-bordered table-striped table-condensed table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="location" items="${locationBean.list}">
                                    <tr>
                                        <td>${location.location}</td>
                                        <td>
                                            <a href="locations.jsp?action=edit&id=${location.id}" class="btn"><i class="icon icon-pencil"></i> Update</a>
                                            <a href="../con?control=deleteLocation&id=${location.id}" class="btn btn-danger"><i class="icon icon-trash"></i> Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </form>
        </div>
    </body>
</html>