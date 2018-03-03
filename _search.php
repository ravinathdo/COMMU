<!-- <form action="#" method="post">
                        <input type="search" name="Search" placeholder="Search Keywords..." required="" />
                        <input type="submit" value="Search">
                    </form>-->
<a href="?lang=SI"><img src="images/si.gif" ></a>
<a href="?lang=TM"><img src="images/ta.gif" ></a>
<a href="?lang=EN">ENGLISH</a>

<?php 
if (isset($_SESSION['ssn_user'])){ ?>
<a href="#" onclick="openChatWin()"><i class="fa fa-commenting" aria-hidden="true"></i>CHAT NOW</a>
<?php } ?>

<script>
    function openChatWin() {
    myWindow = window.open("chatbox/index.php", "chat", "top=50,left=500,width=500,height=600");   // Opens a new window
}
    </script>