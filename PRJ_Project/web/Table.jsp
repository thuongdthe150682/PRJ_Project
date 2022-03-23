

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
        <link href="Css/ManageDish.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <style>
        .add{

            text-decoration: none;
            color: black;
            background-color: greenyellow;
        }
        .add:hover{
            color: palevioletred;
        }
        .buttonn{
            background-color: greenyellow;
            border-color: greenyellow;
            border-radius: 1em;
            margin-top: 20px;
            margin-bottom: 0;
            margin-left: 45%;
        }
        .buttonn:hover{
            background-color: yellow;
            border-color: yellow;
        }
    </style>

    <body>
        <jsp:include page="Header.jsp"></jsp:include>

        <jsp:include page="Tables.jsp"></jsp:include>
        <!--<p class="message">${message}</p>-->
        <form action="AddOrder">
            <button class="buttonn">Add an order</button>
        </form>
<!--<p class="add"><a href="AddOrder?orderid=${o.getId()}">Add an order</a></p>-->
        <table class="table" style="margin-top: 2em;margin-bottom: 1em;">
            <thead>
                <tr>
                    <th>OrderID</th>
                    <th>Date</th>
                    <th>Table</th>
                    <th>Start Time </th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="o" items="${list}">
                    <tr>
                        <td>${o.getId()}</td>
                        <td>${o.getDate()}</td>
                        <td>TableA${o.getTable()}</td>
                        <td>${o.getStartime()}</td>
                        <c:if test="${o.getStatus()== '1'}">
                            <td><a href="UpdateOrder?orderid=${o.getId()}&task=see"><i class='far fa-eye' style="color: crimson;"></i></a></td>
                            <!--<td><i class='far fa-eye' style="color: graytext;"></i></td>-->
                            <!--<td><a href="AddOrder?orderid=${o.getId()}"><i style="color: green" class='fas fa-plus'></i></a></td>-->
                        </c:if>
                        <c:if test="${o.getStatus()=='0'}">
                            <!--                            <td><i  style="color: crimson" class='fas fa-file-alt'></i></i></td>-->
                            <td><a href="UpdateOrder?orderid=${o.getId()}"><i  style="color: green" class='fas fa-edit'></i></a>
                                <a  href="ConfirmFixOrder?orderId=${o.getId()}&tableID=${o.getTable()}"
                                    onclick="return confirm('Are you sure you want to Delete this Account?');"><i class='fas fa-trash-alt' style="color: crimson;"></i></a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
