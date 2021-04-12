import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Pages/CartCart.dart';
import 'package:electro_mania_afnan/Shopping/AppDrawer.dart';
import 'package:electro_mania_afnan/Pages/ShopHelp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nice_button/nice_button.dart';

class Help extends StatefulWidget {
  static const String id = 'help';
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {

  var firstColor =   Color(0xff03989E),  secondColor = Colors.white10;

  QuerySnapshot items;
  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Majors').get().then((value) {
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
        title: Text("Help Student"),
        backgroundColor: Color(0xff03989E),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartCart()));
            },
          ),],),
      backgroundColor:Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image(image: AssetImage("images/HelpSelect.png"
                ,),height: 300,),),
              Expanded(
                flex: 1,
                child: itemsFlowListBrand(context),
              )
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),

    );
  }

  Widget itemsFlowListBrand(BuildContext context) {
    if(items==null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else {
      return ListView.builder(
        itemCount: items.docs.length,
        itemBuilder: (context, i)
        {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed(ProudctDetails.id ,
                //              arguments: product.idd );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NiceButton(
                    width: 500,
                    elevation: 3.0,
                    radius: 40,
                    padding: const EdgeInsets.all(30),
                    text: items.docs[i].data()['Major'],fontSize: 20,
                    gradientColors: [ firstColor, secondColor],
                    onPressed: () { Navigator.pushReplacement(context ,
                     MaterialPageRoute(builder:(context) => ShopHelp(
                     majorID: items.docs[i].data()['Majo_id'].toString(),
            )));
      },
                  ),
                  // RoundHelp(
                  //   title: items.docs[i].data()['Major'],
                  //   color:Color(0xff03989E),
                  //   onPressed: () {
                  //     Navigator.pushReplacement(context ,
                  //         MaterialPageRoute(builder:(context) => ShopHelp(
                  //           majorID: items.docs[i].data()['Majo_id'].toString(),
                  //         )));
                  //   },
                  // ),

                ],
              ),
            ),);
        },);
    }}
}
