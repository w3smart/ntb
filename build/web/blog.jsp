<%-- 
    Document   : blog
    Created on : Jan 7, 2013, 9:31:44 AM
    Author     : Hoanvd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contentId" value="${param.contentId}" />
<jsp:useBean id="articleBean" scope="request" class="bean.ArticleBean" />
<jsp:setProperty name="articleBean" property="contentId" value="${contentId}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog - ${articleBean.article.title} </title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <script src="Scripts/jquery-1.8.3.js" type="text/javascript" ></script>
        <%-- <script src="Scripts/jquery-ui-1.9.2.custom.min.js" type="text/javascript" ></script> --%>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'>
                <div id='content'>
                    <div id='top-content'>
                        <h1 style="font-family: 'Cuprum',sans-serif;
                            font-size: 40px;
                            line-height: normal;
                            text-transform: uppercase;
                            margin-top: 26px;">Our Blog</h1>
                    </div>
                    <div id='body-content'>
                        <div id='left-body-content'>
                            <h1>${articleBean.article.title}</h1>
                            <p><img src="${articleBean.article.imgSrc}" ></img></p>
                            <p>${articleBean.article.content}</p>
                        </div>
                        <div id='right-body-content'>
                            <%@include  file="Shared/_RightBlog.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
            <!-------End Wrapper ------->
            <%@include  file="Shared/_Footer.jsp" %>
        </div>

    </body>
</html>
