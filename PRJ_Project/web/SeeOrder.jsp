

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>See Order</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
        <link href="Css/confirmOrder.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        .a{
            clear: both;
            padding: 0.5em 1em 0.5em 1em;
            font-size: 0.7em;
            background-color: greenyellow;
            margin-top: 20em;
            text-decoration: none;
            color: black;
            margin-left: 5%;
            margin-bottom: 10em;
            border-radius: 2em;
            font-family: cursive;
        }
        .a:hover{
            background-color: yellow;
        }
    </style>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <br>
            <a class="a" href="Manage">Back</a>
            
            <h5 style="font-size: 0.9em;margin-left: 5%; text-align: left; color: blue;">Order ${orderId}</h5>
            <div class="Aorder">
            <form action="ConfirmAddOrder" method="post">
                <p style="margin-left: 5%;">Payment:</p>
                <c:if test="${list.size() > 0}">
                <table class="table" style="margin-left: 5%;">
                    <tbody>
                        <c:forEach var="i" begin="0" end="${list.size()-1}" >
                            <tr>
<!--                                <td><input type="checkbox" name="chose" value="${d.getId()}" checked /></td>
                                <td style="margin-left: 0.5em;">${list.get(i).getDishId()}.${listDish.get(i).getName()}</td>
                                <td><input type="number" min="0" name="price" value="${list.get(i).getPrice()}" /></td>
                                <td><input type="number" min="0" name="quantity" value="${list.get(i).getQuantity()}" /></td>
                                <td>${payment[i]}$</td>-->
                                <td style="margin-left: 0.5em;">${list.get(i).getDishId()}.${listDish.get(i).getName()}</td>
                                <td>${list.get(i).getPrice()}</td>
                                <td>${list.get(i).getQuantity()}</td>
                                <td>${payment[i]}$</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>  
                            <td></td> 
                            <td>Total</td> 
                            <td>${total}$</td> 
                        </tr>
                    </tbody>
                </table>
                </c:if>
                
                <c:if test="${task != 'see'}">
                <!--<a class="button"style="margin-left: 60%;" href="ConfirmFixOrder?orderId=${orderId}&tableID=${table.getId()}">Delete</a>-->
                <a class="button a" style="margin-left: 40%; text-decoration: none; color: black;" href="FixOrder?orderId=${orderId}">Fix</a>
                
                <input class="tablee" type="text" name="orderId" value="${orderId}" readonly />
                <button class="button a"  type="submit" >Paid</button> 
                <a class="button a" style=" text-decoration: none; color: black;" href="Manage">Back</a>
                <br>
                </c:if>
                
                <br>
                
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>