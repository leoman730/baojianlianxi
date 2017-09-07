var question_dialog;
var clock;
var team_a_sigh = 'plus';
var team_b_sigh = 'plus';

window.addEventListener('WebComponentsReady', function(e) {
    init();
});

function init() {
    question_dialog = Polymer.dom(this.root).querySelector('#question_dialog');
    // initGameBoard();
    selectSection(0);
    onQuestionClick();

    initGameClock();

}


function initGameBoard() {
  dataset.each(function(section) {
    console.log(section);
  });
}



function initGameClock() {
  clock = new FlipClock($('.game-clock'), 900, {
    autoplay: false,
    clockFace: 'MinuteCounter',
    countdown: true,
    autoStart: false,
    minimumDigits: 0
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

            item.disabled = true;
            openQuestion(questionContent);
        });
    });
}

function getQuestionContentByIndex(index) {
    return questionPool[index];
}


function openQuestion(questionContent) {
    setQuestionContent(questionContent);
        
    question_dialog.querySelector('.answer').hide();

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
  var clockVal = document.getElementById('game-duration').value;
  clock.setTime(clockVal * 60);
  // clock.start();
}

function onGameClockBtnClick(elem) {
  if (elem.innerHTML.indexOf('Start') !== -1 || elem.innerHTML.indexOf('Continue') !== -1) {
    clock.start();
    elem.innerHTML = 'Stop';
  } else {
    clock.stop();
    elem.innerHTML = 'Continue';
  }
}

function setTeamArithmeticSigh(team, sigh) {
  if (team === 'team_a') {
    team_a_sigh = sigh;
  } else if (team === 'team_b') {
    team_b_sigh = sigh;
  }
}

function updateScore(elem) {
  var score = elem.dataset.value;
  var team = elem.dataset.team;

  if (team === 'team_a') {
    if (team_a_sigh == 'plus') {
      document.getElementById("team_a_score").value = parseInt(document.getElementById("team_a_score").value, 10) + parseInt(score, 10);
    } else {
      document.getElementById("team_a_score").value = parseInt(document.getElementById("team_a_score").value, 10) - parseInt(score, 10);
    }

  } else if (team === 'team_b') {
    if (team_b_sigh === 'plus') {
        document.getElementById("team_b_score").value = parseInt(document.getElementById("team_b_score").value, 10) + parseInt(score, 10);
    } else {
      document.getElementById("team_b_score").value = parseInt(document.getElementById("team_b_score").value, 10) - parseInt(score, 10);
    }

  }
}
