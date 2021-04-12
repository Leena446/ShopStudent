import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/drawer/FeedApp.dart';
import 'package:electro_mania_afnan/drawer/Contactus.dart';
import 'package:electro_mania_afnan/drawer/Information.dart';
import 'package:electro_mania_afnan/homePage/help.dart';
import 'package:electro_mania_afnan/homePage/home3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../login_screen.dart';
import '../Pages/CartCart.dart';


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Color(0xff03989E),
            title: Text("${FirebaseAuth.instance.currentUser.email}"
            , style: TextStyle(fontSize: 18),),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop,
              color: Color(0xff03989E),
            ),
            title: Text("shop"),
            onTap: (){
              Navigator.push(context ,
                  MaterialPageRoute(builder:(context) => Home3()));            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.feedback,
              color: Color(0xff03989E),
            ),
            title: Text("FeedBack"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FeedApp.id);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite,
              color: Color(0xff03989E),
            ),
            title: Text("WishList"),
            onTap: (){
              Navigator.push(context ,
                  MaterialPageRoute(builder:(context) => WishList()));
            },
          ),
          Divider(),
          ListTile(
                  title: Text('Help Student',),
                  leading: Icon(
                    Icons.home,
                    color: Color(0xff03989E),
                    ),
                  onTap: () {
                    Navigator.pushNamed(context, Help.id);
                  },
                ),
          Divider(),
          ListTile(
            title: Text('Order',),
            leading: Icon(
              Icons.drag_handle_sharp,
              color: Color(0xff03989E),
            ),
            onTap: () {
              Navigator.push(context ,
                  MaterialPageRoute(builder:(context) => OrderPage()));             },
          ),

          Divider(),
          ListTile(
                  title: Text('Cart', ),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Color(0xff03989E),
                    ),
                  onTap: () {
                    Navigator.push(context ,
                        MaterialPageRoute(builder:(context) => CartCart()));                      },
                ),
          Divider(),
          ListTile(
            title: Text('Reconnaissance',),
            leading: Icon(
              Icons.receipt_outlined,
              color: Color(0xff03989E),
            ),
              onTap: () {
              Navigator.push(context ,
              MaterialPageRoute(builder:(context) => HelpLink()));
              },

          ),
          Divider(),
          ListTile(
            title: Text('Logout', ),
            leading: Icon(
              Icons.exit_to_app,
              color: Color(0xff03989E),
            ),
            onTap: () async {
              await  FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context ,
                  MaterialPageRoute(builder:(context) => LoginScreen()));
            },),
          Divider(),
          ListTile(
                  title: Text('Information', ),
                  leading: Icon(
                    Icons.info,
                    color: Color(0xff03989E),
                    ),
                  onTap: () {
                    Navigator.pushNamed(context , Information.id);
                  },
                ),
          Divider(),
          ListTile(
                  title: Text('Contact Us',),
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xff03989E),
                   ),
                  onTap: () {
                    Navigator.pushNamed(context , Contactus.id);
                  },
                ),
       ],),);
  }
}
class HelpLink extends StatefulWidget {
  @override
  _HelpLinkState createState() => _HelpLinkState();
  static const String id = 'HelpLink';

}

class _HelpLinkState extends State<HelpLink> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
          title:  Text('Reconnaissance'),
          backgroundColor: Color(0xff03989E),
        ),
        body:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 Image(image: AssetImage("images/FillLink.png" ,
                ),
                ),
              RichText(
                text: TextSpan(
                  children: [
                     TextSpan(
                      text: 'If your major does not exist, help us to add it ',
                      style:  TextStyle(color: Colors.black),
                    ),
                     TextSpan(
                      text: 'Click Here',
                      style:  TextStyle(color:Color(0xff03989E),),
                      recognizer:  TapGestureRecognizer()
                        ..onTap = () { launch('https://forms.gle/BZSFEEEz656Nwfjb8');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}