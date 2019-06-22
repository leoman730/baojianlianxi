import 'package:scoped_model/scoped_model.dart';

class GameModel extends Model {
  double _score = 100.00;
  bool _isActive = false;
  String _name = 'team name';
  String activeTeam;
  double activeScore = 10.00;
  List _questions;
  List _questions2;
  Map gameCardStatus;

  List <Team> _teams;

  double get score => _score;
  String get name => _name;
  List get teams => _teams;
  List get questions => _questions;
  List get questions2 => _questions2;

  GameModel() {
    _teams = [new Team('A 組'), new Team('B 組')];
    toggleActiveTeam();
    _questions = _getQuestions();
    _questions2 = _getQuestions2();
    gameCardStatus = _generateGameCardStatus();
  }


  List _getQuestions2() {
    List questions =[
      {
        'key': 'Column 1',
        'questions': [
          {
            'id':'2-1-1',
            'question': '哪種水果視力最差? ',
            'answer': '答案：芒果 ',
            'score': 30,
          },
          {
            'id':'2-1-2',
            'question': '一顆心值多少錢? ',
            'answer': '答案:1億.因為一心一意嘛!',
            'score': 30
          },
          {
            'id':'2-1-3',
            'question': '洪水漸退後，挪亞所造的方舟停在何處？',
            'answer': '7月17日，方舟停在亞拉臘山上',
            'score': 30
          },
          {
            'id':'2-1-4',
            'question': '猶太人的三位先祖是誰？',
            'answer': '答案： 亞伯拉罕、以撒、雅各',
            'score': 30
          },
          {
            'id':'2-1-5',
            'question': '請問雅各在何時得到“以色列”這個名字？',
            'answer': '答案：會見以掃的前一夜，帶家人過雅博渡口以後',
            'score': 30
          },
        ]
      },

      {
        'key': 'Column 2',
        'questions': [
          {
            'id':'2-2-1',
            'question': '耶和華神説：那人________,我要為他__________幫助他。（創世記2:18）',
            'answer': '答案：獨居不好、造一個配偶'
                '',
            'score': 30,
//            'image': ''
          },
          {
            'id':'2-2-2',
            'question': '舊約中都有誰與神同行？',
            'answer': '答案： 以諾和諾亞',
            'score': 30
          },
          {
            'id':'2-2-3',
            'question': '鉛筆姓什麼？',
            'answer': '回答：蕭（削鉛筆）',
            'score': 30
          },
          {
            'id':'2-2-4',
            'question': ' 因此，____要離開_____，與______，二人_______。（創世記2:24）',
            'answer': '答案：人、父母、妻子聯合、成為一體',
            'score': 30
          },
          {
            'id':'2-2-5',
            'question': '看圖猜成語？',
            'answer': '呆若木雞',
            'image': 'assets/images/5.png',
            'score': 30
          },
        ]
      },

      {
        'key': 'Column 3',
        'questions': [
          {
            'id':'2-3-1',
            'question': '看圖猜成語？',
            'answer': '金屋藏嬌',
            'score': 30,
            'image': 'assets/images/6.png'
          },
          {
            'id':'2-3-2',
            'question': '看圖猜成語？',
            'answer': '腸回氣盪',
            'score': 30,
            'image': 'assets/images/7.png'
          },
          {
            'id':'2-3-3',
            'question': '奧運會上的馬拉松比賽的起源與什麼有關？\n\nA、遊戲\n\nB、打賭\n\nC、戰爭\n\nD、競賽 ',
            'answer': '答案：C',
            'score': 30
          },
          {
            'id':'2-3-4',
            'question': '"輕於鴻毛"中的鴻毛是那種動物的毛？\\nA、羊\\nB、大雁\\nC、雞\\nD、燕子',
            'answer': '回答：B',
            'score': 30
          },
          {
            'id':'2-3-5',
            'question': '怎樣使麻雀安靜下來？  ',
            'answer': '答案：壓它一下。  原因：鴉雀無聲(壓雀無聲)',
            'score': 30
          },
        ]
      },
    ];


    return questions;
  }


