class Cord
{

  String _card;
  String _cocard;



  String get card => _card;
  set card(String c) {
    _card= c;
  }

  String get cocard => _cocard;
  set cocard(String c) {
    _cocard= c;
  }



  Cord(this._card,this._cocard);

  toSnapShot() {
    var value = {
      "N° Carte":_card,
      "Code": _cocard,
    };
    return value;
  }


}