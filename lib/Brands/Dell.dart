import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Pages/ShopShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
class Dell extends StatefulWidget {
  @override
  _DellState createState() => _DellState();
}

class _DellState extends State<Dell> {
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
        title: Text("Dell"),
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
              text: "Laptop",
              fontSize: 20,
              gradientColors: [ firstColor, secondColor],
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LaptopDell()));
              }),
        ],
      ),

    );
  }
}
class LaptopDell extends StatefulWidget {
  @override
  _LaptopDellState createState() => _LaptopDellState();
}

class _LaptopDellState extends State<LaptopDell> {
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
        title: Text("Laptop"),
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
              .where("Device Brand", isEqualTo: "Dell")
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

