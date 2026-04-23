<?php
include "connect.php";

// Kiểm tra và làm sạch dữ liệu đầu vào
$tensp = isset($_POST['tensp']) ? trim($_POST['tensp']) : '';
$gia = isset($_POST['gia']) ? floatval($_POST['gia']) : 0;
$hinhanh = isset($_POST['hinhanh']) ? trim($_POST['hinhanh']) : '';
$mota = isset($_POST['mota']) ? trim($_POST['mota']) : '';
$loai = isset($_POST['loai']) ? intval($_POST['loai']) : 0;
$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
$kho = isset($_POST['kho']) ? intval($_POST['kho']) : 0;

// Kiểm tra nếu thiếu dữ liệu quan trọng
if (empty($tensp) || empty($gia) || empty($id)) {
    $arr = [
        'success' => false,
        'message' => "Dữ liệu không đầy đủ"
    ];
    echo json_encode($arr);
    exit;
}

// Sử dụng prepared statement để tránh SQL injection
$stmt = $conn->prepare('UPDATE `sanphammoi` SET `tensp` = ?, `giasp` = ?, `mota` = ?, `loai` = ?, `kho` = ? WHERE `id` = ?');
$stmt->bind_param("sdssii", $tensp, $gia, $mota, $loai, $kho, $id);

if ($stmt->execute()) {
    $arr = [
        'success' => true,
        'message' => "Thành Công"
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không Thành Công",
        'error' => $stmt->error // Hiển thị lỗi chi tiết nếu có
    ];
}

// Đóng statement và kết nối
$stmt->close();
$conn->close();

// In kết quả dưới dạng JSON
echo json_encode($arr);
?>
