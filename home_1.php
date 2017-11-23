<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Commu</title>
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
                    <?php
                    include '_search.php';
                    ?>
                </div>

            </nav>
        </div>






        <div class="row">
            <div class="col-md-2">
                <p style="font-weight: bold;color: #09347a">Open Elections</p>
                <?php
                include './model/DB.php';
                $sqlElection = " SELECT * FROM cms_election WHERE STATUS = 'OPEN' ";
                $resultEle = getData($sqlElection);
                if ($resultEle != FALSE) {
                    while ($row = mysqli_fetch_assoc($resultEle)) {
//date field check
                        $date = new DateTime($row['enddatetime']);
                        $now = new DateTime();
                        $nowDate = date('Y-m-d');


                        if($nowDate."" == $row['enddatetime']){
                            echo 'Equalx';
                        }else{
                            if ($date > $now) {
                                echo 'greater tham';
                            }
                        }
                        

                       

                        if ($nowDate != $row['enddatetime']) {

                            
                        } else {

                            if ($date < $now) {
                                ?>


                                <div>
                                    <p style="font-weight: bold"><?= $row['electiontitle']; ?></p>
                                    <p><?= $row['post_title']; ?></p>
                                    <p>
                <?php
                if (isset($_SESSION['ssn_user'])) {
                    ?>
                                            <a href="mamber_voting.php?eid=<?= $row['id']; ?>&election=<?= $row['electiontitle']; ?>&post_title=<?= $row['post_title']; ?>" class="btn btn-primary btn-xs">Vote Now</a></p>
                                            <?php
                                        }
                                        ?> 
                                    <p><span class="btn btn-default btn-xs"> <?= $row['startdatetime']; ?> to <?= $row['enddatetime']; ?> </span></p>
                                </div>
                                <hr>



                <?php
            }
        }
    }
}
?>

            </div>
            <div class="col-md-6">

<?php
if (isset($_GET['pid'])) {
    $pid = $_GET['pid'];
    $action = $_GET['action'];
    $totalLike = $_GET['totalLike'];
    $totalDisLike = $_GET['totalDisLike'];


    echo 'Vote Posting';

    //user LIKE
    $sql_1 = " SELECT * FROM cms_post_vote WHERE postid = $pid AND memberid = " . $_SESSION['ssn_user']['id'];
    $result_1 = getData($sql_1);



    if ($result_1 != FALSE) {
        while ($row = mysqli_fetch_assoc($result_1)) {
            echo $row['type'];

            if ($action != $row['type']) {
                echo '<br>Invase :' . $action;
                //update the status
                switch ($action) {
                    case "LIKE":
                        echo '<br>CASE:LIKE';
                        $totalLike = $totalLike + 1;
                        $q = " UPDATE cms_post SET plike  = $totalLike  WHERE id  = $pid ";
                        setUpdate($q, FALSE);

                        if ($totalDisLike != 0) {
                            $totalDisLike = $totalDisLike - 1;
                            $q2 = " UPDATE cms_post SET dislike  = $totalDisLike  WHERE id  = $pid ";
                            setUpdate($q2, FALSE);
                        } else {
                            $sqlSetUserPost = setUserPostVote($pid, $_SESSION['ssn_user']['id'], 'LIKE');
                            setData($sqlSetUserPost, TRUE);
                        }

                        $sqlSetUserPost = setUserUpdateVote($pid, $_SESSION['ssn_user']['id'], 'LIKE');
                        setUpdate($sqlSetUserPost, FALSE);
                        break;
                    case "DISLIKE":

                        echo '<br>CASE:DISLIKE';
                        $totalDisLike = $totalDisLike + 1;
                        $q = " UPDATE cms_post SET dislike  = $totalDisLike  WHERE id  = $pid ";
                        setUpdate($q, FALSE);

                        if ($totalLike != 0) {
                            $totalLike = $totalLike - 1;
                            $q2 = " UPDATE cms_post SET plike  = $totalLike  WHERE id  = $pid ";
                            setUpdate($q2, FALSE);
                        } else {
                            $sqlSetUserPost = setUserPostVote($pid, $_SESSION['ssn_user']['id'], 'DISLIKE');
                            echo '<br>1:' . $sqlSetUserPost;
                            setData($sqlSetUserPost, TRUE);
                        }

                        $sqlSetUserPost = setUserUpdateVote($pid, $_SESSION['ssn_user']['id'], 'DISLIKE');
                        echo '<br>2:' . $sqlSetUserPost;
                        setUpdate($sqlSetUserPost, FALSE);
                        break;
                }
                //update the user_vote
            }
        }
    } else {
        //no vote found
        // echo '<br>Vote Not Found';
//                          $totalLike = $_GET['totalLike'];
//                    $totalDisLike = $_GET['totalDisLike'];
        switch ($action) {
            case "LIKE":
                echo 'LIKE';
                $totalLike = $totalLike + 1;
                $q = " UPDATE cms_post SET plike  = $totalLike  WHERE id  = $pid ";
                setUpdate($q, FALSE);

                $sqlSetUserPost = setUserPostVote($pid, $_SESSION['ssn_user']['id'], 'LIKE');
                setData($sqlSetUserPost, FALSE);
                break;
            case "DISLIKE":
                echo 'DISLIKE';
                $totalDisLike = $totalDisLike + 1;
                $q = " UPDATE cms_post SET dislike  = $totalDisLike  WHERE id  = $pid ";
                setUpdate($q, FALSE);

                $sqlSetUserPost = setUserPostVote($pid, $_SESSION['ssn_user']['id'], 'DISLIKE');
                setData($sqlSetUserPost, FALSE);
                break;
        }
    }
}

