import 'package:electro_mania_afnan/first/InfoPage.dart';
import 'package:electro_mania_afnan/first/InfoPage3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage2 extends StatefulWidget {
  static const String id = 'test2';

  @override
  _InfoPage2State createState() => _InfoPage2State();
}

class _InfoPage2State extends State<InfoPage2> {
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
              'images/Delivery.png',
              width: 500,
              height: 550,
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
                        MaterialPageRoute(builder: (context) => InfoPage()));
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
                          MaterialPageRoute(builder: (context) => InfoPage3()));
                    }),
   /*   floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Test3.id);
          },
          child: Row(
          children:<Widget> [
            Icon(
              Icons.navigate_next,
              color: Colors.white,
            //  onPressed: () {
             //   Navigator.pushNamed(context, Test3.id);
            //  }
              ),
          Padding(
          Icon(
            Icons.navigate_next,
            color: Colors.white,),
    //    backgroundColor: Color(0xff03989E),

   ],),),
    */
    ], ),
      ),); // This trailing comma makes auto-fo
  }
}
