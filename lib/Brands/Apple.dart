import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Pages/CartCart.dart';
import 'package:electro_mania_afnan/Pages/ShopShop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nice_button/NiceButton.dart';
class Apple extends StatefulWidget {
  @override
  _AppleState createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  @override
  var firstColor = Color(0xff03989E),
      secondColor = Colors.white10;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apple"),
        backgroundColor: Color(0xff03989E),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //   },
        // ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NiceButton(
              width: 500,
              elevation: 3.0,
              radius: 40,
              padding: const EdgeInsets.all(30),
              text: "iPhone",
              fontSize: 20,
              gradientColors: [ firstColor, secondColor],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Mobile()));
              }),
          SizedBox(height: 20,),

          NiceButton(
              width: 500,
              elevation: 3.0,
              radius: 40,
              padding: const EdgeInsets.all(30),
              text: "iPad",
              fontSize: 20,
              gradientColors: [ firstColor, secondColor],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ipad()));
              }),
          SizedBox(height: 20,),
          NiceButton(
              width: 500,
              elevation: 3.0,
              radius: 40,
              padding: const EdgeInsets.all(30),
              text: "MacBook",
              fontSize: 20,
              gradientColors: [ firstColor, secondColor],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Mobile()));
              }),
        ],
      ),

    );
  }
}

  class Mobile extends StatefulWidget {
    @override
    _MobileState createState() => _MobileState();
  }

  class _MobileState extends State<Mobile> {
    var firstColor =   Color(0xff03989E),  secondColor = Colors.white10;

    @override
    void initState() {
      setState(() {
      });
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Mobile"),
          backgroundColor: Color(0xff03989E),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //   },
          // ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Devices')
                .where("Device Type", isEqualTo: "Mobile")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null)
                return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    ));
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot product = snapshot.data.docs[index];
                    return  Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: NiceButton(
                        width: 500,
                        elevation: 3.0,
                        radius: 40,
                        padding: const EdgeInsets.all(30),
                        text: product['Device Model'],fontSize: 20,
                        gradientColors: [ firstColor, secondColor],
                        onPressed: () { Navigator.pushReplacement(context ,
                            MaterialPageRoute(builder:(context) => ShopShop(
                              DevicesId: product['DevicesId'].toString(),
                            )));
                        },
                        // onPressed: () {
                        //     if ( product['Device Name'] == "IPhone 12 pro" ) {
                        //       Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => IPhone12pro()));
                        //     }  else if (product['Device Name']== "iPhone 12 Pro max"){
                        //       Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => Iphone12ProMax()));
                        //     }else if (product['DeviceModel']== "MacBook"){
                        //       Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => AddDevice()));
                        //
                        //   };
                        // }
                    //   onPressed: () { Navigator.pushReplacement(context ,
                    //   MaterialPageRoute(builder:(context) => ShopShop(
                    //   majorID: items.docs[i].data()['Majo_id'].toString(),
                    //   ),
                    // );
                    ),);
                  }
              );
            }
        ),
      );
    }}

class ipad extends StatefulWidget {
  @override
  _ipadState createState() => _ipadState();
}

class _ipadState extends State<ipad> {
  var firstColor =   Color(0xff03989E),  secondColor = Colors.white10;

  @override
  void initState() {
    setState(() {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iPad"),
        backgroundColor: Color(0xff03989E),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Devices')
              .where("Device Type", isEqualTo: "iPad ")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null)
              return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  ));
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot product = snapshot.data.docs[index];
                  return  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: NiceButton(
                      width: 500,
                      elevation: 3.0,
                      radius: 40,
                      padding: const EdgeInsets.all(30),
                      text: product['Device Model'],fontSize: 20,
                      gradientColors: [ firstColor, secondColor],
                      onPressed: () { Navigator.pushReplacement(context ,
                          MaterialPageRoute(builder:(context) => ShopShop(
                            DevicesId: product['DevicesId'].toString(),
                          )));
                      },
                      // onPressed: () {
                      //     if ( product['Device Name'] == "IPhone 12 pro" ) {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => IPhone12pro()));
                      //     }  else if (product['Device Name']== "iPhone 12 Pro max"){
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => Iphone12ProMax()));
                      //     }else if (product['DeviceModel']== "MacBook"){
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => AddDevice()));
                      //
                      //   };
                      // }
                      //   onPressed: () { Navigator.pushReplacement(context ,
                      //   MaterialPageRoute(builder:(context) => ShopShop(
                      //   majorID: items.docs[i].data()['Majo_id'].toString(),
                      //   ),
                      // );
                    ),);
                }
            );
          }
      ),
    );
  }}
