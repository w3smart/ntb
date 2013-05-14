<%-- 
    Document   : blogs
    Created on : Jan 3, 2013, 10:03:25 AM
    Author     : Hoanvd
--%>
<%@page import="tool.Discriminator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="articleBean" scope="request" class="bean.ArticleBean" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantech-Blogs</title>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <script src="Scripts/jquery-1.8.3.js" type="text/javascript" ></script>
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
                            <%
                                Account _account = (Account) session.getAttribute("account");
                                if (_account != null) {
                                    if (Discriminator.ADMINISTRATOR.equals(_account.getAccountType())) {%>
                            <div class="navBlog" style="margin-top:26px;width:100%;float:left;padding:2px 0px;border:1px solid rgb(234, 234, 234);">
                                <a href="addBlog.jsp" class="readmore" style="float: left;">New Thread</a>
                                <select class="slDisplayBy">
                                    <option value="0">Standard</option>
                                    <option value="1">Grid</option>
                                </select>

                            </div>
                            <% }
                                }
                            %>

                            <c:forEach items="${articleBean.list}"  var="article">
                                <div class='blogItem'>
                                    <div class='blogItem-img'>
                                        <img src='${article.imgSrc}' alt='' /> 
                                        
                                    </div>
                                    <h3 class='blogItem-title'><a  href='blog.jsp?contentId=${article.contentId}'> ${article.title}</a> </h3>
                                    <p class='blogItem-info'><span class='news-itemInfo'> ${article.submitedDate} <a  href='#'> 1 Comment </a>
                                        </span>  </p>
                                    <p class='blogItem-content'>
                                        In volutpat convallis lectus, id ultricies libero varius vitae. Duis fermentum gravida dapibus. Donec pulvinar erat in diam auctor fringilla. Integer eleifend, risus et viverra faucibus, lacus urna lacinia purus, nec interdum dui purus vel tellus. In hac habitasse platea dictumst...
                                    </p>
                                    <div class='blogItem-nav'>
                                        <a  class='readmore' href='blog.jsp?contentId=${article.contentId}'>Read more</a> 
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="blog-pagenav">
                                <a href="" class="prev"><-- last preview</a>
                                <a href="" class="next" style="float:right;">next preview--></a>
                            </div>
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


