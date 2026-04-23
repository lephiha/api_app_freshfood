<?php
include "connect.php";

require 'vendor/autoload.php';
$config =  require_once '../config/config.php';
$secret_key = $config['jwt_secret'];

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$headers  = apache_request_headers();

if (isset($headers['Authorization'])){
    $authHeader = $headers['Authorization'];
   
    $jwt = str_replace('Bearer ', '', $authHeader);
  
    try {
        $decoded = JWT::decode($jwt, new Key($secret_key, 'HS256'));
        //print_r($decoded);
    
    } catch (Exception $e) {
        $arr = [
            'success' => false,
            'message' => "Token không hợp lệ: " . $e->getMessage()
        ];
        echo json_encode($arr);
        exit();
    }

}else{
    $arr = [
        'success' => false,
        'message' => "Không tìm thấy token"
    ];
    echo json_encode($arr);
    exit();
}



// Truy vấn danh sách sản phẩm với giamgia = 0
$query = "SELECT * FROM `sanphammoi` WHERE `giamgia`= 0 ORDER BY id DESC";

// Thực thi truy vấn
$data = mysqli_query($conn, $query);

// Kiểm tra lỗi truy vấn
if (!$data) {
    $arr = [
        'success' => false,
        'message' => "Lỗi khi truy vấn dữ liệu: " . mysqli_error($conn)
    ];
    echo json_encode($arr);
    exit();
}

$result = array();
while ($row = mysqli_fetch_assoc($data)) {
    // Lấy thông tin hình ảnh của sản phẩm
    $row['images'] = getImages($row['id'], $conn);
    $result[] = $row;
}

// Trả về kết quả
if (!empty($result)) {
    $arr = [
        'success' => true,
        'message' => "Thành công",
        'result'  => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không có sản phẩm nào",
        'result'  => []
    ];
}

// Đóng kết nối
mysqli_free_result($data);
mysqli_close($conn);

// Trả về kết quả dưới dạng JSON
echo json_encode($arr);

// Hàm lấy hình ảnh của sản phẩm
function getImages($idsp, $conn)
{
    // Truy vấn lấy hình ảnh sản phẩm
    $query1 = "SELECT id, idsp, image FROM `images` WHERE `idsp` = ?";
    
    // Sử dụng prepared statement
    if ($stmt = mysqli_prepare($conn, $query1)) {
        mysqli_stmt_bind_param($stmt, 'i', $idsp);
        mysqli_stmt_execute($stmt);
        $result1 = mysqli_stmt_get_result($stmt);
        
        $images = array();
        while ($row = mysqli_fetch_assoc($result1)) {
            $images[] = $row;
        }
        mysqli_stmt_close($stmt);
        return $images;
    } else {
        return [];
    }
}
?>
