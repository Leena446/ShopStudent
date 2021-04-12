
import 'package:flutter/material.dart';

class RoundedButton2 extends StatelessWidget {
  RoundedButton2({this.colour,this.onPressed,this.title, });
  final Color colour;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0,top: 0, right: 0 ,),

      child: Material(

        elevation: 0.0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 130.0,
          height: 130.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Yanone Kaffeesatz Bold'
            ),
          ),
        ),
      ),
    );
  }
} 