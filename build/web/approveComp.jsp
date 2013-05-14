<%-- 
    Document   : approveComp
    Created on : Dec 29, 2012, 12:50:48 PM
    Author     : Hoanvd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="viewModelBean" scope="request" class="bean.ViewModelBean" />
<c:set var="contentId" value="${requestScope.contentId}" />
<jsp:setProperty name="viewModelBean" property="contentId" value="${contentId}" />
<jsp:useBean id="compBean" scope="request" class="bean.ComponentBean" />
<%
    Account _account = (Account) session.getAttribute("account");
    if (_account == null) {
        request.setAttribute("url","approveComp.jsp");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        if (!_account.getAccountType().equals(tool.Discriminator.ADMINISTRATOR)) {
            request.setAttribute("errorType", "denyAccess");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approve Complaint</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'>
                <div id='content'>
                    <div id='body-content'>
                        <div id='left-body-content'>
                            <h3>${viewModelBean.complaintDetail.title}</h3>
                            <p>Employee : <a href="#"><b>${viewModelBean.complaintDetail.submitedBy} </b></a> </p>
                            <p>Submission Time : ${viewModelBean.complaintDetail.submitedDate} </p>
                            <table>
                                <tbody>
                                <form action="con" method="post">
                                    <tr>
                                        <td>Select Technician :</td>
                                        <td><select class="slDisplayBy" style="width:auto;" name="technician" id="ddlTechnician">
                                                <c:forEach items="${compBean.listTechnician}" var="tech">
                                                    <option  value="${tech.personId}">${tech.fullName}</option>
                                                </c:forEach>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Set Priority: </td>
                                        <td><select class="slDisplayBy" name="priority" style="width:auto;">
                                                <option value="High">High</option>
                                                <option value="Above Normal">Above Normal</option>
                                                <option value="Normal" selected="true">Normal</option>
                                                <option value="Below Normal">Below Normal</option>
                                                <option value="Low">Low</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">

                                            <input type="hidden" name="hdContentId" value="${contentId}" />
                                            <button type="submit" class="readmore" style="float:left;" name="action" value="insetDiary">Update</button>
                                            <button type="reset" class="readmore" style="float:left;" >Reset</button>

                                        </td>
                                    </tr>
                                </form>
                                </tbody>

                            </table>
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
