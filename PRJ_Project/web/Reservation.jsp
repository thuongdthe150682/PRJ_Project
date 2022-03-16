


<%@taglib uri="/WEB-INF/tlds/mytag.tld" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="utf-8">
        <title>Reservation</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Reservation.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="form">
                <div class="pform">
                    <h6>Reservation</h6>
                    <h2>Book Now</h2>
                    <form action="Reservation" method="post">
                        <input type="text" placeholder="Name" name="name"><br>
                        <input type="text" placeholder="Phone" name="phone"><br>
                        <input type="date" min=<m:NewTagHandler/> placeholder="Date" name="date">
                        <input type="time" placeholder="Time" name="time"><br>
                        <input type="number" min="1" placeholder="Number of People" name="number"><br>
                        <input class="area"type="textbox" placeholder="Your message" name="message"><br>
                        <p style="font-size: 0.6em; color: crimson;">${message}</p>
                        <button class="button" type="submit">Send Messsage</button>
                    </form>
                </div>

            </div>
            
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>