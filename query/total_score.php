<?php
// Report:  score and games played per categories
$query_categories = "
    SELECT 
        category,
        categories.id AS category_id,
        count(quizzes.id) AS games_played,
        avg(scores) AS average_score

    FROM `quizzes`
    LEFT JOIN categories ON categories.id=quizzes.FK_categories
    where FK_users = ".$user_id."
    GROUP by category
    ORDER BY 
        category ASC;
";

$res_total_score = mysqli_query($con, $query_categories);
// $row_total_score  = mysqli_fetch_array($res_total_score);
// $count_total_score = mysqli_num_rows($res_total_score);
$total_points=0;
while ($row_total_score  = mysqli_fetch_array($res_total_score)){
    $average_score=$row_total_score['average_score'];
    $games_played=$row_total_score['games_played'];

    $x=number_format(($average_score*100*$games_played),2,",",".");
    $total_points+=$x;
}

$total_points=number_format(($total_points),0,",",",");
?>