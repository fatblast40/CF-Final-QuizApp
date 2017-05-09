<?php
	ob_start();
	session_start();
	require_once 'dbconnect.php';

	// if session is not set this will redirect to login page
	if( !isset($_SESSION['admin']) ) {
		header("Location: index.php");
	exit;
	}
	 // select logged-in users detail
 $res=mysqli_query($con, "SELECT nickname, users.id AS user_id, avatars.location AS avatar, avatars.id AS avatar_id, email FROM users 
 	JOIN avatars ON users.FK_avatars=avatars.id 
 	WHERE users.id=".$_SESSION['user']);
	 $userRow=mysqli_fetch_array($res);
	 $user_id = $userRow['user_id'];
	 $user_avatar = $userRow['avatar'];
	 $user_nickname = $userRow['nickname'];
	 $user_email = $userRow['email'];
?>