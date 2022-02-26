<!DOCTYPE html>
<html>
    <head lang="en">
        <meta charset="utf-8">
        <title>Chop Chop Restaurant</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
            integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link href="Css/styleindex.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <div class="container">
            <div class="menu" style="background-color: white;">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#"> </a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">About</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        Speacial Dishes
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#">Food</a></li>
                                        <li><a class="dropdown-item" href="#">Drink</a></li>
                                        <!-- <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li> -->
                                    </ul>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Menu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Reservation</a>
                                </li>
                            </ul>
                            <a class="navbar-brand navbar-brand-center d-flex align-items-center only-desktop " href="#">
                                <img src="Images/Logo.png" alt="logo">
                            </a>

                            <form class="d-flex">
                                <button class="btn btn-outline-success" type="submit">Login</button>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>

            <div class="row d-flex align-items-center">
                <div class="col-lg-6 hero-left">
                    <h1 class="display-4 mb-5">We Love <br>Delicious Foods!</h1>
                    <div class="mb-2">
                        <a class="btn btn-primary btn-shadow btn-lg" href="#" role="button">Explore Menu</a>
                        <a class="btn btn-icon btn-lg" href="https://player.vimeo.com/video/33110953" data-featherlight="iframe"
                            data-featherlight-iframe-allowfullscreen="true">
                            <span class="lnr lnr-film-play"></span>
                            Play Video
                        </a>
                    </div>
            
                    <ul class="hero-info list-unstyled d-flex text-center mb-0">
                        <li class="border-right">
                            <span class="lnr lnr-rocket"></span>
                            <h5>
                                Fast Delivery
                            </h5>
                        </li>
                        <li class="border-right">
                            <span class="lnr lnr-leaf"></span>
                            <h5>
                                Fresh Food
                            </h5>
                        </li>
                        <li class="">
                            <span class="lnr lnr-bubble"></span>
                            <h5>
                                24/7 Support
                            </h5>
                        </li>
                    </ul>
            
                </div>
                <div class="col-lg-6 hero-right">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="Images/hero-1.jpg" class="d-block w-100" alt="">
                        </div>
                        <div class="carousel-item">
                            <img src="Images/hero-2.jpg" class="d-block w-100" alt="">
                        </div>
                        <div class="carousel-item">
                            <img src="Images/hero-3.jpg" class="d-block w-100" alt="">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="text-center text-lg-start bg-light text-muted">
                
                <!-- Section: Links  -->
                <section class="">
                    <div class="container text-center text-md-start mt-5">
                        <!-- Grid row -->
                        <div class="row mt-4">
                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                                <!-- Content -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    <img src="Images/Logo.png" alt="">
                                </h6>
                                <p>
                                    Welcome to our restaurant! Wish you a delicious meal and have enjoyable relaxing moments in ChopChop.
                                </p>
                                <nav class="nav nav-mastfoot justify-content-start">
                                    <a class="nav-link" href="#">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a class="nav-link" href="#">
                                        <i class="fab fa-google"></i>
                                    </a>
                                    <a class="nav-link" href="#">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                    <a class="nav-link" href="#">
                                        <i class="fab fa-github"></i>
                                    </a>
                                </nav>
                            </div>
                            <!-- Grid column -->
            
                            <!-- Grid column -->
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
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
                            <!-- Grid column -->
            
                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Useful links
                                </h6>
                                <p>
                                    <a href="#!" class="text-reset">Pricing</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Settings</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Orders</a>
                                </p>
                                <p>
                                    <a href="#!" class="text-reset">Help</a>
                                </p>
                            </div>
                            <!-- Grid column -->
            
                        </div>
                        <!-- Grid row -->
                    </div>
                </section>
             
            </footer>
            <!-- Footer -->
            </div>






        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
        
    </body>
</html>