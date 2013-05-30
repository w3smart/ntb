<%-- 
    Document   : atomic
    Created on : May 14, 2013, 2:00:30 PM
    Author     : fpoly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${param.id}" />
<jsp:useBean id="atomicBean" scope="request" class="bean.AtomicBean" />
<jsp:setProperty name="atomicBean" property="roomId" value="${id}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${atomicBean.room.name}</title>
        <script type="text/javascript" src="bootstrap/js/jquery-2.0.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.css" />
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="span12">
                 <h1>${atomicBean.room.name}</h1>
                 <p>Type: ${atomicBean.room.type}</p>
                 <p>Address: ${atomicBean.room.address}</p>
                 <p>Area: ${atomicBean.room.area}</p>
                 <p>Status: ${atomicBean.room.status}</p>
                 <p>Description ${atomicBean.room.description}</p>
                 <p>Photo: <img src="${atomicBean.room.thumbnail}" alt="${atomicBean.room.name}" /></p>
                 <p>Price: ${atomicBean.room.price}</p>
                 <p>Floor: ${atomicBean.room.floorNumber} </p>
                 
                 <form name="formOrderAtomic" method="post" action="con">
                     <input type="hidden" name="id" value="${atomicBean.room.id}" />
                     <button class="readmore" type="submit" value="Order" name="control" >Order</button>
                 </form>
            </div>
        </div>
    </body>
</html>
