import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AddNewDeviceMajor.dart';

class HelpStudent extends StatefulWidget {
  @override
  _HelpStudentState createState() => _HelpStudentState();
}

class _HelpStudentState extends State<HelpStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
            ],),),),
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
                                  AddMajor()));
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
                          'Add Major',
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
                              builder: (BuildContext context) => AddNewDeviceMajor()));
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
                          Icons.add_box_outlined,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Add new Device',
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
                                  RemoveMajors()));
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
                          Icons.assignment,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Remove Major',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            //   fontWeight: FontWeight.bold,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RemoveProdMajor()));
                    },
                    //             MembersPage()));

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
                          Icons.people,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Remove Device',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 22.0,
                            //    fontWeight: FontWeight.bold,
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
class RemoveMajors extends StatefulWidget {
  @override
  _RemoveMajorsState createState() => _RemoveMajorsState();
}

class _RemoveMajorsState extends State<RemoveMajors> {

  QuerySnapshot items;
  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Majors').get().then((
        value) {
      setState(() {
        items = value;
      });
    });
    print(items.docs.length.toString());
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("remove major"),
        backgroundColor: Color(0xff03989E),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Majors').snapshots(),
          builder: ( context, snapshot){
            if (items == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else{
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                  DocumentSnapshot product = snapshot.data.docs[index];
                  return Card(
                      child: ListTile(
                          title:Text(product['Major'].toString()),
                          trailing:IconButton(
                            icon:Icon(Icons.delete, color: Colors.red[400],),
                            onPressed: ()=> deletProduct(context , snapshot.data.docs[index].data()['Majo_id']),
                          )
                      )

                  );
                }); }},
      ),
    );

  }
  Future<void> deletProd(String id ){
    FirebaseFirestore.instance.collection('AddMajor').doc(id).delete();

  }

  void deletProduct(BuildContext context, String id ) async {
    if (await _showCupertinoDialog(context)) {
      try {
        await deletProd(id);
      } catch (e) {
        print(e);
      }
    }
  }
  Future <bool> _showCupertinoDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (_) =>
        new CupertinoAlertDialog(
          title: Text("Are You Sure"),
          content: Text("Do you want to remove the item",
          ),
          actions: <Widget>[
            FlatButton(child: Text('No'), onPressed: () {
              Navigator.pop(context, false);
            },),
            FlatButton(child: Text('Yes'), onPressed: () =>
                Navigator.pop(context, true),

              // تعديل حذف عنصر واحد فق
            ),
          ],
        ));
  }
}

class RemoveProdMajor extends StatefulWidget {
  @override
  _RemoveProdMajorState createState() => _RemoveProdMajorState();
}

class _RemoveProdMajorState extends State<RemoveProdMajor> {
  QuerySnapshot items;

  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('DeviceMajor').get().then((
        value) {
      setState(() {
        items = value;
      });
    });
    print(items.docs.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("remove product "),
        backgroundColor: Color(0xff03989E),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('DeviceMajor').snapshots(),
          builder: ( context, snapshot){
            if (items == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else{
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                  DocumentSnapshot product = snapshot.data.docs[index];
                  return Card(
                      child: ListTile(
                          leading: Text(product['Store']),
                          title:Text(product['DeviceModel']),
                          trailing:IconButton(
                            icon:Icon(Icons.delete, color: Colors.red[400],),
                            onPressed: ()=> deletProduct(context , snapshot.data.docs[index].data()['deviceId']),

                          )
                      )
                  );
                }); }},
      ),
    );

  }
  Future<void> deletProd(String id ){
    FirebaseFirestore.instance.collection('DeviceMajor').doc(id).delete();

  }

  void deletProduct(BuildContext context, String id ) async {
    if (await _showCupertinoDialog(context)) {
      try {
        await deletProd(id);
      } catch (e) {
        print(e);
      }
    }
  }
  Future <bool> _showCupertinoDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (_) =>
        new CupertinoAlertDialog(
          title: Text("Are You Sure"),
          content: Text("Do you want to remove the item",
          ),
          actions: <Widget>[
            FlatButton(child: Text('No'), onPressed: () {
              Navigator.pop(context, false);
            },),
            FlatButton(child: Text('Yes'), onPressed: () =>
                Navigator.pop(context, true),

              // تعديل حذف عنصر واحد فق
            ),
          ],
        ));
  }
}
