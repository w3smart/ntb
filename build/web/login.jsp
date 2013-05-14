<%-- 
    Document   : login
    Created on : Dec 22, 2012, 6:24:02 PM
    Author     : Hoanvd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include  file="Shared/_DenyAccount.jsp" %>
<c:set var="url" value="${requestScope.url}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="Scripts/jquery.validate.min.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            $(document).ready(function(){
                $('#frmLogin').validate();
            });
        </script>
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'>
                <div id='content'>
                    <div id='body-content'>
                        <div id='left-body-content'>
                            <div id="divLogin">
                                <form id="frmLogin" method="post" action="con">
                                    
                                    <table>
                                        <tr>
                                        <input type="hidden" value="${url}" name="url" />
                                            <td>Username : </td>
                                            <td><input type="text" minlength="6" class="required" name="username" /></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" minlength="6" class="required" name="password" /> </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center; padding-left: 80px;" colspan="2">
                                                <button style="float:left;" type="submit" name="action" value="loginSubmit" class="readmore">Login</button>
                                                <button style="float:left;margin-left:5px;" type="reset"  class="readmore">Reset</button> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="loginMess">
                                                    ${requestScope.res}
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                        <div id='right-body-content'>
                            <%@include  file="Shared/_RightBlog.jsp" %>
                        </div>
                    </div>
                </div>
            </div>                       
            <%@include  file="Shared/_Footer.jsp" %>                                 
        </div>
    </body>
</html>
