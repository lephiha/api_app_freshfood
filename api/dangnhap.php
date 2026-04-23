<?php
error_reporting(0);
ini_set('display_errors', 0);
header('Content-Type: application/json');

include "connect.php";
require 'vendor/autoload.php';
$config = require_once '../config/config.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$secret_key = $config['jwt_secret'];
$email = $_POST['email'];
$pass = $_POST['pass'];

$query = "SELECT * FROM `user` WHERE `email` = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, 's', $email);
mysqli_stmt_execute($stmt);
$result_data = mysqli_stmt_get_result($stmt);

$result = array();
while ($row = mysqli_fetch_assoc($result_data)) {
    $result[] = $row;
}

if (!empty($result)) {
    $payload = [
        'iss' => "appbanhang",
        'aud' => "appbanhang",
        'iat' => time(),
        'exp' => time() + (24 * 60 * 60),
        'data' => [
            'id' => $result[0]['id'],
            'email' => $result[0]['email']
        ]
    ];
    $jwt = JWT::encode($payload, $secret_key, 'HS256');
    $result[0]['jwt'] = $jwt;
    $arr = [
        'success' => true,
        'message' => "thành công",
        'result'  => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "không thành công",
        'result'  => []
    ];
}

mysqli_stmt_close($stmt);
mysqli_close($conn);
echo json_encode($arr);
?>
