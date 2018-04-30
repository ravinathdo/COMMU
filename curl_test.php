<?php
include './model/DB.php';
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$msg = $_GET['msg'];
$sql = "INSERT INTO cms_news (description) VALUES ('$msg')";
setData($sql, "");

?>
