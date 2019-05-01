<?php
/**
 * Created by PhpStorm.
 * User: ajvan
 * Date: 4/18/2019
 * Time: 11:11 PM
 */
require 'db_connect.php';

$query = 'SELECT * FROM tblParticipants ORDER BY fname;';

$result = mysqli_query($link, $query);

if($result){
    // Cycle through results
    while($row = $result->fetch_object()){
        echo "-----";
        echo "<p>First name: ". $row->fname . "<p>";
        echo "<p>Last name: ". $row->lname . "<p>";
    }

    // Free result set
    $result->close();
}