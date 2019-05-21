<?php

// show all errors.
error_reporting(-1);

$pdo = new PDO('mysql:dbname=study;host=db', 'root', 'password');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

function log_output($message) {
    error_log($message);
}

header('Content-type: text/csv; charset=utf-8');
