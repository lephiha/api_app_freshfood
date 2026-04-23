<?php
include "connect.php";

// Kiểm tra sự tồn tại và hợp lệ của dữ liệu đầu vào
if (!isset($_POST['id']) || !isset($_POST['status'])) {
    $arr = [
        'success' => false,
        'message' => "Thiếu thông tin 'id' hoặc 'status'"
    ];
    echo json_encode($arr);
    exit;
}

$id = intval($_POST['id']);
$status = trim($_POST['status']);

// Kiểm tra giá trị hợp lệ của 'status' (ví dụ: chỉ chấp nhận 0 hoặc 1)
if (!in_array($status, ['0', '1'])) {
    $arr = [
        'success' => false,
        'message' => "Giá trị 'status' không hợp lệ"
    ];
    echo json_encode($arr);
    exit;
}

// Sử dụng prepared statement
$stmt = $conn->prepare('UPDATE `livestream` SET `status` = ? WHERE `id` = ?');
$stmt->bind_param("si", $status, $id);  // "si" chỉ định kiểu string và integer

if ($stmt->execute()) {
    $arr = [
        'success' => true,
        'message' => "Thành Công"
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không Thành Công",
        'error' => $stmt->error  // Hiển thị lỗi SQL nếu có
    ];
}

// Đóng statement và kết nối
$stmt->close();
$conn->close();

// In kết quả dưới dạng JSON
echo json_encode($arr);
?>
