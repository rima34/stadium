//import 'package:first_app/Accueil.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';
import 'package:first_app/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:form_field_validator/form_field_validator.dart';



class AddFrB extends StatefulWidget {
  @override
  _AddFrBState createState() => _AddFrBState();
}

class _AddFrBState extends State<AddFrB> {
  bool _isObscure = true;

  var formKey = GlobalKey<FormState>();
  get _numeric => null;
  get uid =>null;



  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);




  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{8,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }



  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  TextEditingController textfirstname = new TextEditingController();
  TextEditingController textlastname = new TextEditingController();
  TextEditingController textEmail = new TextEditingController();
  TextEditingController textPhone = new TextEditingController();
  TextEditingController textpasseword = new TextEditingController();
  TextEditingController textcpassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Container(

          width: 1200.0,
          height: 1200.0,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage('assets/backs.png')
              )
          ),

          child: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextFormField(

              validator: (value) {
                if (value.isEmpty) {
                  return "* Required";
                } else
                  return null;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'First Name',
                labelText: 'First Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              controller: textfirstname,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "* Required";
                } else
                  return null;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Last Name',
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              controller: textlastname,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: MultiValidator([
                RequiredValidator(errorText: "* Required"),
                EmailValidator(errorText: "Enter valid email id"),
              ] ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              controller: textEmail,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(

              validator: validateMobile,

              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Phone',
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              controller: textPhone,
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
              controller: textpasseword,
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(

              validator: (val) =>
                  MatchValidator(errorText: 'passwords do not match')
                      .validateMatch(val, textpasseword.text),
              keyboardType: TextInputType.text,
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
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              controller: textcpassword,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              height: 5,
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
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    adduser(new User(uid,
                        textfirstname.text,
                        textlastname.text,
                        textEmail.text,
                        textPhone.text,
                        textpasseword.text,
                        textcpassword.text));
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ),
                  );
                  }
                },
                child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18 ))

  ),
     ]
        )
      )
        ),

    )
    );

  }

  var uReference = FirebaseDatabase.instance.reference();
  DatabaseReference getuserReference() {
    uReference = uReference.root();
    return uReference;
  }

  void adduser(User user) {
    uReference = getuserReference();
    uReference.child("User").push().set(user.toSnapShot());
  }

  bool isNumeric(String phone) {
    return _numeric.hasMatch(phone);
  }

}
