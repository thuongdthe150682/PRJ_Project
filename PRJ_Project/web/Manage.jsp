<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chop Chop Restaurant</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Manage.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <div class="menu" style="background-color: white;">
                <nav>
                    <a  href="Home">Home</a>
                    <a  href="Manage" id="active">Manage</a>
                    <a  href="SpecialDishes">Special Dishes</a>
                    <img src="Images/Logoo.png" alt="logo">
                    <a href="Menu">Menu</a>
                    <a href="Reservation">Reservation</a>
                    <form action="Login" method="post">
                        <button class="button"type="submit" >Login</button>
                    </form>
                </nav>
            </div>
            <div class="nav-bar">
                <nav>
                    <a href="" id="checked">Manage Dishes</a>
                    <a href="">Manage Orders</a>
                    <a href="">Manage Reservation</a>
                    <a href="">Manage Revenue</a>
                    
                </nav>
            </div>
             
            <table>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <td>Quantity</td>
                    <td>Total</td>
                </tr>
            </table>
            
            
            

            <footer class="footer">
                <div class="pfoot1">
                    <h6>
                        <img src="Images/Logoo.png" alt="">
                    </h6>
                    <p>
                        Welcome to our restaurant!<br> 
                        Wish you a delicious meal and<br> have
                        enjoyable relaxing moments in ChopChop.
                    </p>
                </div>
                <div class="pfoot2">
                    <h6>
                        Open Hours
                    </h6>
                    <table class="tableF">
                        <tr><td>Monday</td><td>9:00 - 24:00</td></tr>
                        <tr>
                            <td>Tuesday</td>
                            <td>9:00 - 24:00</td>
                        </tr>
                        <tr>
                            <td>Tuesday</td>
                            <td>9:00 - 24:00</td>
                        </tr>
                        <tr>
                            <td>Wednesday</td>
                            <td>9:00 - 24:00</td>
                        </tr>
                        <tr>
                            <td>Thursday</td>
                            <td>9:00 - 24:00</td>
                        </tr>
                        <tr>
                            <td>Friday</td>
                            <td>9:00 - 24:00</td>
                        </tr>
                        <tr>
                            <td>Saturday</td>
                            <td>9:00 - 24:00</td>
                        </tr>
                        <tr>
                            <td>Sunday</td>
                            <td>Closed</td>
                        </tr>
                    </table>
                </div>
                <div class="pfoot3">
                    <h6>
                        ChopChop
                    </h6>
                    <img src="Images/overview.jpg" alt="">
                    <p>Email : Thuongdthe150682@fpt.edu.vn</p>
                    <p>Address: 100 Hoang Mai, HN</p>
                    <p>Phone: 0582 642 654</p>
                </div>

            </footer>
        </div>
    </body>
</html>