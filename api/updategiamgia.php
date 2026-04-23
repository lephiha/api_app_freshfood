<?php
include "connect.php";

// Lấy dữ liệu từ client
$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
$giamgia = isset($_POST['giamgia']) ? trim($_POST['giamgia']) : '';

if ($id <= 0 || $giamgia === '') {
    // Kiểm tra nếu dữ liệu không hợp lệ
    $arr = [
        'success' => false,
        'message' => "Dữ liệu không hợp lệ"
    ];
    echo json_encode($arr);
    exit;
}

// Sử dụng Prepared Statements
$query = $conn->prepare("UPDATE `sanphammoi` SET `giamgia` = ? WHERE `id` = ?");
$query->bind_param("si", $giamgia, $id);
$success = $query->execute();

if ($success) {
    $arr = [
        'success' => true,
        'message' => "Thành Công"
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không Thành Công",
        'error' => $conn->error // Thông báo lỗi SQL nếu có
    ];
}

echo json_encode($arr);

// Đóng kết nối
$conn->close();
?>
