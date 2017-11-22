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


// Create connection
    $conn = mysqli_connect($servername, $username, $password, $db);
// Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        return $conn;
    }
}

function setData($sql, $MSG) {
    $conn = getDBConnection();
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    if (mysqli_query($conn, $sql)) {
        $last_id = mysqli_insert_id($conn);
        if ($MSG)
            echo '<p class="bg-success">New record created successfully<p>';
        return $last_id;
    } else {
        if ($MSG)
            echo "Error: " . $sql . "<br>" . $conn->error;
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
            echo '<p class="bg-success">Record updated successfully<p>';
    } else {
        if ($MSG)
            echo "Error: " . $sql . "<br>" . $conn->error;
    }

    mysqli_close($conn);
}

function sendSMS($toMobile, $msg) {

    $sql = " INSERT INTO `ozekimessageout`
            (`sender`,
             `receiver`,
             `msg`,
             `status`)
VALUES ('0716483414',
        '$toMobile',
        '$msg',
        'send'); ";
    setData($sql, FALSE);
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