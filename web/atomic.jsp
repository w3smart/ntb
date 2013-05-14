<%-- 
    Document   : atomic
    Created on : May 14, 2013, 2:00:30 PM
    Author     : fpoly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${param.id}" />
<jsp:useBean id="roomBean" scope="request" class="bean.RoomBean" />
<jsp:setProperty name="roomBean" property="id" value="${id}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${roomBean.room.name}</title>
        <script type="text/javascript" src="bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="span12">
                 <h1>${roomBean.room.name}</h1>
                 <p>Type: ${roomBean.room.type}</p>
                 <p>Address: ${roomBean.room.address}</p>
                 <p>Area: ${roomBean.room.area}</p>
                 <p>Status: ${roomBean.room.status}</p>
                 <p>Description ${roomBean.room.description}</p>
                 <p>Photo: <img src="${roomBean.room.thumbnail}" alt="${roomBean.room.name}" /></p>
                 <p>Price: ${roomBean.room.price}</p>
                 
                 <form name="formOrderAtomic" method="post" action="con">
                     <input type="hidden" name="id" value="${roomBean.room.id}" />
                     <button class="readmore" type="submit" value="Order" name="action" >Order</button>
                 </form>
            </div>
        </div>
    </body>
</html>
