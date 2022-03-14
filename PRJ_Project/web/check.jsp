<%-- 
    Document   : check
    Created on : Mar 13, 2022, 11:10:05 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${listC.get(0).getId()}
        ${dish.getCategory_Id()}
        ${o.getId() == dish.getCategory_Id()?"checked":""}
        
    </body>
</html>
