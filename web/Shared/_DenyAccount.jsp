
<%@page import="entity.Account"%>
<%
Account _account = (Account)session.getAttribute("account");
if(_account != null){
response.sendRedirect("index.jsp");
}
%>
