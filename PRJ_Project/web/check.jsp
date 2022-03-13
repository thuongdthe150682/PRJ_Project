<%-- 
    Document   : check
    Created on : Mar 13, 2022, 11:10:05 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${id[0]}.${id[1]}.${id[2]}.${id[3]}<br>
        ${price[0]}.${price[1]}.${price[2]}.${price[3]}<br>
        ${quantity[0]}.${quantity[1]}.${quantity[2]}.${quantity[3]}<br>
        ${idTable}<br>
        ${orderId}<br>
        ------------------
        ${aa}
        ${list.size()}
        ${list.get(0).getDishId()}
        
        
    </body>
</html>
