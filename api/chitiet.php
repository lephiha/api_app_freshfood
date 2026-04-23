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


$page = isset($_POST['page']) ? (int)$_POST['page'] : 1;
$loai = isset($_POST['loai']) ? (int)$_POST['loai'] : 0;
$total = 20;
$pos = ($page - 1) * $total;


$query = "SELECT * FROM sanphammoi WHERE loai = ? LIMIT ?, ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("iii", $loai, $pos, $total);
$stmt->execute();
$data = $stmt->get_result();

$result = array();
while ($row = $data->fetch_assoc()) {
    $row['images'] = getImages($row['id'], $conn);
    $result[] = $row;
}

if (!empty($result)) {
    $arr = [
        'success' => true,
        'message' => "Thành công",
        'result'  => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Hết dữ liệu",
        'result'  => []
    ];
}

echo json_encode($arr);


function getImages($idsp, $conn)
{
    $query1 = "SELECT idsp, image FROM images WHERE idsp = ?";
    $stmt1 = $conn->prepare($query1);
    $stmt1->bind_param("i", $idsp); 
    $stmt1->execute();
    $data1 = $stmt1->get_result();

    $result1 = array();
    while ($row = $data1->fetch_assoc()) {
        $result1[] = $row;
    }

    $stmt1->close();
    return $result1;
}

$stmt->close();
$conn->close();
?>
