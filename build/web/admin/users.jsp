<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="role" value="${param.role}" />
<c:set var="status" value="${param.status}" />
<jsp:useBean id="userBean" scope="request" class="bean.UserBean" />
<jsp:setProperty name="userBean" property="role" value="${role}" />
<jsp:setProperty name="userBean" property="username" value="${param.s}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Users List</title>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/style.css" />
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        
        <%@include file="menu.jsp" %>
        
        <div class="container">

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

            <form name="formUsers" id="formUsers" method="post">
                <div class="row">
                    <div class="span12">
                        <h1>User List</h1>
                       
                        <table class="table table-bordered table-striped table-condensed table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Role</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="user" items="${userBean.list}">
                                    <tr>
                                        <td>
                                            <p><a href="user.jsp?action=edit&id=${user.id}">${user.username}</a></p>
                                        </td>
                                        <td>${user.role}</td>
                                        <td>${user.email}</td>
                                        <td>${user.address}</td>
                                        <td>${user.phone}</td>
                                        <td>
                                            <a class="btn btn-small" role="button" href="user.jsp?action=edit&id=${user.id}"><i class="icon icon-pencil"></i> Edit</a>
                                            <a class="btn btn-danger btn-small delete-user" href="../con?control=deleteUser&id=${user.id}"><i class="icon icon-trash"></i> Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                        <a href="user.jsp?action=add" class="btn">Add New User</a>
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
                  
                $('#formUsers').submit(function(e){
                    filter();
                    return false;
                });
                  
                function filter(){
                    var  search = $('#search').val(),
                    role = $('#selectRole').val();
                    window.location.href = 'users.jsp?s='+search+'&role='+role;
                }
                
                $('.delete-user').click(function(){
                   return confirm("Are you sure want to delete?");
                });
            })
        </script>
        
        <%@include file="footer.jsp" %>
    </body>
</html>