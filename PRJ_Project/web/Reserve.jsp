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
        <title>Reserve</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/reserve.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <style>
        .close{
            padding: 0.2em 0.5em 0.2em 0.5em;
        }
        .close,.buttonn{
            text-decoration: none;
            color: white;
            background-color: crimson;
            font-size: 1em;
            margin-top: 3px;
            
        }
        .close:hover,.buttonn:hover{
            background-color: brown;
        }
    </style>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <c:if test="${sessionScope.acc.isManager == 1}">
         <jsp:include page="Tables.jsp"></jsp:include>
        </c:if>
        ${message}
        <div class="adish">
            <div class="rleft col">
                <c:if test="${!listN.isEmpty()}">
                    <h6 style="color: black;">Not Yet Reserved</h6>
                    <!--table_reserve-->
                    <table class="table">
                        <thead>
                            <tr style="background-color: black;">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>People</th>
                                <th>Message</th>
                                <th>Phone</th>
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
                                    <td>${o.getStaff()}</td>
                                    <td><a href="Reserve?id=${o.getId()}"><i class='fas fa-pen' style="color: green;"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>


                <c:if test="${!listD.isEmpty()}">
                    <h6 style="color: black;">Done Reservation</h6>
                    <table class="table" name="Not_yet">
                        <thead>
                            <tr style="background-color: black;">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>People</th>
                                <th>Message</th>
                                <th>Phone</th>
                                <th>Staff</th>
                                <th></th>
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
                                    <td><a href="Reserve?id=${o.getId()}"><i class='fas fa-pen' style="color: green;"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
            <c:if test="${reserve !=null}">
                <div style="margin-left: 5%;" class="rright col" >
                    <h6 class="reservation">Edit</h6>
                    <form action="editReservation" method="get">
                        <input type="text" value="${reserve.getId()}" name="id" readonly><br>
                        <input type="text" value="${reserve.getName()}" name="name"><br>
                        <input type="date" value="${reserve.getDate()}" name="date"><br>
                        <input type="time" value="${reserve.getTime()}" name="time"><br>
                        <input type="number" value="${reserve.getNumber_People()}" name="number"><br>
                        <input type="text" value="${reserve.getPhone()}" name="phone" readonly><br>
                        <input class="area"type="textbox" name="message">${reserve.getMesage()}<br>
                        <c:if test="${messageEdit == 'Edit Successfully.'}">${messageEdit}</c:if>
                        <c:if test="${messageEdit != 'Edit Successfully.'}">
                            <button class="buttonn" type="submit">Done</button>
                            <a class="close" href="Reserve">Close</a>
                        </c:if>

                    </form>
                </div>
            </c:if>

        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
