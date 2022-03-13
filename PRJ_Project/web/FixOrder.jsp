
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FixOrder.jsp</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/addOrder.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        

        <div class="Aorder">
            <h5 class="add_table">${table.getName()} Order:${orderId}</h5>
            <form action="ConfirmFixOrder" method="post">
                <table class="table" style="margin-left: 5%;">
                    <tbody>
                        <c:forEach var="i" begin="0" end="${listDish.size()-1}" >
                            <tr>
                                <td><input class ="a" type="checkbox" checked name="chose" value="${listDish.get(i).getId()}" /></td>
                                <td style="margin-left: 0.5em;">${listDish.get(i).getId()}.${listDish.get(i).getName()}</td>
                                <td>${listD.get(i).getPrice()}</td>
                                <td>${listD.get(i).getQuantity()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <h5 class="add_table">Add:</h5>
                <c:forEach items="${listOtherDishes}" var="o">
                    <c:if test="${o.getList() != null}">
                        <h6 class="cate">${o.getName()}</h6>
                        <table class="table" style="margin-left: 5%;">
                            <tbody>
                                <c:forEach  var="d" items="${o.getList()}">
                                    <tr>
                                        <td><input class ="a" type="checkbox" name="chose" value="${d.getId()}" /></td>
                                        <td style="margin-left: 0.5em;">${d.getId()}.${d.getName()}</td>
                                        <td>${d.getPrice()}$</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <br>
                    </c:if>
                </c:forEach>
                <br>
                <input class ="tablee" type="text" name="table" value="${table.getId()}" readonly />
                <input class ="tablee" type="text" name="orderId" value="${orderId}" readonly />
                <button class="btn" type="submit" >Add</button>   
            </form>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

