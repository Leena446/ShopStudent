import 'package:electro_mania_afnan/first/InfoPage2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electro_mania_afnan/homePage/home.dart';

class InfoPage3 extends StatefulWidget {

  @override
  _InfoPage3State createState() => _InfoPage3State();
}

class _InfoPage3State extends State<InfoPage3> {
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
              'images/chosse.png',
              width: 500,
              height: 600,
            ),
          ],
        ),
      ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              FloatingActionButton(
              child: Icon(
              Icons.navigate_before
              ),
              backgroundColor: Colors.black45,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoPage2()));
                  },
              heroTag: null,

               ),
                 Expanded(
                    child: Padding(
                    padding: EdgeInsets.only(right :2),
                    ),
                    ),
                    FloatingActionButton(
                    child: Icon(
                    Icons.navigate_next
                    ),

                    backgroundColor: Colors.black,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }),
          ], ),
          ),); // This trailing comma makes auto-fo
        }
}
