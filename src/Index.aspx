<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NYC Restaurant Locator</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top" onclick="$(#menu-close).click();">Welcome</a>
            </li>
            <li>
                <a href="#top" onclick="$(#menu-close).click();">Home</a>
            </li>
            <li>
                <a href="#about" onclick="$(#menu-close).click();">About</a>
            </li>
            <li>
                <a href="#services" onclick="$(#menu-close).click();">Services</a>
            </li>

            <li>
                <a href="#contact" onclick="$(#menu-close).click();">Contact</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
            <h1>New York Restaurants Locator</h1>
            <br>
            <a href="#about" class="btn btn-dark btn-lg">Explore more!!</a>
        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="abt" style="font-size: 38px; text-align: center; font-family: cursive; /* font-style: inherit; */">
                About Us
            </div>
            <br>
            New York Restaurant Locator helps the users to find the right restaurant in the New York city.
          This application provides the user to insert/update/delete the information of the hotels.
          User can also locate the restaurants on map and get the directions from the given address.Users can view all the restaurants in and around New york city

            <br>
            <br>
            <br>
            <br>
            <div>
                <img src="img/pizza3.png">
                <img src="img/dessert4.png">
                <img src="img/drink24.png">
                <img src="img/plate7.png">
                <img src="img/turkey7.png">
                <img src="img/wine65.png">
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                </div>
                <!-- /.row -->
            </div>
            <div></div>
            <div></div>
        </div>
        <!-- /.container -->
    </section>
    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2 style="font-family: cursive; color: green;">Our Services</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="http://localhost:5354/SearchWithinList.aspx" target="_blank">
                                    <img class="img-portfolio img-responsive" src="img/img5.jpg">
                                    <div class="service_description">

                                        <p class="description_content">Search</p>
                                </a>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="portfolio-item">
                            <a href="http://localhost:5354/InsertRestaurants.aspx" target="_blank">
                                <img class="img-portfolio img-responsive" src="img/img2.jpg">
                                <div class="service_description">

                                    <p class="description_content">Insert</p>
                               
                            </a>

                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="portfolio-item">
                        <a href="http://localhost:5354/UpdateRestaurants.aspx" target="_blank">
                            <img class="img-portfolio img-responsive" src="img/img3.jpg">
                            <div class="service_description">

                                <p class="description_content">Update & delete</p>
                           
                        </a>

                    </div>
                </div>
            </div>




            <div class="col-md-6">
                <div class="portfolio-item">
                    <a href="http://localhost:5354/ViewRestaurants.aspx" target="_blank">
                        <img class="img-portfolio img-responsive" src="img/img7.jpg">
                        <div class="service_description">
                            <p class="description_content">View</p>
                        </div>
                    </a>

                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="portfolio-item">
                <a href="http://localhost:5354/SearchWithinDistance.aspx" target="_blank">
                    <img class="img-portfolio img-responsive" src="img/img4.jpg">
                    <div class="service_description">

                        <p class="description_content">Search within your area</p>
                    </div>
                </a>

            </div>
        </div>

    </section>

    <!-- Call to Action -->


    <!-- Map -->
    <section id="contact" class="map">
        <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3007.6626764950042!2d-81.51244218458385!3d41.07636557929398!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x883129d8ef8c276f%3A0x66f09fc09aa9c6d2!2sThe+University+of+Akron!5e0!3m2!1sen!2sus!4v1448909191762output=embed"></iframe>
        <br />
        <small>
            <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
        </small>

    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Krishna Chaitanya & Sri Kavya</strong>
                    </h4>
                    <p>
                        77 FIRHILL ST APT 9B12<br>
                        AKRON, OH 44304
                    </p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i>(234) 716-3645</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i><a href="mailto:sg156@zips.uakron.edu">sg156@zips.uakron.edu</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="https://www.facebook.com/chaitanya.chaithu"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy;The University of Akron 2015</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
        // Closes the sidebar menu
        $("#menu-close").click(function (e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });

        // Opens the sidebar menu
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });

        // Scrolls to the selected menu item on the page
        $(function () {
            $('a[href*=#]:not([href=#])').click(function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 1000);
                        return false;
                    }
                }
            });
        });
    </script>

</body>

</html>
