<!--
author: Thisara
-->
<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">


    <?php
    $lang_EN = array("OPEN_ELECTIONS" => "", "OPENING_HOURS" => "Opening Hours", "SEND_US_A_MESSAGE" => "Send us a Message", "GIVE_US_A_CALL" => "Give us a Call");
    $lang_SI = array("OPEN_ELECTIONS" => "විවෘත මැතිවරණ", "OPENING_HOURS" => "විවෘත වේලාවන්", "SEND_US_A_MESSAGE" => "අපට පණිවිඩයක් එවන්න", "GIVE_US_A_CALL" => "අපිට කෝල් එකක් දෙන්න");
    $lang_TM = array("OPEN_ELECTIONS" => "திறந்த தேர்தல்  ", "OPENING_HOURS" => "தொடக்க நேரம் ", "SEND_US_A_MESSAGE" => "எங்களுக்கு ஒரு செய்தியை அனுப்புங்கள் ", "GIVE_US_A_CALL" => "எங்களுக்கு ஒரு அழைப்பு கொடுங்கள்");

    if (isset($_GET['lang'])) {

        if ($_GET['lang'] == 'SI') {
            $lang = $lang_SI;
        } else if ($_GET['lang'] == 'TM') {
            $lang = $lang_TM;
        } else if ($_GET['lang'] == 'EN') {
            $lang = $lang_EN;
        }
    } else {

        $lang = $lang_EN;
    }
    ?>


    <head>
        <title>Commu-V2</title>
        <!-- custom-theme -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Funding Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //custom-theme -->

        <?php include_once './basecss.php'; ?>

        <link rel="stylesheet" href="ism/css/my-slider.css"/>
        <script src="ism/js/ism-2.2.min.js"></script>


        <style type="text/css">
         
            
            @media screen and (min-width: 0px) and (max-width: 400px) {
  #commu-slider { display: none; }  /* show it on small screens */
}

