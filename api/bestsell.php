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
        $query = "SELECT sanphammoi.*, SUM(chitietdonhang.soluong) AS tong_soluong
                  FROM sanphammoi
                  INNER JOIN chitietdonhang ON sanphammoi.id = chitietdonhang.idsp
                  WHERE giamgia = 0
                  GROUP BY sanphammoi.id
                  ORDER BY tong_soluong DESC
                  LIMIT 5";

        $stmt = $conn->prepare($query);
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
                'message' => "Không có dữ liệu",
                'result'  => []
            ];
        }

        echo json_encode($arr);

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

// Hàm lấy danh sách hình ảnh an toàn
function getImages($idsp, $conn)
{
    $query1 = "SELECT id, idsp, image FROM images WHERE idsp = ?";
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

// Đóng kết nối
$stmt->close();
$conn->close();
?>
