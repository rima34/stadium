import 'package:first_app/Accueil.dart';
import 'package:first_app/addFirebase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'user.dart';


class LogIn extends StatefulWidget {

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  bool _isObscure = false;
  SharedPreferences loginData;
  TextEditingController textemail = new TextEditingController();
  TextEditingController textpassword = new TextEditingController();


  @override
  void initState() {
    super.initState();
searchUser();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      Stack(

          children: <Widget>[

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
           child:

           Column(

             mainAxisAlignment: MainAxisAlignment.start,
             children: [

               SizedBox(height: 200),
              /* Text(
                 "Log In",
                 style: TextStyle(
                   fontSize: 35,
                   fontWeight: FontWeight.bold,
                 ),
               ),*/
               SizedBox(
                 height: 60,
               ),
               Text(
                 "Welcome",
                 style: TextStyle(
                   fontSize: 20,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 ),

               ),
               SizedBox(
                 height: 80,
               ),
               Padding(padding: EdgeInsets.only(right:40)),
               TextFormField(
                 decoration: InputDecoration(

                     prefixIcon: Icon(Icons.email),
                     hintText: 'Email',
                     labelText: 'Email',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(900.0),
                     )),
                 controller :textemail ,
               ),
               SizedBox(
                 height: 10,
               ),
               TextFormField(
                 obscureText: ! _isObscure,
                 decoration: InputDecoration(
                     suffixIcon: IconButton(
                         icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off),
                         onPressed: () {
                           setState(() {
                             _isObscure = !_isObscure;
                           });
                         }),
                     hintText: 'Password',
                     labelText: 'Password',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30.0),
                     )),
                 controller: textpassword,
               ),
               SizedBox(
                 height: 50,
               ),
            ElevatedButton(

              style: ElevatedButton.styleFrom(
                padding:EdgeInsets.symmetric(
                    horizontal: 80.0 , vertical: 20.0),
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                ),
              ),

              onPressed:
                 (){
                searchUser();
                 //appel methode search ki telkah tkhabi fl shared preferences uid =>appel saveData

                   if ((findUser(allUsers, textemail.text,textpassword.text).toString())!="null")
                     {
                       SaveData(findUser(allUsers, textemail.text, textpassword.text).toString());
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => Accueil(),
                         ),
                       ); }
              },
             child: Text('Log In',
               style: TextStyle(color: Colors.white, fontSize: 18


             ),),
           ),

               SizedBox(
                 height: 30,
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   Text(
                     'New to this app?'),

                   SizedBox(
                     width: 5,
                   ),
                   GestureDetector(
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => AddFrB(),
                         ),
                       );
                     },
                     child:Text('Sign Up',
                       style: TextStyle(
                           color: Colors.white,
                           backgroundColor: Colors.teal,
                           fontSize: 18),
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),
       ),
      )
    ]
      )
    );
   }
   //methode searchuser

  var stdReference = FirebaseDatabase.instance.reference();
  DatabaseReference getStudentReference() {
    stdReference = stdReference.root();
    return stdReference;
  }

  List<User> allUsers = [];
  List<User> searchUsers = [];
  void searchUser() {
    searchUsers.clear();

    Query query = stdReference
        .child("User")
        .orderByChild("firstname");
    query.once().then((snapshot) {
      String uid,
          firstname,
          lastname,
          email,
          phone,
          password,
          cpassword;
      snapshot.value.forEach((key, value) {
        uid=key;
        firstname = value["firstname"].toString().trim();
        lastname = value["lastname"].toString().trim();
        email = value["Email"].toString().trim();
        phone=value["Phone"].toString().trim();
        password=value["Password"].toString().trim();
        cpassword=value["Confirm Password"].toString().trim();

        searchUsers.add(new User(uid,
            firstname,
            lastname,
            email,
            phone,
            password,
            cpassword));
        setState(() {
          allUsers = searchUsers.toList();
        });
      });
    });
  }

  String findUser(List<User> allUsers, String email,String password) {
    final result = allUsers.where((element) => element.Email == email && element.password == password);
    if (result.isNotEmpty) {
      return result.first.uid;
    }
    return null;
  }


  Future SaveData(String uid) async
  {
    loginData= await SharedPreferences.getInstance();
    loginData.setBool('login', true);
    loginData.setString('uid', uid);
  }

}
