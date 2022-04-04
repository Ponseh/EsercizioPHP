<?php
$config = [
    'db_host' => 'localhost',
    'db_user' => 'root',
    'db_password' => '',
    'db_name' => 'classiinsegnanti5a'
];

$conn = new mysqli($config['db_host'], $config['db_user'], $config['db_password'], $config['db_name']);

if($conn->connect_error){
    die;
}
