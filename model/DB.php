<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getDBConnection() {

  /**/
    $servername = "localhost";
    $username = "root";
    $password = "123";
    $db = "cmsdb"; 
    /*
      $servername = "localhost";
      $username = "commulkc_user";
      $password = "password#1";
      $db = "commulkc_cmsdb";
    */

// Create connection
    $conn = mysqli_connect($servername, $username, $password, $db);
// Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        return $conn;
    }
}

/**
 * 
 * @param type $sql
 * @param type $MSG   if TRUE - display the message
 * @return type
 */
function setData($sql, $MSG) {
    $conn = getDBConnection();
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    if (mysqli_query($conn, $sql)) {
        $last_id = mysqli_insert_id($conn);
        if ($MSG)
            echo '<p class="bg-success msg-success">New record created successfully<p>';
        return $last_id;
    } else {
        if ($MSG)
            echo "Duplicate Entry Found";
    }

    mysqli_close($conn);
}

function getData($sql) {
    // Create connection
    $conn = getDBConnection();

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        return $result;
    } else {
        return FALSE;
    }

    mysqli_close($conn);
}

function setUpdate($sql, $MSG) {
    $conn = getDBConnection();
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    if (mysqli_query($conn, $sql)) {
        if ($MSG)
            echo '<p class="bg-success msg-success">Record updated successfully<p>';
    } else {
        if ($MSG)
            echo "Error: In Update";
    }

    mysqli_close($conn);
}

function sendSMS($toMobile, $msg) {
  $msgx =  str_replace(" ", "+", $msg);
    /*
http://127.0.0.1:9501/api?action=sendmessage&username=admin&password=abc123&
recipient=06203105366&messagetype=SMS:TEXT&messagedata=Hello+World
    */
    $curl = curl_init();
//    $url = "http://127.0.0.1:9501/api?action=sendmessage&username=admin&password=admin&recipient=" . $toMobile . "&messagetype = SMS:TEXT&messagedata = " . $msg;
    $url = "http://127.0.0.1:9501/api?action=sendmessage&username=admin&password=admin&recipient=$toMobile&messagetype=SMS:TEXT&messagedata=$msgx";
    //http://127.0.0.1:9501/api?action=sendmessage&username=admin&password=admin&recipient=+94715833470&messagetype=SMS:TEXT&messagedata=Hello+World
    echo $url;
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HEADER, false);
    $str = curl_exec($curl);
}

function sendSMStoAll($msg) {
    $sql = " SELECT * FROM cms_member";
    $resultx = getData($sql);
    if ($resultx != FALSE) {
        while ($row = mysqli_fetch_assoc($resultx)) {
            sendSMS($row['mobileno'], $msg);
        }
    }
}

?>