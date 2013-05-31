<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="roomId" value="${param.id}" />
<c:set var="buildingId" value="${param.building_id}" />
<c:set var="landId" value="${param.land_id}" />
<c:set var="action" value="${param.action}" />
<c:set var="status" value="${param.status}" />

<jsp:useBean id="atomicBean" scope="request" class="bean.AtomicBean" />
<jsp:setProperty name="atomicBean" property="roomId" value="${roomId}" />
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
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../bootstrap/js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function(){
                $('#formLand').validate(); 
            });
        </script>
    </head>
    <body>

        <%@include file="menu.jsp" %>

        <div class="container">
            <div class="row">
                <div class="span12">
                    <c:choose>
                        <c:when test="${status == 'add-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Room was added successfully! <a href="building.jsp?action=edit&id=${buildingId}&land_id=${landId}">Go back</a>
                            </div>
                        </c:when>
                        <c:when test="${status == 'add-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during adding room
                            </div>
                        </c:when>
                        <c:when test="${status == 'edit-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Room was updated successfully! <a href="building.jsp?action=edit&id=${buildingId}&land_id=${landId}">Go back</a>
                            </div>
                        </c:when>
                        <c:when test="${status == 'edit-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during updating room
                            </div>
                        </c:when>
                        <c:when test="${status == 'delete-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Room was deleted successfully!
                            </div>
                        </c:when>
                        <c:when test="${status == 'delete-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during deleting room
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <div class="row">
                <div class="span12">
                    <h1>Room Management</h1>

                    <form name="formLand" id="formLand" method="post" action="../con">

                        <input type="hidden" name="inputThumbnail" value="" />
                        <input type="hidden" name="inputNumOfFloor" value="0" />
                        <input type="hidden" name="inputRoomEachFloor" value="0" />
                        <input type="hidden" name="inputLocation" value="0" />
                        <input type="hidden" name="page" value="room" />
                        <input type="hidden" name="land_id" value="${landId}" />
                        <input type="hidden" name="building_id" value="${buildingId}" />

                        <c:choose>
                            <c:when test="${action == 'edit'}">

                                <div class="control-group">
                                    <label class="control-label" for="inputName">Name</label>
                                    <div class="controls">
                                        <input type="text" name="inputName" class="required" value="${atomicBean.room.name}" id="inputName" placeholder="Name" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputFloorNumber">Floor Number</label>
                                    <div class="controls">
                                        <input type="text" name="inputFloorNumber" class="number required" value="${atomicBean.room.floorNumber}" id="inputFloorNumber" placeholder="Floor Number" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputType">Type</label>
                                    <div class="controls">
                                        <select name="inputType" id="inputType">
                                            <c:forEach var="type" items="room (normal),room (house),room (shop)">
                                                <c:choose>
                                                    <c:when test="${atomicBean.room.type == type}">
                                                        <option value="${type}" selected="selected">${type}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${type}">${type}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputDescription">Description</label>
                                    <div class="controls">
                                        <textarea id="inputDescription" name="inputDescription">${atomicBean.room.description}</textarea>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputPrice">Price (For each meter square)</label>
                                    <div class="controls">
                                        <input type="text" name="inputPrice" class="number required" id="inputPrice" placeholder="Price" value="${atomicBean.room.price}" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputStatus">Status</label>
                                    <div class="controls">
                                        <select name="inputStatus" id="inputStatus">
                                            <c:forEach var="status" items="building,onsale">
                                                <c:choose>
                                                    <c:when test="${atomicBean.room.status == status}">
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
                                    <label class="control-label" for="inputParentId">Building</label>
                                    <div class="controls">
                                        <select name="inputParentId" id="inputParentId">
                                            <c:forEach var="building" items="${atomicBean.listBuilding}">
                                                <c:choose>
                                                    <c:when test="${building.id == atomicBean.room.parentId}">
                                                        <option value="${building.id}" selected="selected">${building.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${building.id}">${building.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputArea">Area (Meter Square)</label>
                                    <div class="controls">
                                        <input type="text" id="inputArea" name="inputArea" class="number required" value="${atomicBean.room.area}" />
                                    </div>
                                </div>


                                <input type="hidden" name="parentId" value="${atomicBean.room.parentId}" />
                                <input type="hidden" name="inputId" value="${param.id}" />
                                <input type="hidden" name="control" value="editRoom" />
                                <input type="submit" name="updateBuilding" class="btn btn-primary" value="Update Room" />

                            </c:when>

                            <c:otherwise>
                                <div class="control-group">
                                    <label class="control-label" for="inputName">Name</label>
                                    <div class="controls">
                                        <input type="text" name="inputName" class="required" id="inputName" placeholder="Name" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputFloorNumber">Floor Number</label>
                                    <div class="controls">
                                        <input type="text" name="inputFloorNumber" class="number required" id="inputFloorNumber" placeholder="Floor Number" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputType">Type</label>
                                    <div class="controls">
                                        <select name="inputType" id="inputType">
                                            <c:forEach var="type" items="room (normal),room (house),room (shop)">
                                                <option value="${type}">${type}</option>
                                            </c:forEach>
                                        </select>
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
                                        <input type="text" name="inputPrice" class="number required" id="inputPrice" placeholder="Price"  />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputStatus">Status</label>
                                    <div class="controls">
                                        <select name="inputStatus" id="inputStatus">
                                            <c:forEach var="status" items="building,onsale">
                                                <option value="${status}">${status}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputParentId">Building</label>
                                    <div class="controls">
                                        <select name="inputParentId" id="inputParentId">
                                            <c:forEach var="building" items="${atomicBean.listBuilding}">
                                                <option value="${building.id}">${building.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputArea">Area</label>
                                    <div class="controls">
                                        <input type="text" id="inputArea" class="number required" name="inputArea" placeholder="area" />
                                    </div>
                                </div>

                                <input type="hidden" name="parentId" value="${buildingId}" />
                                <input type="hidden" name="inputId" value="${param.id}" />
                                <input type="hidden" name="control" value="addRoom" />
                                <input type="submit" name="addRoom" class="btn btn-primary" value="Add Room" />
                            </c:otherwise>
                        </c:choose>

                    </form>
                </div><!--span6 edit land area-->
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>