<?php
/**
 * Created by PhpStorm.
 * User: ajvan
 * Date: 4/18/2019
 * Time: 10:57 PM
 */
require 'db_connect.php';

$partFname = $_POST['fname'];
$partLname = $_POST['lname'];
$partEmail = $_POST['email'];
$partPhone = $_POST['phoneNum'];
$partAbout = $_POST['subject'];

if (!isset($partFname) || !isset($partLname) || !isset($partEmail)) {
    die ('incorrect data sent!!!');
}

// -----------------------------------------------------
// This is where you MUST MUST MUST do data scrubbing!!!
// -----------------------------------------------------
print("$partFname, $partLname, $partEmail");

$query = 'INSERT INTO tblParticipants' .
    ' (fname, lname, email)' .
    ' VALUES' .
    " ('$partFname', '$partLname', '$partEmail')";

$result = mysqli_query($link, $query);

if ( $result === TRUE){
    printf("A new participant was successfully added.\n");
    printf("%d rows changed.\n", mysqli_num_rows($result));
} else {
    printf("Sorry, the participant was not added.\n");
}

if(isset($partPhone)){
    $query = "UPDATE tblParticipants SET phoneNum='$partPhone' WHERE email='$partEmail'";
    mysqli_query($link, $query);
}

if(isset($partAbout)){
    $query = "UPDATE tblParticipants SET aboutMe='$partAbout' WHERE email='$partEmail'";
    mysqli_query($link, $query);
}

$query = "SELECT partId FROM tblParticipants WHERE email='$partEmail';";

$partId = mysqli_query($link, $query)->fetch_object()->partId;

print("$partId");

if(isset($_POST['javaScript'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 1);";
    mysqli_query($link, $query);
}

if(isset($_POST['python'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 2);";
    mysqli_query($link, $query);
}

if(isset($_POST['java'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 3);";
    mysqli_query($link, $query);
}

if(isset($_POST['c'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 4);";
    mysqli_query($link, $query);
}

if(isset($_POST['c#'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 5);";
    mysqli_query($link, $query);
}

if(isset($_POST['c++'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 6);";
    mysqli_query($link, $query);
}

if(isset($_POST['php'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 7);";
    mysqli_query($link, $query);
}

if(isset($_POST['ruby'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 8);";
    mysqli_query($link, $query);
}

if(isset($_POST['swift'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 9);";
    mysqli_query($link, $query);
}

if(isset($_POST['sql'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 10);";
    mysqli_query($link, $query);
}

if(isset($_POST['objectiveC'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 11);";
    mysqli_query($link, $query);
}

if(isset($_POST['html'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 12);";
    mysqli_query($link, $query);
}

if(isset($_POST['css'])){
    $query = 'INSERT INTO xrefPartProgrammingLanguage (partId, languageId) VALUES' . "('$partId', 13);";
    mysqli_query($link, $query);
}

if(isset($_POST['photoEditing'])){
    $query = 'INSERT INTO xrefPartDesignSkill (partId, designSkillId) VALUES' . "('$partId', 1);";
    mysqli_query($link, $query);
}

if(isset($_POST['indesign'])){
    $query = 'INSERT INTO xrefPartDesignSkill (partId, designSkillId) VALUES' . "('$partId', 2);";
    mysqli_query($link, $query);
}

if(isset($_POST['dreamweaver'])){
    $query = 'INSERT INTO xrefPartDesignSkill (partId, designSkillId) VALUES' . "('$partId', 3);";
    mysqli_query($link, $query);
}

if(isset($_POST['photoshop'])){
    $query = 'INSERT INTO xrefPartDesignSkill (partId, designSkillId) VALUES' . "('$partId', 4);";
    mysqli_query($link, $query);
}

if(isset($_POST['illustrator'])){
    $query = 'INSERT INTO xrefPartDesignSkill (partId, designSkillId) VALUES' . "('$partId', 5);";
    mysqli_query($link, $query);
}

if(isset($_POST['xd'])){
    $query = 'INSERT INTO xrefPartDesignSkill (partId, designSkillId) VALUES' . "('$partId', 6);";
    mysqli_query($link, $query);
}

mysqli_free_result($result);
mysqli_close($link);