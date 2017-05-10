<?php require_once 'dbconnect.php'?>
<?php

header('Content-Type: application/json');
$allQuestionsQuery = $con->prepare(<<<'SQL'
SELECT id, question FROM questions ORDER BY RAND() LIMIT ?;
SQL
);


$newQuizQuery = $con->prepare(<<<'SQL'
INSERT INTO quizzes (FK_users, FK_categories, start_timestamp) VALUES (?, ?, NOW());
SQL
);

$removeUnfinishedQuizQuery = $con->prepare(<<<'SQL'
DELETE FROM quizzes WHERE ISNULL(scores) AND FK_users = ? AND FK_categories = ?;
SQL
);

$removeUnfinishedQuizQuestionsQuery = $con->prepare(<<<'SQL'
DELETE FROM quiz_questions WHERE id = ?;
SQL
);

$getUnfinishedQuestionsQuery = $con->prepare(<<<'SQL'
SELECT quiz_questions.id FROM quizzes
INNER JOIN quiz_questions ON quizzes.id = quiz_questions.FK_quizzes
WHERE ISNULL(scores) AND FK_users = ? AND FK_categories = ?
SQL
);

$addQuizQuestionsQuery = $con->prepare(<<<'SQL'
INSERT INTO quiz_questions (FK_quizzes, FK_questions) VALUES (?, ?);
SQL
);

$categoryQuestionsQuery = $con->prepare(<<<'SQL'
SELECT questions.id, question FROM questions
WHERE questions.FK_categories = ? ORDER BY RAND() LIMIT ?;
SQL
);

$correctAnswerQuery = $con->prepare(<<<'SQL'
SELECT id, answer FROM answers WHERE FK_question = ? AND correct = 1
ORDER BY RAND() LIMIT 1;
SQL
);

$incorrectAnswersQuery = $con->prepare(<<<'SQL'
SELECT id, answer FROM answers WHERE FK_question = ? AND correct = 0
ORDER BY RAND() LIMIT 3;
SQL
);

$getCategoryIdQuery = $con->prepare(<<<'SQL'
SELECT id FROM categories WHERE category = ?
;
SQL
);


function showError($httpCode, $message) {
    global $con;
    http_response_code($httpCode);
    echo json_encode(['status' => 'error', 'message' => $message, 'dberror' => $con->error]);
    exit();
}


//$userId = (int)$con->real_escape_string($_SESSION['user']);
$userId = 1;
$categoryName = $con->real_escape_string($_GET['category']);
$getCategoryIdQuery->bind_param('s', $categoryName);
$getCategoryIdQuery->execute();
$getCategoryIdResult = $getCategoryIdQuery->get_result();

if (is_bool($getCategoryIdResult)) {
    showError(400, 'Unknown Category');
}

$categoryId = $getCategoryIdResult->fetch_assoc()['id'];

//$questionCount = (int)$con->real_escape_string($_GET['questions']);
$questionCount = 10;
$allQuestionsQuery->execute();

switch ($categoryId) {
    case 'Mixed':
        $allQuestionsQuery->bind_param('i', $questionCount);
        $allQuestionsQuery->execute();
        initQuiz($allQuestionsQuery->get_result());
        break;
    default:
        $categoryQuestionsQuery->bind_param('ii', $categoryId, $questionCount);
        $categoryQuestionsQuery->execute();
        initQuiz($categoryQuestionsQuery->get_result());
        break;

}

function createQuiz() {
    global $con;
    global $newQuizQuery;
    global $userId;
    global $categoryId;
    global $removeUnfinishedQuizQuery;
    global $getUnfinishedQuestionsQuery;
    global $removeUnfinishedQuizQuestionsQuery;

    $getUnfinishedQuestionsQuery->bind_param('ii', $userId, $categoryId);
    $getUnfinishedQuestionsQuery->execute();
    $getUnfinishedQuestionsResult = $getUnfinishedQuestionsQuery->get_result();
    if (is_bool($getUnfinishedQuestionsResult)) {
        showError(400, 'could not create quiz');
    }
    while ($unfinishedQuestion = $getUnfinishedQuestionsResult->fetch_assoc()) {
        $removeUnfinishedQuizQuestionsQuery->bind_param('i', $unfinishedQuestion['id']);
        $removeUnfinishedQuizQuestionsQuery->execute();
    }
    $removeUnfinishedQuizQuery->bind_param('ii', $userId, $categoryId);
    $removeUnfinishedQuizQuery->execute();

    $newQuizQuery->bind_param('ii', $userId, $categoryId);
    $newQuizQuery->execute();
    return $con->insert_id;
}


function addQuizQuestion($quizId, $questionId) {
    global $addQuizQuestionsQuery;
    $addQuizQuestionsQuery->bind_param('ii', $quizId, $question);
    $addQuizQuestionsQuery->execute();

}

/**
 * @param bool|mysqli_result $questionResults
 */
function initQuiz($questionResults) {
    global $con;

    // insert new quiz and store id
    $quizId = createQuiz();


    if (is_bool($questionResults)) {
        showError(400, 'can not initialize quiz.');
        exit();
    }
    $questions = [];
    while ($question = $questionResults->fetch_assoc()) {
        addQuizQuestion($quizId, $question['id']);
        $questions[] = $question;
    }
    $values = [];
    foreach ($questions as $question) {
        $answers = [];
        global $correctAnswerQuery;
        global $incorrectAnswersQuery;
        $incorrectAnswersQuery->bind_param('i', $question['id']);
        $incorrectAnswersQuery->execute();
        $answersResults = $incorrectAnswersQuery->get_result();
        while ($answer = $answersResults->fetch_assoc()) {
            $answers[] = $answer['answer'];
        }
        $correctAnswerQuery->bind_param('i', $question['id']);
        $correctAnswerQuery->execute();
        $correctAnswerResult = $correctAnswerQuery->get_result();
        $answers[] = $correctAnswerResult->fetch_assoc()['answer'];
        shuffle($answers);

        $value = [
            'question' => $question['question'],
            'answers' => $answers
        ];
        $values[] = $value;
    }
    print json_encode(['quiz_id' => $quizId, 'questions' => $values]);
};


?>


