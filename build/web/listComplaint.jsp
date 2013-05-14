<%-- 
    Document   : listComplaint
    Created on : Dec 17, 2012, 10:34:42 AM
    Author     : Hoanvd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:useBean id="list" scope="request" class="bean.ViewModelBean" />
<jsp:useBean id="compBean" scope="request" class="bean.ComponentBean" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantech - Complaints</title>

        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <link href='Styles/jquery-ui-1.9.2.custom.css' rel='stylesheet' type='text/css' />
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
       <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" /> 
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <style>
            body{
                font-family: 'Cuprum';
            }
            .ui-autocomplete-input
            {

            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <script type="text/javascript">
            
        </script>
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'> <!------- Wrapper ------->
                <div id='content'>
                    <div id='body-content'> 
                        <div id='left-body-content'> <!------- Left-body-Content ------->

                            <p>

                            </p>
                            <div class="techNav" style="margin-bottom:10px;width:100%;float:left;padding:5px 0px;border:1px solid rgb(234, 234, 234);">
                                <a href="/MantechSite/addComplaint.jsp" style="width: 110px;float:left;" class="readmore">New Complaint</a>
                                <input type="text" id="searchKey" name="seachBy" style="margin-left:10px;width:310px;height:20px;float:left;"/>
                                <a href="javascript:void(0)" id="btnSearch"  class="readmore" style="float:left;margin-left:10px;">Search</a>
                                <select id="slSortedBy" class="slDisplayBy" style="width:130px;float:left;margin-left:10px;font-size:13px;">
                                    <option value="ALL">Display All</option>
                                    <option value="PENDING">Pending</option>
                                    <option value="APPROVED">Approved</option>
                                </select>
                            </div>
                            <table id="tblContent" class='tblListComp'>
                                <tbody>
                                    <tr>
                                        <th>Date</th>
                                        <th>Title</th>
                                        <th >Submitted</th>
                                        <th>Status</th>
                                        <th>Category</th>
                                        <th>Status</th>
                                    </tr> 
                                    <c:forEach items="${list.listComplaintViewModel}" var="comp" >
                                        <tr> 
                                            <td class='tbl-submitedDate'>${comp.submitedDate}</td>
                                            <td class='tbl-title'><a href="../MantechSite/con?action=viewComplaint&AMP;compId=${comp.contentId}"> ${comp.title}</a></td>
                                            <td class='tbl-submitedBy'>${comp.submitedBy}</td>
                                            <c:if test="${not empty comp.status}">
                                                <td >${comp.status}</td>
                                            </c:if>
                                            <c:if test="${empty comp.status}">
                                                <td > --- </td>
                                            </c:if>

                                            <td class='tbl-category'>${comp.category}</td>

                                            <c:if test="${not empty comp.technician}">
                                                <td class='tbl-status' name="dTech" ><span class="approved">Approved</span></td>
                                            </c:if>
                                            <c:if test="${empty comp.technician}">
                                                <td  class='tbl-status' name="dTech" ><span><img src="Images/ico_hourglass.jpg" /> Pending</span></td>
                                                    </c:if>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <span class="pages">Page 1 of 1</span>
                                <a href="#" style="text-decoration: underline;">1</a>
                                <span id="ajaxLoading"></span>
                            </div>
                        </div>    <!------- End Left-body-Content ------->
                    </div>
                    <div id='right-body-content'>   <!------- Right-body-Content ------->
                        <%@include  file="Shared/_RightBlog.jsp" %>
                    </div>    <!------- End Right-body-Content ------->
                </div>
            </div> <!------- END Wrapper ------->
            <%@include  file="Shared/_Footer.jsp" %>
        </div>
        <script>
            $(document).ready(function(){
                
                $('#btnSearch').click(function(){
                        $.ajax({
                            url:'../MantechSite/con',
                            data:'action=ajaxViewComplaintBy&sortedKey='+$('#slSortedBy').val()+'&searchKey='+$( "#searchKey" ).val(),
                            type:'post',
                            success:function(data){
                                $('#tblContent tbody').empty().html(data);
                            }
                        });
                });
                
                
                
                $(function() {
                    var availableTags = [
                        "technicianLam",
                        "technicianTruong",
                        "tonykeos"
                    ];
                    $( "#searchKey" ).autocomplete({
                        source: availableTags
                    });
                });
                
                //ajax load complaintContent
                $('#slSortedBy').change(function(){
                    $('#ajaxLoading').ajaxStart(function(){
                        $(this).html("<img src='Images/loading.gif' style='width:30px;height:10px;' />");
                    });
                    $.ajax({
                        url:'../MantechSite/con',
                        data:'action=ajaxViewComplaintBy&sortedKey='+$('#slSortedBy').val()+'&searchKey='+$( "#searchKey" ).val(),
                        type:'post',
                        success:function(data){
                            $('#tblContent tbody').empty().html(data);
                        }
                    });
                    $('#ajaxLoading').ajaxComplete(function(){
                        $(this).text('');
                    });
                });
            });
        </script>
    </body>
</html>
<%--     $('button[name="save"]').attr("disabled","true");
                $('button[name="cancel"]').attr("disabled","true");
                $('td[name*="dTech"]').dblclick(function(){
                    var tdTech = $(this);
                    $.ajax({
                        url:'../MantechSite/con',
                        data:'action=getDepartmentList',
                        type:'post',
                        success:function(data){
                            tdTech.empty().html(data);
                        }
                    });
                });
            }); --%> 


