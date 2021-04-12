import 'package:electro_mania_afnan/brand/huawei.dart';
import 'package:electro_mania_afnan/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:electro_mania_afnan/login_screen.dart';
import 'package:provider/provider.dart';
import 'DashBoard/AddNewDevice.dart';
import 'DashBoard/HomePage.dart';
import 'Devices/InsertDevice.dart';
import 'Pages/CustomerLoction.dart';
import 'Shopping/AppDrawer.dart';
import 'Shopping/CartScreenPro.dart';
import 'Shopping/CheakOut.dart';
import 'brand/ios.dart';
import 'brand/lenovo.dart';
import 'drawer/FeedApp.dart';
import 'Shopping/EditProduct.dart';
import 'Shopping/OrderScreen.dart';
import 'Shopping/Orders.dart';
import 'Shopping/ProductDetalis.dart';
import 'Shopping/SendedOrder.dart';
import 'Shopping/cartt.dart';
import 'drawer/Contactus.dart';
import 'drawer/Information.dart';
import 'homePage/help.dart';
import 'homePage/home3.dart';
import 'homePage/home.dart';
import 'first/logo.dart';
import 'homePage/home2.dart';
import 'Shopping/mobile.dart';
import 'Shopping/mobiledetails.dart';
import 'Shopping/Products.dart';

int cartBadgQTY=0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: Products(),),
      ChangeNotifierProvider.value(
        value: Cartt(),),
      ChangeNotifierProvider.value(
        value: Orders(),),
    ],
      //ChangeNotifierProvider(
      //  value: Products(),
      //  create:(_)=> Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        // theme: ThemeData.dark().copyWith(
        //   textTheme: TextTheme(
        //     body1: TextStyle(color: Colors.white),
        //    ),
        //  ),
        initialRoute:  LoginScreen.id,
        routes: {
          Home2.id: (context) => Home2(),
          Home3.id: (context) => Home3(),
          Home.id: (context) => Home(),
          Logo.id: (context) => Logo(),
          Help.id: (context) => Help(),
          mobile.id: (context) => mobile(),
          MobileDetails.id:(context) => MobileDetails(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          Contactus.id: (context) => Contactus(),
          Information.id: (context) => Information(),
          ProudctDetails.id: (context) =>  ProudctDetails(),
          CartScreenPro.id: (context) =>  CartScreenPro(),
          OrderScreen.id: (context) =>  OrderScreen(),
          EditProduct.id: (context) =>  EditProduct(),
          SendedOrder.id: (context) =>  SendedOrder(),
          FeedApp.id: (context) =>  FeedApp(),
          CheakOut.id: (context) =>  CheakOut(),
          Ios.id: (context) =>  Ios(),
          lenovo.id: (context) =>  lenovo(),
          huawei.id: (context) =>  huawei(),
          HomePage.id: (context) => HomePage(),
          AddNewDevice.id: (context) => AddNewDevice(),
          AddProductMaj.id: (context) => AddProductMaj(),
          CorrectEntry.id: (context) => CorrectEntry(),
          CustomerLoction.id:(context) =>CustomerLoction(),
          HelpLink.id:(context) =>HelpLink(),
          InsertDevice.id:(context) => InsertDevice(),





          //  CartScreen(),

        },
      ),
    );
  }
}