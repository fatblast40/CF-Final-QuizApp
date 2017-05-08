<?php
 ob_start();
 session_start(); // start a new session or continues the previous
 
 // it will never let you open register(sign-up) page if session is set
 if ( isset($_SESSION['admin'])!="" ) {
  header("Location: home_admin.php");
  exit;
 } else if ( isset($_SESSION['user'])!="" ) {
  header("Location: home_user.php");
  exit;
 }

 include_once 'dbconnect.php';
 



 $error = 0;
 $emailError ="";
 $nameError ="";
 $emailError ="";
 $passError ="";
 $hidden="";


 $avatarError ="";
 $errTyp="";
 $errMSG="";


 if ( isset($_POST['btn-signup']) ) {
  // sanitize user input to prevent sql injection
  // $nickname = trim($_POST['nickname']);
  // $nickname = strip_tags($nickname);
  // $nickname = htmlspecialchars($nickname);
 
  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);
 
  $password = trim($_POST['password']);
  $password = strip_tags($password);
  $password = htmlspecialchars($password);

  $nickname = trim($_POST['nickname']);
  $nickname = strip_tags($nickname);
  $nickname = htmlspecialchars($nickname);


  
  $avatar = $_POST['avatar'];
    // if (empty($avatar)){
    //   $avatar = 1;
    // }

  // basic nickname validation
  if (empty($nickname)) {
   $error = 1;
   $nameError = "Please enter your user name.";
  } else if (strlen($nickname) < 3) {
   $error = 1;
   $nameError = "Name must have atleat 3 characters.";
  } else {
   // check whether the nickname exist or not
   $query_nickname = "SELECT nickname FROM users WHERE users.nickname='$nickname'";
   $result_nickname = mysqli_query($con, $query_nickname);
   $count_nickname = mysqli_num_rows($result_nickname);
   if($count_nickname!=0){
    $error = 1;
    $nameError = "Provided user name is already in use.";
   }
  }
  // echo " nickname: $error<br>";
 
  //basic email validation
  if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
   $error = 1;
   $emailError = "Please enter valid email address.";
  } else {
   // check whether the email exists or not
   $query_email = "SELECT email FROM users WHERE users.email='$email'";
   $result_email = mysqli_query($con, $query_email);
   $count_email = mysqli_num_rows($result_email);
   if($count_email!=0){
    $error = 1;
    $emailError = "Provided Email is already in use.";
   }
  }
    // echo " email: $error<br>";

  // password validation
  if (empty($password)){
   $error = 1;
   $passError = "Please enter password.";
  } else if(strlen($password) < 6) {
   $error = 1;
   $passError = "Password must have atleast 6 characters.";
  }
      // echo " password: $error<br>";

 
  // password encrypt using SHA256();
  // not even the admin can see the password anymore
  $password = hash('sha256', $password);
  
  
  // Avatar validation
  if (empty($avatar)){
   $error = 1;
   $avatarError = "Please choose an avatar.";
  }
        // echo " avatar: $error<br>";
        // 
  

  // if there's no error, continue to signup
  if( $error == 0 ) {
   // echo "no error";
    
   $query_user = "INSERT INTO users (nickname, email, password, FK_avatars) VALUES('$nickname', '$email', '$password', $avatar)";
   $res_user = mysqli_query($con, $query_user);
   
   if ($res_user) {
    $errTyp = "alert-success";
    $errMSG = "Successfully registered, you may login now! <a class='margin-left' href='index.php'><button type='button'  class='btn btn-success'>Log in</button></a>";
    $hidden ="hidden";
    // echo $errMSG;
    // unset($nickname);
    unset($email);
    unset($password);
    unset($nickname);
    // unset($DOB);
   } else {
    $errTyp = "alert-danger";
    $errMSG = "Something went wrong, try again later...";
    // echo $errMSG;
   }
   
  } 
 
 
 }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Sign-up</title>
  <?php
require_once('includes/head_tag.php');
  ?>
</head>
<body>
<div id="wrap">
  <div id="main" class="container clear-top">

    <header class="row shadow">
    <div class="col-xs-6">
      <span class="margin-top"><img id="logo" src="pictures/logo.png" alt="logo"></span>
      <!-- <span><h1 class="brandfont color_bc1">Code Bus</h1></span> -->
    </div>
  </header>
      <div class="row">
      <div class="col-xs-12">
        
          <h2 class="color_bc1">Sign Up</h2>
          <hr />
          <?php
            if ( isset($_POST['btn-signup']) ) {
              echo '<div class="alert '.$errTyp.'">'.$errMSG.'</div>';
            }
          ?>
      </div>
      <form method="post" class="<?php echo $hidden; ?>" action="register.php" autocomplete="off">
      <!-- first_row -->
      <div class="col-xs-12 col-md-4">
          <!-- NICKNAME -->
          <h4>User Name:</h4>
          <input type="text" name="nickname" id="nickname" class="form-control" placeholder="Enter nickname" maxlength="50" />
          <span class="text-danger"><?php echo $nameError; ?></span>

          
          
        
      </div>
      <!-- second row -->
      <div class="col-xs-12 col-md-4">
        <!-- EMAIL -->
          <h4 class="color_bc1">E-Mail:</h4>
          <input type="email" id="email" name="email" class="form-control" placeholder="Enter Your Email" maxlength="40">
          <span class="text-danger"><?php echo $emailError; ?></span>
          
      </div>
      <!-- third row -->
      <div class="col-xs-12 col-md-4">
        <!-- PASSWORD -->
        <h4 class="color_bc1">Password:</h4>
        <input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" maxlength="15" />
        <span class="text-danger"><?php echo $passError; ?></span>
          
      </div>
      <div class="col-xs-12 text-center">
        <hr>
        <h4 class="color_bc1">Pick an avatar:</h4>
        <hr>

        <?php
          $query_avatar = "SELECT * FROM avatars";
          $res_avatar = mysqli_query($con, $query_avatar);

          while($avatarRow=mysqli_fetch_array($res_avatar)){
            $avatar = $avatarRow['location'];
            $avatar_id = $avatarRow['id'];

            echo    '<label class="radio-inline">
                      <input type="radio" value="'.$avatar_id.'" name="avatar"><img class="img-circle avatar" src="'.$avatar.'" alt="avatar" >
                    </label>';
          }
        ?>
        <div class="text-center text-danger margin-top"><?php echo $avatarError; ?></div>  
      </div>
      <div class="col-xs-12">
        <!-- SUBMIT -->
          <hr />
          <button type="submit" id="btn-signup" class="btn btn-block btn-primary background_bc1" name="btn-signup">Sign Up</button>
      </div>
      <div class="col-xs-12">
          <hr />
          <a href="index.php">Sign in Here...</a>
        </form>
      </div>
      </div>
<!-- end wrapper to put footer on the bottom of the page -->
  </div>
</div>
  <!-- footer -->
  <?php
require_once('includes/footer.php');
  ?>

</body>
</html>
<?php ob_end_flush(); ?>
