<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


//Load Composer's autoloader
require './vendor/autoload.php';

function db()
{
$mysqli = new mysqli ('localhost', 'root', 'P@55w0rD!ndia', 'kb');
$db = new MysqliDb ($mysqli);
$db->autoReconnect = true;
return $db;
}

// Call this function in parser 
function jsonParser()
{
    $inputJSON = file_get_contents('php://input');
    $input = json_decode($inputJSON, TRUE); //convert JSON into array
    return $input;    
}



?>