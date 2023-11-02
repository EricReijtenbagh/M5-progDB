<?php

include_once 'dbdata.php';



 $conn = new mysqli($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);

    $sql = "SELECT * FROM gebruiker";
   