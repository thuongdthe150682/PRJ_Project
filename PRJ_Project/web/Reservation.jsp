<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="utf-8">
        <title>Chop Chop Restaurant</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Reservation.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <div class="menu" style="background-color: white;">
                <nav>
                    <a  href="#" >Home</a>
                    <a  href="#">Manage</a>
                    <a  href="#">Special Dishes</a>
                    <img src="Images/Logoo.png" alt="logo">
                    <a href="#">Menu</a>
                    <a href="#" id="active">Reservation</a>
                    <form action="Home" method="">
                        <button class="button"type="submit" >Login</button>
                    </form>
                </nav>
            </div>
            <div class="form">
                <div class="pform">
                    <h6>Reservation</h6>
                    <h2>Book Now</h2>
                    <form action="" method="">
                        <input type="text" placeholder="Name" name="name"><br>
                        <input type="email" placeholder="Email" name="email"><br>
                        <input type="date" placeholder="Date" name="date">
                        <input type="time" placeholder="Time" name="time"><br>
                        <input type="number" placeholder="Number of People" name="number"><br>
                        <input class="area"type="textbox" placeholder="Your message" name="message"><br>
                        <button class="button" type="submit">Send Messsage</button>
                    </form>
                </div>

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