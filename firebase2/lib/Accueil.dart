import 'package:first_app/equipe.dart';
import 'package:first_app/stade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'match.dart';
import 'details.dart';


class Accueil extends StatefulWidget {


  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {



  List<Matchs> allMatches = [];
  List<Matchs> searchMatches = [];
  List<Equipe> allEquips =[];
  List<Equipe> searchEquips = [];
  List<Stade> allStades =[];
  List<Stade> searchStades = [];
  Equipe currentEquipe = new Equipe("", "");
  @override
  void initState() {
    super.initState();
    getallEquips();
    getallStades();
    getallMatches();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("List of matchs"),
         centerTitle: true,
          backgroundColor: Colors.green,
       ),


      body: Container(

        child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 30)),

            Container(

              width: 500,
              height: 600,
              child: Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/aa.jpg')
                    )
                ),
              child:ListView.builder(
                  itemCount: allMatches.length,
                  itemBuilder: (BuildContext context, int position){


                return Card(
                  color: Colors.transparent,
                  elevation: 5,
                  child: ListTile(

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                            allMatches[position].date,
                            allMatches[position].equipe1,
                            allMatches[position].equipe2,
                            allMatches[position].stade,
                            allMatches[position].prix,
                            allMatches[position].uid,
                            allMatches[position].time),
                      ),
                    );
                  },

                  title: Text("\n"
                      +"\n"+allMatches[position].equipe1
                      + '  VS  '
                      + allMatches[position].equipe2,
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("\n"
                      +"\n"+allMatches[position].prix
                      + 'DT'
                      +"\n"
                      +"\n"
                      + allMatches[position].date,

                      textAlign: TextAlign.end,
                      style: new TextStyle(color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold)),


                  // trailing: Text(allMatches[position].stade),
                  //  leading: Text(allMatches[position].date),
                  //leading: CircleAvatar(),
                ),);

    }),

            )
            )],
        ),
      )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  var stdReference = FirebaseDatabase.instance.reference();
  DatabaseReference getMatchstReference() {
    stdReference = stdReference.root();
    return stdReference;
  }



  void getallMatches() {
    searchMatches.clear();

    Query query = stdReference.child("matchs").orderByChild("date");

    query.once().then((snapshot) {
      String uid, date, equipe1, equipe2, prix, stade,time;


      snapshot.value.forEach((key, value) {
        uid = key;
        date = value["date"].toString().trim();
        equipe1 = value["equipe1"].toString().trim();
        equipe2 = value["equipe2"].toString().trim();
        prix = value["prix"].toString().trim();
        stade = value["stade"].toString().trim();
        time = value["time"].toString().trim();

        searchMatches.add(new Matchs(
            uid,
            date,
            findNameEquipe(allEquips, equipe1).toString(),
            findNameEquipe(allEquips, equipe2).toString(),
            prix,
            findNameStade(allStades, stade).toString(),
        time));
        setState(() {
          allMatches = searchMatches.toList();
          print(allMatches.length);
        });
      });
    });
  }

  void getallEquips() {
    searchEquips.clear();

    Query query = stdReference.child("equipe").orderByChild("equipe");

    query.once().then((snapshot) {
      String uid,equipe;

      snapshot.value.forEach((key, value) {
        uid = key;
        equipe = value["equipe"].toString().trim();

        searchEquips.add(new Equipe(uid,equipe));

        setState(() {
          allEquips = searchEquips.toList();

        });
      });
    });
  }

  void getallStades() {
    searchStades.clear();

    Query query = stdReference.child("stade").orderByChild("stade");

    query.once().then((snapshot) {
      String uid,stade;

      snapshot.value.forEach((key, value) {
        uid = key;
        stade = value["stade"].toString().trim();

        searchStades.add(new Stade(uid,stade));

        setState(() {
          allStades = searchStades.toList();

        });
      });
    });
  }

  String findNameEquipe(List<Equipe> allEquips, String id) {
    final result = allEquips.where((element) => element.uid == id);
    if (result.isNotEmpty) {
      return result.first.equipe;
    }
    return null;

  }

  String findNameStade(List<Stade> allStades, String id) {
    final result = allStades.where((element) => element.uid == id);
    if (result.isNotEmpty) {
      return result.first.stade;
    }
    return null;

  }


}



