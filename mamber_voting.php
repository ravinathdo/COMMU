<!--
author: Thisara
 
  
  
-->
<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Commu | Template</title>
        <!-- custom-theme -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Funding Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //custom-theme -->

        <?php include_once './basecss.php'; ?>

    </head>	
    <body>
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
                <?php include './_top.php'; ?>
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
                    <h1><a class="navbar-brand" href="index.html"><span>C</span>OMMU</a></h1>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    <?php include './_menu.php'; ?>

                </div>
                <div class="w3_agile_search">
                    <form action="#" method="post">
                        <input type="search" name="Search" placeholder="Search Keywords..." required="" />
                        <input type="submit" value="Search">
                    </form>
                </div>
            </nav>
        </div>



        <div class="row">
            <div class="col-md-3"> </div>
            <div class="col-md-6">
                <h2>Election Details</h2>
                <hr>
                <?php
                include './model/DB.php';
                $electionTitle = $_GET['election'];
                $eid = $_GET['eid'];
                $post_title = $_GET['post_title'];
                echo '<h1> ' . $electionTitle . '</h1>';
                echo '<h2> ' . $post_title . '</h2>';
                ?>





                <?php
                //is  member voted 
                $VT = FALSE;
                $sqlMemVote = " SELECT * FROM cms_member_election WHERE member_id = " . $_SESSION['ssn_user']['id'] . " AND election_id = $eid ";
                $resultVote = getData($sqlMemVote);
                if ($resultVote != FALSE) {
                    while ($row = mysqli_fetch_assoc($resultVote)) {
                        $VT = TRUE;
                    }
                }

                if ($VT) {
                    echo '<p style="color: red">You Already Vote On this</p>';
                } else {
                    //set member vote 
                    //get member vote


                    if (isset($_GET['action'])) {

                        $v = $_GET['vote'] + 1;
                        $sqlUpMV = "UPDATE cms_election_vote SET vote = $v WHERE id = '" . $_GET['id'] . "' ";
                        setUpdate($sqlUpMV, FALSE);
                        $sqlIn = " INSERT INTO `cms_member_election`
            (`member_id`,
             `election_id`)
VALUES ('" . $_SESSION['ssn_user']['id'] . "',
        '" . $_GET['id'] . "'); ";

                        setData($sqlIn, TRUE);
                    }
                }
                ?>


                <table id="example" class="display" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Member ID</th>
                            <th>Name</th>
                            <th>Votes</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
//get member list
                        $sqlM = " SELECT cms_election_vote.*,cms_member.username,cms_member.firstname,cms_member.lastname FROM cms_election_vote
INNER JOIN cms_member
ON cms_election_vote.memberid = cms_member.id
WHERE electionid =  " . $eid;

                        $resultx = getData($sqlM);
                        if ($resultx != FALSE) {
                            while ($row = mysqli_fetch_assoc($resultx)) {
                                ?>

                                <tr>
                                    <td><?= $row['username']; ?></td>
                                    <td><?= $row['firstname']; ?> <?= $row['lastname']; ?></td>
                                    <td><?= $row['vote']; ?></td>
                                    <td><?php if (!$VT) { ?>
                                            <a href="mamber_voting.php?eid=<?= $eid ?>&username=<?= $row['username']; ?>&post_title=<?= $post_title ?>&election=<?= $electionTitle ?>&vote=<?= $row['vote'] ?>&id=<?= $row['id'] ?>&action=VOTE">Set Vinner</a></td>
                                    <?php } ?>
                                </tr>
                                <?php
                            }
                        }
                        ?>
                    </tbody>
                </table>

            </div>
            <div class="col-md-3"> </div>
        </div>









        <!-- footer -->
        <div class="footer_agile_w3ls">
            <div class="container">
                <div class="agileits_w3layouts_footer_grids">
                    <div class="col-md-3 footer-w3-agileits">
                        <h3>Training Grounds</h3>
                        <ul>
                            <li>Etiam quis placerat</li>
                            <li>the printing</li>
                            <li>unknown printer</li>
                            <li>Lorem Ipsum</li>
                        </ul>
                    </div>
                    <div class="col-md-3 footer-agileits">
                        <h3>Specialized</h3>
                        <ul>
                            <li>the printing</li>
                            <li>Etiam quis placerat</li>
                            <li>Lorem Ipsum</li>
                            <li>unknown printer</li>
                        </ul>
                    </div>
                    <div class="col-md-3 footer-wthree">
                        <h3>Partners</h3>
                        <ul>
                            <li>unknown printer</li>
                            <li>Lorem Ipsum</li>
                            <li>the printing</li>
                            <li>Etiam quis placerat</li>
                        </ul>
                    </div>

                    <div class="col-md-3 footer-agileits-w3layouts">
                        <h3>Our Links</h3>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="about.html">About</a></li>
                            <li><a href="events.html">Events</a></li>
                            <li><a href="mail.html">Contact</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>

                </div>
                <div class="agileits_w3layouts_logo logo2">
                    <h2><a href="index.html">Funding</a></h2>
                    <div class="agileits-social">
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            <li><a href="#"><i class="fa fa-vk"></i></a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <div class="wthree_copy_right">
            <div class="container">
                <p>© 2017 All rights reserved | Design by COMMU</p>
            </div>
        </div>
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
                                <form action="#" method="post">
                                    <input type="email" name="email" placeholder="E-mail" required="">
                                    <input type="password" name="password" placeholder="Password" required="">
                                    <div class="tp">
                                        <input type="submit" value="Sign In">
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
                            <p><a href="#" data-toggle="modal" data-target="#myModal3" > Don't have an account?</a></p>
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

        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>