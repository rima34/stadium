class Stade {

  String _uid;
  String _stade;


  String get uid => _uid ;
  set uid (String u)
  {
    _uid=u;
  }


  String get stade => _stade;
  set stade(String s)
  {
    _stade=s;
  }


  Stade (this._uid,this._stade);


  toSnapshot(){
    return
      {
        "uid" : uid,
        "Name": stade,
      };
  }

}