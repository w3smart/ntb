<%-- 
    Document   : complaintDetail
    Created on : Dec 24, 2012, 11:00:39 AM
    Author     : Hoanvd
--%>
<%@page import="viewModel.ComplaintDetailViewModel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page import="entity.Account"%>
<c:set scope="request" var="comp" value="${requestScope.compDt}" />

<%
    Account _account = (Account) session.getAttribute("account");
    if (_account == null) {
        request.setAttribute("url","solveComplaint.jsp");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        ComplaintDetailViewModel d = (ComplaintDetailViewModel) request.getAttribute("compDt");
        if ((!_account.getAccountType().equals(tool.Discriminator.TECHNICIAN))
                || (!d.getTechnician().equals(_account.getUserName()))) {
            request.setAttribute("errorType", "denyAccess");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
%>
<html>
    <head>
        <title>Mantech - Solve Complaint</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <script src="Scripts/jquery.validate.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                $('#frmSvComp').validate({
                    message : {
                        required : 'Required'
                    }   
                }
            );
               
            
                $(function() {
                    $( "#datepicker" ).datepicker({
                        changeMonth: true,
                        changeYear: true
                    });
                    $( "#datepicker" ).datepicker("option",{dateFormat : 'mm-dd-yy',beforeShowDay: function(date){
                            var now = new Date();//this gets the current date and time
                            var submitedDateValue = $('#hdSubDate');
                            var sbmDate = new Date(submitedDateValue.val());
                            if (date.getFullYear() == now.getFullYear() 
                                && date.getMonth() == now.getMonth() 
                                && date.getDate() <= now.getDate()
                                && date.getFullYear() >= sbmDate.getFullYear()
                                && date.getMonth() >= sbmDate.getMonth()
                                && date.getDate() >= sbmDate.getDate()
                        )
                                return [true];
                            return [false];
                        }}
                );
                });
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
                            <div class="dv-frmSvComp">
                                <form id="frmSvComp" action="con" method="post">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><h3>Information Problem</h3></td>
                                            </tr>
                                            <tr>
                                                <td>Title :</td>
                                                <td >${comp.title}</td>
                                            </tr>
                                            <tr>
                                                <td >Technician :</td>
                                                <td >${comp.technician}</td>
                                            </tr>
                                            <tr>
                                                <td >Submission Time : </td>
                                                <td ><input type="hidden"
                                                            id="hdSubDate"
                                                            value="${comp.submitedDate}" />
                                                    ${comp.submitedDate}</td>
                                            </tr>
                                            <tr>
                                                <td>Category : </td>
                                                <td>${comp.category} </td>
                                            </tr>
                                            <tr>
                                                <td>Priority : </td>
                                                <td >${comp.priority}</td>
                                            </tr>
                                            <tr>
                                                <td>Status :</td>
                                                <td>Fixed <input type="radio"  name="status" checked="true" value="Fixed" />
                                                    Denial <input type="radio" name="status" value="Denial"  />
                                                    Not Fixed <input type="radio" name="status" value="Not Fixed" /></td>
                                            </tr>
                                            <tr>
                                                <td>Solved Date :</td>
                                                <td><input type="text" id="datepicker" style="width: 200px;" class="required" name="dateSolved" value="" /> </td></tr>
                                            <tr>
                                                <td>Content :</td>
                                                <td><textarea class="required" name="txtContent" rows="4" cols="20"></textarea></td>
                                            </tr>
                                            <tr>
                                                <td>Rate :</td>
                                                <td>Easy <input type="radio" name="rate" checked="true" value="Easy" />
                                                    Normal <input type="radio" name="rate" value="Normal"  />
                                                    Medium <input type="radio" name="rate" value="Medium"  />
                                                    Hard <input type="radio" name="rate" value="Hard"  />
                                                </td>
                                            </tr>
                                            <tr><td></td>
                                                <td>
                                                    <input type="hidden" name="hdContentId" value="${comp.contentId}" />
                                                    <button type="sumit" class="readmore" style="float:right;padding-right:10px;margin-top:10px;" name="action" value="updateDiary">Update</button>
                                                    <button type="reset" class="readmore" style="float:right;padding-right:10px;margin-top:10px;" >Reset</button>
                                                </td></tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
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