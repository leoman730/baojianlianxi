var question_dialog;


window.addEventListener('WebComponentsReady', function(e) {
    init();
});

function init() {
    question_dialog = Polymer.dom(this.root).querySelector('#question_dialog');
    selectSection(0);
    onQuestionClick();
}

function showAnswer() {
    var answer = Polymer.dom(elem).parentNode.querySelector('.answer');
    answer.toggle();
}


function selectSection(index) {
    Polymer.dom(this.root).querySelector('#sidenav').select(index);
}

function onQuestionClick() {
    var buttons = document.getElementsByTagName('paper-button');
    var buttonList = Array.prototype.slice.call(buttons);
    buttonList.forEach(function(item, index) {
        item.addEventListener('click', function() {
            var questionIndex = item.dataset['questionIndex'];
            var questionContent = getQuestionContentByIndex(questionIndex);

            openQuestion(questionContent);
        });
    });
}

function getQuestionContentByIndex(index) {
    return questionPool[index];
}


function openQuestion(questionContent) {
    setQuestionContent(questionContent);
    question_dialog.toggle();
}

function setQuestionContent(content) {
    question_dialog.querySelector('.question').innerHTML = '<strong>' + content.question + '</stong>';
    question_dialog.querySelector('.answer').innerHTML = '<i>' + content.answer + '</i>';
}

function toggle(elem) {
    var answer = Polymer.dom(elem).parentNode.querySelector('.answer');
    answer.toggle();
}
