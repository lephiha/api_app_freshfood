<?php
include "connect.php";

$idsp = $_POST['idsp'];

// Kiểm tra xem idsp có được truyền vào và hợp lệ không
if (!isset($idsp) || empty($idsp)) {
    $arr = [
        'success' => false,
        'message' => "ID sản phẩm không hợp lệ"
    ];
    echo json_encode($arr);
    exit();
}

// Chuẩn bị câu truy vấn để tránh SQL injection
$query = "SELECT id, idsp, image FROM `images` WHERE `idsp` = ?";
$stmt = mysqli_prepare($conn, $query);

if ($stmt === false) {
    $arr = [
        'success' => false,
        'message' => "Lỗi khi chuẩn bị truy vấn SQL"
    ];
    echo json_encode($arr);
    exit();
}

// Liên kết tham số vào câu truy vấn chuẩn bị
mysqli_stmt_bind_param($stmt, 'i', $idsp);

// Thực thi truy vấn
mysqli_stmt_execute($stmt);

// Lấy kết quả truy vấn
$data = mysqli_stmt_get_result($stmt);

$result = array();
while ($row = mysqli_fetch_assoc($data)) {
    $result[] = $row;
}

if (!empty($result)) {
    $arr = [
        'success' => true,
        'message' => "Thành công",
        'result' => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không có hình ảnh cho sản phẩm này",
        'result' => $result
    ];
}

// Đóng kết nối và truy vấn
mysqli_stmt_close($stmt);
mysqli_close($conn);

// Trả về kết quả dưới dạng JSON
echo json_encode($arr);
?>
