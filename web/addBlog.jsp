<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Account _account = (Account) session.getAttribute("account");
    if (_account == null) {
        response.sendRedirect("login.jsp");
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
        <title>Add Blog</title>
        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='Styles/style.css' rel='stylesheet' type='text/css' />
        <link href='Styles/styleRedactor.css' rel='stylesheet' type='text/css' />		
        <script src="Scripts/jquery-1.8.3.js" type="text/javascript" ></script>	
        <!-- Redactor is here -->
        <link href='Styles/redactor.css' rel='stylesheet' type='text/css' />
         
        <script src="Scripts/redactor.min.js" type="text/javascript" ></script>
        <style>
            #frmAddBlog input
            {
                width:310px;
                margin:5px 0px;
            }
           
            body{
                font-family: 'Cuprum';
            }
        </style>
        <script type="text/javascript">
            $(document).ready(
            function()
            {
                $('#redactor_content').redactor();
            }
        );
        </script>	
    </head>
    <body>
        <div id="container">
            <%@include  file="Shared/_Header.jsp" %>
            <div id='wrapper'>
                <div id='content'>
                    <div id='top-content'>
                        <div id='nvSlider'>
                            Placeholder NivoSlider
                        </div>
                    </div>
                    <div id='body-content'>
                        <div id='left-body-content'>
                            <form  id="frmAddBlog" action="con" ENCTYPE="multipart/form-data" method="post">
                                <table>
                                    <tr>
                                        <td>Title: </td>
                                        <td><input type="text" name="title" value="" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Image: </td>
                                        <td><input type="file" name="atmFile" value="" style="margin:5px 0px;" size="40" value="" /> </td>
                                    </tr>
                                    <tr>
                                        <td>Content: </td>
                                        <td><textarea style="margin:5px 0px;" id="redactor_content" name="content">
                                            </textarea> </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><button class="readmore" type="submit" value="addBlog" name="action" >Add Blog</button></td>
                                    </tr>
                                </table>
                            </form>
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
    </body>
</html>
