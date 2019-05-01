<?php
/**
 * Created by PhpStorm.
 * User: ajvan
 * Date: 4/18/2019
 * Time: 10:53 PM
 */

$host = 'CHANGE';
$username = 'CHANGE';
$password = 'CHANGE';
$dbName = 'CHANGE';

// Connect to the database
$link = mysqli_connect($host, $username, $password);
if (!$link) {
    echo ('Could not connect: ' . mysqli_error($link));
}

// Select the database we want to use
$db_selected = mysqli_select_db($link, $dbName);
if (!$db_selected) {
    die ('Could not select database: ' . mysqli_error($link));
}
