
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Addorder.jsp</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>

    </head>
    <style>
        .a{
            font-size: 0.7em;
            background-color: inherit;
            border: none;
        }
    </style>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="Aorder">
                <form style="margin-left: 5%;" action="AddOrder" method="post">
                    <p style="font-size: 1.2em; font-weight: bold;margin-left: 40%;">    
                 Table: <select style="font-size: 0.7em;margin-top: 2em;" name="table">
                <c:forEach items="${listT}" var="o">
                    <option value="${o.getId()}">${o.getName()}</option>
                </c:forEach>
                </select>
                 </p>
                <c:forEach items="${list}" var="o">
                    <c:if test="${o.getList() != null}">
                        <h6 class="cate">${o.getName()}</h6>
                        <table class="table" style="margin-left: 5%;">
                            <tbody>
                                <c:forEach  var="d" items="${o.getList()}">
                                    <tr>
                                        <td><input class ="a" type="checkbox" name="chose" value="${d.getId()}" /></td>
                                        <td style="margin-left: 0.5em;">${d.getId()}.${d.getName()}</td>
                                        <td><input class ="a" type="number" min="0" name="price" value="${d.getPrice()}" /></td>
                                        <td><input class ="a" type="number" min="0" name="quantity" value="1" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br>
                    </c:if>
                </c:forEach>
                <br>
                <!--<input class ="tablee" type="text" name="table" value="${table.getId()}" readonly />-->
                <button class="btn" type="submit" >Add</button>   
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

