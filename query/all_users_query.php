<?php
// Report:  score and games played for a specific category and user
$query_all_users = "
    SELECT 
        id, first_name, family_name, email

    FROM `users`
    
    ORDER BY 
        family_name DESC;
";

$res_all_users = mysqli_query($con, $query_all_users);
// $row_all_users  = mysqli_fetch_array($res_all_users);
// $count_all_users = mysqli_num_rows($res_all_users);
?>