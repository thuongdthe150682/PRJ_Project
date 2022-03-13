

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
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="Aorder">
                <h5 class="add_table">Order ${orderId}: Table ${table.getName()}</h5>
            <form action="ConfirmAddOrder" method="post">
                <p style="margin-left: 5%;">Payment:</p>
                <table class="table" style="margin-left: 5%;">
                    <tbody>
                        <c:forEach var="i" begin="0" end="${list.size()-1}" >
                            <tr>
                                <td style="margin-left: 0.5em;">${list.get(i).getDishId()}.${listDish.get(i).getName()}</td>
                                <td>${list.get(i).getPrice()}</td>
                                <td>${list.get(i).getQuantity()}</td>
                                <td>${payment[i]}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>  
                            <td></td> 
                            <td>Total</td> 
                            <td>${total}</td> 
                        </tr>
                    </tbody>
                </table>
                <br>
                <a class="button"style="margin-left: 60%;" href="ConfirmFixOrder?orderId=${orderId}&tableID=${table.getID}">Delete</a>
                <a class="button" href="FixOrder?orderId=${orderId}">Fix</a>
                <input class="tablee" type="text" name="orderId" value="${orderId}" readonly />
                <button class="button" type="submit" >Done</button>   
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>