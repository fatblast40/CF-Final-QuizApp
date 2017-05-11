$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results && results[1] || 0 ;
};
var quizCategory = $.urlParam('category');
var questionData;
var pickedAnswers = {};
var questionCount = $.urlParam('questions');
var questionIndex = 0;

var quizPromptDOM = $('#quiz-prompt');
var messageBoxDOM = $('#message-box');

function QuizPrompt(questionString, answers) {
    var self = this;
    this.answers = [];
    this.questionString = questionString;

    this.DOM = $('<div class="black">');
    this.questionContainerDOM =
        $('<div class="col-xs-8 col-xs-offset-2 text-center margin-top left_round_side warning" id="play_button">').appendTo(this.DOM);
    this.questionContainerDOM.before($('<div class="col-xs-12" id="play_line"><hr></div>'));
    this.questionDOM = $('<h1>').appendTo(this.questionContainerDOM);
    this.questionDOM.text(this.questionString);
    this.answersDOM = $('<div class="col-xs-12 col-sm-8 col-sm-offset-2">').appendTo(this.DOM);

    this.setQuestion = function (question) {
        this.question = question;
        this.questionDOM.text(questionString.question);
    };

    this.createAnswer = function (answer) {
        this.addAnswer(new QuizAnswer(this, answer))
    };


    this.addAnswer = function (answer) {
        this.answers.push(answer);
        this.answersDOM.append(answer.DOM);
        this.questionIndex++;
    };

    this.pickAnswer = function (answer) {
      pickedAnswers[this.questionString] = answer;
    };

    if (typeof answers === 'object') {
        answers.map(function (answer) {
            self.createAnswer(answer);
        });
    }

}

function QuizAnswer(prompt, answer) {
    var self = this;
    this.prompt = prompt;
    this.answer = answer;
    this.DOM = $('<div class="wrapper2 text-center">');
    this.bodyDOM = $('<div class="panel-body">').appendTo(this.DOM);
    this.textDOM = $('<h3>').appendTo(this.bodyDOM);
    this.textDOM.text(this.answer);

    this.DOM.click(function (event) {
        self.prompt.pickAnswer(self.answer);
        if (questionIndex <= 1) {
            submitResults();
        } else {
            nextPrompt();
        }
    })
}

function nextPrompt() {
    questionIndex--;
    renderPrompt();
}

function submitResults() {
    $.ajax({
        url: 'submit_questions.php',
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: JSON.stringify({
            'quiz_id': questionData.quiz_id,
            'answers': pickedAnswers
        }),
        processData: false,
        statusCode: {
            500: function (response) {
                // for 400 responses the data is contained within the responseJSON property.
                var message = response.responseJSON.message;
                showMessage(message, 'alert-danger');

            },

            400: function (response) {
                // for 400 responses the data is contained within the responseJSON property.
                var message = response.responseJSON.message;
                showMessage(message, 'alert-danger');

            },
            409: function (response) {
                // for 400 responses the data is contained within the responseJSON property.
                var message = response.responseJSON.message;
                showMessage(message, 'alert-danger');


            },
            200: function (response) {
                // for 2XX responses the data is contained right in the object.
                var message = response.message;
                showMessage(message, 'alert-success');
                setTimeout("location.href = 'quiz_score.php';",200);


            }
        }
    });
}

function renderPrompt() {
    quizPromptDOM.empty();
    var prompt = new QuizPrompt(questionData.questions[questionIndex].question, questionData.questions[questionIndex].answers);
    quizPromptDOM.append(prompt.DOM);

}

function getQuestions(quizCategory) {
    $.getJSON('get_questions.php?category='+quizCategory, function (data) {
        questionData = data;
        console.log('fetched question data');
        // calling the render function
        renderPrompt();
        questionIndex = questionData.questions.length;
    })

}

function showMessage(message, className) {
    var mainDOM = $('#message-box').empty();
    var columnDom = $('<div class="col-xs-12 booking_message">');
    var messageBoxDOM = $('<div class="alert" id="alert_message">').appendTo(columnDom);
    messageBoxDOM.addClass(className);
    var messageTextDOM = $('<h3>').appendTo(messageBoxDOM);
    messageTextDOM.text(message);
    mainDOM.append(columnDom);
}


$(document).ready(function (event) {
    getQuestions(quizCategory);
    $('#back_link').click(function (event) {
        event.preventDefault();
        history.go(-1);
    });
});

