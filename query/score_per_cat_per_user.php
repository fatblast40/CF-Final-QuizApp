<?php
// Report:  ranking


$query_scores_per_cat_per_user = "
            SELECT category, t1.scores AS scores
            FROM categories 
            left JOIN quizzes as t1 ON categories.id=t1.FK_categories
            left JOIN quizzes AS t2
              ON t1.FK_users = t2.FK_users 
                    AND t1.start_timestamp < t2.start_timestamp
            WHERE t2.FK_users IS NULL 
            and t1.fk_categories = ".$category_id." and t1.FK_users=".$all_users_id."
            order by category ASC"
            
;
// $query_scores_per_cat_per_user = "
//             SELECT category, t1.scores AS scores
//             FROM quizzes AS t1
//             right JOIN categories ON categories.id=t1.FK_categories
//             right JOIN users ON users.id = t1.FK_users
//             LEFT JOIN quizzes AS t2
//               ON t1.FK_users = t2.FK_users 
//                     AND t1.start_timestamp < t2.start_timestamp
//             WHERE t2.FK_users IS NULL 
//             and t1.fk_categories = ".$category_id." and t1.FK_users=".$all_users_id."
//             order by category ASC"
            
// ;

$res_scores_per_cat_per_user = mysqli_query($con, $query_scores_per_cat_per_user);
// $row_scores_per_cat_per_user  = mysqli_fetch_array($res_scores_per_cat_per_user);
$count_scores_per_cat_per_user = mysqli_num_rows($res_scores_per_cat_per_user);

?>