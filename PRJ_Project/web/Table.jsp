

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Order</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        
        <jsp:include page="Tables.jsp"></jsp:include>
        <p class="message">${message}</p>
<table class="table">
    <thead>
        <tr>
            <th>Table ID</th>
            <th>Name</th>
            <th>Status</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="o" items="${list}">
            <tr>
                <td>${o.getId()}</td>
                <td>${o.getName()}</td>
                <c:if test="${o.getStatus()==1}">
                    <td style="color: green">free</td>
                    <td><a href="AddOrder?tableid=${o.getId()}">Add</a></td>
                </c:if>
                <c:if test="${o.getStatus()==0}">
                    <td style="color: red">using</td>
                    <td><a href="UpdateOrder?tableid=${o.getId()}">See</a></td>
                </c:if>
            </tr>
        </c:forEach>
    </tbody>
</table>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
