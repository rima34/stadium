class User {
  String _uid;
  String _firstname;
  String _lastname;
  String _Email;
  String _Phone;
  String _password;
  String _cpassword;


String get uid => _uid;
set uid(String uid) {
  _uid = uid;
}

  String get firstname => _firstname;
  set firstname(String ft) {
    _firstname = ft;
  }

  String get lastname => _lastname;
  set lastname(String ln) {
    _lastname = ln;
  }

  String get Email => _Email;
  set Email(String e) {
    _Email = e;
  }

  String get Phone => _Phone;
  set Phone(String p) {
    _Phone = p;
  }

  String get password => _password;
  set password(String ps) {
    _password = ps;
  }

  String get cpassword => _cpassword;
  set cpassword(String pss) {
    _cpassword = pss;
  }



  User(this._uid,this._firstname, this._lastname, this._Email, this._Phone,
      this._password, this._cpassword);

  toSnapShot() {
    var value = {
      "uid":_uid,
      "firstname": _firstname,
      "lastname": _lastname,
      "Email": _Email,
      "Phone": _Phone,
      "Password": _password,
      "Confirm Password": _cpassword,
    };
    return value;
  }
}
