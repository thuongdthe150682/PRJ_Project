<%-- 
    Document   : Tables
    Created on : Mar 13, 2022, 9:41:19 AM
    Author     : HP
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${sessionScope.acc.isManager == 1}">
    <div class="nav-bar">
        <nav>
            <a href="Table" ${checked eq "order"? "id='checked'":""}>Manage Orders</a>
            <a href="DishManage" ${checked eq "dish"? "id='checked'":""}>Manage Dishes</a>
            <a href="Reserve" ${checked eq "reserve"? "id='checked'":""}>Manage Reservation</a>
            <a href="Account" ${checked eq "account"? "id='checked'":""}>Manage Account</a>
            <a href="" ${checked eq "revenue"? "id='checked'":""}>Manage Revenue</a>
        </nav>
    </div>
</c:if>
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
