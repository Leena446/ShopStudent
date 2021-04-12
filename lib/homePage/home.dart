import 'package:electro_mania_afnan/login_screen.dart';
import 'package:electro_mania_afnan/registration_screen.dart';
import 'package:electro_mania_afnan/rounded.button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
    //    decoration: BoxDecoration(
    //      image: DecorationImage(
     //       image: AssetImage("images/back.png"),
      //      fit: BoxFit.cover,
      //    ),
   //     ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset('images/mobileapp.png'),
                ),
                SizedBox(
                  height: 48,
                ),
                RoundedButton(
                  title: 'Login ',
                  colour: Color(0xff03989E),
                  onPressed: () {
                    Navigator.push(context ,
                          MaterialPageRoute(builder:(context) => LoginScreen()));
                    },
                ),
                RoundedButton(
                  title: 'Registration',
                  colour: Color(0xff03989E),
                  onPressed: () {
                    Navigator.push(context ,
                        MaterialPageRoute(builder:(context) => RegistrationScreen()));
                    },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
