<?php
include "connect.php";
$room = $_POST['room'];
$status = $_POST['status'];
$title = $_POST['title'];

// Chèn dữ liệu vào cơ sở dữ liệu
$query = 'INSERT INTO `livestream`( `room`, `status`,`title`) VALUES ("'.$room.'", '.$status.',"'.$title.'")';
$data = mysqli_query($conn, $query);

// Kiểm tra nếu chèn thành công
if ($data == true) {
    // Lấy ID của Room vừa chèn
    $last_inserted_id = mysqli_insert_id($conn);
    
    // Tạo phản hồi với Room vừa chèn
    $arr = [
        'success' => true,
        'message' => "Thành Công",
        'result' => [
            [
                'id' => $last_inserted_id,  // Trả về ID vừa chèn
                'room' => $room,  // Trả về thông tin Room
                'status' => $status,
                'title'   => $title
            ]
        ]
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không Thành Công"
    ];
}

// Trả về kết quả dưới dạng JSON
echo json_encode($arr);
?>