<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${param.id}" />
<c:set var="username" value="${param.username}" />
<c:set var="productName" value="${param.product_name}" />
<c:set var="dateCreatedMin" value="${param.date_min}" />
<c:set var="dateCreatedMax" value="${param.date_max}" />
<c:set var="status" value="${param.status}" />
<c:set var="paymentType" value="${param.payment_type}" />
<c:set var="userId" value="${param.user_id}" />
<c:set var="productId" value="${param.product_id}" />

<jsp:useBean id="orderBean" scope="request" class="bean.OrderBean" />
<jsp:setProperty name="orderBean" property="id" value="${id}" />
<jsp:setProperty name="orderBean" property="username" value="${username}" />
<jsp:setProperty name="orderBean" property="productName" value="${productName}" />
<jsp:setProperty name="orderBean" property="dateCreatedMin" value="${dateCreatedMin}" />
<jsp:setProperty name="orderBean" property="dateCreatedMax" value="${dateCreatedMax}" />
<jsp:setProperty name="orderBean" property="status" value="${status}" />
<jsp:setProperty name="orderBean" property="paymentType" value="${paymentType}" />
<jsp:setProperty name="orderBean" property="userId" value="${userId}" />
<jsp:setProperty name="orderBean" property="productId" value="${productId}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order History</title>
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
                                Order was deleted successfully!
                            </div>
                        </c:when>
                        <c:when test="${status == 'delete-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during deleting order
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            
            <div class="row">
                <div class="span12">
                    
                    <h1>Orders History</h1>

                    <form name="formOrders" method="get">
                        <div class="row">

                            <div class="span12">

                                Status
                                <select name="status" id="status" class="span1">
                                    <option value="">All</option>
                                    <c:forEach var="oStatus" items="Payment Not Received,Yet to be Registered,Registration and Stamp Duty is Done">
                                        <c:choose>
                                            <c:when test="${oStatus == status}">
                                                <option value="${oStatus}" selected="selected">${oStatus}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${oStatus}">${oStatus}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>

                                Payment Type
                                <select name="payment_type" id="payment_type" class="span1">
                                    <option value="">All</option>
                                    <c:forEach var="oPaymentType" items="onetime,monthly,yearly">
                                        <c:choose>
                                            <c:when test="${oPaymentType == paymentType}">
                                                <option value="${oPaymentType}" selected="selected">${oPaymentType}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${oPaymentType}">${oPaymentType}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                                Username
                                <input type="text" name="username" id="username" class="span2" value="${param.username}" placeholder="Username..." />

                            </div>
                        </div>
                        <div class="row">
                            <div class="span12">
                                Room Name
                                <input type="text" name="product_name" class="span2" id="product_name" value="${param.product_name}" placeholder="Room..." />

                                From Date
                                <input type="text" name="date_min" class="span2" id="date_min" placeholder="From date..." /> 

                                To Date
                                <input type="text" name="date_max" class="span2" id="date_max" placeholder="To date..." /> 

                                <input type="submit" value="Search" id="submitSearch" class="btn" />
                            </div>
                        </div>


                        <table class="table table-bordered table-striped table-condensed table-hover">
                            <thead>
                                <tr>
                                    <th>Room</th>
                                    <th>Customer</th>
                                    <th>Date Created</th>
                                    <th>Payment Type</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach var="order" items="${orderBean.list}">
                                    <tr>
                                        <td>${order.productName}</td>
                                        <td>${order.username}</td>
                                        <td>${order.dateCreated}</td>
                                        <td>${order.paymentType}</td>
                                        <td>${order.status}</td>
                                        <td>
                                            <a class="btn btn-mini" role="button" href="order.jsp?action=edit&id=${order.id}"><i class="icon icon-pencil"></i> Edit</a>
                                            <a class="btn btn-danger btn-mini delete-order" href="../con?control=deleteOrder&id=${order.id}"><i class="icon icon-trash icon-white"></i> Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>