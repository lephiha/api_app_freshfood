<?php
include "connect.php";

// Chuẩn bị câu lệnh SQL sử dụng Prepared Statements
$query = "SELECT * FROM `sanphammoi` ORDER BY CAST(giasp AS DECIMAL(10, 2)) ASC";

if ($stmt = mysqli_prepare($conn, $query)) {
    mysqli_stmt_execute($stmt);
    $data = mysqli_stmt_get_result($stmt);

    $result = array();
    while ($row = mysqli_fetch_assoc($data)) {
        $row['images'] = getImages($row['id'], $conn); // Lấy ảnh sản phẩm
        $result[] = $row;
    }

    if (!empty($result)) {
        $arr = [
            'success' => true,
            'message' => "Thành công",
            'result'  => $result
        ];
    } else {
        $arr = [
            'success' => false,
            'message' => "Không thành công",
            'result'  => $result
        ];
    }

    // Đóng prepared statement
    mysqli_stmt_close($stmt);
} else {
    $arr = [
        'success' => false,
        'message' => "Lỗi chuẩn bị câu lệnh SQL",
        'error' => mysqli_error($conn)
    ];
}

// Đóng kết nối cơ sở dữ liệu
mysqli_close($conn);

// Trả về kết quả dưới dạng JSON
echo json_encode($arr);

// Hàm lấy hình ảnh sản phẩm
function getImages($idsp, $conn) {
    $query1 = "SELECT id, idsp, image FROM `images` WHERE `idsp` = ?";
    
    if ($stmt1 = mysqli_prepare($conn, $query1)) {
        // Ràng buộc tham số
        mysqli_stmt_bind_param($stmt1, 'i', $idsp);
        mysqli_stmt_execute($stmt1);
        $data1 = mysqli_stmt_get_result($stmt1);

        $result1 = array();
        while ($row = mysqli_fetch_assoc($data1)) {
            $result1[] = $row;
        }

        // Đóng prepared statement
        mysqli_stmt_close($stmt1);

        return $result1;
    } else {
        return []; // Trả về mảng rỗng nếu có lỗi
    }
}
?>