<%-- 
  <!------- Dialog ------->
                            
                            <!------- End Dialog ------->
<div id="dialog-form" title="Update Complaint">
                                <form>
                                    <fieldset>
                                        Technician :<select id="ddlTechnician">
                                            <option value="-1">Pending...</option>
                                            <c:forEach items="${compBean.listTechnician}" var="tech">
                                                <option  value="${tech.personId}">${tech.fullName}</option>
                                            </c:forEach>
                                        </select>
                                        <br /><br />
                                        <div id="example-2"></div> <br />
                                        Severity : <span id="spPriority">Prioriy : not set</span>
                                    </fieldset>
                                </form>
                            </div>

--%>

<%-- 

$(document).ready(function(){
                $('#example-2').ratings(5).bind('ratingchanged', function(event, data) {
                    $('#spSeverity').text(data.rating);
                });
                    
 
                $( "#dialog-form" ).dialog({
                    autoOpen: false,
                    height: 300,
                    width: 350,
                    modal: true,
                    buttons: {
                        "Save": function() {     
                            var ddlTechnician = $('#ddlTechnician');
                            var sp = $('#spPriority');
                            // alert(sp.text());
                            $.ajax({
                                url:'../MantechSite/con',
                                data:'action=ajaxUpdate',
                                type:'post',
                                success:function(data){
                                    tdTech.empty().html(data);
                                }
                            });
                            $( this ).dialog( "close" );
                        },
                        Cancel: function() {
                            $( this ).dialog( "close" );
                        }
                    },
                    close: function() {
                       
                    }
                });
                $('a[name*="editTech"]').click(function(){
                    //$(this).click(function(){
                    var hdContentId = $(this).next("input");
                    var contentId = hdContentId.attr("value");
      
                    $.ajax({
                        url:'../MantechSite/con',
                        data:'action=ajaxGetPriority&contentId='+contentId,
                        type:'post',
                        success:function(data){
                            var content = $.parseJSON(data);
                            if(content!=null)
                            {
                                var priority = content.priority;
                                var techId = content.technician;
                                $('#example-2').ratings(0, priority);
                                $('#spPriority').text(priority);
                                $('Option[value="'+techId+'"]').attr("selected",true);   
                            }else
                            {
                                $('#spPriority').text(1);
                                $('#example-2').ratings(0, 1);
                                $('Option[value="-1"]').attr("selected",true); 
                            }
                        }
                    });
                    $( "#dialog-form" ).dialog( "open" );
                        
                    // });
                });
              
            });


--%>