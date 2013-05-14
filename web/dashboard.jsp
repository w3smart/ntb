<%-- 
    Document   : employees
    Created on : Dec 19, 2012, 1:46:52 PM
    Author     : Hoanvd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<jsp:useBean scope="request" id="compBean" class="bean.ComponentBean" />
<jsp:useBean scope="request" id="empBean" class="bean.EmployeeBean" />
<%
    Account _account = (Account) session.getAttribute("account");
    if (_account == null) {
        request.setAttribute("url","dashboard.jsp");
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
        <title>Mantech - Dashboard</title>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href="Styles/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <style>
            a[title] { color:red;  padding : 2px 2px;  } 
            .input-error
            {
                border: 1px solid red;
            }
            .ui-widget
            {

            }
        </style>
        <script src="Scripts/jquery.validate.min.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            $(document).ready(function(){
                //dialog
                $(function() {
                    var username = $( "#username" ),
                    fullName = $('#fullName'),
                    email = $( "#email" ),
                    password = $( "#password" ),
                    dateOfBirth = $('#datepicker'),
                    address = $('#address'),
                    allFields = $( [] ).add( name ).add( email ).add( password ),
                    tips = $( "#frmUser-sumary" );
                    function updateTips( t ) {
                        tips
                        .html( t )
                    }
                    function checkLength( o, n, min, max ) {
                        if ( o.val().length > max || o.val().length < min ) {
                            updateTips("Length of <b style='font-style:bold;color:red;'>" + n + '</b> must be between ' + min + ' and ' + max + '.');  
                            o.addClass('input-error');
                            o.focus();
                            return false;
                        } else {
                            o.removeClass('input-error');
                            return true;
                        }
                    }
                    function checkRegexp( o, regexp, n ) {
                        if ( !( regexp.test( o.val() ) ) ) {
                            updateTips(n)
                            return false;
                        } else {
                            return true;
                        }
                    }
                    $( "#dialog-form" ).dialog({
                        autoOpen: false,
                        height: 530,
                        width: 470,
                        resizable: false,
                        modal: true,
                        buttons: {
                            "Create an account": function() {
                                var bValid = true;
                                tips.text('');
                                bValid = bValid && checkLength( username, "Username", 6, 16 );
                                bValid = bValid && checkRegexp( username, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
                                bValid = bValid && checkLength( fullName, "FullName", 3, 16 );
                                bValid = bValid && checkLength( email, "Email", 6, 80 );
                                bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "Email is not valid" );
                                bValid = bValid && checkLength( password, "Password", 5, 16 );
                                bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
                                bValid = bValid && checkLength( dateOfBirth, "DateOfBirth", 8, 14 );
                                bValid = bValid && checkLength( address, "Address", 10, 40 );
                                
                                if ( bValid ) {
                                    $.ajax({
                                        url:'../MantechSite/con',
                                        data:'action=ajaxAddEmployee&'+$('#frmInsertEmp').serialize(),
                                        type:'post',
                                        success:function(data){
                                            $('.tblListComp > tbody').prepend(data);
                                        }
                                    });
                                    //frmInsertEmp
                                    
                                    $( this ).dialog( "close" );
                                }
                            },
                            Cancel: function() {
                                $( this ).dialog( "close" );
                                tips.text('All fields are required.');
                                //$('#frmInsertEmp').empty();
                            }
                        },
                        close: function() {
                            allFields.val( "" ).removeClass( "ui-state-error" );
                            //$('#frmInsertEmp')[0].reset();
                        }
                    });
                    $( "#create-user" )
                    .button()
                    .click(function() {
                        $('#frmInsertEmp')[0].reset();
                        $('#errUser').empty();
                        $( "#dialog-form" ).dialog( "open" );
                    });
                });
             
                    //date picker
                    $(function() {
                    
                        $( "#datepicker" ).datepicker({
                            changeMonth: true,
                            changeYear: true
                        });
                        $( "#datepicker" ).datepicker( "option", "dateFormat", "mm-dd-yy" );
                    });
                
                    //check exist user
                    $('input[name="username"]').focusout(function(){
                        if($(this).val().length > 6)
                        {
                            var username = $(this).val();
                            $.ajax({
                                url:'../MantechSite/con',
                                data:'action=isUser&username='+username,
                                type:'post',
                                success:function(data){
                                    var content = $.parseJSON(data);
                                    var value = content.res;
                                    $('#ddd').append(value);
                                    if(value==true)
                                    {
                                        $('#errUser').empty();
                                        $('#errUser').css('color','red').html("<img src='Images/icon_delete.png' /> Invalid");
                                    }else
                                    {
                                        $('#errUser').empty();
                                        $('#errUser').css('color','green').html("<img src='Images/icon_accept.png' /> Valid");
                                    }
                                }
                            });
                        }else
                        {
                            $('#errUser').empty();
                        }
                    }); 
                });
        </script>
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'>
                <div id='content'>
                    <div id='top-content'>
                        <h1 style="font-family: 'Cuprum',sans-serif;
                            font-size: 40px;
                            line-height: normal;
                            text-transform: uppercase;
                            margin-top: 26px;">Administrator Page</h1>
                    </div>
                    <div id="body-content">
                        <div id="left-body-content">
                            <table class="tblListComp" style="margin-top:30px;">
                                <thead>
                                    <tr>
                                        <th>UserName</th>
                                        <th>BirthDate</th>
                                        <th>JoinedDate</th>
                                        <th style='width: 200px;'>Address</th>
                                        <th style='width: 100px;'>Department</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${empBean.list}" var="emp">
                                        <tr>
                                            <td>${emp.userName}</td>
                                            <td>${emp.birthDate}</td>
                                            <td>${emp.joinedDate}</td>
                                            <td>${emp.address}</td>
                                            <jsp:setProperty name="compBean" property="departmentId" value="${emp.departmentId}" />
                                            <td>${compBean.department.name}</td>
                                            <td> 
                                                <a href="" title="AAA" ><img src="Images/edit.jpg" alt="Edit" /></a>
                                                <a href=""><img src="Images/cancel.jpg" alt="Delete" /></a>
                                                <a href=""><img src="Images/folder.png" title="ssss" /></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div id="dvStatus">
                               
                            </div>
                            <!-------- dialog -------   
                            <button class="readmore" type="submit" type id="create-user"  name="action" value="addEmployee">New Employee</button>
                            --->
                            <p><button class="readmore"   id="create-user" style=" color: rgb(255, 255, 255);
                                       display:block;
                                       text-align:center;
                                       line-height: 26px;
                                       background: none repeat scroll 0% 0% rgb(78, 91, 112);
                                       float:left;width: auto;"  name="action" value="addEmployee">Create Employee</button>
                            <div id="dialog-form" title="Create new user" >

                                <form action="con" id="frmInsertEmp" method="post">
                                    <table>
                                        <tbody>
                                            <tr style="margin-top:10px;">
                                                <td>UserName: </td>
                                                <td><input minlength="6" class="required" type="text" id="username" name="username" /><span id="errUser"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>FullName: </td>
                                                <td><input minlength="6" class="required" id="fullName" type="text" name="fullName" /></td>
                                            </tr>
                                            <tr>
                                                <td>Email: </td>
                                                <td><input minlength="9" class="required" type="text" name="email" id="email" /></td>
                                            </tr>
                                            <tr>
                                                <td>Password: </td>
                                                <td><input type="password" name="password" id="password" value=""  /></td>
                                            </tr>
                                            <tr>
                                                <td>Birth Of Date:</td>
                                                <td><input minlength="6" class="required" type="text" id="datepicker" name="birthOfDate" /> </td>
                                            </tr>
                                            <tr>
                                                <td>Address:</td>
                                                <td><textarea minlength="10" class="required" id="address" name="address" ></textarea> </td>
                                            </tr>
                                            <tr>
                                                <td>Department: </td>
                                                <td><select name="department" style="float:left;width: auto;" class="slDisplayBy">
                                                        <c:forEach items="${compBean.listDepartment}" var="de">
                                                            <option value="${de.departmentId}">${de.name}</option>
                                                        </c:forEach>
                                                    </select> </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><span id="frmUser-sumary" style="display:block;padding-top: 10px;color:red;font-style: italic;">All fields are required</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <!--------- end dialog -------->
                           
                        </div> <!-- end left-body-content ------>
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
