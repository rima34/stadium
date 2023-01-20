import 'package:first_app/Accueil.dart';
import 'achatTicket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/Cordonnée.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'qr.dart';

class Pay extends StatefulWidget {
  String datematch = "";
  String idmatch = "";

  Pay(String d, String e1) {
    this.datematch = d;
    this.idmatch = e1;
  }

  @override
  _PayState createState() => _PayState(this.idmatch, this.datematch);
}

class _PayState extends State<Pay> {

  List<Achat> allTicket = [];
  List<Achat> searchTicket = [];

  String iduser = "";

  @override
  void initState() {
    super.initState();
    getallTickets();
    setState(() {
      getDataFromSharedPreferences();
    });
  }

  String datematch = "";
  String idmatch = "";

  _PayState(String d, String e1) {
    this.datematch = d;
    this.idmatch = e1;
  }

  var formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  TextEditingController textcarte = new TextEditingController();
  TextEditingController textcocarte = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        Form(
            child: Container(
                width: 1200.0,
                height: 1200.0,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/backl.png')
                    )
                ),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
          SizedBox(height: 160),
          Text(
            "",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(padding: EdgeInsets.only(right: 40)),
          TextFormField(
            decoration: InputDecoration(

                hintText: 'N° Carte',
                labelText: 'N° Carte',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(900.0),
                )),
            controller: textcarte,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: _isObscure,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
                hintText: 'Code Confidentiel',
                labelText: 'Code Confidentiel',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
            controller: textcocarte,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
              onPressed: () {
                addCord(new Cord(textcarte.text,textcocarte.text));
                //list des tickets fl init
               if ((allTicket.length) < 0) {
                  achatTick(new Achat(
                      "PortA/" + datematch + "/" + idmatch + "/" + iduser));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  QRc("PortA/" + datematch + "/" + idmatch + "/" + iduser),
                    ),
                  ); }
               else {
                  achatTick(new Achat(
                      "PortB/" + datematch + "/" + idmatch + "/" + iduser));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRc("PortB/" + datematch + "/" + idmatch + "/" + iduser),
                    ),
                  );
                }


              },
              child: Text('Payement',
                  style: TextStyle(color: Colors.white, fontSize: 18))),
        ])))));
  }

  var uReference = FirebaseDatabase.instance.reference();
  DatabaseReference getCordReference() {
    uReference = uReference.root();
    return uReference;
  }

  void addCord(Cord cord) {
    uReference = getCordReference();
    uReference.child("Cordonnée").push().set(cord.toSnapShot());
  }

  var aReference = FirebaseDatabase.instance.reference();
  DatabaseReference getAchatReference() {
    aReference = aReference.root();
    return aReference;
  }

  void achatTick(Achat atick) {
    aReference = getAchatReference();
    aReference.child("AchatTicket").set(atick.toSnapShot("1"));
  }

  Future getDataFromSharedPreferences() async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    iduser = loginData.getString('uid').toString();
  }

  void getallTickets() {

   searchTicket.clear();
    Query query = aReference.child("AchatTicket");
    query.once().then((snapshot) {
      print(snapshot.value);
     String  qrval;
     snapshot.value.forEach((key, value) {

        searchTicket.add(new Achat(qrval));
        setState(() {
          allTicket = searchTicket.toList();
        });
      });
    });
  }



}
