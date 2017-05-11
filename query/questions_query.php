<?php
// Report:  all questions
$query_all_questions = "
    SELECT 
    	questions.id AS question_id,
        question, 
        category,
        answers_displayed


    FROM `questions`
    JOIN  categories on categories.id = questions.fk_categories
    WHERE categories.id=".$category_id;

$res_all_questions = mysqli_query($con, $query_all_questions);
// $row_all_questions  = mysqli_fetch_array($res_all_questions);
// $count_all_questions = mysqli_num_rows($res_all_questions);
?>