@media screen and (min-width: 401px) and (max-width: 1024px) {
  #commu-slider { display: block; }   /* hide it elsewhere */
}


        </style>
        
        
        
    </head>	
    
    
    
    <body>
        <?php
        include './model/DB.php';
        include './model/UserModel.php';
        if (isset($_POST['btnLogin'])) {

            $flag = doLogin();

            if ($flag) {
                // echo 'User Found';
                header('Location:home.php');
            } else {

                echo '<p class="bg-danger msg-error">Invalid Username or Password</p>';
            }
        }
        ?>
        <!-- banner -->
        <div class="header">

            <div class="w3layouts_header_right">
                <div class="agileits-social top_content">
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#"><i class="fa fa-vk"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="w3layouts_header_left">
                <ul>
                    <li><a href="#" data-toggle="modal" data-target="#myModal2">Community Management System</a></li>
                    <!--<li><a href="#" data-toggle="modal" data-target="#myModal2"><i class="fa fa-user" aria-hidden="true"></i> Sign in</a></li>-->
                    <!--<li><a href="#" data-toggle="modal" data-target="#myModal3"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up </a></li>-->
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>



        <div class="banner">
            <nav class="navbar navbar-default">
                <div class="navbar-header navbar-left">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1><a class="navbar-brand" href="index.php"><span>C</span>OMMU</a></h1>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    <nav class="link-effect-2" id="link-effect-2">
                        <ul class="nav navbar-nav">
                            <?php include './_menu_common.php'; ?>
                            <!--                            <li class="dropdown">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span data-hover="Short Codes">Short Codes</span> <b class="caret"></b></a>
                                                            <ul class="dropdown-menu agile_short_dropdown">
                                                                <li><a href="icons.html">Web Icons</a></li>
                                                                <li><a href="typography.html">Typography</a></li>
                                                            </ul>
                                                        </li>-->
                            <!--<li><a href="#"><span data-hover="Mail Us">Mail Us</span></a></li>-->
                        </ul>
                    </nav>

                </div>
                <div class="w3_agile_search">
                    <?php
                    include '_search.php';
                    ?>
                </div>
            </nav>
        </div>



        <div class = "header_mid">
            <div class = "w3layouts_header_mid">
                <ul>
                    <li>
                        <div class = "header_contact_details_agile"><i class = "fa fa-envelope-o" aria-hidden = "true"></i>
                            <div class = "w3l_header_contact_details_agile">
                                <div class = "header-contact-detail-title"><?= $lang['SEND_US_A_MESSAGE'] ?></div>
                                <a href = "mailto:info@commu.com">info@commulk.com</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class = "header_contact_details_agile"><i class = "fa fa-phone" aria-hidden = "true"></i>
                            <div class = "w3l_header_contact_details_agile">
                                <div class = "header-contact-detail-title"><?= $lang['GIVE_US_A_CALL'] ?></div>
                                <a class = "w3l_header_contact_details_agile-info_inner"> 071-468-3414 </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class = "header_contact_details_agile"><i class = "fa fa-clock-o" aria-hidden = "true"></i>
                            <div class = "w3l_header_contact_details_agile">
                                <div class = "header-contact-detail-title"><?= $lang['OPENING_HOURS']; ?></div>
                                <a class = "w3l_header_contact_details_agile-info_inner">Mon - Sat: 7:00 - 18:00</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class = "header_contact_details_agile"><i class = "fa fa-map-marker" aria-hidden = "true"></i>
                            <div class = "w3l_header_contact_details_agile">
                                <div class = "header-contact-detail-title">POBOX 3007 Union Place</div>
                                <a class = "w3l_header_contact_details_agile-info_inner">Sri Lanka, Colombo 03 </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>






        <div class = "row">
            <div class = "col-md-8" id="commu-slider">
                <div class="ism-slider" id="my-slider">
                    <ol>
                        <li>
                            <img src="ism/image/slides/flower-729514_1280.jpg">
                            <div class="ism-caption ism-caption-0">Community Management</div>
                        </li>
                        <li>
                            <img src="ism/image/slides/beautiful-701678_1280.jpg">
                            <div class="ism-caption ism-caption-0">Social Activity</div>
                        </li>
                        <li>
                            <img src="ism/image/slides/summer-192179_1280.jpg">
                            <div class="ism-caption ism-caption-0">Child Protection Event</div>
                        </li>
                    </ol>
                </div>
            </div>




            <div class="col-md-4" style="padding: 10px">
                <div class="panel panel-primary" style="margin: 20px">
                    <div class="panel-heading ">Login</div>
                    <div class="panel-body">

                         <form action="index.php" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username</label>
                                <input type="text" name="username" class="form-control" id="exampleInputEmail1" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>

                             <input name="btnLogin" type="submit" class="btn btn-primary" value="Login" />
                        </form>

                    </div>
                </div>
            </div>
        </div>









        <!-- footer -->
        <?php include './_footer.php'; ?>
        <!-- //footer -->




        <!-- Modal1 -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                        <div class="signin-form profile">
                            <h3 class="agileinfo_sign">Sign In</h3>	
                            <div class="login-form">
                                <form action="index.php" method="post">
                                    <input type="text" name="username" placeholder="Username" required="">
                                    <input type="password" name="password" placeholder="Password" required="">
                                    <div class="tp">
                                        <input type="submit" name="btnLogin" value="Sign In">
                                    </div>
                                </form>
                            </div>
                            <div class="login-social-grids">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                </ul>
                            </div>
                            <!--<p><a href="#" data-toggle="modal" data-target="#myModal3" > Don't have an account?</a></p>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //Modal1 -->	
        <!-- Modal2 -->
        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                        <div class="signin-form profile">
                            <h3 class="agileinfo_sign">Sign Up</h3>	
                            <div class="login-form">
                                <form action="#" method="post">
                                    <input type="text" name="name" placeholder="Username" required="">
                                    <input type="email" name="email" placeholder="Email" required="">
                                    <input type="password" name="password" placeholder="Password" required="">
                                    <input type="password" name="password" placeholder="Confirm Password" required="">
                                    <input type="submit" value="Sign Up">
                                </form>
                            </div>
                            <p><a href="#"> By clicking register, I agree to your terms</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //Modal2 -->	

        <!-- //bootstrap-pop-up -->

        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <!-- //js -->
        <!-- Counter required files -->
        <script type="text/javascript" src="js/dscountdown.min.js"></script>
        <script src="js/demo-1.js"></script>
        <script>
            jQuery(document).ready(function ($) {
                $('.demo2').dsCountDown({
                    endDate: new Date("December 24, 2020 23:59:00"),
                    theme: 'black'
                });
            });
        </script>
        <!-- //Counter required files -->



        <script src="js/mainScript.js"></script>
        <script src="js/rgbSlide.min.js"></script>
        <!-- carousal -->
        <script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            $(document).on('ready', function () {
                $(".center").slick({
                    dots: true,
                    infinite: true,
                    centerMode: true,
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    responsive: [
                        {
                            breakpoint: 768,
                            settings: {
                                arrows: true,
                                centerMode: false,
                                slidesToShow: 2
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                arrows: true,
                                centerMode: false,
                                centerPadding: '40px',
                                slidesToShow: 1
                            }
                        }
                    ]
                });
            });
        </script>
        <!-- //carousal -->
        <!-- flexisel -->
        <script type="text/javascript">
            $(window).load(function () {
                $("#flexiselDemo1").flexisel({
                    visibleItems: 4,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint: 480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint: 640,
                            visibleItems: 2
                        },
                        tablet: {
                            changePoint: 768,
                            visibleItems: 2
                        }
                    }
                });

            });
        </script>
        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
        <!-- //flexisel -->
        <!-- gallery-pop-up -->
        <script src="js/lsb.min.js"></script>
        <script>
            $(window).load(function () {
                $.fn.lightspeedBox();
            });
        </script>
        <!-- //gallery-pop-up -->
        <!-- flexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    start: function (slider) {
                        $('body').removeClass('loading');
                    }
                });
            });
        </script>
        <!-- //flexSlider -->

        <!-- start-smooth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- start-smooth-scrolling -->
        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
        <!-- here stars scrolling icon -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
        </script>


        <!-- //here ends scrolling icon -->
    </body>
</html>