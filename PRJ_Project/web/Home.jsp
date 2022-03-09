
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head lang="en">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chop Chop Restaurant</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Menu.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <div class="menu" style="background-color: white;">
                <nav>
                    <a  href="Home" id="active">Home</a>
                    <a  href="Manage">Manage</a>
                    <a  href="#newfood">Special Dishes</a>
                    <img src="Images/Logoo.png" alt="logo">
                    <a href="Menu">Menu</a>
                    <a href="Reservation">Reservation</a>
                    
                    <form action="Login" method="post">
                        <button class="button"type="submit" >Login</button>
                    </form>
                </nav>
            </div>
            <div class="adish">
                <div class="left col">
                    <div>
                        <h2>We Love <br>Delicious Foods!</h2>
                        <div class="pleft">
                            <a class="btn" href="Menu" role="button">Explore Menu</a>
                            <p>Call to order: 0582 642 654</p>
                        </div>

                        <table>
                            <tr>
                                <td>Fast Delivery</td>
                                <td>Fresh Food</td>
                                <td>24/7 Support</td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="right col">
                    <img src="Images/ban_ghe.jpg" alt="">
                </div>
            </div>
            <h3 id="newfood" style="color: palevioletred; text-align: center;
                font-family: serif; font-size: 2em;">New foods</h3>
            <div class="specialdish">
                <c:forEach items="${list}" var="o">
                    <div class="adish">
                        <img class="left col" src="${o.getImage()}" alt="">
                        <div class="right col">
                            <h3>${o.getPrice()}$</h3>
                            <p>${o.getName()}</p>
                            <p>${o.getDescription()}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>



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