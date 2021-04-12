import 'package:electro_mania_afnan/Pages/CustomerLoction.dart';
import 'package:electro_mania_afnan/Pages/ShopHelp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'help.dart';
import 'home3.dart';

class Home2 extends StatefulWidget {
  static const String id = 'home2';
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final _auth =FirebaseAuth.instance;
    User loggedInUser;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCuurentUser();
  }
  void getCuurentUser()async {
    try{
      final user = await _auth.currentUser;
  if (user !=null){
  loggedInUser = user;
  print(loggedInUser.email);
  }
  } catch(e){
    print(e);
  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("images/scrren.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage("images/shopLogo.png"),),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color(0xff03989E),
                  padding:  EdgeInsets.symmetric(horizontal: 50, vertical: 15),

                  ),
                  child: Text('SHOP' ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home3()));
                    }),
                  ],
                ),
            Image(image: AssetImage("images/HelpLogo.png"),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:Color(0xff03989E),
                padding:  EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('STUDENT HELP' ),
              onPressed: () {
                    Navigator.push(context ,
                        MaterialPageRoute(builder:(context) => Help())); },
                ),
              ],
            ),

      ),
    );

  }
}
