<%-- 
    Document   : myPage
    Created on : Dec 22, 2012, 6:57:53 PM
    Author     : Hoanvd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/jquery-ui-1.9.2.custom.css' rel='stylesheet' type='text/css' />
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            $(document).ready(function(){
                $.ajax({
                    url:'../MantechSite/con',
                    data:'action=userList',
                    type:'post',
                    success:function(data){
                        $('#myPageContent').html(data);                    
                    }
                });
            });
        </script>
    </head>
    <body>
        <div id="myRightCol">
            <button id="btnViewComp" value="viewComp" >My Complaint</button>
            <button id="btnChangePass" value="viewComp" >Change Password</button>
            <button id="btnChangeInfo" value="viewComp" >Change Infomation</button>
        </div>
        
        <div id="myPageContent">
        </div>
    </body>
</html>
