<?php
// Report:  score and games played for a specific category and user
$query_categories = "
    SELECT 
        start_timestamp AS time_stamp,
        categories.id AS category_id,
        scores

    FROM `quizzes`
    LEFT JOIN categories ON categories.id=quizzes.FK_categories
    where FK_users = ".$user_id."
    AND categories.id=".$category_id."
    ORDER BY 
        start_timestamp DESC;
";

$res_categories = mysqli_query($con, $query_categories);
// $row_categories  = mysqli_fetch_array($res_categories);
// $count_categories = mysqli_num_rows($res_categories);
?>