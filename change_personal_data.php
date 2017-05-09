<?php
require_once('includes/start_session_user.php');
?>

<?php
$error = 0;
 $emailError ="";

 $nameError ="";
 $passError ="";
 
 $avatarError ="";

 $errTyp="";
 $errMSG="";
 $hidden ="";


 if ( isset($_POST['btn-change_data']) ) {
  // sanitize user input to prevent sql injection
  $username = trim($_POST['nickname']);
  $username = strip_tags($username);
  $username = htmlspecialchars($username);
 
  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);
 
  $password = trim($_POST['password']);
  $password = strip_tags($password);
  $password = htmlspecialchars($password);

  $password_old = trim($_POST['password_old']);
  $password_old = strip_tags($password_old);
  $password_old = htmlspecialchars($password_old);

  $avatar = $_POST['avatar'];
    // if (empty($avatar)){
    //   $avatar = 1;
    // }

  // basic username validation
  if (empty($username)) {
   $error = 1;
   $nameError = "Please enter your user name.";
  } else if (strlen($username) < 3) {
   $error = 1;
   $nameError = "Name must have atleat 3 characters.";
  } else {
   // check whether the nickname exist or not
   $query_nickname = "SELECT nickname FROM users WHERE users.nickname='$username' AND users.id!=".$_SESSION['user'];
   $result_nickname = mysqli_query($con, $query_nickname);
   $count_nickname = mysqli_num_rows($result_nickname);
   if($count_nickname!=0){
    $error = 1;
    $nameError = "Provided user name is already in use.";
   }
  }
  // echo " username: $error<br>";
 
  //basic email validation
  if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
   $error = 1;
   $emailError = "Please enter valid email address.";
  } else {
   // check whether the email exists or not
   $query_email = "SELECT email FROM users WHERE users.email='$email' AND users.id != ".$_SESSION['user'];
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
  

  if(empty($password_old)){
   $error = 1;
   $passError = "Please enter your password.";
  }

  $password_old = hash('sha256', $password_old);

  // Avatar validation
  if (empty($avatar)){
   $error = 1;
   $avatarError = "Please choose an avatar.";
  }

  // if there's no error, continue to signup
  
  if( $error == 0 ) {
   // echo "no error";
   
   $user_query = "SELECT id, email, password FROM users WHERE email='$user_email'";
   $res_user = mysqli_query($con, $user_query);
   $row_user = mysqli_fetch_array($res_user);
   // echo $row_user['email'];
   // $count_user = mysqli_num_rows($res_user); 

	   if($row_user['password']==$password_old ) {
		   $query_user = "UPDATE users SET
		   nickname='$username',
		   email='$email',
		   password='$password', 
		   FK_avatars=$avatar
		   WHERE users.id=".$_SESSION['user'];
		   $res_user = mysqli_query($con, $query_user);
		  
		   
		   if ($res_user) {
		    $errTyp = "alert-success";
		    $errMSG = "Your Data was successfully changed!";
        $hidden ="hidden";
		    // echo $errMSG;
		    // unset($username);
		    unset($email);
		    unset($password);
		   } else {
		    $errTyp = "alert-danger";
		    $errMSG = "Something went wrong, try again later...";
		    // echo $errMSG;
		   }
		   
		  }
	 
	 }
 }

?>
<!DOCTYPE html>
<html>
<head>
	<title>Change Personal Data</title>
	<?php
require_once('includes/head_tag.php');
	?>
</head>
<body>
<div id="wrap">
  <div id="main" class="container-fluid clear-top">
  <!-- header -->
    <header class="row shadow" id="header">
            <div class="col-xs-3">
                <a href="home_user.php">
                    <img alt="back_button" src="pictures/back_button.png" id="back_button"/>
                </a>
            </div>      
            <div class="col-xs-6 white text-center margin-top">
                <h1 class="heading_font">Change Personal Data</h1>
            </div>                      
        <?php
        echo'
            <div class="col-xs-3">
                <a href="logout.php?logout" class="pull-right">         
                    <img class="img-circle show_avatar border" src="'.$user_avatar.'" alt="avatar" id="avatar_img"><br>
                    Sign Out
                </a>
            </div>';
        ?>

    </header>

    
    <?php 
    include 'includes/alert_box.php';
    ?>

    
<!-- main -->
    <div class="row">
      <main class="col-xs-12">
        <section class="row">
          <div class="col-xs-12 margin-top">
            <!-- add main content here -->
            <form method="post" class="row <?php echo $hidden; ?>" autocomplete="off">
              <!-- first_row -->
              <div class="col-xs-12">
                <div class="row">
                  <div class="col-xs-12 col-md-6">
                    <!-- NICKNAME -->
                    <h4 class="white">User Name:</h4>
                    <input type="text" name="nickname" id="nickname" class="form-control" placeholder="Enter nickname" maxlength="50" value="<?php echo $user_nickname ;?>"/>
                    <span class="text-danger"><?php echo $nameError; ?></span>         
                  </div>
                  <!-- second row -->
                  <div class="col-xs-12 col-md-6">
                    <!-- EMAIL -->
                    <h4 class="white">E-Mail:</h4>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Enter Your Email" maxlength="40" value="<?php echo $user_email ;?>">
                    <span class="text-danger"><?php echo $emailError; ?></span>         
                  </div>
                </div>
                <div class="row">

                  <!-- first_row -->
                  <div class="col-xs-12 col-md-6">
                    <!-- Old PASSWORD -->
                    <h4 class="white">Current Password:</h4>
                    <input type="password" id="password_old" name="password_old" class="form-control" placeholder="Enter Password"/>
                    <span class="text-danger"><?php echo $passError; ?></span>
                  </div>
                  <!-- second row -->
                  <div class="col-xs-12 col-md-6">
                    <!-- NEW PASSWORD -->
                    <h4 class="white">New Password:</h4>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" maxlength="15" />
                    <span class="text-danger"><?php echo $passError; ?></span>   
                  </div>
                </div>
              </div>
    

              <div class="col-xs-12 text-center">
                <hr>
                <h4 class="white">Pick an avatar:</h4>
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
                  <button type="submit" id="btn-change_data" class="btn btn-block btn-primary background_bc1" name="btn-change_data">Change Data</button>
              </div>
            </form>
          </div>
        </section>
      </main>
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