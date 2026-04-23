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

$sdt = $_POST['sdt'];
$email = $_POST['email'];
$tongtien = $_POST['tongtien'];
$iduser = $_POST['iduser'];
$diachi = $_POST['diachi'];
$soluong = $_POST['soluong'];
$chitiet = $_POST['chitiet'];
$phuongthucthanhtoan = $_POST['phuongthucthanhtoan'];
$query = "INSERT INTO `donhang` (`iduser`, `diachi`, `sodienthoai`, `email`, `soluong`, `tongtien`, `phuongthucthanhtoan`) VALUES (?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($query);

if ($stmt) {
    $stmt->bind_param("isssids", $iduser, $diachi, $sdt, $email, $soluong, $tongtien, $phuongthucthanhtoan);

    if ($stmt->execute()) {
        $iddonhang = $stmt->insert_id;
        $chitiet = json_decode($chitiet, true);
        if (json_last_error() === JSON_ERROR_NONE && is_array($chitiet)) {
            $query_chitiet = "INSERT INTO `chitietdonhang` (`iddonhang`, `idsp`, `soluong`, `gia`) VALUES (?, ?, ?, ?)";
            $stmt_chitiet = $conn->prepare($query_chitiet);

            if ($stmt_chitiet) {
                $success = true;
                foreach ($chitiet as $item) {
                    $idsp = $item['idsp'];
                    $soluong_sp = $item['soluong'];
                    $giasp = $item['giasp'];

                    $stmt_chitiet->bind_param("iiid", $iddonhang, $idsp, $soluong_sp, $giasp);
                    if (!$stmt_chitiet->execute()) {
                        $success = false;
                        break;
                    }
                }

                if ($success) {
                    $arr = [
                        'success' => true,
                        'message' => "Thêm đơn hàng thành công",
                        'iddonhang' => $iddonhang
                    ];
                } else {
                    $arr = [
                        'success' => false,
                        'message' => "Không thể thêm chi tiết đơn hàng"
                    ];
                }

                $stmt_chitiet->close();
            } else {
                $arr = [
                    'success' => false,
                    'message' => "Lỗi khi chuẩn bị truy vấn chi tiết đơn hàng: " . $conn->error
                ];
            }
        } else {
            $arr = [
                'success' => false,
                'message' => "Dữ liệu chi tiết đơn hàng không hợp lệ"
            ];
        }
    } else {
        $arr = [
            'success' => false,
            'message' => "Không thể thêm đơn hàng: " . $stmt->error
        ];
    }

    $stmt->close();
} else {
    $arr = [
        'success' => false,
        'message' => "Lỗi khi chuẩn bị truy vấn: " . $conn->error
    ];
}

echo json_encode($arr);
$conn->close();
?>
