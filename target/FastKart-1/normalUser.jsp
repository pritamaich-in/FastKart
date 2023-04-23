<%@page import="com.fastkart.entities.User" %>
<%
    User user = (User) session.getAttribute("current-user");
    if(user == null){
        session.setAttribute("message", "You are not logged in!! Please login first");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Normal User</h1>
    </body>
</html>
