
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  static const String id = 'Information';
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child:
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("About App"),
        backgroundColor: Color(0xff03989E),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                Image.asset(
                'images/www.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("This application will help you to choose a device at the best price and help students to know the suitable device for them"
                      , style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),
          ),
        ],),),);
  }

}