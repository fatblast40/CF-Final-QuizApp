<?php
// Report:  all classes
$query_classes = "
    SELECT 
        *

    FROM `classes`
    order by start_date ASC

";

$res_classes = mysqli_query($con, $query_classes);
// $row_classes  = mysqli_fetch_array($res_classes);
$count_classes = mysqli_num_rows($res_classes);
?>