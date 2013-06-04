<%@page import="entity.User"%>
<%
    User _u = (User) session.getAttribute("user");
    String userOutput = "";
    if (_u == null) {
        response.sendRedirect("index.jsp?status=required_login");
    } else {
        if (!_u.getRole().equals("admin")) {
            response.sendRedirect("../404.jsp?status=denyAccess");
        }
        else
        {
            userOutput = "Logged in as <a href=\"user.jsp?action=edit&id="+_u.id+"\">"+_u.username+"</a> | <a href=\"../con?control=logOut\">Logout</a>";
        }
    }
%>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="../">NTB</a>
            <div class="nav-collapse collapse">
                
                <p class="navbar-text pull-right"><%=userOutput%></p>

                <ul class="nav">
                    <li><a href="statistics.jsp">Statistics</a></li>
                    <li><a href="orders.jsp">Sales</a></li>
                    <li><a href="locations.jsp">Locations</a></li>
                    <li><a href="lands.jsp">Land, Building and Room</a></li>
                    <li><a href="users.jsp">Users</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>