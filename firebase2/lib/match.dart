class Matchs {
  String _uid;
  String _date;
  String _equipe1;
  String _equipe2;
  String _prix;
  String _stade;
  String _time;
  Matchs(
      this._uid,
      this._date,
      this._equipe1,
      this._equipe2,
      this._prix,
      this._stade,
      this._time
      );

  String get uid => _uid;
  set uid(String uid) {
    _uid = uid;
  }

  String get date => _date;
  set date(String date) {
    _date = date;
  }

  String get equipe1 => _equipe1;
  set equipe1(String equipe1) {
    _equipe1 = equipe1;
  }

  String get equipe2 => _equipe2;
  set equipe2(String equipe2) {
    _equipe2 = equipe2;
  }

  String get prix => _prix;
  set prix(String prix) {
    _prix = prix;
  }

  String get stade => _stade;
  set stade(String stade) {
    _stade = stade;
  }

  String get time => _time;
  set time(String time) {
    _time = time;
  }

  toSnapShot() {
    var value = {
      'uid': _uid,
      'date': _date,
      'equipe1': _equipe1,
      'equipe2': _equipe2,
      'prix': _prix,
      'stade': _stade,
      'time':_time,
    };
    return value;
  }
}
