 <?php
// Report:  ranking
$query_ranking="
    SELECT 
        t1.*,
        first_name,
        family_name,
        passed_at
    FROM categories 
    left JOIN quizzes as t1 ON categories.id=t1.FK_categories
    left JOIN quizzes AS t2
      ON t1.FK_users = t2.FK_users 
        AND t1.FK_categories = t2.FK_categories
        AND t1.end_timestamp < t2.end_timestamp
    JOIN users on users.id=t1.fk_users
    WHERE t2.FK_users IS NULL 
    and t1.fk_categories = ".$selected_category_id."
    and users.fk_classes=".$selected_class_id."
    order by scores Desc
";

// $query_ranking = "
//     SELECT 
//         t1.*,
//         first_name,
//         family_name,
//         nickname, 
//         passed_at
//     FROM quizzes AS t1
//     LEFT JOIN categories ON categories.id=t1.FK_categories
//     JOIN users ON users.id = t1.FK_users
//     JOIN classes on classes.id=users.FK_classes
//     LEFT JOIN quizzes AS t2
//       ON t1.FK_users = t2.FK_users 
//             AND t1.start_timestamp < t2.start_timestamp
//     WHERE t2.FK_users IS NULL 
//     and t1.fk_categories = ".$selected_category_id."
//     and classes.id=".$selected_class_id."
//     ORDER BY 
//         scores Desc
// ";

$res_ranking = mysqli_query($con, $query_ranking);
// $row_ranking  = mysqli_fetch_array($res_ranking);
// $count_ranking = mysqli_num_rows($res_ranking);

?>