
<!doctype html>
<html lang="en">
<?php require_once 'includes/head_tag.php'?>
<?php require_once 'dbconnect.php'?>
<?php
$allQuestionsQuery = $con->prepare(<<<'SQL'
SELECT id FROM questions;
SQL
);

$categoryQuestionsQuery = $con->prepare(<<<'SQL'
SELECT questions.id FROM questions
INNER JOIN categories ON questions.FK_categories = categories.id
WHERE categories.category = ?;
SQL
);
$categoryId = (int)$con->real_escape_string($_GET['category']);
$allQuestionsQuery->execute();

switch ($categoryId) {
    case 0:
        initQuiz($allQuestionsQuery->get_result());
        break;
    default:
        $categoryQuestionsQuery->bind_param('i', $categoryId);
        initQuiz($categoryQuestionsQuery->get_result());
        break;

}

/**
 * @param bool|mysqli_result $questionResults
 */
function initQuiz($questionResults, $num=4) {

    $questions = [];
    while ($question = $questionResults->fetch_assoc()) {
        $questions[] = $question['id'];
    }
    $pickedQuestions = array_rand($questions, $num);
    global $categoryId;
    $_SESSION['quiz_'.$categoryId] = json_encode($pickedQuestions);
}



?>
<body>
<div class="container">
    <script>
        var selectedQuestions = <?php echo $_SESSION['quiz_'.$categoryId];?>;
        console.log(selectedQuestions);
    </script>


</div>

</body>
</html>
