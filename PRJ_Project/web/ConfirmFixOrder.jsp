<%-- 
    Document   : ConfirmOrder
    Created on : Mar 12, 2022, 9:24:37 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ConfirmFixOrder.jsp</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>
        <link href="Css/confirmOrder.css" rel="stylesheet" type="text/css"/>
    </head>
   <style>
         table tr:nth-child(odd){
            background-color: beige;
        }
         table tr:nth-child(odd){
            background-color: #f2f2f2;
        }
        
        input{
            font-size: 0.7em;
            border: none;
            background-color: inherit;
        }
        .buttonn{
            font-size: 0.8em;
            background-color: crimson;
            padding: 0.4em 0.6em;
            border-radius: 0.8em;
            color: #ffffff;
        }
        .buttonn:hover{
            background-color:firebrick;
        }
        
    </style>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <h5>Add ${table.getName()}</h5>
        <c:if test="${list.size()==0}">
            <p class="message">${message}</p>
        </c:if>
        <c:if test="${list.size()>0}">
        <form action="ConfirmFixOrder" method="post">
            <input type="text" class="tablee" value="${table.getId()}" readonly>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price($)</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" begin="0" end="${list.size()-1}">
                        <tr>
                            <td><input class="input" type="text" name="id" value="${list.get(i).getId()}" readonly/></td>
                            <td><input class="input" type="text" name="name" value="${list.get(i).getName()}" readonly/></td>
                            <td><input class="input" type="number" name="price" value="${listO.get(i).getPrice()}"/></td>
                            <td><input class="input" type="number" name="quantity" value="${listO.get(i).getQuantity()}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input class="tablee" type="text" name="table" value="${table.getId()}" readonly/>
            <input class="tablee" type="text" name="orderId" value="${orderId}" readonly/>
            <button class="buttonn" type="submit" onclick="aa()">Fix Order</button>
        </form>
        </c:if>

        <jsp:include page="Footer.jsp"></jsp:include>
<!--        <script>
            function aa() {
                window.alert("Are you sure to add Orders.");
            }
        </script>-->
    </body>
</html>
