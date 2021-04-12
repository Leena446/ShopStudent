import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/first/ResetPassword.dart';
import 'package:electro_mania_afnan/homePage/home2.dart';
import 'package:electro_mania_afnan/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'DashBoard/HomePage.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email;
  String password;
  bool _obscureText1 = true;
  String _error;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  void initState() {
//    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
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
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      child: Image.asset('images/login.png'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    showAlert(),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      autofillHints: [AutofillHints.email],
                      validator: (val) {
                        if (val.isEmpty)
                          return 'Empty';
                        else if (!val.contains('@') || !val.contains('.com')) {
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
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 5.5, left: 20.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResetPassword()));
                          },
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                                color: Colors.teal,
                                decoration: TextDecoration.underline),
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 5.5, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()));
                        },
                        child: Text(
                          "Do not have an account? Register now",
                          style: TextStyle(
                               color: Color(0xff03989E),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Color(0xff03989E),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () {
                            signInUser();
                          },
                          minWidth: 200.0,
                          height: 100.0,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signInUser() async {
    _submit();
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null && _submit() == 'OK') {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.user.uid)
            .get()
            .then((value) async {
          if (value.exists == true) {
            switch (value.data()['AccountType']) {
              case 'Admin':
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
                break;
              case 'User':
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CorrectEntry()));
                }
                break;
            }
          } else {
            await FirebaseAuth.instance.signOut();
          }
        });
      } else {
        return 'invalid';
      }
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = e.message;
      });
    }
  }
}

class CorrectEntry extends StatefulWidget {
  static const String id = 'CorrectEntry';
  @override
  _CorrectEntryState createState() => _CorrectEntryState();
}

class _CorrectEntryState extends State<CorrectEntry> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationn;
  void initState() {
    super.initState();
    //tartTime();
    Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Home2()),
      );
    });

    controller = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    animationn = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    //  controller.forward(); // bounceOut
    //  animationn.addStatusListener((status){
    // if (status== AnimationStatus.completed) {
    //  controller.reverse(from: 1.0);
    //   }else if (status == AnimationStatus.dismissed){
//easeInCirc
    controller.forward();
    //  }});
    controller.addListener(() {
      setState(() {});
      //  print(animationn.value);
    });
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 10, top: 220, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/CoorectEntry.png',
              width: 300,
              height: animationn.value * 450,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   //  onPressed: (){
      //   //     Navigator.pushNamed(context, Test2.id);
      //   //    },
      //   child:   IconButton(icon: Icon(Icons.navigate_next) , color: Colors.white, onPressed: (){
      //     Navigator.pushNamed(context, Test.id);
      //   })
      //   ,
      //   backgroundColor: Colors.teal,
      // ),
    ); // This trailing comma makes auto-fo
  }
}
