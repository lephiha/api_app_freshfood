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
            'message' => "Hết phiên đăng nhập"
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

$iduser = isset($_POST['iduser']) ? (int)$_POST['iduser'] : 0; // Ép kiểu để đảm bảo $iduser là số nguyên
$result = array();
if ($iduser === 0) {
    // Truy vấn lấy tất cả đơn hàng
    $query = 'SELECT donhang.id, donhang.diachi, donhang.sodienthoai, donhang.email, donhang.soluong, donhang.tongtien, donhang.trangthai, donhang.momo, donhang.ngaydat, donhang.phuongthucthanhtoan, donhang.iduser, user.username 
              FROM donhang 
              INNER JOIN user ON donhang.iduser = user.id 
              ORDER BY donhang.id DESC';
    $stmt = $conn->prepare($query);
} else {
    // Truy vấn lấy đơn hàng theo iduser
    $query = 'SELECT * FROM donhang WHERE iduser = ? ORDER BY id DESC';
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $iduser); // "i" là kiểu số nguyên
}

// Thực thi truy vấn
$stmt->execute();
$data = $stmt->get_result();

while ($row = $data->fetch_assoc()) {
    // Truy vấn chi tiết đơn hàng
    $query_details = 'SELECT chitietdonhang.*, sanphammoi.*, images.image 
                      FROM chitietdonhang 
                      INNER JOIN sanphammoi ON chitietdonhang.idsp = sanphammoi.id 
                      INNER JOIN images ON chitietdonhang.idsp = images.idsp 
                      WHERE chitietdonhang.iddonhang = ? 
                      GROUP BY chitietdonhang.idsp';
    $stmt_details = $conn->prepare($query_details);
    $stmt_details->bind_param("i", $row['id']); // "i" là kiểu số nguyên
    $stmt_details->execute();
    $data1 = $stmt_details->get_result();

    $item = array();
    while ($row1 = $data1->fetch_assoc()) {
        $item[] = $row1;
    }
    $row['item'] = $item;

    $result[] = $row;

    // Đóng truy vấn chi tiết
    $stmt_details->close();
}

// Tạo phản hồi JSON
if (!empty($result)) {
    $arr = [
        'success' => true,
        'message' => "Thành công",
        'result'  => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không thành công",
        'result'  => []
    ];
}

echo json_encode($arr);

// Đóng kết nối
$stmt->close();
$conn->close();
?>