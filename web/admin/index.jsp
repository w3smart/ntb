<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="status" value="${param.status}" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <script type="text/javascript" src="../bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
        <style type="text/css">
            body {
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }

            .form-signin {
                max-width: 300px;
                padding: 19px 29px 29px;
                margin: 0 auto 20px;
                background-color: #fff;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }
            .form-signin input[type="text"],
            .form-signin input[type="password"] {
                font-size: 16px;
                height: auto;
                margin-bottom: 15px;
                padding: 7px 9px;
            }

        </style>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="span6 offset3">
                    <form class="form-signin" method="post" action="../con">
                        <h2 class="form-signin-heading">Please sign in</h2>
                        <c:choose>
                            <c:when test="${status == 'error'}">
                                <div class="alert alert-error">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    Error! Wrong username or password!
                                </div>
                            </c:when>
                        </c:choose>

                        <label for="inputUsername">Username</label>
                        <input type="text" minlength="6" class="required" class="input-block-level" name="inputUsername" id="inputUsername" placeholder="Email address">
                        <label for="inputPassword">Password</label>
                        <input type="password" class="input-block-level" minlength="6" class="required" name="inputPassword" id="inputPassword" placeholder="Password">
                        <input type="hidden" name="control" value="login" />
                        <input class="btn btn-large btn-primary" type="submit" value="Sign in" />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>