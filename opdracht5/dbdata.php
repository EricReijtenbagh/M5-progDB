<?php

$envSettings = []; // funcie word gemaakt
    if (file_exists(dirname(__FILE__).'/.env')) { // checkt of de file bestaat in het .env bestand
        $envSettings = parse_ini_file(dirname(__FILE__).'/.env'); // doet de info van het file in de array
    }

$DB_NAME=$envSettings["DB_NAME"];
$DB_USER= $envSettings["DB_USER"];
$DB_PASSWORD= $envSettings["DB_PASSWORD"];
$DB_HOST= $envSettings["DB_HOST"];

?>