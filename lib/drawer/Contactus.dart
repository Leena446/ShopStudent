
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contactus extends StatefulWidget {
  static const String id = 'Contactus';
  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child:
    Scaffold(
      appBar: AppBar(
        title: Text("Contactus"),
        backgroundColor: Color(0xff03989E),
      ),
      body: Center(
        child: Column(
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
                    FloatingActionButton(
                      heroTag: "btn2",
                      child: Icon(
                        Icons.phone, color: Colors.black,
                      ),
                      backgroundColor: Color(0xff03989E),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" +966 55 183 5699 ", style: TextStyle(fontSize: 20),),
                    ),
                    SizedBox(height: 10,),
                    FloatingActionButton(
                      heroTag: "btn1",
                      child: Icon(
                        Icons.email, color: Colors.black,
                      ),
                      backgroundColor: Color(0xff03989E),

                    ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("S9201707902@aou.edu.sa ",
                          style: TextStyle(fontSize: 20),),
                     ),
                  ],
                ),
              ),
            ),
          ],),
      ),),);
  }

}