<ul>
    <li><a href="#" >Community Management System</a></li>
    <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i> 
            <?php echo $_SESSION['ssn_user']['firstname'] ?> 
            [ <?php echo $_SESSION['ssn_user']['role'] ?> ]

        </a> </li>
        <li><a href="change_password.php"><i class="fa fa-lock" aria-hidden="true"></i> Change Password</a></li>
    <li><a href="logout.php"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Logout</a></li>
</ul>
<?php //echo '<tt><pre>' . var_export($_SESSION['ssn_user'], TRUE) . '</pre></tt>'; ?>