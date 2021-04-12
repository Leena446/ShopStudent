import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:electro_mania_afnan/DashBoard/AddNewDevice.dart';
import 'package:url_launcher/url_launcher.dart';
import '../login_screen.dart';
import 'HelpStudent.dart';
class ShowOrders extends StatefulWidget {
  @override
  _ShowOrdersState createState() => _ShowOrdersState();
}

class _ShowOrdersState extends State<ShowOrders> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child:Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 350,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/www.png', ),
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Home' , style: TextStyle(fontSize: 20),),
                  leading: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                  // onTap: () {
                  //   Navigator.push(context ,
                  //       MaterialPageRoute(builder:(context) => HomeAdmin()));
                  // },
                ),
                Divider(),
                ListTile(
                  title: Text('Help',style: TextStyle(fontSize: 20),),
                  leading: Icon(
                    Icons.help,
                    color: Colors.teal,
                  ),
                  onTap: () {
                    Navigator.push(context ,
                        MaterialPageRoute(builder:(context) => HelpStudent()));
                  },
                ),
                Divider(),
                ListTile(
                    title: Text('Logout',style: TextStyle(fontSize: 20), ),
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Color(0xff03989E),
                    ), onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context ,
                      MaterialPageRoute(builder:(context) => LoginScreen()));
                }
                ),
              ],
            ),)),
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Color(0xff03989E),
      ),
      backgroundColor: Colors.white,
      body:ListView(
        padding: EdgeInsets.only(top: 150),
        children: <Widget>[

          SizedBox(
            height: 40.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: double.infinity,
                  height: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TrackOrders()));
                    },
                    elevation: 7.0,
                    padding: EdgeInsets.all(7.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff03989E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.auto_awesome,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Open Order',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 22.0,
                            //  fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: double.infinity,
                  height: 200,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => History()));
                    },
                    elevation: 7.0,
                    padding: EdgeInsets.all(7.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff03989E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.description,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' Order Delivered',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 20.0,
                            //      fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}


class TrackOrders extends StatefulWidget {
  @override
  _TrackOrdersState createState() => _TrackOrdersState();
}

class _TrackOrdersState extends State<TrackOrders> {
  QuerySnapshot orders;
  String userlat;
  String userlong;


  var r = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    getItemsFromFB();
  //  getItemsFromFB2();
    setState(() {
    });
    super.initState();
  }
  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Cart')
        .where("state", isEqualTo: "inOrder")
        .where("StateOrder", isEqualTo: "order is done")
        .get().then((value) {
      setState(() {
        orders = value;
      });
    });
  }
  // getItemsFromFB2() async {
  //   print('Getting Items #FB.....');
  //   await FirebaseFirestore.instance.collection('Users').doc(r)
  //       .get().then((value) {
  //     setState(() {
  //       userlat = value.data()["lat"];
  //       userlong = value.data()["long"];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
        backgroundColor: Color(0xff03989E),
      ),
      body: flowList(context)
    );

  }

  Widget flowList(BuildContext context){
    if(orders!=null){
      return ListView.builder(
          itemCount: orders.docs.length,
          itemBuilder: (context, i) {
           return Card(
           child: Container(
             height: 80,
             child: ListTile(
               title:  Text(
                 orders.docs[i]['email'],
                 style: TextStyle(fontSize: 14, color: Colors.red ),
               ),
               trailing:
               ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                   primary:Color(0xff03989E),
                 ),
                 label: Text('Map'),
                 icon: Icon(Icons.location_on ,
                   color: Colors.white,),
                 onPressed: () {
                   FirebaseFirestore.instance.collection('Users').doc(orders.docs[i]['userid'])
                       .get().then((value) {
                     setState(() {
                       userlat = value.data()["lat"];
                       userlong = value.data()["long"];
                       opengoogleMap(userlat, userlong);

                     });
                   });
                   print(userlat);
                   print(userlong);
                   //  opengoogleMap(userlat, userlong);
                 },
               ),
               subtitle:
               Column(
                 children: [
                   Text(
                     orders.docs[i]['StateOrder'],
                     style: TextStyle(fontSize: 14),
                   ),
                   Text(
                     orders.docs[i]['time'],
                     style: TextStyle(fontSize: 14),
                   ),
                   // Text(
                   //   orders.docs[i]['model'],
                   //   style: TextStyle(fontSize: 14),
                   // ),
                 ],
               ),
                leading:
                    Expanded(
                      flex: 2,
                      child: Container(
                       height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ElevatedButton.icon(
                            //   style: ElevatedButton.styleFrom(
                            //     primary:Color(0xff03989E),
                            //   ),
                            //   label: Text('Map'),
                            //   icon: Icon(Icons.location_on ,
                            //     color: Colors.white,),
                            //   onPressed: () {
                            //     FirebaseFirestore.instance.collection('Users').doc(orders.docs[i]['userid'])
                            //         .get().then((value) {
                            //       setState(() {
                            //         userlat = value.data()["lat"];
                            //         userlong = value.data()["long"];
                            //         opengoogleMap(userlat, userlong);
                            //
                            //       });
                            //     });
                            //     print(userlat);
                            //     print(userlong);
                            //   //  opengoogleMap(userlat, userlong);
                            //   },
                            // ),
                            // SizedBox(
                            //   height: 15,
                            // ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary:Color(0xff03989E),
                              ),
                              label: Text('delivery' ),
                              icon: Icon(Icons.web ,
                                color: Colors.white,),
                              onPressed: () {
                                print(orders.docs[i].id);
                                StateOrders(orders.docs[i].id).then((value){
                                  getItemsFromFB();
                                });
                              },
                            ),
                          ],

                        ),
                      ),
                    ),

                ),
           ),
             // Text(
             //   orders.docs[i]['model'],
             //   style: TextStyle(fontSize: 17),
             // ),
           );
          });
    }else{
      return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ));
    }
  }

  Future  StateOrders(String orderDocID)async {
    try {
      await FirebaseFirestore.instance
          .collection('Cart').doc(orderDocID).update({
        "StateOrder": "order is delivered"
      }).then((value){
        return value;
      });
      //     .where("StateOrder", isEqualTo: "order is done")
      //     .get()
      //     .then((value) {
      //   value.docs.forEach((element) {
      //     print(element.reference.id);
      //     element.reference.update({"StateOrder": "order is delevired"});
      //   });
      // });
    } catch (e) {
      print(e);
    }
  }
  getLoctionCustomer(String id){
    Future.delayed(Duration.zero,()async{
      DocumentSnapshot snapshot = await
      FirebaseFirestore.instance.collection("Users").doc(id).get();
      setState(() {
        try {
          lat = snapshot.data()["lat"];
          long = snapshot.data()["long"];
         // name = snapshot.data()["FirstName"];
        } catch (e) {
          print("error");
          print("$lat,$long");
        }
      });
    });
  }
  String lat;
  String long;
  String name;

  void opengoogleMap(lat,long) async{
    try {
      String googleUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
      if (await canLaunch(googleUrl)) {
        await launch(googleUrl);
      } else
        throw ("Could not open google map");
    }catch(e){
      print(e.toString());}
  }
}

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  QuerySnapshot orders;
  @override
  void initState() {
    getItemsFromFB();
    setState(() {
    });
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Cart')
        .where("StateOrder", isEqualTo: "order is delivered")
        .get().then((value) {
      setState(() {
        orders = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History"),
          backgroundColor: Color(0xff03989E),
        ),
        body: flowList(context)
    );

  }

  Widget flowList(BuildContext context){
    if(orders!=null){
      return ListView.builder(
          itemCount: orders.docs.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                title: Text(
                  orders.docs[i]['StateOrder'],
                  style: TextStyle(fontSize: 14,color: Colors.green[700])
                ),
                trailing: Text(
                  orders.docs[i]['email'],
                  style: TextStyle(fontSize: 14),
                ),
                leading: Text(
                  orders.docs[i]['model'],
                  style: TextStyle(fontSize: 17),
                ),
               subtitle:Text(orders.docs[i]['time'],
                style: TextStyle(fontSize: 13),
              ),
                // FlatButton(
                //   onPressed: () {
                //     print(orders.docs[i].id);
                //     StateOrders(orders.docs[i].id).then((value){
                //       getItemsFromFB();
                //     });
                //   },
                //   textColor: Colors.teal,
                //   minWidth: 2000,
                //   height: 50.0,
                //   child: Text(
                //     'delivery',
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 20),
                //   ),
                // ),
              ),
            );
          });
    }else{
      return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ));
    }
  }
  //
  // Future  StateOrders(String orderDocID)async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('Cart').doc(orderDocID).update({
  //       "StateOrder": "order is delivered"
  //     }).then((value){
  //       return value;
  //     });
  //     //     .where("StateOrder", isEqualTo: "order is done")
  //     //     .get()
  //     //     .then((value) {
  //     //   value.docs.forEach((element) {
  //     //     print(element.reference.id);
  //     //     element.reference.update({"StateOrder": "order is delevired"});
  //     //   });
  //     // });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
      }

