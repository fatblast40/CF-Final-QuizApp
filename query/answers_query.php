<?php
// Report:  all questions
$query_all_answers = "
    SELECT 
    	*


    FROM `answers`
    WHERE answers.FK_question=".$question_id;

$res_all_answers = mysqli_query($con, $query_all_answers);
// $row_all_answers  = mysqli_fetch_array($res_all_answers);
// $count_all_answers = mysqli_num_rows($res_all_answers);
?>