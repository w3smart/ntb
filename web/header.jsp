<%@page import="entity.User"%>
<%
    User _u = (User) session.getAttribute("user");
    String userOutput = "";
    String registerOutput = "";
    
    if (_u == null) {
        userOutput = "<li><a href=\"admin/\">Login</a></li><li><a href=\"register.jsp\">Register</a></li>";
        
        registerOutput = "<div class='alert alert-warning'>Please <a href='admin/'>Login</a> or <a href='register.jsp'>Register</a> to buy this product</div>";
    } else {
        userOutput = "<li><a href=\"my_product.jsp?user_id="+_u.getId()+"\">Welcome "+_u.getUsername()+"</a></li><li><a href=\"con?control=logOut\">Logout</a></li>";
        
        if(_u.getRole().equals("customer")){
            registerOutput = "<input type=\"submit\" class=\"btn btn-primary\" name=\"submitOrder\" value=\"Register Now\" />";
        }
    }
%>