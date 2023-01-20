class Achat
{

  String _idmatch;


  String get idmatch => _idmatch;
  set idmatch(String id) {
    _idmatch = idmatch;
  }


  Achat(this._idmatch);

  toSnapShot(String qrid) {
    var value = {
     qrid : _idmatch ,
    };
    return value;
  }


}