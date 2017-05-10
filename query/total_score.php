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

$res_total_score = mysqli_query($con, $query_categories);
// $row_total_score  = mysqli_fetch_array($res_total_score);
// $count_total_score = mysqli_num_rows($res_total_score);
$total_points=0;
while ($row_total_score  = mysqli_fetch_array($res_total_score)){
    $category_id=$row_total_score['category_id'];
    $average_score=$row_total_score['average_score'];
    $games_played=$row_total_score['games_played'];
    $latest_timestamp=$row_total_score['latest_timestamp'];

    $query_latest_result_total = "
        SELECT 
            scores AS latest_score

        FROM `quizzes`
        LEFT JOIN categories ON categories.id=quizzes.FK_categories
        where FK_users = ".$user_id."
        AND categories.id=".$category_id."
        AND start_timestamp='".$latest_timestamp."'"
        ;
    

    $res_latest_result_total = mysqli_query($con, $query_latest_result_total);
    $latest_result_total = mysqli_fetch_array($res_latest_result_total);
    $latest_score_total = $latest_result_total['latest_score'];


    $total_points+=$latest_score_total*100;
}

$total_points=number_format(($total_points),0,",",",");
?>