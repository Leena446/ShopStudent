import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Pages/ShopModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class huawei extends StatefulWidget {
  static const String id = 'huawei';
  @override
  _huaweiState createState() => _huaweiState();
  huawei({this.market,});
  final String market;
}
String devicetype;
var modelName;
String color_capacity;

class _huaweiState extends State<huawei> {

  FocusNode _descriptionNode;
  var type;
  var model;
  var colorCapacity;


  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Type"),
        backgroundColor: Color(0xff03989E),),
      backgroundColor: Colors.white,
      // body: Container(
      //   decoration: BoxDecoration(
      //    // image: DecorationImage(
      //     //  image: AssetImage("images/back.png"),
      //   //    fit: BoxFit.cover,
      //     ),
      // //  ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Text(
      //             "Please Select The Type",style: TextStyle(fontSize: 30),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           RoundedButton(
      //             title: 'Laptop',
      //             colour: Color(0xff03989E),
      //             onPressed: () {
      //                 Navigator.push(context ,
      //                     MaterialPageRoute(builder:(context) => ShopModel(type: 'Laptop', market: widget.market,)));
      //               },
      //           ),
      //           RoundedButton(
      //             title: 'Mobile',
      //             colour: Color(0xff03989E),
      //             onPressed: () {
      //             Navigator.push(context ,
      //             MaterialPageRoute(builder:(context) => ShopModel(type: 'Mobile', market: widget.market,)));
      //         },
      //           ),
      //           RoundedButton(
      //             title: 'IPad',
      //             colour: Color(0xff03989E),
      //             onPressed: () {
      //               Navigator.push(context ,
      //                   MaterialPageRoute(builder:(context) => ShopModel(type: 'IPad',market: widget.market,)));
      //             },
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  leading: Icon(
                    Icons.devices,
                    color: Color(0xff03989E),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_descriptionNode);
                      },
                      //controller: _eventLocationController,
                      decoration: InputDecoration(
                        labelText: (type != null) ? "$type" : 'Type',
                        labelStyle:
                        TextStyle(color: Colors.black, fontSize: 15),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.orange),
                        //),
                      ),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: dropDown1(),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.devices,
                    color: Color(0xff03989E),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_descriptionNode);
                      },
                      //controller: _eventLocationController,
                      decoration: InputDecoration(
                        labelText: (model != null) ? "$model" : 'Model',
                        labelStyle:
                        TextStyle(color: Colors.black, fontSize: 15),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.orange),
                        //),
                      ),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: dropDown2(devicetype),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.devices,
                    color: Color(0xff03989E),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      enabled: false,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_descriptionNode);
                      },
                      //controller: _eventLocationController,
                      decoration: InputDecoration(
                        labelText: (colorCapacity != null) ? "$colorCapacity" : 'Color_Capacity',
                        labelStyle:
                        TextStyle(color: Colors.black, fontSize: 15),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.orange),
                        //),
                      ),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: dropDown3(modelName),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.maxFinite,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        print(devicetype);
                        print(modelName);
                        print(color_capacity);
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => ShopModel(market: 'huawei',
                          type: devicetype, model: modelName, colorCapacity: color_capacity,)));
                      },
                      padding: EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xff03989E),
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dropDown1(){
    //to return the types of devices
    return DropdownButton(
      hint: Text('Choose type'),
      // // Not necessary for Option 1
      //value: city,
      onChanged: (newValue) {
        setState(() {
          type = newValue;
          devicetype = type;
        });
      },
      items: [
        "mobile",
        "laptop",
        "tablet"
      ].map((cities) {
        return DropdownMenuItem(
          child: Center(child: Text(cities)),
          value: cities,
        );
      }).toList(),
    );

  }
  dropDown2(type) {
    var supco;
    // method for select user
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Model').doc('huawei').collection(type.toString())
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('loading');
        } else {
          List<DropdownMenuItem> addToList = [];
          for (int i = 0; i < snapshot.data.docs.length; i++) {
            DocumentSnapshot snap = snapshot.data.docs[i];
            addToList.add(DropdownMenuItem(
              child: Text(
                snap.data()['model'],
              ),
              value:
              '${snap.data()['model']}', // the value is user id when i select i will select user name
            ));
          }
          return DropdownButton(
            isDense: false,
            isExpanded: false,
            hint: new Text(
              'Choose model',
              style: TextStyle(fontSize: 10.0),
            ),
            items: addToList,
            onChanged: (value) {
              setState(() {
                model = value;
                modelName = model;
              });
            },
            value: model,
          );
        }
      },
    );
  }
  dropDown3(modelName) {
    print(modelName);
    // method for select user
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Model').doc('huawei').collection(devicetype.toString())
          .doc(modelName).collection('color.capacity')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('loading');
        } else {
          List<DropdownMenuItem> addToList = [];
          for (int i = 0; i < snapshot.data.docs.length; i++) {
            DocumentSnapshot snap = snapshot.data.docs[i];
            addToList.add(DropdownMenuItem(
              child: Text(
                snap.data()['color.capacity'],
              ),
              value:
              '${snap.data()['color.capacity']}', // the value is user id when i select i will select user name
            ));
          }
          return DropdownButton(
            isDense: false,
            isExpanded: false,
            hint: new Text(
              'Choose model',
              style: TextStyle(fontSize: 10.0),
            ),
            items: addToList,
            onChanged: (value) {
              setState(() {
                colorCapacity = value;
                color_capacity = colorCapacity;
              });
            },
            value: colorCapacity,
          );
        }
      },
    );
  }
}