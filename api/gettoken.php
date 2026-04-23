<?php
include "connect.php";

// Nhận giá trị status từ POST
$status = $_POST['status'];

// Khởi tạo mảng kết quả
$result = array();

if ($status == 1) {
    // Truy vấn tất cả người dùng có status = 1
    $query = "SELECT * FROM `user` WHERE `status` = ?";
    
    if ($stmt = mysqli_prepare($conn, $query)) {
        mysqli_stmt_bind_param($stmt, 'i', $status);
        mysqli_stmt_execute($stmt);
        $data = mysqli_stmt_get_result($stmt);
        
        while ($row = mysqli_fetch_assoc($data)) {
            $result[] = $row;
        }
        mysqli_stmt_close($stmt);
    } else {
        $arr = [
            'success' => false,
            'message' => "Lỗi khi chuẩn bị câu truy vấn: " . mysqli_error($conn)
        ];
        echo json_encode($arr);
        exit();
    }
} else if ($status == 0) {
    // Nhận iduser nếu status = 0
    $iduser = $_POST['iduser'];
    
    // Truy vấn người dùng với id và status = 0
    $query = "SELECT * FROM `user` WHERE `id` = ? AND `status` = ?";
    
    if ($stmt = mysqli_prepare($conn, $query)) {
        mysqli_stmt_bind_param($stmt, 'ii', $iduser, $status);
        mysqli_stmt_execute($stmt);
        $data = mysqli_stmt_get_result($stmt);
        
        while ($row = mysqli_fetch_assoc($data)) {
            $result[] = $row;
        }
        mysqli_stmt_close($stmt);
    } else {
        $arr = [
            'success' => false,
            'message' => "Lỗi khi chuẩn bị câu truy vấn: " . mysqli_error($conn)
        ];
        echo json_encode($arr);
        exit();
    }
}

// Kiểm tra kết quả và trả về
if (!empty($result)) {
    $arr = [
        'success' => true,
        'message' => "Thành công",
        'result'  => $result
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không tìm thấy kết quả",
        'result'  => []
    ];
}

// Trả về kết quả dưới dạng JSON
echo json_encode($arr);

// Đóng kết nối
mysqli_close($conn);
?>
