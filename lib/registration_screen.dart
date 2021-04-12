import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/homePage/home2.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'Registration_Screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  // User loggedInUser;

  bool showSpinner = false;
  String email;
  String FirstName;
  String LastName;
  int PhoneNumber;
  String password;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  String _error;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  void initState() {
    super.initState();
    //  getCurrentUser();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  String _submit() {
    final form = _form.currentState;
    if (form.validate()) {
      return 'OK';
    }
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.red[600],
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
                child: AutoSizeText(
                  _error,
                  maxLines: 3,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

/*
  void getCurrentUser() async{
    try{
    final user = await _auth.currentUser;
    if (user != null){
      loggedInUser = user;
      print(loggedInUser.email);
    }
  } catch(e) {
      print(e);
    }}

 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SafeArea(
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Image.asset('images/app.png'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      showAlert(),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val.isEmpty)
                            return 'Empty';
                          else if (!val.contains('@') ||
                              !val.contains('.com')) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.teal,
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.teal),
//                    hintText: 'Enter your email',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: _obscureText1,
                        controller: _pass,
                        validator: (val) {
                          if (val.isEmpty)
                            return 'Empty';
                          else if (val.length < 6) {
                            return 'Password should be at least 6 Characters';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.teal,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.teal,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _obscureText1 = !_obscureText1;
                              });
                            },
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.teal),
//                    hintText: 'Enter your password',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: _obscureText2,
                        controller: _confirmPass,
                        validator: (val) {
                          if (val.isEmpty) return ' Empty';
                          if (val != _pass.text) return 'Not Matching';
                          return null;
                        },
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.teal,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.teal,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.teal),
//                    hintText: 'Re-Enter your password',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val.isEmpty)
                            return 'Empty';
                          else if (val.length != 10) {
                            return 'Mobile number should be 10 numbers ';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          PhoneNumber = value as int;
                        },
                        keyboardType: TextInputType.number,
                        //  inputFormatters: <TextInputFormatter>[
                        //    FilteringTextInputFormatter.digitsOnly,
                        //    ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_iphone,
                            color: Colors.teal,
                          ),

                          labelText: 'Mobile Number',
                          labelStyle: TextStyle(color: Colors.teal),
//                    hintText: 'Enter your mobile number',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff03989E), width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val.isEmpty) return 'Empty';
                          return null;
                        },
                        onChanged: (value) {
                          FirstName = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.teal,
                          ),
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.teal),
//                    hintText: 'Enter your first name',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val.isEmpty) return 'Empty';
                          return null;
                        },
                        onChanged: (value) {
                          LastName = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.teal,
                          ),

                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Colors.teal),
//                    hintText: 'Enter your last name',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          color: Color(0xff03989E),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          elevation: 5.0,
                          child: MaterialButton(
                            onPressed: () {
                              signUpUser();
                            },
                            minWidth: 200.0,
                            height: 100.0,
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
//                  SizedBox(
//                    height: MediaQuery.of(context).viewInsets.bottom,
//                  ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUpUser() async {
    _submit();
    if (_submit() == 'OK') {
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(newUser.user.uid)
              .set({
            'UserID': newUser.user.uid,
            'UserEmail': email,
            'PhoneNumber': PhoneNumber.toString(),
            'FirstName': FirstName,
            'LastName': LastName,
            'AccountType': 'User',
            "Address details": "None",
            "AddressLine": "None",
            "Street": "None",
            'lat':"None",
            'long':"None",
          }).then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home2()));
          });
        }
      } catch (e) {
        print(e);
        setState(() {
          _error = e.message;
        });
      }
    }
  }

}