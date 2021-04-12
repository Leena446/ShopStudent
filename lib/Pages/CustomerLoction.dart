import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/homePage/home2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:url_launcher/url_launcher.dart';

class  CustomerLoction extends StatefulWidget  {
  static const String id = 'CustomerLoction';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomerLoction_s();
  }
}
class CustomerLoction_s extends State<CustomerLoction> {
  var firstColor =   Color(0xff03989E),  secondColor = Colors.white10;
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff03989E),
          title: Text("Location page"),
        ),

        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: [
                //Image(image: AssetImage("images/Loction.png"),),
                SizedBox(height: 20,),
                // Text("get user location",style: TextStyle(fontSize: 30),),
                SizedBox(height: 0,),
                Text(locationmass,style: TextStyle(fontSize: 15),),
                SizedBox(height: 0,),
                FlatButton(onPressed:() {getuserlocation();}, child: Text("get location")),
                // Spacer(),
                FlatButton(onPressed:() {opengooglemap();}, child: Text("open in google map")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text(" Send Location", style: TextStyle(color: Colors.white),),
                    color: Color(0xff03989E),
                    onPressed: () async {
                      print('Saving Data');
                    },
                  ),

                ),
                SizedBox(height: 10,),
                NiceButton(
                    width: 300,
                    elevation: 3.0,
                    radius: 40,
                    padding: const EdgeInsets.all(30),
                    text:"Order Now",fontSize: 20,
                    gradientColors: [ firstColor, secondColor],
                    onPressed: () {
                      final userId = FirebaseAuth.instance.currentUser.uid;
                      var OrderTime =DateFormat("dd/MM/yyy/hh:mm").format(DateTime.now()).toString();
                      Order(userId,OrderTime);
                      //var doci = '${userId}${OrderTime}';
                      var docId = FirebaseFirestore.instance.collection('Orders').doc().id;
                      FirebaseFirestore.instance.collection('Orders').doc(docId).set({
                        'userId': userId,
                        'oderTime': OrderTime,
                        'docId': docId,
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => ThankForShopping()));
                    }),
              ],

            ),

          ),
        ),
      );
  }
  // Future OederScreen() async {
  //   try {
  //     final OederId = FirebaseFirestore.instance.collection('Order').doc().id;
  //     await FirebaseFirestore.instance.collection('Order').doc(OederId).set({
  //    //   'Order': ,
  //     ///  'OederId':OederId,
  //     //  "total":anie().returnTotal(),
  //     //  "Item":
  //
  //     }).then((value) {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  Future Order(userId, OrderTime) {

    try {
      FirebaseFirestore.instance
          .collection('Cart')
          .where("email", isEqualTo: FirebaseAuth.instance.currentUser.email)
          .where("state", isEqualTo: "inCart")
          .where("StateOrder", isEqualTo: "waiting")
          .get()
      //     .then((QuerySnapshot querySnapshot) {
      //   querySnapshot.docs.forEach((doc) {
      //     StateOrder = doc.data()['StateOrder'];
      //     email = doc.data()['email'];
      //     id = doc.data()['id'];
      //     //state = doc.data()['state'];
      //     store = doc.data()['store'];
      //     userid = doc.data()['email'];
      //     email = doc.data()['email'];
      //     email = doc.data()['email'];
      //   });
      // })
          .then((value) {
        value.docs.forEach((element) {
          print(element.reference.id);
          element.reference.update({"state": "inOrder"});
          element.reference.update({"StateOrder": "order is done"});
          element.reference.update({"timeOrder": OrderTime});
        });

      });
    } catch (e) {
      print('heeeeeeeer');
    }
  }
  var locationmass="";
  String lat;
  String long;
  updatedatebase() {
    FirebaseFirestore.instance.collection('Users').
    doc(FirebaseAuth.instance.currentUser.uid).
    update({
      'lat':lat,
      'long':long,
    });
  }
  void getuserlocation() async
  {
    try {
      final pos = await Geolocator.getCurrentPosition
        (
          desiredAccuracy: LocationAccuracy.high);
      var latitude = pos.latitude;
      var longitude = pos.longitude;

      lat = "$latitude";
      long = "$longitude";
      updatedatebase();
      setState(()
      {
        locationmass="The latitude = $lat \n  \n The longitude = $long ";
        print(latitude);
        print(lat);
        print(locationmass);

      });}catch(e){print (e.toString());}
  }
  //
  void opengooglemap() async
  {
    try {
      String googleUrl =
          "https://www.google.com/maps/search/?api=1&query=$lat,$long";

      if (await canLaunch(googleUrl)) {
        await launch(googleUrl);
      } else
        throw ("Couldn't open google maps");
    }catch(e){print(e.toString());}
  }
}

class ThankForShopping extends StatefulWidget {
  @override
  _ThankForShoppingState createState() => _ThankForShoppingState();
}

class _ThankForShoppingState extends State<ThankForShopping> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationn;
  void initState() {
    super.initState();
    //tartTime();
    Timer(Duration(milliseconds: 6000), () {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home2()),
      );
    });

    controller = AnimationController(
      duration: Duration(milliseconds: 5000),
      vsync: this,
    );
    animationn = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    //  controller.forward(); // bounceOut
    //  animationn.addStatusListener((status){
    // if (status== AnimationStatus.completed) {
    //  controller.reverse(from: 1.0);
    //   }else if (status == AnimationStatus.dismissed){
//easeInCirc
    controller.forward();
    //  }});
    controller.addListener(() {
      setState(() {});
      //  print(animationn.value);
    });
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 10, top: 220, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/ThankShopping.png',
              width: 300,
              height: animationn.value * 450,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   //  onPressed: (){
      //   //     Navigator.pushNamed(context, Test2.id);
      //   //    },
      //   child:   IconButton(icon: Icon(Icons.navigate_next) , color: Colors.white, onPressed: (){
      //     Navigator.pushNamed(context, Test.id);
      //   })
      //   ,
      //   backgroundColor: Colors.teal,
      // ),
    ); // This trailing comma makes auto-fo
  }

}
