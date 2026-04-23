<?php
include "connect.php";

// Kiểm tra nếu các biến POST được thiết lập và không rỗng
$tensp = isset($_POST['tensp']) ? $_POST['tensp'] : '';
$gia = isset($_POST['gia']) ? $_POST['gia'] : '';
$hinhanh = isset($_POST['hinhanh']) ? $_POST['hinhanh'] : '';
$mota = isset($_POST['mota']) ? $_POST['mota'] : '';
$loai = isset($_POST['loai']) ? $_POST['loai'] : '';
$kho = isset($_POST['kho']) ? $_POST['kho'] : '';

// Đảm bảo tất cả các trường cần thiết không rỗng
if (empty($tensp) || empty($gia) || empty($hinhanh) || empty($mota) || empty($loai)) {
    $arr = [
        'success' => false,
        'message' => "Tất cả các trường đều phải được điền"
    ];
    echo json_encode($arr);
    exit;
}

// Kiểm tra xem giá có phải là một số hợp lệ
if (!is_numeric($gia)) {
    $arr = [
        'success' => false,
        'message' => "Giá sản phẩm không hợp lệ"
    ];
    echo json_encode($arr);
    exit;
}

// Chuẩn bị câu lệnh SQL với prepared statements
$query = "INSERT INTO `sanphammoi` (`tensp`, `giasp`, `mota`, `loai`, `kho`) VALUES (?, ?, ?, ?, ?)";
if ($stmt = mysqli_prepare($conn, $query)) {
    // Ràng buộc tham số
    mysqli_stmt_bind_param($stmt, 'sssss', $tensp, $gia, $mota, $loai, $kho);
    $execute = mysqli_stmt_execute($stmt);
    
    if ($execute) {
        $inserted_id = mysqli_insert_id($conn);

        // Kiểm tra xem hình ảnh có phải là URL không
        if (strpos($hinhanh, 'http') !== false) {
            $query1 = "INSERT INTO `images`(`idsp`, `image`) VALUES (?, ?)";
            if ($stmt1 = mysqli_prepare($conn, $query1)) {
                mysqli_stmt_bind_param($stmt1, 'is', $inserted_id, $hinhanh);
                mysqli_stmt_execute($stmt1);
            }
        }
        
        $arr = [
            'success' => true,
            'message' => "Thành Công",
            'name' => $inserted_id
        ];
        echo json_encode($arr);
    } else {
        $arr = [
            'success' => false,
            'message' => "Không Thành Công",
            'error' => mysqli_error($conn) // Để nhận thông báo lỗi SQL
        ];
        echo json_encode($arr);
    }
    mysqli_stmt_close($stmt);
} else {
    $arr = [
        'success' => false,
        'message' => "Lỗi khi chuẩn bị câu lệnh SQL",
        'error' => mysqli_error($conn)
    ];
    echo json_encode($arr);
}

// Đóng kết nối
mysqli_close($conn);
?>
