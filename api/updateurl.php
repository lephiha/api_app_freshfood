<?php
include "connect.php";
$idsp = $_POST['idsp'];
$image = $_POST['image'];

$query = "INSERT INTO `images`(`idsp`, `image`) VALUES ('".$idsp."','".$image."')";
$data = mysqli_query($conn, $query);

         if($data == true){
            $arr = [
                'success' => true,
                'message' => "Thành Công"
          ];
        }else{
            $arr = [
                'success' => false,
                'message' => "Không Thành Công"
    ];
 }
print_r(json_encode($arr));

?>

