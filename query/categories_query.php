<?php
// Report:  score and games played per categories
$query_all_categories = "
    SELECT 
        *


    FROM `categories`
    order by category ASC
";

$res_all_categories = mysqli_query($con, $query_all_categories);
// $row_all_categories  = mysqli_fetch_array($res_all_categories);
// $count_all_categories = mysqli_num_rows($res_all_categories);
?>