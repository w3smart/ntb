<%-- 
    Document   : addComlaint
    Created on : Dec 15, 2012, 11:11:43 AM
    Author     : Hoanvd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Account"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


<%
    Account _account = (Account) session.getAttribute("account");
    if (_account == null) {
        request.setAttribute("url","addComplaint.jsp");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        if (!_account.getAccountType().equals(tool.Discriminator.EMPLOYEE)) {
            request.setAttribute("errorType", "denyAccess");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
%>
<jsp:useBean scope="request" id="compBean" class="bean.ComponentBean" />
<jsp:setProperty name="compBean" property="departmentId" value="${sessionScope.account.departmentId}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Complaint</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <style>
            .severity-gui
            {
                font-size: 13px;
                margin:0px;
                padding:0px;
            }
            #empInfo p
            {
                margin-bottom:0px;
            }
        </style>
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <script src="Scripts/jquery.validate.min.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            $(document).ready(function(){
                $('#frmComplaint').validate({
                 message : {
                     required : 'Required'
                 }   
                }
            );
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

                            <div id='empInfo'>
                                <p>Employee : <a href="#"><b class="fkLink">${sessionScope.account.fullName} </b></a> <span style="padding-left:50px;">Department : <b>${compBean.department.name}</b> </span> </p>
                                <p>Position : Employee </p>
                                
                            </div>
                            <form action="con" method="post" ENCTYPE="multipart/form-data" id="frmComplaint">
                                <table>
                                    <tr>
                                        <td colspan="2"><b style="text-decoration: underline;"> Problem pre-definition :</b></td>
                                    </tr>
                                    <tr> 
                                        <td><b>Relate System :</b></td>
                                        <td><b>Mantech Helpdesk</b></td>
                                    </tr>
                                    <tr> 
                                        <td><b>Subject :</b></td>
                                        <td><input type="text" minlength="6"  class="required" name="subject"/></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 140px;"><b>Detail Of Problems:</b></td>
                                        <td><textarea minlength="10" class="required" id="dtOfProblem" name="dtOfProblem" >
                                            </textarea><label for="dtOfProblem"></label> </td>
                                    </tr>
                                    <tr>
                                        <td><b>Category :</b></td>
                                        <td><select name="ddlCategory" class="slDisplayBy" style="width: 180px;float: none;">
                                                <c:forEach items="${compBean.listCategory}" var="ca">
                                                    <option value="${ca.categoryId}">${ca.name}</option>
                                                </c:forEach>
                                            </select> </td>
                                    </tr>
                                    <tr>
                                        <td><b>Remote Support :</b></td>
                                        <td><input type="radio" name="rmtSupport" value="Yes" checked="checked" /> Yes
                                            <input type="radio" name="rmtSupport"  value="No" /> No
                                            <p class="severity-gui"><i>Remote support with  <b style="color: rgb(220, 60, 0);">Skype</b>,
                                                    <b style="color: rgb(220, 60, 0);">TeamView..</b></i></p></td>
                                    </tr>
                                    <tr>
                                        <td><b>Severity :</b></td>
                                        <td>
                                            <input type="radio" name="severity" value="Business Impact" /> <b>Business Impact </b>
                                            <input type="radio" name="severity" value="Front Issue"  /> <b>Front Issue </b>
                                            <input type="radio" name="severity" value="User Impact"  /> <b>User Impact </b>
                                            <input type="radio" name="severity" value="Inquiry" checked="checked" /> <b>Inquiry </b>
                                            <p class="severity-gui"><i style="color: rgb(220, 60, 0);"><b>Business Impact : </b> Effect on many computer at the same time</i> </p>
                                            <p class="severity-gui"><i style="color: rgb(220, 60, 0);"><b >Front Issue : </b> Effect on transaction customer's</i></p>
                                            <p class="severity-gui"><i style="color: rgb(220, 60, 0);"><b >User Impact : </b> Error</i> </p>
                                            <p class="severity-gui"><i style="color: rgb(220, 60, 0);"><b >Inquiry : </b> Required research and add-in</i></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b>Attachment :</b></td>
                                        <td><input accept="jpeg|gif|png|jpg" type="file" id="attFile" name="atmFile" value="" size="50" />
                                            <label for="attFile"></label>
                                            <p  class="severity-gui"><i>Accept File's extension <b>.PNG  </b>,  <b>.GIF </b>, <b> .JPEG </b>, <b> .JPG </b> </i></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan='2'>
                                            <button type="submit" name="action" style="float:right;padding-right:10px;margin-top:10px;" id="action"  class="readmore" value="addComplaint">Submit</button>
                                            <button type="reset" id="btnReset" style="float:right;margin-top:10px;" class="readmore" >Reset</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div id='right-body-content'>
                            <%@include  file="Shared/_RightBlog.jsp" %>
                        </div>
                    </div>
                </div>
            </div> <!-------End Wrapper ------->
            <%@include  file="Shared/_Footer.jsp" %>
        </div>
    </body>
</html>
