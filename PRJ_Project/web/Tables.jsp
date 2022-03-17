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
            <a href="Benefit" ${checked eq "revenue"? "id='checked'":""}>Manage Revenue</a>
        </nav>
    </div>
</c:if>