  List _getQuestions() {
    List questions = [
      {
        'key': '創世記 1',
        'questions': [
          {
            'id':'1-1',
            'question': '為什麼創世記第11章中記載遠古時代人類要建造巴別塔？\n\nA、因為當時天下認得口音、語言都是一樣 \n\nB、 因為神要人類生養眾多，變慢地面，致力萬物 \n\nC、因為想要傳揚自己的名，免得分散到全地 \n\nD、以上都對',
            'answer': '答案： C',
            'score': 10,
//            'image': 'assets/images/splash.png'
          },
          {
            'id':'1-2',
            'question': '創世記13章～14章記載亞伯蘭與羅得分離，之後又救了羅得的經過。以下相關敘述何者有誤？\n\nA、亞伯蘭因為不願與親人在牲畜與財物上彼此相爭，而向羅得提出分離的要求\n\nB、羅得因為看到約旦河平原的富庶而去了所多瑪，沒想到被捲入戰爭\n\nC、亞伯蘭聽到姪兒羅得被擄的消息，就出動300多名壯丁前去營救\n\nD、亞伯蘭救回羅得後，羅得就拿出所奪回財物的十分之一給祭司麥基洗得',
            'answer': '答案：D',
            'score': 20
          },
          {
            'id':'1-3',
            'question': '創世記15章～17章記載神應許亞伯蘭將得後嗣以及神與他立約的經過。以下敘述何者正確？ \n\nA、神沒有馬上將迦南地賜給亞伯蘭為業，是因為迦南人的罪惡沒有滿盈 \n\nB、亞伯蘭的妾夏甲因受不了撒萊的苦待而逃走，但在曠野被亞伯蘭勸回 \n\nC、亞伯蘭與神立約時，他與兒子以實瑪利受了割禮，但他的僕人沒有 \n\nD、以上都對',
            'answer': '答案：A',
            'score': 30
          },
          {
            'id':'1-4',
            'question': '挪亞有幾個兒子？叫什麼名字？多大年紀生的？',
            'answer': '三個兒子，叫閃、含、雅弗，500歲生的。',
            'score': 40
          },
          {
            'id':'1-5',
            'question': '我把____放在_____中，這就____我與地____的____了。',
            'answer': '虹、雲彩、可作、立約、記號',
            'score': 50
          },
        ]
      },

      {
        'key': '創世記 2',
        'questions': [
          {
            'id':'2-1',
            'question': '當亞伯拉罕要將以撒獻給神時，以撒對他誰：“請看，火與柴都有了，但燔祭的羔羊在哪裡呢？”請問亞伯拉罕的回答是：\n\nA、你招的咒詛歸到我身上；你只管聽我的話\n\nB、耶和華豈有難成的事嗎？到了日期，明年這時候，我必回到你這裏\n\nC、你家裡生的和你用銀子買的，都必須受割禮\n\nD、神必自己預備作燔祭的羊羔',
            'answer': '答案： D'
                '',
            'score': 10,
//            'image': 'assets/images/splash.png'
          },
          {
            'id':'2-2',
            'question': '雅各如何得到哥哥以掃長子的名份？',
            'answer': '答案：餅與紅豆湯',
            'score': 20
          },
          {
            'id':'2-3',
            'question': '神就照著自己的形象_____，那是照著他的形象______。神就賜福給他們，又對他們説：“________， 遍滿地面，治理這地，也要管理海裏的_____、空中的____、和地上各樣行動的_____.” (創世記1:27-28)',
            'answer': '答案：造人、造男造女、要生養眾多、魚、鳥、活物',
            'score': 30
          },
          {
            'id':'2-4',
            'question': '在創世記中，神和人約了四個約定，請問是哪些？',
            'answer': '伊甸園之約、亞當之約、挪亞之約、亞伯拉罕之約',
            'score': 40
          },
          {
            'id':'2-5',
            'question': '在創世記中__________沒有死就被神所提去，他是亞當的第_________代世孫？',
            'answer': '答案： 以諾、七',
            'score': 50
          },
        ]
      },

      {
        'key': '知識題',
        'questions': [
          {
            'id':'3-1',
            'question': '血液中的红细胞可以活：\n\nA、7天\n\nB、120天\n\nC、一生\n\nD、30天',
            'answer': '答案： B',
            'score': 10,
//            'image': 'assets/images/splash.png'
          },
          {
            'id':'3-2',
            'question': '最早制造香水瓶所用的原料是：\n\nA、陶瓷\n\nB、玻璃\n\nC、石膏\n\nD、铜瓶',
            'answer': '答案：C',
            'score': 20
          },
          {
            'id':'3-3',
            'question': '數學符號中的“0”起源於：\n\nA、古印度\n\nB、古希臘\n\nC、古羅馬\n\nD、古埃及\n\nE、中國',
            'answer': '答案：A',
            'score': 30
          },
          {
            'id':'3-4',
            'question': '鉛筆上的標示，如“2B”、“HB”等，其中B越多代表鉛筆越？\n\nA、淺\n\nB、硬\n\nC、軟',
            'answer': '答案： C',
            'score': 40
          },
          {
            'id':'3-5',
            'question': '五香除花椒、茴香子外還有包括什麼？\n\nA、八角、辣椒、丁香\n\nB、八角、桂皮、丁香花蕾\n\nC、桂皮、八角、胡椒\n\nD、芥末、桂皮、八角',
            'answer': '答案： B',
            'score': 50
          },
      ]
      },
      {
        'key': '團契知多少',
        'questions': [
           {
            'id':'4-1',
            'question': '請講出5個5月份的壽星公？',
            'answer': 'May, Susan, Joshua, Christopher, Clement,  Ethan, Ian, 心珏，Daniel的小朋友',
            'score': 10,
          },
          {
            'id':'4-2',
            'question': '猜猜我是誰？',
            'answer': '答案：Praisely、莫琳',
            'image': 'assets/images/1.png',
            'score': 20
          },
          {
            'id':'4-3',
            'question': '猜猜我是誰？',
            'answer': '答案：亮哥，楊勇',
            'image': 'assets/images/2.png',
            'score': 30
          },
          {
            'id':'4-4',
            'question': '請問這是什麼聚會和在什麼時候？',
            'answer': '答案：10/7/2017 團契在Alley Pond Park BBQ',
            'image': 'assets/images/3.png',
            'score': 40
          },
          {
            'id':'4-5',
            'question': '猜猜我是誰？',
            'answer': '答案：周教士、丁師母，淑若，雪影，May和林慧',
            'image': 'assets/images/4.png',
            'score': 50
          },
        ]
      },
      {
        'key': 'IQ趣味題',
        'questions': [
          {
            'id':'5-1',
            'question': '你参加赛跑，追过第2名，你是第几名？',
            'answer': '答案：你如果追过第2名，你只是取代那人的位置，你是第2名。',
            'score': 10,
          },
          {
            'id':'5-2',
            'question': '有一只猪，它走啊走啊，走到了英国,结果他变成了什么?',
            'answer': '答案：Pig',
            'score': 20
          },
          {
            'id':'5-3',
            'question': '30-50哪個數字比熊的大便厲害!',
            'answer': '答案:40  原因：事實勝於雄(熊)辯',
            'score': 30
          },
          {
            'id':'5-4',
            'question': '2只蚂蚁看见一个梨,打国家名字',
            'answer': '意大利。咦，大梨！',
            'score': 40
          },
          {
            'id':'5-5',
            'question': '以1000加上40，再加1000，再加30，再加1000，现在加上20，再加上1000，现在加上10，总数是什么？（只能在脑中盘算，不要使用纸与笔或计算器）',
            'answer': '答案：4100',
            'score': 50
          },
        ]
      },

      {
        'key': '猜猜我是誰',
        'questions': [
          {
            'id':'6-1',
            'question': '派出一至兩名代表, 以動作、對話、講出最多三樣關於該人物的事件，猜猜該人物是誰.\n\n不可以說出或做出該人名, 或其同音字, 否則該題分數取消.',
            'answer': '答案: 拉班',
            'score': 10,
          },
          {
            'id':'6-2',
            'question': '派出一至兩名代表, 以動作、對話、講出最多三樣關於該人物的事件，猜猜該人物是誰.\n\n不可以說出或做出該人名, 或其同音字, 否則該題分數取消.',
            'answer': '答案: 利百加',
            'score': 20
          },
          {
            'id':'6-3',
            'question': '派出一至兩名代表, 以動作、對話、講出最多三樣關於該人物的事件，猜猜該人物是誰.\n\n不可以說出或做出該人名, 或其同音字, 否則該題分數取消.',
            'answer': '答案: 拉麥',
            'score': 30
          },
          {
            'id':'6-4',
            'question': '派出一至兩名代表, 以動作、對話、講出最多三樣關於該人物的事件，猜猜該人物是誰.\n\n不可以說出或做出該人名, 或其同音字, 否則該題分數取消.',
            'answer': '答案: 利亞',
            'score': 40
          },
          {
            'id':'6-5',
            'question': '派出一至兩名代表, 以動作、對話、講出最多三樣關於該人物的事件，猜猜該人物是誰.\n\n不可以說出或做出該人名, 或其同音字, 否則該題分數取消.',
            'answer': '答案: 瑪土撒拉',
            'score': 50
          },
        ]
      },

    ];

    return questions;
  }



