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

$search = isset($_POST['search']) ? trim($_POST['search']) : '';

if (empty($search)) {
    $arr = [
        'success' => false,
        'message' => "Từ khóa tìm kiếm không được để trống"
    ];
    echo json_encode($arr);
    exit;
}

// Sử dụng Prepared Statements để tránh SQL Injection
$query = $conn->prepare("SELECT * FROM `sanphammoi` WHERE `tensp` LIKE ?");
$search_term = "%" . $search . "%";
$query->bind_param("s", $search_term);
$query->execute();
$data = $query->get_result();

$result = array();
while ($row = $data->fetch_assoc()) {
    $row['images'] = getImages($row['id'], $conn);
    $result[] = $row;
}

if (!empty($result)) {
    $arr = [
        'success' => true,
        'message' => "Tìm kiếm thành công",
        'result'  => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không tìm thấy sản phẩm phù hợp",
        'result'  => []
    ];
}

echo json_encode($arr);

// Hàm lấy danh sách ảnh
function getImages($idsp, $conn) {
    $query1 = $conn->prepare("SELECT id, idsp, image FROM `images` WHERE `idsp` = ?");
    $query1->bind_param("i", $idsp);
    $query1->execute();
    $data1 = $query1->get_result();

    $result1 = array();
    while ($row = $data1->fetch_assoc()) {
        $result1[] = $row;
    }
    return $result1;
}

// Đóng kết nối
$conn->close();
?>
