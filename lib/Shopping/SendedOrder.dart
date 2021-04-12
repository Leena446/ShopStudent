import 'dart:async';

import 'package:electro_mania_afnan/homePage/home3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electro_mania_afnan/first/InfoPage.dart';

class SendedOrder extends StatefulWidget {
  static const String id = 'SendedOrder';

  @override
  _SendedOrderState createState() => _SendedOrderState();
}

class _SendedOrderState extends State<SendedOrder> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationn;
  void initState() {
    super.initState();
    //tartTime();
    Timer(Duration(milliseconds: 4000), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home3()),
      );
    });

    controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    animationn = CurvedAnimation(parent: controller, curve: Curves.decelerate);
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
        padding: EdgeInsets.only(left: 10, top: 200, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/Thanks.png',
              width: 4500,
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
