import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login_screen.dart';
import 'Admin.dart';
import 'HelpStudent.dart';
import 'LastProduct.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
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
                  onTap: () {
                    Navigator.push(context ,
                        MaterialPageRoute(builder:(context) => HomeAdmin()));
                  },
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
        title: Text('DashBorad'),
        backgroundColor: Color(0xff03989E),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Round(
                title: 'Shop ',
                colour: Color(0xff03989E),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Admin()));
                },
              ),
              SizedBox(
                height: 30,
              ),
              Round(
                title: 'Help Student',
                colour: Color(0xff03989E),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpStudent()));
                },
              ),
              SizedBox(
                height: 30,
              ),
              Round(
                title: 'Last Product',
                colour: Color(0xff03989E),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LastProduct()));
                },
              ),],),),
      ),

    );
  }
}