  Map _generateGameCardStatus() {
    Map cardStatus = {};
    this._questions.forEach((items) {
      items['questions'].forEach((question) {
        cardStatus[question['id']]= false;
      });
    });

    this._questions2.forEach((items) {
      items['questions'].forEach((question) {
        cardStatus[question['id']]= false;
      });
    });
    return cardStatus;
  }


  void toggleActiveTeam() {
    this.activeTeam = (this.activeTeam == this.teams[0].id) ? this.teams[1].id : this.teams[0].id;
    notifyListeners();
  }

  void setActiveScore(double value) {
//    print('set active score to: ' + value.toString());
    this.activeScore = value;
  }

  setTeamScore(id, value) {
    Team team = this.findTeamById(id);
    team.score = value;
  }

  bool getCardStatus(id) {
//    id = int.parse(id);
//  print(gameCardStatus);
    return this.gameCardStatus[id];
  }

  void setCardStatus(id, hasOpened) {
    this.gameCardStatus[id] = hasOpened;
  }

  Team findTeamById(id) {
    Team candidate;
    teams.forEach((team) {
      if (team.id == id) {
        candidate = team;
      }
    });

    return candidate;
  }



}

class Team extends Model {
  double score = 100;
  String id = 'undefined';

  Team(this.id);

  void increment(value) {
    score = score + value;
    // Then notify all the listeners.
    notifyListeners();
  }

  void decrement(value) {
    score = score - value;
    // Then notify all the listeners.
    notifyListeners();
  }

  void setScore(value) {
    print('team: '+ this.id);
    print('score set to ' + value.toString() );
    score = value;
  }
}

class Question extends Model {
  int _score;
  String _question;
  String _answer;
  String _image;
  String _id;

  Question(Map args) {
    this._id = args['id'];
    this._question = args['question'];
    this._answer = args['answer'];
    this._score = args['score'];
    this._image = args['image'];
  }

  String get id => this._id;
  String get question => this._question;
  String get answer => this._answer;
  int get score => this._score;
  String get image => this._image;

}
