<%-- 
    Document   : complaintDetail
    Created on : Dec 24, 2012, 11:00:39 AM
    Author     : Hoanvd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="viewModelBean" scope="request" class="bean.ViewModelBean" />
<c:set var="contentId" value="${requestScope.contentId}" />
<jsp:setProperty name="viewModelBean" property="contentId" value="${contentId}" />
<jsp:useBean id="compBean" scope="request" class="bean.ComponentBean" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint - ${viewModelBean.complaintDetail.title}</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <script language="javascript" type="text/javascript">
            $(document).ready(function(){
                $( "#dialog-form" ).dialog({
                    autoOpen: false,
                    height: 540,
                    width: 760,
                    modal: true,
                    close: function() {
                    }
                });
                    
                $('.aImg').click(function(){
                    $( "#dialog-form" ).dialog( "open" );
                    return false;
                })      
            });
        </script>
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'>
                <div id='content'>
                    <div id='body-content'>
                        <div id='left-body-content'>
                            <h2 style="margin-top: 28px;">${viewModelBean.complaintDetail.title}</h2>
                            <p>Employee : <a href="#"><b>${viewModelBean.complaintDetail.submitedBy} </b></a>
                                <span style="padding-left:50px;">Submission Time : ${viewModelBean.complaintDetail.submitedDate} </span> 
                            </p>
                            <p>Technician : 
                                <% if (viewModelBean.getComplaintDetail().getTechnician() == null) {%>
                                Pending...
                                <% } else {%>
                                <b> ${viewModelBean.complaintDetail.technician} </b>
                                <% }%>
                            </p>
                            <table class="tblCompDetail">
                                <tbody>
                                    <tr><td colspan="4"><b style="text-decoration: underline;"> Problem pre-definition :</b></td></tr>
                                    <tr><td class="leftTd"><b>Category :</b> </td><td>${viewModelBean.complaintDetail.category}</td><td style="text-align: right;padding-right:5px;"><b >Severity :</b> </td><td>${viewModelBean.complaintDetail.severity}</td></tr>
                                    <tr><td class="leftTd"><b>Required Support :</b> </td><td colspan="3">${viewModelBean.complaintDetail.remoteSupport}</td></tr>
                                    <tr><td class="leftTd"><b>Detail Of Problems:</b></td><td colspan="3"> ${viewModelBean.complaintDetail.detailOfProblem} </td></tr>
                                    <tr><td class="leftTd"><b>Attach File : </b></td>
                                        <td colspan="3">
                                            <c:if test="${viewModelBean.complaintDetail.imgSrc == null}">
                                                <a href="" class="aImg"><img src="Images/no_picture.jpg" width="200px" height="170px" alt="" /></a> 
                                                </c:if>
                                                <c:if test="${viewModelBean.complaintDetail.imgSrc != null}">
                                                <a href="" class="aImg"><img src="${viewModelBean.complaintDetail.imgSrc}" width="200px" height="170px" alt="" /></a> 
                                                </c:if>
                                        </td></tr>
                                        <% if (viewModelBean.getComplaintDetail().getTechnician() != null) {%>
                                    <tr><td colspan="4"><b style="text-decoration: underline;">Information Fixed</b></b></td></tr>
                                    <tr><td class='leftTd'><b>Priority : </b></td><td colspan="3">${viewModelBean.complaintDetail.priority}</td></tr>
                                    <tr><td class='leftTd'><b>Status : </b></td><td colspan="3">${viewModelBean.complaintDetail.status}</td></tr>
                                    <tr><td class='leftTd'><b>Note : </b></td><td colspan="3">${viewModelBean.complaintDetail.note}</td></tr>
                                    <% }%>        
                                    <tr>
                                        <jsp:setProperty name="compBean" property="contentId" value="${viewModelBean.complaintDetail.contentId}" />
                                        <td colspan="4">
                                            <form method="post" action="con" >
                                                <input type="hidden" name="hdContentId" value="${viewModelBean.complaintDetail.contentId}" />
                                                <% if (viewModelBean.getComplaintDetail().getTechnician() != null) {
                                                        if (compBean.getDiary().isIsActive() != true) {%> 
                                                <button type="submit" name="action" value="solvedComplaint" class="readmore" >Solve</button>
                                            </form>
                                            <% } else {%>

                                            <button type="submit" name="action" class="readmore" value="solvedComplaintRd" >Solve</button>
                                            <%  }
                                            } else {%> 
                                            <form method="post" action="con" >
                                                <input type="hidden" name="hdContentId" value="${viewModelBean.complaintDetail.contentId}" />
                                                <button type="submit" name="action" value="approve" class="readmore" >Approve</button>
                                            </form>
                                            <% }%>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div id="dialog-form" title="">
                                <img src="${viewModelBean.complaintDetail.imgSrc}" width="400" height="500" alt="" />
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






        <script type="text/javascript">
            $(document).ready(function(){
           
            });
        </script>
    </body>
</html>
<%--


               

--%>