function setUserPostVote($postid, $memberid, $type) {

    $sql = " INSERT INTO `cms_post_vote`
            (`postid`,
             `memberid`,
             `type`)
VALUES ('$postid',
        '$memberid',
        '$type'); ";
    return $sql;
}

function setUserUpdateVote($postid, $memberid, $type) {

    $sql = " UPDATE cms_post_vote SET TYPE = '$type' WHERE postid = $postid AND memberid = $memberid ";
    return $sql;
}
?>
                <table class="table table-striped">
                <?php
                $sqlPost = " SELECT * FROM cms_post WHERE STATUS = 'ACTIVE' ORDER BY id DESC  ";
                $resultAllPost = getData($sqlPost);
                if ($resultAllPost != FALSE) {
                    while ($row = mysqli_fetch_assoc($resultAllPost)) {
                        ?>

                            <tr>
                                <td><?= $row['id'] ?></td>
                                <td style="color: black">
                                    <p style="font-weight: bold"><?= $row['posttitle'] ?></p>
        <?= $row['description'] ?>
                                    <p style="font-size: x-small">[ <?= $row['datecreated'] ?> ]</p></td>
                                <td>
                                    <a href="home.php?pid=<?= $row['id'] ?>&totalDisLike=<?= $row['dislike'] ?>&totalLike=<?= $row['plike'] ?>&action=LIKE&usr=<?= $row['usercreated'] ?>"> <i class="fa fa-thumbs-up"></i> <?= $row['plike']; ?></a>
                                    <a href="home.php?pid=<?= $row['id'] ?>&totalDisLike=<?= $row['dislike'] ?>&totalLike=<?= $row['plike'] ?>&action=DISLIKE&usr=<?= $row['usercreated'] ?>"> <i class="fa fa-thumbs-down"></i> <?= $row['dislike']; ?></a>
                                </td>
                            </tr>
                            <td></td>
                            <td></td>

        <?php
    }
}
?>

                </table> 
            </div>
            <div class="col-md-4">
                <p style="font-weight: bold;color: #09347a">News</p>
<?php
$sqlNews = " SELECT * FROM cms_news WHERE STATUS = 'ACTIVE' ORDER BY id DESC  ";
$resultNews = getData($sqlNews);
if ($resultNews != FALSE) {
    while ($row = mysqli_fetch_assoc($resultNews)) {
        ?>
                        <div class="bg-info" style="margin-bottom: 10px"> <b><?= $row['news_title'] ?></b>
                            <p > <?= $row['description'] ?> </p>
                            <p style="font-size: small" class="btn btn-default btn-xs" > <?= $row['datecreated'] ?> </p>
                        </div>
        <?php
    }
}
?>
            </div>
        </div>









<?php include './_footer.php'; ?>




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
    </body>
</html>