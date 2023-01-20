import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/payment.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class Details extends StatefulWidget {
  String time = "";
  String date = "";
  String equipe1 = "";
  String equipe2 = "";
  String stade = "";
  String prix = "";
  String uid="";
  Details(String d, String e1, String e2, String s, String p, String u, String t) {

    this.date = d;
    this.equipe1 = e1;
    this.equipe2 = e2;
    this.stade = s;
    this.prix = p;
    this.uid=u;
  this.time=t;}

  @override
  _DetailsState createState() => _DetailsState(
      this.date, this.equipe1, this.equipe2, this.stade, this.prix,this.uid,this.time);
}

class _DetailsState extends State<Details> {
  String time = "";
  String date = "";
  String equipe1 = "";
  String equipe2 = "";
  String stade = "";
  String prix = "";
  String uid="";

  _DetailsState(this.date, this.equipe1, this.equipe2, this.stade, this.prix,this.uid,this.time) {

    this.date = date;
    this.equipe1 = equipe1;
    this.equipe2 = equipe2;
    this.stade = stade;
    this.prix = prix;
    this.uid=uid;
    this.time=time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Container(
        width: 400,
        height: 750,
        child: Card(
          margin: EdgeInsets.all(10),
          color: Colors.white,
          shadowColor: Colors.blueGrey,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: new InkWell(
            child: Text(
              "Date match : " +
                  date +
                  "\n" +
                  "Teams : " +
                  "\n" +
                  equipe1 +
                  "  " + " vs  " +
                  equipe2 +
                  "\n" +
                  "Stadium : " +
                  stade +
                  "\n" +
                  "Price  : " +
                  prix +
                  "DT"+
                  "\n" +
                  'Time : ' +time  +
                  "\n"
                +"Tap to buy your ticket",
              style: TextStyle(height: 5, fontSize: 20 ,fontWeight: FontWeight.bold , color: Colors.green),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Pay(uid,date),
                ),
              );
            },

          ),

        ),
      ),
    ));
  }
}
