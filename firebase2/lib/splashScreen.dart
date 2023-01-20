import 'package:first_app/Accueil.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences loginData;
  bool newuser;


  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
        if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }
      check_if_already_login();
    });
  }

  void check_if_already_login() async {
    loginData = await SharedPreferences.getInstance();
    newuser = (loginData.getBool('login'));
    print(newuser);
    if (newuser == true) {
      _navigateToHome();
    } else {
      _navigateToLogin();
    }
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Accueil()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LogIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

            child:Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/splash.png"), fit: BoxFit.cover,),
              ),
            ),

          )


      );
  }
}
