import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../rounded.button.dart';

class lenovo extends StatefulWidget {
  static const String id = 'lenovo';
  @override
  _lenovoState createState() => _lenovoState();
}

class _lenovoState extends State<lenovo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //  image: AssetImage("images/back.png"),
          //    fit: BoxFit.cover,
        ),
        //  ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Please Select The Type",style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  title: 'Mobile',
                  colour: Color(0xff03989E),
                  onPressed: () {
                 //   Navigator.pushNamed(context, Iphone.id);
                  },
                ),
                RoundedButton(
                  title: 'Laptop',
                  colour: Color(0xff03989E),
                  onPressed: () {
                    //        Navigator.pushNamed(context, Help.id);
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
