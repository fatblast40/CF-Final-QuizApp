
<!doctype html>
<html lang="en">
<?php require_once 'includes/head_tag.php'?>
<?php require_once 'dbconnect.php'?>
<?php
$allQuestionsQuery = $con->prepare(<<<'SQL'
SELECT id, question FROM questions;
SQL
);

$categoryQuestionsQuery = $con->prepare(<<<'SQL'
SELECT questions.id, questions.question FROM questions
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

function initQuiz($questionResults) {

}


?>
<body>
<div class="container">


</div>

</body>
</html>
