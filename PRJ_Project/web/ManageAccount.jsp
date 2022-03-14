
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ManageAccount.jsp</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
        <link href="Css/confirmOrder.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="nav-bar">
                <nav>
                    <a href="Table" ${checked eq "order"? "id='checked'":""}>Manage Orders</a>
                <a href="DishManage" ${checked eq "dish"? "id='checked'":""}>Manage Dishes</a>
                <a href="Reserve" ${checked eq "reserve"? "id='checked'":""}>Manage Reservation</a>
                <a href="Account" ${checked eq "account"? "id='checked'":""}>Manage Account</a>
                <a href="" ${checked eq "revenue"? "id='checked'":""}>Manage Revenue</a>
            </nav>
        </div>
        <div class="Aorder">
            ${message}
            <form action="UpdateAccount" method="get">
                <c:if test="${list.size() >0}">
                    <table class="table" style="margin-left: 5%;">
                        <thead>
                        <th></th>
                        <th>UserName</th>
                        <th>Password</th>
                        <th></th>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o">
                                <tr>
                                    <td>
                                        <a href="UpdateAccount?user=${o.getUsername()}&task=update"><i class='fas fa-pen' style="color: black;"></i></a>
                                        <a href="UpdateAccount?user=${o.getUsername()}&task=delete"
                                           onclick="return confirm('Are you sure you want to Delete this Account?');"><i class='fas fa-trash-alt' style="color: black;"></i></a>
                                        <a href="UpdateAccount?user=${o.getUsername()}&task=see"><i class='far fa-eye' style="color: black;"></i></a>
                                    </td>
                                    <td style="margin-left: 0.5em;">${o.getUsername()}</td>
                                    <td style="margin-left: 0.5em;">${o.getPassword()}</td>
                                    <c:if test="${o.getIsManager() == 1 }">
                                        <td>Manager</td>
                                    </c:if>
                                    <c:if test="${o.getIsManager() == 0 }">
                                        <td>Staff</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <input class ="tablee" type="text" name="task" value="add" readonly />
                <button class="addanA" type="submit" >Add An Account</button>   
            </form>
        </div>
        <jsp:include page="UpdateAccount.jsp"></jsp:include>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

