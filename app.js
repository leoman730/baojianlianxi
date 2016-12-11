var question_dialog;
var timer;

window.addEventListener('WebComponentsReady', function(e) {
    init();
});

function init() {
    question_dialog = Polymer.dom(this.root).querySelector('#question_dialog');
    selectSection(0);
    onQuestionClick();

    initGameClock();

}


function initGameClock() {
  timer = $('.game-clock').FlipClock(900, {
    autoplay: false,
    clockFace: 'MinuteCounter',
    countdown: true,
    autoStart: false,
    minimumDigits: 0,
    onStart: function() {
        console.log('i am starting');
    },
    onInterval: function() {
        console.log('here');
        console.log(timer.getFaceValue);
        console.log(this.getFaceValue());
    }
  });
}

function showAnswer() {
    var answer = Polymer.dom(elem).parentNode.querySelector('.answer');
    answer.toggle();
}


function selectSection(index) {
    Polymer.dom(this.root).querySelector('#sidenav').select(index);
}

function onQuestionClick() {
    var buttons = document.getElementsByClassName('question-btn');
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

function resetGameClock(elem) {
  var timerVal = document.getElementById('game-duration').value;
  timer.setTime(timerVal * 60);
  // timer.start();
}

function onGameClockBtnClick(elem) {
  if (elem.innerHTML.indexOf('Start') !== -1 || elem.innerHTML.indexOf('Continue') !== -1) {
    timer.start();
    elem.innerHTML = 'Stop';
  } else {
    timer.stop();
    elem.innerHTML = 'Continue';
  }
}
