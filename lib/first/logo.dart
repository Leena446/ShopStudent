import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electro_mania_afnan/first/InfoPage.dart';

class Logo extends StatefulWidget {
  static const String id = 'logo';

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationn;
  void initState() {
    super.initState();
    //tartTime();
    Timer(Duration(milliseconds: 7000), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => InfoPage()));
    });

    controller = AnimationController(
      duration: Duration(milliseconds: 5000),
      vsync: this,
    );
    animationn = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    //  controller.forward(); // bounceOut
    //  animationn.addStatusListener((status){
    // if (status== AnimationStatus.completed) {
    //  controller.reverse(from: 1.0);
    //   }else if (status == AnimationStatus.dismissed){

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
        padding: EdgeInsets.only(left: 10, top: 170, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/www.png',
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
