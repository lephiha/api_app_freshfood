<?php
include "connect.php";
require 'vendor/autoload.php';
$config = require_once '../config/config.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$headers = apache_request_headers();
if (isset($headers['Authorization'])) {
    $authHeader = $headers['Authorization'];
    $jwt = str_replace('Bearer ', '', $authHeader);

    try {
        $decoded = JWT::decode($jwt, new Key($config['jwt_secret'], 'HS256'));
        if ($decoded->aud !== "appbanhang") {
            echo json_encode([
                'success' => false,
                'message' => "Audience không hợp lệ"
            ]);
            exit();
        }

        if ($decoded->exp < time()) {
            echo json_encode([
                'success' => false,
                'message' => "Token đã hết hạn"
            ]);
            exit();
        }

    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => "Token không hợp lệ: " . $e->getMessage()
        ]);
        exit();
    }
} else {
    echo json_encode([
        'success' => false,
        'message' => "Không tìm thấy token"
    ]);
    exit();
}

$query = "SELECT * FROM `sanphammoi` WHERE `giamgia`>0 ORDER BY id DESC";
$data = mysqli_query($conn, $query);
$result = array();
while ($row = mysqli_fetch_assoc($data)) {
    $row['images'] = getImages($row['id'], $conn);
    $result[] = $row;
}

if (!empty($result)) {
    $arr = [
        'success' => true,
        'message' => "thanh cong",
        'result'  => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "khong thanh cong",
        'result'  => []
    ];
}
echo json_encode($arr);

function getImages($idsp, $conn)
{
    $query1 = "SELECT idsp, image FROM `images` WHERE `idsp`=?";
    $stmt = $conn->prepare($query1);
    $stmt->bind_param("i", $idsp);
    $stmt->execute();
    $data1 = $stmt->get_result();
    $result1 = array();
    while ($row = $data1->fetch_assoc()) {
        $result1[] = $row;
    }
    $stmt->close();
    return $result1;
}
?>
