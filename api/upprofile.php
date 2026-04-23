<?php
include "connect.php"; // Include kết nối cơ sở dữ liệu

// Kiểm tra kết nối cơ sở dữ liệu
if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}

// Khởi tạo các biến
$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
$name = $id . ".jpg"; // Đặt tên file là ID kèm đuôi .jpg
$target_dir = "uploads/";
$target_file_name = $target_dir . $name;

// Kiểm tra nếu thư mục upload không tồn tại
if (!is_dir($target_dir)) {
    mkdir($target_dir, 0777, true);
}

if (isset($_FILES["file"])) {
    // Kiểm tra MIME type để chỉ chấp nhận ảnh JPG
    $allowed_types = ['image/jpeg', 'image/png'];
    $file_type = mime_content_type($_FILES["file"]["tmp_name"]);
    
    if (!in_array($file_type, $allowed_types)) {
        $arr = [
            'success' => false,
            'message' => "File không hợp lệ. Chỉ chấp nhận JPG hoặc PNG."
        ];
        echo json_encode($arr);
        exit;
    }

    // Kiểm tra kích thước file (giới hạn 2MB)
    $max_size = 2 * 1024 * 1024; // 2MB
    if ($_FILES["file"]["size"] > $max_size) {
        $arr = [
            'success' => false,
            'message' => "File quá lớn. Giới hạn 2MB."
        ];
        echo json_encode($arr);
        exit;
    }

    // Di chuyển file tải lên vào thư mục
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file_name)) {
        // Cập nhật thông tin file vào cơ sở dữ liệu
        $stmt = $conn->prepare('UPDATE `user` SET `imageprofile` = ? WHERE `id` = ?');
        $stmt->bind_param("si", $name, $id);

        if ($stmt->execute()) {
            $arr = [
                'success' => true,
                'message' => "Thành công",
                "name" => $name
            ];
        } else {
            $arr = [
                'success' => false,
                'message' => "Cập nhật database thất bại: " . $stmt->error
            ];
        }

        $stmt->close();
    } else {
        $arr = [
            'success' => false,
            'message' => "Upload file thất bại"
        ];
    }
} else {
    $arr = [
        'success' => false,
        'message' => "Không có file tải lên"
    ];
}

// Xuất kết quả dưới dạng JSON
echo json_encode($arr);

// Đóng kết nối cơ sở dữ liệu
$conn->close();
?>
