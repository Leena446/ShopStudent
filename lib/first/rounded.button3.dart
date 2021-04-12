
import 'package:flutter/material.dart';

class RoundedButton3 extends StatelessWidget {
  RoundedButton3({this.colour,this.onPressed,this.title, });
  final Color colour;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0,top: 5, right: 0),

      child: Material(

        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(40.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 100.0,
          height: 100.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}