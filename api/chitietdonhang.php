<?php
include "connect.php";

// Nhận giá trị từ POST và kiểm tra
$iduser = isset($_POST['iduser']) ? (int)$_POST['iduser'] : 0;
$page = isset($_POST['page']) ? (int)$_POST['page'] : 1;
$total = 20;
$pos = ($page - 1) * $total;
$trangthai = isset($_POST['trangthai']) ? (int)$_POST['trangthai'] : 0;

$result = array();

if ($iduser == 0) {
    // Lấy tất cả đơn hàng theo trạng thái
    $query = "SELECT donhang.id, donhang.diachi, donhang.sodienthoai, donhang.email, donhang.soluong, donhang.tongtien, donhang.trangthai, donhang.momo, donhang.ngaydat, donhang.phuongthucthanhtoan, user.username 
              FROM donhang 
              INNER JOIN user ON donhang.iduser = user.id 
              WHERE trangthai = ? 
              ORDER BY donhang.id DESC 
              LIMIT ?, ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iii", $trangthai, $pos, $total);
} else {
    // Lấy đơn hàng theo người dùng
    $query = "SELECT * FROM donhang WHERE iduser = ? ORDER BY id DESC LIMIT ?, ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("iii", $iduser, $pos, $total);
}

$stmt->execute();
$data = $stmt->get_result();

while ($row = $data->fetch_assoc()) {
    // Lấy chi tiết đơn hàng
    $row['item'] = getOrderDetails($row['id'], $conn);
    $result[] = $row;
}

// Trả về kết quả
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
        'result'  => []
    ];
}

echo json_encode($arr);

// Hàm lấy chi tiết đơn hàng
function getOrderDetails($iddonhang, $conn)
{
    $query = "SELECT chitietdonhang.*, sanphammoi.*, images.image 
              FROM chitietdonhang 
              INNER JOIN sanphammoi ON chitietdonhang.idsp = sanphammoi.id 
              INNER JOIN images ON chitietdonhang.idsp = images.idsp 
              WHERE chitietdonhang.iddonhang = ? 
              GROUP BY chitietdonhang.idsp";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $iddonhang);
    $stmt->execute();
    $data = $stmt->get_result();

    $item = array();
    while ($row = $data->fetch_assoc()) {
        $item[] = $row;
    }

    $stmt->close();
    return $item;
}

// Đóng kết nối
$stmt->close();
$conn->close();
?>
