
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
    <style>
        .buttonn{
            margin-top: 1em;
            font-size: 1em;
            margin-left: 45%;
            color: white;
            background-color: crimson;
        }
        .buttonn:hover{
            background-color: brown;
        }
        
        .closee{
            padding: 0.2em 0.5em 0.2em 0.5em;
        }
        .buttonn2{
            border-color: khaki;
        }
        .closee,.buttonn2{
            text-decoration: none;
            color: black;
            background-color: khaki;
            font-size: 1em;
            margin-top: 3px;
            
        }
        .closee:hover,.buttonn2:hover{
            background-color: gold;
            border-color: gold;
        }
    </style>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <jsp:include page="Tables.jsp"></jsp:include>
        <div class="Aorder">
            <p style="color: crimson; margin-left: 5%;" >${message}</p>
            <form action="UpdateAccount" method="get">
                <c:if test="${list.size() >0}">
                    <table class="table" style="margin: 0 auto;">
                        <thead>
                        <th></th>
                        <th>UserName</th>
                        <th>Password</th>
                        <th></th>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o">
                                <tr>
                                    <td style="margin-left: 0.5em;">${o.getUsername()}</td>
                                    <td style="margin-left: 0.5em;">${o.getPassword()}</td>
                                    <c:if test="${o.getIsManager() == 1 }">
                                        <td>Manager</td>
                                    </c:if>
                                    <c:if test="${o.getIsManager() == 0 }">
                                        <td>Staff</td>
                                    </c:if>
                                        <td>
                                        <a href="UpdateAccount?user=${o.getUsername()}&task=update"><i class='fas fa-pen' style="color: green;"></i></a>
                                        <a href="UpdateAccount?user=${o.getUsername()}&task=delete"
                                           onclick="return confirm('Are you sure you want to Delete this Account?');"><i class='fas fa-trash-alt' style="color: crimson;"></i></a>
                                        <a href="UpdateAccount?user=${o.getUsername()}&task=see"><i class='far fa-eye' style="color: graytext;"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <input class ="tablee" type="text" name="task" value="add" readonly />
                <button class="buttonn" type="submit" >Add An Account</button>   
            </form>
        </div>
        <jsp:include page="UpdateAccount.jsp"></jsp:include>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

