import 'package:first_app/addFirebase.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';




class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hello There!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "New way to get your match ticket easily",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          new Image.asset("assets/tick.jpg")


                        ],

                      ),

                      MaterialButton(
                        minWidth: double.infinity,
                        height:60,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddFrB()),
                          );
                        },
                        color: Colors.indigo,
                        padding:EdgeInsets.symmetric(
                            horizontal: 80.0 , vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text('Get Started',
                          style: TextStyle(
                            fontSize: 16,

                          ),),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            'You have already an account?',),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogIn(),
                                ),
                              );
                            },
                            child:Text('Log In',
                              style: TextStyle(

                                  color: Colors.indigo,

                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),

                    ]
                )


            )
        )
    );
  }
}
