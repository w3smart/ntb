<%-- 
    Document   : atomics
    Created on : May 17, 2013, 4:19:05 PM
    Author     : fpoly
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="userId" value="${param.id}" />
<c:set var="action" value="${param.action}" />
<c:set var="status" value="${param.status}" />
<jsp:useBean id="userBean" scope="request" class="bean.UserBean" />
<jsp:setProperty name="userBean" property="id" value="${userId}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <c:choose>
            <c:when test="${action == 'edit'}"><title>Edit User</title></c:when>
            <c:otherwise><title>Add User</title></c:otherwise>    
        </c:choose>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>

        <script type="text/javascript" src="../bootstrap/js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function(){
                $('#formUser').validate(); 
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
                                User was added successfully! <a href="users.jsp">Go back</a>
                            </div>
                        </c:when>
                        <c:when test="${status == 'add-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during adding user
                            </div>
                        </c:when>
                        <c:when test="${status == 'edit-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                User was updated successfully! <a href="users.jsp">Go back</a>
                            </div>
                        </c:when>
                        <c:when test="${status == 'edit-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during updating user
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <div class="row">
                <div class="span8">
                    <h1>User</h1>
                    <form name="formUser" id="formUser" method="post" action="../con">
                        <c:choose>
                            <c:when test="${action == 'edit'}">

                                <div class="control-group">
                                    <label class="control-label" for="inputUserName">Username</label>
                                    <div class="controls">
                                        <input type="text" class="required" minlength="4" name="inputUserName" value="${userBean.user.username}" id="inputUserName" placeholder="Username" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputUserPassword">Password</label>
                                    <div class="controls">
                                        <input type="password" class="required" minlength="6" name="inputUserPassword" id="inputUserPassword" value="password" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputRetypePassword">Re-type Password</label>
                                    <div class="controls">
                                        <input type="password" equalTo="#inputUserPassword" class="required" minlength="6" name="inputRetypePassword" id="inputRetypePassword" value="password" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputRole">Role</label>
                                    <div class="controls">
                                        <select name="inputRole" id="inputRole">
                                            <c:forEach var="role" items="admin,manager,user,customer">
                                                <c:choose>
                                                    <c:when test="${userBean.user.role == role}">
                                                        <option value="${role}" selected="selected">${role}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${role}">${role}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">Email</label>
                                    <div class="controls">
                                        <input type="text" class="required email" name="inputEmail" id="inputEmail" placeholder="Email" value="${userBean.user.email}" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputAddress">Address</label>
                                    <div class="controls">
                                        <input type="text" name="inputAddress" id="inputAddress" placeholder="Address" value="${userBean.user.address}" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputPhone">Phone</label>
                                    <div class="controls">
                                        <input type="text" name="inputPhone" id="inputPhone" placeholder="Phone" value="${userBean.user.phone}" />
                                    </div>
                                </div>

                                <input type="hidden" name="inputId" value="${param.id}" />
                                <input type="hidden" name="control" value="editUser" />
                                <input type="submit" name="updateUser" class="btn btn-primary" value="Update User" />

                            </c:when>

                            <c:otherwise>
                                <div class="control-group">
                                    <label class="control-label" for="inputUserName">Username</label>
                                    <div class="controls">
                                        <input type="text" class="required" minlength="4" name="inputUserName" id="inputUserName" placeholder="Username" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputUserPassword">Password</label>
                                    <div class="controls">
                                        <input type="password" class="required" minlength="6" name="inputUserPassword" id="inputUserPassword" placeholder="Password" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputRetypePassword">Re-type Password</label>
                                    <div class="controls">
                                        <input type="password" class="required" equalTo="#inputUserPassword" minlength="6" name="inputRetypePassword" id="inputRetypePassword" placeholder="Re-type Password" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputRole">Role</label>
                                    <div class="controls">
                                        <select name="inputRole" id="inputRole">
                                            <c:forEach var="role" items="admin,manager,user,customer">
                                                <option value="${role}">${role}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">Email</label>
                                    <div class="controls">
                                        <input type="text" class="required email" name="inputEmail" id="inputEmail" placeholder="Email" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputAddress">Address</label>
                                    <div class="controls">
                                        <input type="text" name="inputAddress" id="inputAddress" placeholder="Address" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputPhone">Phone</label>
                                    <div class="controls">
                                        <input type="text" name="inputPhone" id="inputPhone" placeholder="Phone" />
                                    </div>
                                </div>

                                <input type="hidden" name="control" value="addUser" />
                                <input type="submit" name="submitUser" class="btn" value="Add New User" />
                            </c:otherwise>
                        </c:choose>

                    </form>
                </div><!--span6 edit land area-->
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>