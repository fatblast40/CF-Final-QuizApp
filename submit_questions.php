<?php
ob_start();
session_start();
require_once 'dbconnect.php';
require_once 'includes/api_helpers.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
    showError(400, 'Invalid user session.');
}
$userId = (int)$con->real_escape_string($_SESSION['user']);

$quizDataQuery = $con->prepare(<<<'SQL'
SELECT * FROM quizzes WHERE FK_users = ? AND id = ?
;
SQL
);

$selectedQuestionsQuery = $con->prepare(<<<'SQL'
SELECT questions.id, question FROM quizzes
INNER JOIN quiz_questions ON quizzes.id = quiz_questions.FK_quizzes
INNER JOIN questions ON quiz_questions.FK_questions = questions.id
WHERE quizzes.FK_users = ? AND quizzes.id = ?
;
SQL
);

$updateQuizQuery = $con->prepare(<<<'SQL'
UPDATE quizzes SET scores = ?, end_timestamp = NOW()
WHERE quizzes.id = ?
;
SQL
);


$correctAnswersQuery = $con->prepare(<<<'SQL'
SELECT answers.id, answer, correct FROM answers
WHERE correct = 1 AND FK_question = ?
SQL
);

function runQuery(mysqli_stmt &$mysqli_stmt, $typeString, ...$values) {
    error_log(json_encode($values));
    global $con;
    $values = array_map(function ($value) use ($con) {
        return $con->real_escape_string($value);
    }, $values);
    $mysqli_stmt->bind_param($typeString, ...$values);
    $mysqli_stmt->execute();
}


function getQueryData(mysqli_stmt &$mysqli_stmt, $typeString, ...$values) {
    global $con;
    runQuery($mysqli_stmt, $typeString, ...$values);
    $result = $mysqli_stmt->get_result();
    if (is_bool($result)) {
        throw new UnexpectedValueException('mysql error: '. $con->error);
    }
    $values = [];
    while ($value = $result->fetch_assoc()) {
        $values[] = $value;
    }
    return $values;
}






if (isset($_POST)) {
    try {
        $data = json_decode(file_get_contents('php://input'), true);
        $data['answers'] = array_unique($data['answers']);
        $submittedAnswers = $data['answers'];
        $quizId = $data['quiz_id'];
        if (!isset($data['answers']) && !isset($data['quiz_id'])) {
            showError(400, 'Invalid input');
            exit();
        }

        $quizData = getQueryData($quizDataQuery, 'ii', $userId, $quizId);
        $selectedQuestions = getQueryData($selectedQuestionsQuery, 'ii', $userId, $quizId);
        if (count($submittedAnswers) != count($selectedQuestions)) {
            showError(400, 'Incorrect number of Answers submitted.');
        }
        $score = 0;
        foreach ($selectedQuestions as $question) {
            $selectedQuestionId = $question['id'];
            $selectedQuestionString = $question['question'];
            $correctAnswers = getQueryData($correctAnswersQuery, 'i', $selectedQuestionId);
            foreach ($correctAnswers as $correctAnswer) {
                $correctAnswerId = $correctAnswer['id'];
                $correctAnswerString = $correctAnswer['answer'];
                if (isset($submittedAnswers[$selectedQuestionString])) {
                    if ($submittedAnswers[$selectedQuestionString] == $correctAnswerString) {
                        $score++;
                        break;
                    }
                }
            }

        }

        $points = $score / count($selectedQuestions);
        error_log("Quiz has been graded: $points");
        runQuery($updateQuizQuery, 'di', $points, $quizId);

        echo json_encode(['message' => 'Quiz has been graded', 'score' => $points]);

        http_response_code(200);
        exit();
    } catch (\UnexpectedValueException $exception) {
        showError(400, 'Database error: '.$exception->getMessage());
    }
}


ob_end_flush();