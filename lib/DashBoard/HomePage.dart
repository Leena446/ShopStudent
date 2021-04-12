
import 'package:electro_mania_afnan/Devices/InsertDevice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login_screen.dart';
import 'HelpStudent.dart';
import 'TrackOrders.dart';

class HomePage extends StatefulWidget {
  static const id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
        padding: EdgeInsets.only(top: 100),
        children: <Widget>[
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
                                  HelpStudent()));
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
                          'Help Student',
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
                              builder: (BuildContext context) => ChosseBrand()));
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
                          'Choose Brand',
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
                                   InsertDevice()));
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
                          'Add New Brand',
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
                            MaterialPageRoute(builder: (context) => ShowOrders()));
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
                          Icons.hourglass_top,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          'Last Product',
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
                              ShowOrders()));
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
                      Icons.reorder_sharp,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      'Track Orders',
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
    ],)
    );
  }
}