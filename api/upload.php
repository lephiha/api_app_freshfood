<?php  
include "connect.php";
$target_dir = "images/";  
$id = isset($_POST['id']) ? $_POST['id'] : '';

if (!empty($id)){
    $name = $_FILES["file"]["name"];
    $query = "INSERT INTO `images`(`idsp`, `image`) VALUES ('".$id."','".$name."')";
    $data = mysqli_query($conn, $query);
}


// Check if image file is an actual image or fake image  
if (isset($_FILES["file"]))  
   {

    
    $target_file_name = $target_dir .$name; 
  

   if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file_name))  
      {  
         $arr = [
                'success' => true,
                'message' => "Thành Công",
                "name"    => $name
          ]; 
      }  
   else  
      {  
        $arr = [
                'success' => false,
                'message' => "Không Thành Công"
          ]; 
      }  
   }  
else  
   {  
      $arr = [
                'success' => false,
                'message' => "Đã có lỗi xảy ra"
          ];
   }  
   echo json_encode($arr);  
?>  