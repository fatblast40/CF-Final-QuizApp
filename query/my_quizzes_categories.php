<?php
// Report:  score and games played per categories
$query_categories = "
    SELECT 
        category,
        categories.id AS category_id,
        count(quizzes.id) AS games_played,
        avg(scores) AS average_score,
        max(start_timestamp) AS latest_timestamp

    FROM `quizzes`
    LEFT JOIN categories ON categories.id=quizzes.FK_categories
    where FK_users = ".$user_id."
    GROUP by category
    ORDER BY 
        category ASC;
";

$res_categories = mysqli_query($con, $query_categories);
// $row_categories  = mysqli_fetch_array($res_categories);
// $count_categories = mysqli_num_rows($res_categories);
?>