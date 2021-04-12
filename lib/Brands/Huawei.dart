import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Pages/CartCart.dart';
import 'package:electro_mania_afnan/Pages/ShopShop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nice_button/NiceButton.dart';
class Huawei extends StatefulWidget {
  @override
  _HuaweiState createState() => _HuaweiState();
}

class _HuaweiState extends State<Huawei> {
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
        title: Text("Huawei"),
        backgroundColor: Color(0xff03989E),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NiceButton(
              width: 500,
              elevation: 3.0,
              radius: 40,
              padding: const EdgeInsets.all(30),
              text: "Mobile",
              fontSize: 20,
              gradientColors: [ firstColor, secondColor],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MobileHuawei()));
              }),
          SizedBox(height: 20,),

          NiceButton(
              width: 500,
              elevation: 3.0,
              radius: 40,
              padding: const EdgeInsets.all(30),
              text: "Tablet",
              fontSize: 20,
              gradientColors: [ firstColor, secondColor],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TabletHuawei()));
              }),
          SizedBox(height: 20,),
          NiceButton(
              width: 500,
              elevation: 3.0,
              radius: 40,
              padding: const EdgeInsets.all(30),
              text: "Laptop",
              fontSize: 20,
              gradientColors: [ firstColor, secondColor],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TabletHuawei()));
              }),
        ],
      ),

    );
  }
}
class MobileHuawei extends StatefulWidget {
  @override
  _MobileHuaweiState createState() => _MobileHuaweiState();
}

class _MobileHuaweiState extends State<MobileHuawei> {

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

class TabletHuawei extends StatefulWidget {
  @override
  _TabletHuaweiState createState() => _TabletHuaweiState();
}

class _TabletHuaweiState extends State<TabletHuawei> {
  @override

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
        title: Text("Tablet"),
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
              .where("Device Type", isEqualTo: "Tablet")
               .where("Device Brand" , isEqualTo: "Huawei")
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

