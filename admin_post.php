<!--
author: Thisara
-->
<?php session_start(); ?>

<?php //echo '<tt><pre>'.var_export($_SESSION['ssn_user'], TRUE).'</pre></tt>';

if($_SESSION['ssn_user']['role'] != 'ADMIN'){
    header("Location:index.php");
}

?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Commu | Post </title>
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
                                      <?php include './_search.php';?>

                </div>
            </nav>
        </div>


        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                <?php
                include './model/DB.php';
                include './model/MESSAGE_LIST.php';
                
                if (isset($_POST['btnSub'])) {
                    $sql = " INSERT INTO `cms_post`
            (`posttitle`,
             `description`,
             `usercreated`)
VALUES ('" . $_POST['posttitle'] . "',
        '" . $_POST['description'] . "',
        '" . $_SESSION['ssn_user']['id'] . "'); ";

                    setData($sql,TRUE);
                     $sms = $_POST['posttitle'];
                    sendSMStoAll($sms);
                }
                ?>
                
                
                 <?php
        if (isset($_GET['pid'])) {
            $pid = $_GET['pid'];
            $action = $_GET['action'];
            $sql = " UPDATE cms_post SET STATUS = '$action' WHERE id = $pid ";
            setUpdate($sql,TRUE);
        }
        ?>
                
                <div class="panel panel-primary">
                <div class="panel-heading ">Post </div>
                <div class="panel-body">
                                        <span class="mando-msg">* fields are mandatory</span>

                <form action="admin_post.php" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1"><span class="mando-msg">*</span>Post Title</label>
                        <input required="" name="posttitle" type="text" class="form-control" id="exampleInputEmail1" >
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1"><span class="mando-msg">*</span>Description</label>
                        <textarea required="" name="description" class="form-control" ></textarea>
                    </div>
                    <!--                    <div class="form-group">
                                            <label for="exampleInputFile">Photo</label>
                                            <input type="file" id="exampleInputFile">
                                            <p class="help-block">Related photo upload here.</p>
                                        </div>-->

                    <button type="submit" name="btnSub" class="btn btn-primary">Submit</button>
                </form>
                
                </div></div>
                
                


                

            </div>
            <div class="col-md-4"></div>
        </div>



       

        <table id="example" class="display" cellspacing="0" width="100%" style="font-size: small">
            <thead>
                <tr>
                    <th>POST ID</th>
                    <th>Title</th>
                    <th>Post Date</th>
                    <th>Likes</th>
                    <th>Dislike</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>POST ID</th>
                    <th>Title</th>
                    <th>Post Date</th>
                    <th>Likes</th>
                    <th>Dislike</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </tfoot>
            <tbody>
                <?php
                //get all post on member
                $sqlAllPost = " SELECT * FROM cms_post";
                $resultPost = getData($sqlAllPost);
                if ($resultPost != FALSE) {
                    while ($row = mysqli_fetch_assoc($resultPost)) {
                        /*
                          `id`,
                          `posttitle`,
                          `description`,
                          `like`,
                          `dislike`,
                          `usercreated`,
                          `datecreated`,
                          `status`
                         *                          */
                        ?>
                        <tr>
                            <td><?= $row['id']; ?></td>
                            <td><?= $row['posttitle']; ?></td>
                            <td><?= $row['description']; ?> <span class="btn btn-default btn-xs">[<?= $row['datecreated']; ?>] </span></td>
                            <td><i class="fa fa-thumbs-up"></i> <?= $row['plike']; ?></td>
                            <td><i class="fa fa-thumbs-down"></i> <?= $row['dislike']; ?> </td>
                            <td> <?= $row['status']; ?>    
                              <?php if ($row['status'] == 'PENDING') {
                                  ?> <a href="admin_post.php?pid=<?= $row['id']; ?>&action=ACTIVE" >Activate Now</a> <?php
                                } 
                               ?>
                            
                            </td>
                            <td><?php
                if ($row['status'] != 'CLOSE') {
                            ?> <a href="admin_post.php?pid=<?= $row['id']; ?>&action=CLOSE" >Close Now</a> <?php
                                }
                                ?></td>
                        </tr>
                        <?php
                    }
                }
                ?>
            </tbody>
        </table>

    </div>
    <div class="col-md-4">.col-md-4</div>
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


<!--data table-->
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
       // $('#example').DataTable();
        $('#example').DataTable({ "order": [[ 0, "desc" ]] });
    });
</script>
</body>
</html>