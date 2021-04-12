
import 'package:flutter/material.dart';

class Round extends StatelessWidget {
  Round({this.colour,this.onPressed,this.title, });
  final Color colour;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5,top: 30 , right: 10),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 50.0,
          height: 50.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}