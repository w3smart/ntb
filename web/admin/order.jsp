<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${param.id}" />
<c:set var="status" value="${param.status}" />
<jsp:useBean id="orderBean" scope="request" class="bean.OrderBean" />
<jsp:setProperty name="orderBean" property="id" value="${id}" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Order</title>
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
                        <c:when test="${status == 'edit-success'}">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                Order was updated successfully! <a href="orders.jsp">Go back</a>
                            </div>
                        </c:when>
                        <c:when test="${status == 'edit-error'}">
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Error! </strong> Error during updating order
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <div class="row">
                <div class="span8">
                    <h1>Update Order</h1>
                    <form name="formUser" method="post" action="../con">

                        <div class="control-group">
                            <label class="control-label" for="inputProductName">Room</label>
                            <div class="controls">
                                <input type="text" name="inputProductName" value="${orderBean.order.productName}" id="inputProductName" disabled="disabled" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="inputPaymentType">Payment Type</label>
                            <div class="controls">
                                <input type="text" name="inputPaymentType" id="inputPaymentType" value="${orderBean.order.paymentType}" disabled="disabled"  />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="inputUsername">Customer</label>
                            <div class="controls">
                                <input type="text" name="inputUsername" id="inputUsername" value="${orderBean.order.username}" disabled="disabled" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputStatus">Status</label>
                            <div class="controls">
                                <select name="inputStatus" id="inputStatus">
                                    <c:forEach var="status" items="Payment Not Received,Yet to be Registered,Registration and Stamp Duty is Done">
                                        <c:choose>
                                            <c:when test="${orderBean.order.status == status}">
                                                <option value="${status}" selected="selected">${status}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${status}">${status}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <input type="hidden" name="inputId" value="${param.id}" />
                        <input type="hidden" name="control" value="updateOrder" />
                        <input type="submit" name="updateUser" class="btn btn-primary" value="Update Order" />

                    </form>
                </div><!--span6 edit land area-->
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>