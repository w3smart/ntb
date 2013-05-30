<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="fromDate" value="${param.from_date}" />
<c:set var="toDate" value="${param.to_date}" />

<jsp:useBean id="statisticBean" scope="request" class="bean.StatisticBean" />
<jsp:setProperty name="statisticBean" property="fromDate" value="${fromDate}" />
<jsp:setProperty name="statisticBean" property="toDate" value="${toDate}" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Statistics</title>
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
                    <h1>Statistics</h1>
                </div>
            </div>

            <div class="row">
                <div class="span12">
                    <form name="formStatistic" method="get">
                        From Date <input type="text" name="from_date" value="${fromDate}" placeholder="Get result from date..." />
                        To Date <input type="text" name="to_date" value="${toDate}" placeholder="Get result to date..." />
                        <input type="submit" name="submit" value="Get Result" class="btn" />
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="span3">
                    <div class="well well-large">
                        <h5>Building Status</h5>
                        <hr />
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Status</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="productStatus" items="${statisticBean.productStatusList}">
                                    <tr>
                                        <td>${productStatus.key}</td>
                                        <td>${productStatus.value}</td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!--.span4-->

                <div class="span3">
                    <div class="well well-large">
                        <h5>Order Status</h5>
                        <hr />
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Status</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="orderStatus" items="${statisticBean.orderStatusList}">
                                    <tr>
                                        <td>${orderStatus.key}</td>
                                        <td>${orderStatus.value}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!--.span4-->

                <div class="span3">
                    <div class="well well-large">
                        <h5>Building Type Rate</h5>
                        <hr />
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Type</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="productType" items="${statisticBean.productTypeList}">
                                    <tr>
                                        <td>${productType.key}</td>
                                        <td>${productType.value}</td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!--.span4-->

                <div class="span3">
                    <div class="well well-large">
                        <h5>Other Statistic</h5>
                        <hr />
                        <table class="table">
                            <tbody>

                                <tr>
                                    <td>Total Money Received</td>
                                    <td>$ ${statisticBean.totalMoney.value}</td>
                                </tr>
                                <tr>
                                    <td>Total Registered Customer</td>
                                    <td>${statisticBean.totalCustomer.value}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><!--.span4-->

            </div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>