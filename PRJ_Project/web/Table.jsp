

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chop Chop Restaurant</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
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
                        <td><a href="AddOrder?tableid=${o.getId()}">See</a></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
