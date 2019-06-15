import 'package:scoped_model/scoped_model.dart';

class GameModel extends Model {
  double _score = 100.00;
  bool _isActive = false;
  String _name = 'team name';

  List <Team> _teams = [new Team('team1'), new Team('team2')];

  double get score => _score;
  String get name => _name;
  List get teams => _teams;





  void toggleActive() {
    _isActive = !_isActive;
    notifyListeners();
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
}
