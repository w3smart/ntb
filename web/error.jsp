<%-- 
    Document   : error
    Created on : Dec 26, 2012, 3:11:26 PM
    Author     : Hoanvd
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:set var="errorType" value="${requestScope.errorType}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantech</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <style>
            .divError
            {

                width:100%;
                float:left;
                margin-top:30px;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'>
                <div id='content'>
                    <div id='body-content'>
                        <div id='left-body-content'>
                            <div class="divError">
                                <c:if test="${errorType == 'diaryBlock'}" >
                                    Complaint was solved ! Please contact <a href="#"> Administrator </a> to reactive.
                                </c:if>
                                <c:if test="${errorType == 'denyAccess'}" >
                                    You don't have permission to access this Page ! Please contact <a href="#"> Administrator </a> if you have any trouble so as to are solved.
                                </c:if>
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
