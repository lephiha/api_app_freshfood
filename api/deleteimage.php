<?php
include "connect.php";
$target_dir = "images/";
$id = $_POST['id'];
$name = $_POST['name'];
$query = "DELETE FROM `images` WHERE `id`=".$id;
$data = mysqli_query($conn, $query);

$target_file_name = $target_dir .$name; 
if (file_exists($target_file_name)) {
            unlink($target_file_name);  // Xóa file ảnh
        }

 if($data){


    $arr = [
      'success' => true,
      'message' => "thanh cong"
     
          ];
 }else{
    $arr = [
      'success' => false,
      'message' => "khong thanh cong"
  
    ];
 }
print_r(json_encode($arr));

?>