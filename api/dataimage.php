<?php
include "connect.php";

// Lấy danh sách sản phẩm và hình ảnh
$query = 'SELECT id, hinhanh FROM `sanphammoi`';
$data = mysqli_query($conn, $query);

if (!$data) {
    die("Lỗi khi truy vấn dữ liệu: " . mysqli_error($conn));
}

$result = array();

while ($row = mysqli_fetch_assoc($data)) {
    $idsp = $row['id'];
    $image = $row['hinhanh'];

    // Sử dụng Prepared Statement để bảo mật
    $insertQuery = "INSERT INTO `images`(`idsp`, `image`) VALUES (?, ?)";
    $stmt = $conn->prepare($insertQuery);

    if ($stmt) {
        $stmt->bind_param("is", $idsp, $image); // "is" tương ứng với kiểu dữ liệu integer và string
        if ($stmt->execute()) {
            echo "Đã thêm hình ảnh cho sản phẩm ID: $idsp<br>";
        } else {
            echo "Lỗi khi thêm hình ảnh cho sản phẩm ID: $idsp - " . $stmt->error . "<br>";
        }
        $stmt->close();
    } else {
        echo "Lỗi khi chuẩn bị truy vấn: " . $conn->error . "<br>";
    }
}

// Đóng kết nối
$conn->close();
?>
