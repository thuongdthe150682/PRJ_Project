<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="utf-8">
        <title>Login</title>
        <link href="Css/home.css" rel="stylesheet" type="text/css"/>
        <link href="Css/Login.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="container">
            <div class="login" style="background-color: antiquewhite;">
                <form action="Login" method="get">
                    <img src="Images/Logoo.png"><br>
                    <p style="color: crimson;">${message}</p>
                    Username:<input type="text" name="username"/><br>
                    Password:<input type="text" name="password"/><br>
                    <button class="button" type="submit" style="font-size: 1em;"
                            >Login</button>
                </form> 
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>