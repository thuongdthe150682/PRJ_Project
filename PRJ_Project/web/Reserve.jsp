<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Reserve
    Created on : Mar 11, 2022, 8:52:11 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/reserve.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        ${message}
        <div class="adish">
            <div class="rleft col">
                <c:if test="${!listN.isEmpty()}">
                    <h6 class="reservation">Not Yet Reservation</h6>
                    <table class="table_reserve">
                        <thead>
                            <tr style="background-color: gainsboro;">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>People</th>
                                <th>Message</th>
                                <th>Phone</th>
                                <th>Edit</th>
                                <th>Staff</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listN}" var="o" varStatus="loop">
                                <tr <c:if test="${loop.index == requestScope.id }"> 
                                        style="background-color:papayawhip;"</c:if>>
                                    <td>${o.getId()}</td>
                                    <td>${o.getName()}</td>
                                    <td>${o.getDate()}</td>
                                    <td>${o.getTime()}</td>
                                    <td>${o.getNumber_People()}</td>
                                    <td>${o.getMesage() }</td>
                                    <td>${o.getPhone()}</td>
                                    <td><a href="Reserve?id=${o.getId()}">Edit</a></td>
                                    <td>${o.getStaff()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>


                <c:if test="${!listD.isEmpty()}">
                    <h6 class="reservation">Done Reservation</h6>
                    <table class="table_reserve" name="Not_yet">
                        <thead>
                            <tr style="background-color: gainsboro;">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>People</th>
                                <th>Message</th>
                                <th>Phone</th>
                                <th>Staff</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listD}" var="o" varStatus="loop">
                                <tr<c:if test="${loop.index % 2 eq 0}"> 
                                        style="background-color:papayawhip;"</c:if>>
                                    <td>${o.getId()}</td>
                                    <td>${o.getName()}</td>
                                    <td>${o.getDate()}</td>
                                    <td>${o.getTime()}</td>
                                    <td>${o.getNumber_People()}</td>
                                    <td>${o.getMesage() }</td>
                                    <td>${o.getPhone()}</td>
                                    <td>${o.getStaff()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
            <div class="rright col" >
                <h6 class="reservation">Edit</h6>
                <form action="editReservation" method="post">
                    <input type="text" value="id" name="ID" readonly><br>
                    <input type="text" value="Name" name="name"><br>
                    <input type="date" value="Date" name="date"><br>
                    <input type="time" value="Time" name="time"><br>
                    <input type="number" value="Number of People" name="number"><br>
                    <input type="text" value="Phone" name="phone" readonly><br>
                    <input class="area"type="textbox" placeholder="Your message" name="message"><br>
                    <button class="button" type="submit">Done</button>
                </form>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
