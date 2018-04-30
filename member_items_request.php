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

        <link href='css/fullcalendar.min.css' rel='stylesheet' />
        <link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />



    </head>	
    <body>

        <?php
        include './model/DB.php';
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
                    <?php
                    include '_search.php';
                    ?>
                </div>
            </nav>
        </div>


   <div class="row">
            <div class="col-md-12">
                <h3 style="text-align: center">Member Inventory</h3>
                   <hr>
            </div>
        </div>


        <div class="row">
            <?php
            if (isset($_POST['btnSub'])) {
                $sql = " INSERT INTO `cmsdb`.`cms_inventory`
            (`itemid`,
             `memberid`,
             `eventname`,
             `fromdate`,
             `todate`,
             `createduser`,
             `status`,
             `qty`)
VALUES ('" . $_POST['itemid'] . "',
        '" . $_SESSION['ssn_user']['id'] . "',
        '" . $_POST['eventname'] . "',
        '" . $_POST['fromdate'] . "',
        '" . $_POST['todate'] . "',
        '" . $_SESSION['ssn_user']['id'] . "',
        'OPEN',
        '" . $_POST['qty'] . "'); ";


                setData($sql, TRUE);
            }
            ?>
            <div class="col-md-6">

                <div id='calendar'></div>
            </div>


            <div class="col-md-6">
               <div class="panel panel-primary">
        <div class="panel-heading">Inventory Request</div>
        <div class="panel-body">
             <form action="member_items_request.php" method="post">
                        <div class="col-md-6">
                            <span class="mando-msg">* fields are mandatory</span>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><span class="mando-msg">*</span> Event Title</label>
                                <input type="text" required="" name="eventname" class="form-control" id="exampleInputEmail1" >
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><span class="mando-msg">*</span>Item </label>
                                <select name="itemid" class="form-control" required="">
                                    <option>--select--</option>
                                    <?php
                                    $sqlItems = " SELECT * FROM cms_item  ";
                                    $resultXXX = getData($sqlItems);
                                    if ($resultXXX != FALSE) {
                                        while ($row = mysqli_fetch_assoc($resultXXX)) {
                                            ?>  <option value="<?= $row['id'] ?>"><?= $row['itemname'] ?></option> <?php
                                        }
                                    }
                                    ?>
                                </select> 
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><span class="mando-msg">*</span> QTY</label>
                                <input name="qty" type="text"class="form-control" required="" />
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputPassword1"><span class="mando-msg">*</span> From Date</label>
                                <input type="date"  name="fromdate" required="" class="form-control" id="exampleInputEmail1" >
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1"><span class="mando-msg">*</span> To Date</label>
                                <input type="date"  name="todate" required="" class="form-control" id="exampleInputEmail1" >
                            </div>
                            <button type="submit" name="btnSub" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
        </div>
        <div class="panel-footer"></div>
      </div>
               
            </div>

        </div>

        <div class="row">
            <div class="col-md-6">


            </div>
            <div class="col-md-6">





            </div>
        </div>




        <div class="row">
            <div class="col-md-12">
                <table class="table" style="color: black">
                    <thead>
                        <tr>
                            <th>Req ID</th>
                            <th>ItemName</th>
                            <th>Event Name</th>
                            <th>Qty</th>
                            <th>From</th>
                            <th>To</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT cms_inventory.*,cms_item.itemname FROM cms_inventory
INNER JOIN cms_item
ON cms_inventory.itemid = cms_item.id WHERE cms_inventory.createduser = " . $_SESSION['ssn_user']['id'];
                        //echo $sql;
                        $resultx = getData($sql);
                        if ($resultx != FALSE) {
                            while ($row = mysqli_fetch_assoc($resultx)) {
                                ?>

                                <tr>
                                    <td><?= $row['id']; ?></td>
                                    <td><?= $row['itemname']; ?></td>
                                    <td><?= $row['eventname']; ?></td>
                                    <td><?= $row['qty']; ?></td>
                                    <td><?= $row['fromdate']; ?></td>
                                    <td><?= $row['todate']; ?></td>
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

//                $('#example').DataTable();
            });
        </script>





        <script src='lib/moment.min.js'></script>
        <script src='lib/jquery.min.js'></script>
        <script src='js/fullcalendar.min.js'></script>


        <script>

            $(document).ready(function () {
                $('#calendar').fullCalendar({
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: [
<?php
$sql = "SELECT cms_inventory.*,cms_item.itemname FROM cms_inventory
INNER JOIN cms_item
ON cms_inventory.itemid = cms_item.id WHERE cms_inventory.createduser = " . $_SESSION['ssn_user']['id'];
$resultAtt = getData($sql);
if ($resultAtt != false) {
    while ($row = mysqli_fetch_array($resultAtt)) {
        ?>
                                {
                                    title: '[ <?= $row['itemname']; ?> ] <?= $row['eventname']; ?>',
                                    start: '<?= $row['fromdate']; ?>',
                                    end: '<?= $row['todate']; ?>'
                                },
        <?php
    }
}
?>
                    ]
                });

            });

        </script>







    </body>
</html>