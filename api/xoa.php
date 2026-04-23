<?php
include "connect.php";

// Kiểm tra kết nối cơ sở dữ liệu
if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}

// Kiểm tra sự tồn tại và hợp lệ của biến 'id'
if (isset($_POST['id']) && is_numeric($_POST['id'])) {
    $id = intval($_POST['id']); // Chuyển đổi 'id' thành số nguyên để đảm bảo an toàn

    // Sử dụng Prepared Statement để tránh SQL injection
    $stmt = $conn->prepare('DELETE FROM `sanphammoi` WHERE `id` = ?');
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        $arr = [
            'success' => true,
            'message' => "Thành Công"
        ];
    } else {
        $arr = [
            'success' => false,
            'message' => "Xóa Không Thành Công: " . $stmt->error
        ];
    }

    // Đóng statement
    $stmt->close();
} else {
    $arr = [
        'success' => false,
        'message' => "ID không hợp lệ hoặc không được cung cấp"
    ];
}

// Xuất kết quả dưới dạng JSON
echo json_encode($arr);

// Đóng kết nối cơ sở dữ liệu
$conn->close();
?>
