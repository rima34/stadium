import 'payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QRc extends StatefulWidget {
  String text="";
  QRc( String text){
    this.text=text;
  }

  @override
  _QRcState createState() => _QRcState(this.text);
}

class _QRcState extends State<QRc> {

  String text="";
  _QRcState( String text){
    this.text=text;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Take a screenshot",textAlign: TextAlign.center,),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          alignment: Alignment.bottomCenter,
          width: 390,
          height: 500,
          child: QrImage(
            data: "${text}",
            version: QrVersions.auto,
            size: 300.0,
            backgroundColor: Colors.white,
            ),

          )
         );

  }
}
