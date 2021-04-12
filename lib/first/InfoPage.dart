import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electro_mania_afnan/first/InfoPage2.dart';
class InfoPage extends StatefulWidget {
  static const String id = 'test';

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 10, top: 150, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/Help.png',
              width: 500,
              height: 600,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
            icon: Icon(Icons.navigate_next),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InfoPage2()));
            }),
        backgroundColor: Colors.black,

      ),

    ); // This trailing comma makes auto-fo
  }
}
