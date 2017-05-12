<?php
// Report:  score and games played for a specific category and user
$query_all_users = "
    SELECT 
        users.id, first_name, family_name, email, location as avatar

    FROM `users`
    join avatars on users.fk_avatars=avatars.id
    where
    	users.FK_classes=".$selected_class_id."
    ORDER BY 
        family_name DESC;
";

$res_all_users = mysqli_query($con, $query_all_users);
// $row_all_users  = mysqli_fetch_array($res_all_users);
// $count_all_users = mysqli_num_rows($res_all_users);
?>