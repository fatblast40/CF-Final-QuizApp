<?php

function checkAndPrintSQLError($successMessage) {
    global $con;
    $error = $con->error;
    if ($error) {
        echo "<p>MySQL error:: $error</p>";
    } else {
        echo $successMessage;
    }
}

