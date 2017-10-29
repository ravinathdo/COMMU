<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if($_SESSION['ssn_user']['role'] == 'ADMIN'){
    include './_menu_admin.php';
} else if($_SESSION['ssn_user']['role'] == 'MEMBER'){
    include './_menu_member.php';
}else if($_SESSION['ssn_user']['role'] == 'MANAGER'){
    include './_menu_manager.php';
}



?>
