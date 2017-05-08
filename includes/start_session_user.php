<?php
 ob_start();
 session_start();
 require_once 'dbconnect.php';
 
 // if session is not set this will redirect to login page
 if( !isset($_SESSION['user']) ) {
  header("Location: index.php");
  exit;
 }


 // select logged-in users detail
 $res=mysqli_query($con, "SELECT nickname, user.id AS user_id, avatar.location AS avatar, avatar.id AS avatar_id FROM user 
 	JOIN avatar ON user.FK_avatar=avatar.id 
 	WHERE user.id=".$_SESSION['user']);
	 $userRow=mysqli_fetch_array($res);
	 $user_id = $userRow['user_id'];
	 $user_avatar = $userRow['avatar'];
	 $user_nickname = $userRow['nickname'];
	 $user_email = $userRow['email'];
	 
?>