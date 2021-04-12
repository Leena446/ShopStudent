import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
class ProDetalis extends StatefulWidget {
  @override
  _ProDetalisState createState() => _ProDetalisState();
  ProDetalis({this.imag,this.price,this.store,this.description, this.model,
    this.other, this.capicty , this.ram , this.screen,});
  var imag;
  var price;
  var store;
  var description;
  var model;
  var other;
  var capicty;
  var ram;
  var screen;

  }

class _ProDetalisState extends State<ProDetalis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalis"),
      backgroundColor: Colors.teal,),
      body: Center(
        child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
              children:<Widget> [
              Container(
              height: 400,
              width: double.infinity,
              child: Image.network(widget.imag,
                    fit: BoxFit.cover,),
      ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    "Title", style: TextStyle(fontSize: 25 ,
                      backgroundColor: Colors.black38
                  ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.model, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    "Capicty", style: TextStyle(fontSize: 25,  backgroundColor: Colors.black38
                  ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.capicty, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    "store", style: TextStyle(fontSize: 25,      backgroundColor: Colors.black38
                  ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.store, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    "Price", style: TextStyle(fontSize: 25,
                      backgroundColor: Colors.black38
                  ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.price.toString(), style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    "Descrption", style: TextStyle(fontSize: 25,
                      backgroundColor: Colors.black38
                  ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.description, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    "Other", style: TextStyle(fontSize: 25,
                      backgroundColor: Colors.black38
                  ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.other, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.screen, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:1),
                  width: double.infinity,
                  child: Text(
                    widget.ram, style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),

                ),

              ],),
            ),
          ],
        ),),),);
  }
}
