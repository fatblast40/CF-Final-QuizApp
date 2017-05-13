<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.9/css/fileinput.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.9/js/fileinput.min.js"></script>


    <!-- NEW PASSWORD -->
    <h4 class="white">Upload Avatar image</h4>
    <input id="fileToUpload" name="fileToUpload" type="file" class="file" data-show-preview="false">




<?php
if(isset($_POST['btn-change_data']) || isset($_POST['btn-signup'])) {
    error_log(json_encode($_FILES));

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    error_log($imageFileType);
    if($check !== false) {
        move_uploaded_file(
                $_FILES["fileToUpload"]["tmp_name"],
                'uploads'.DIRECTORY_SEPARATOR.'avatar_user'.$_SESSION['user'].'.'.$imageFileType
        );
    } else {
        echo '<div class="alert alert-danger">The image file you provided was invalid.</div>';
    }
}
?>

