<%-- 
    Document   : atomics
    Created on : May 17, 2013, 4:19:05 PM
    Author     : fpoly
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="buildingId" value="${param.id}" />
<c:set var="landId" value="${param.landId}" />
<c:set var="action" value="${param.action}" />
<c:set var="status" value="${param.status}" />
<jsp:useBean id="atomicBean" scope="request" class="bean.AtomicBean" />
<jsp:setProperty name="atomicBean" property="buildingId" value="${buildingId}" />
<jsp:setProperty name="atomicBean" property="landId" value="${landId}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <c:choose>
            <c:when test="${action == 'edit'}"><title>Edit Building</title></c:when>
            <c:otherwise><title>Add Building</title></c:otherwise>    
        </c:choose>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="span12">
                    <c:choose>
                        <c:when test="${status == 'add-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Building was added successfully!
                            </div>
                        </c:when>
                        <c:when test="${status == 'add-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during adding building
                            </div>
                        </c:when>
                        <c:when test="${status == 'edit-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Building was updated successfully!
                            </div>
                        </c:when>
                        <c:when test="${status == 'edit-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during updating building
                            </div>
                        </c:when>
                        <c:when test="${status == 'delete-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Building was deleted successfully!
                            </div>
                        </c:when>
                        <c:when test="${status == 'delete-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during deleting building
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
      
            <div class="row">
                <div class="span5">
                    <h1>Land List</h1>

                    <form name="formLand" method="post" action="../con">
                        
                        <input type="hidden" name="parentId" value="0" />
                        <input type="hidden" name="inputThumbnail" value="" />
                        <input type="hidden" name="inputType" value="land" />
                        <input type="hidden" name="inputNumOfFloor" value="0" />
                        <input type="hidden" name="inputFloorNumber" value="0" />
                        <input type="hidden" name="inputRoomEachFloor" value="0" />
                        
                        <c:choose>
                            <c:when test="${action == 'edit'}">

                                <div class="control-group">
                                    <label class="control-label" for="inputName">Name</label>
                                    <div class="controls">
                                        <input type="text" name="inputName" value="${atomicBean.building.name}" id="inputName" placeholder="Name" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputDescription">Description</label>
                                    <div class="controls">
                                        <textarea id="inputDescription" name="inputDescription">${atomicBean.building.description}</textarea>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputPrice">Price (For each meter square)</label>
                                    <div class="controls">
                                        <input type="text" name="inputPrice" id="inputPrice" placeholder="Price" value="${atomicBean.land.price}" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputStatus">Status</label>
                                    <div class="controls">
                                        <select name="inputStatus" id="inputStatus">
                                            <c:forEach var="status" items="waiting permit,completed permit,building,completed">
                                                <c:choose>
                                                    <c:when test="${atomicBean.building.status == $status}">
                                                        <option value="${status}" selected="selected">${status}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${status}">${status}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                    
                                <div class="control-group">
                                    <label class="control-label" for="inputParentId">Land</label>
                                    <div class="controls">
                                        <select name="inputParentId" id="inputParentId">
                                            <c:forEach var="land" items="${atomicBean.listLand}">
                                                <c:choose>
                                                    <c:when test="${land.id == $parentId}">
                                                        <option value="${status}" selected="selected">${status}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${land.id}">${land.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputCreator">Creator</label>
                                    <div class="controls">
                                        <select name="inputCreator" id="inputCreator">
                                            <c:forEach var="creator" items="1,2,3,4,5">
                                                <c:if test="${atomicBean.building.creator == $creator}">
                                                    <option value="${creator}" selected>${creator}</option>
                                                </c:if>
                                                <option value="${creator}">${creator}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <input type="hidden" name="inputId" value="${param.id}" />
                                <input type="hidden" name="control" value="editBuilding" />
                                <input type="submit" name="updateBuilding" class="btn btn-primary" value="Update Building" />

                            </c:when>

                            <c:otherwise>
                                <div class="control-group">
                                    <label class="control-label" for="inputName">Name</label>
                                    <div class="controls">
                                        <input type="text" name="inputName" id="inputName" placeholder="Name" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputDescription">Description</label>
                                    <div class="controls">
                                        <textarea id="inputDescription" name="inputDescription"></textarea>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputPrice">Price (For each meter square)</label>
                                    <div class="controls">
                                        <input type="text" name="inputPrice" id="inputPrice" placeholder="Price" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputStatus">Status</label>
                                    <div class="controls">
                                        <select name="inputStatus" id="inputStatus">
                                            <c:forEach var="status" items="waiting permit,completed permit,building,completed">
                                               <option value="${status}">${status}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                
                                                                <div class="control-group">
                                    <label class="control-label" for="inputParentId">Land</label>
                                    <div class="controls">
                                        <select name="inputParentId" id="inputParentId">
                                            <c:forEach var="land" items="${atomicBean.listLand}">
                                                <c:choose>
                                                    <c:when test="${land.id == $parentId}">
                                                        <option value="${status}" selected="selected">${status}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${land.id}">${land.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputArea">Area</label>
                                    <div class="controls">
                                        <input type="text" id="inputArea" name="inputArea" placeholder="Area" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputCreator">Creator</label>
                                    <div class="controls">
                                        <select name="inputCreator" id="inputCreator">
                                            <c:forEach var="creator" items="1,2,3,4,5">
                                                <option value="${creator}">${creator}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <input type="hidden" name="control" value="addLand" />
                                <input type="submit" name="submitLand" class="btn" value="Add New Land" />
                            </c:otherwise>
                        </c:choose>

                    </form>
                </div><!--span6 edit land area-->
                
                <div class="span7">
                     <c:choose>
                         <c:when test="${atomicBean.listBuilding.size() == 0}">
                             <div class="alert">
                                 There's no building here
                             </div>
                         </c:when>
                         <c:otherwise>
                    <table class="table table-bordered table-striped table-condensed table-hover">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Area</th>
                                <th>Price</th>
                                <th>Floor Number</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="room" items="${atomicBean.listRoom}">
                                <tr>
                                    <td>${room.name}</td>
                                    <td>${room.area}</td>
                                    <td>${room.price}</td>
                                    <td>${room.floorNumber}</td>
                                    <td>${room.status}</td>
                                    <td>
                                        <a href="room.jsp?id=${room.id}" class="btn btn-mini"><i class="icon icon-pencil"></i> Edit</a>
                                        <a href="../con?control=deleteRoom&id=${room.id}" class="btn btn-mini btn-danger"><i class="icon icon-white icon-trash"></i> Remove</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </c:otherwise>
                     </c:choose>
                    <a href="room.jsp?action=add&parent=${buildingId}" class="btn">Add New Building</a>
                </div>
            </div>
        </div>
    </body>
</html>