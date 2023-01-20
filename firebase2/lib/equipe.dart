class Equipe {

  String _uid;
  String _equipe;


  String get uid => _uid ;
  set uid (String u)
  {
    _uid=u;
  }


  String get equipe => _equipe;
  set equipe(String e)
  {
    _equipe=e;
  }


  Equipe (this._uid,this._equipe);


  toSnapshot(){
    return
      {
        "uid" : uid,
        "Name": equipe,
      };
  }

}