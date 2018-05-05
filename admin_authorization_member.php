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
                    <nav class="link-effect-2" id="link-effect-2">
                        <?php include './_menu.php'; ?>
                    </nav>

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




            <div class="col-md-12">




                <?php
                include './model/DB.php';
                if (isset($_POST['btnReg'])) {

                    $sql = " INSERT INTO `cms_member`
            (`firstname`,
             `lastname`,
             `nic`,
             `email`,
             `currentaddress`,
             `experticeid`,
             `permanentaddress`,
             `authstatus`,
             `role`,
             `usercreated`)
VALUES ('" . $_POST['firstname'] . "',
        '" . $_POST['lastname'] . "',
        '" . $_POST['nic'] . "',
        '" . $_POST['email'] . "',
        '" . $_POST['currentaddress'] . "',
        '" . $_POST['experticeid'] . "',
        '" . $_POST['permanentaddress'] . "',
        'Authorized',
        'MEMBER',
        '" . $_SESSION['ssn_user']['id'] . "'); ";


                    $regNo = setData($sql, TRUE);
                    $username = 'MEM' . $regNo;
                    $sqlUpdate = "UPDATE cms_member SET username = '$username' WHERE id = " . $regNo;
                    setUpdate($sqlUpdate, FALSE);

                    // Always set content-type when sending HTML email
                    $headers = "MIME-Version: 1.0" . "\r\n";
                    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
// More headers
                    $headers .= 'From: <webmaster@commu.com>' . "\r\n";
                    $headers .= 'Cc: myboss@example.com' . "\r\n";

                    mail($_POST['email'], "Member Registered", "Pleaase login username:" . $username, $headers);


//new user creted
                    /*
                      $sqlUsr = " INSERT INTO `cms_user`
                      (`username`,
                      `password`,
                      `role`,
                      `status`,
                      `member_id`)
                      VALUES ( '$username',
                      PASSWORD('$username'),
                      '" . $_POST['role'] . "',
                      'ACT',
                      '$regNo'); ";
                      setData($sqlUsr, FALSE); */
                }
                ?>





                <?php
                if (isset($_GET['action'])) {
                    $mid = $_GET['mid'];
                    $action = $_GET['action'];
                    $username = $_GET['username'];
                    $mobileno = $_GET['mobileno'];
                    $sql = "UPDATE cms_member SET authstatus = 'AUTHORIZED' , autorizeby = '" . $_SESSION['ssn_user']['id'] . "' WHERE id = " . $mid;
                    setUpdate($sql, TRUE);

                    //user creation 
                    $sqlUsr = " INSERT INTO `cms_user`
            (`username`,
             `password`,
             `role`,
             `status`,
             `member_id`)
VALUES ( '$username',
        PASSWORD('$username'),
        'MEMBER',
        'ACT',
        '$mid'); ";

                    setData($sqlUsr, FALSE);
                    //SMS
                    $messageSMS = "Welcome to COMMU your username is ".$username;
                    sendSMS($mobileno, $messageSMS);
                    
                }
                ?>


                <h2>Pendings</h2>
                <table id="example" class="display" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Member No</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>NIC</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Created By</th>
                            <th>Approved By</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Member No</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>NIC</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Created By</th>
                            <th>Approved By</th>
                        </tr>
                    </tfoot>
                    <tbody>
<?php
$sqlMy = " SELECT * FROM cms_member WHERE authstatus = 'PENDING' ";
$resultxx = getData($sqlMy);
if ($resultxx != FALSE) {
    while ($row = mysqli_fetch_assoc($resultxx)) {
        /*
          `id`,
          `firstname`,
          `lastname`,
          `nic`,
          `username`,
          `email`,
          `currentaddress`,
          `experticeid`,
          `permanentaddress`,
          `authstatus`,
          `datecreated`,
          `autorizeby`,
          `role`,
          `usercreated`
         *                                  */
        ?>
                                <tr>
                                    <td><?= $row['id']; ?></td>
                                    <td><?= $row['firstname']; ?></td>
                                    <td><?= $row['lastname']; ?></td>
                                    <td><?= $row['nic']; ?></td>
                                    <td><?= $row['email']; ?></td>
                                    <td>
        <?php
        if ($row['authstatus'] == 'PENDING') {
            ?><a href="admin_authorization_member.php?mid=<?= $row['id']; ?>&action=AUTHORIZED&username=<?= $row['username']; ?>&mobileno=<?= $row['mobileno']?>"> <?= $row['authstatus']; ?></a><?php
                                        }
                                        ?>
                                    </td>
                                    <td>MEM<?= $row['usercreated']; ?></td>
                                    <td><?= $row['autorizeby']; ?></td>
                                </tr>
        <?php
    }
}
?>
                    </tbody>
                </table>


            </div>
        </div>









        <!-- footer -->
        <?php include './_footer.php';?>
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