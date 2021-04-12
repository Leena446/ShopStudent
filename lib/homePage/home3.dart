import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Brands/Hp.dart';
import 'package:electro_mania_afnan/Brands/Huawei.dart';
import 'package:electro_mania_afnan/Pages/CartCart.dart';
import 'package:electro_mania_afnan/Pages/ProDetalis.dart';
import 'package:electro_mania_afnan/Shopping/AppDrawer.dart';
import 'package:electro_mania_afnan/Brands/Apple.dart';
import 'package:electro_mania_afnan/brand/ios.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class Home3 extends StatefulWidget {
  static const String id = 'home3';

  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = new List();
  QuerySnapshot itemsInCart;


  QuerySnapshot items;
  QuerySnapshot items2;

  QuerySnapshot items3;

  @override
  void initState() {
    getItemsFromFBLast();
    getItemsFromFBDevice();
    super.initState();
  }
  getItemsFromFBDevice() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('device').get().then((
        value) {
      setState(() {
        items = value;
      });
    });
    print(items.docs.length.toString());
  }
  getItemsFromFBLast() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('LastProduct').get().then((
        value) {
      setState(() {
        items2 = value;
      });
    });
    print('Getting Items #FB2.....');
    await FirebaseFirestore.instance
        .collection('Cart')
        .where('state', isEqualTo: 'inCart')
        .get()
        .then((value2) {
      // print(value);
      // print(value.docs[0].data()["price"]);
      setState(() {
        itemsInCart = value2;
      });
    });
    print(itemsInCart.docs.length.toString());
    print(items2.docs.length.toString());
  }
  String returnCartQty() {
    return itemsInCart.docs.length.toString();
  }
/* User loggedInUser;
 // final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch(e){
        print(e);
    }
  }
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Color(0xff03989E),
        actions: <Widget>[
          // Consumer<Cartt>(
          //   builder: (
          //       _,
          //       cart,
          //       ch,
          //       )=>
          //       Badge(
          //         child: ch,
          //         value: itemsInCart == null ? "" : returnCartQty(),
          //         color: Colors.black54,
          //       ),
             IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartCart()));
              },
            ),
        ],
        // leading: IconButton(icon:Icon (Icons.security), onPressed: (){}),
      ),
      body: Column(children: <Widget>[
        // Container(
        //   child: Padding(
        //     padding: const EdgeInsets.only(right :200.0),
        //     child: Text("${FirebaseAuth.instance.currentUser.email}"),
        //   ),
        // ),
        Container(
             child: Image.asset('images/ShopShop.png'),
        ),

        Container(padding: EdgeInsets.only(top: 2, right: 1),
            child:
            Text("Categories",
                style: TextStyle(fontSize: 30, color: Colors.black,))),
        Container(height: 100, child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
                height: 100,
                width: 100,
                child: ListTile(
                  title: Image.asset('images/AppleLogo.png', width: 50, height: 80, ),
                  subtitle: Container(
                    child: Text("Apple ", textAlign: TextAlign.center,),),
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Apple()));
                  },
                )),
            Container(

                height: 100,
                width: 100,
                child: ListTile(
                  title: Image.asset('images/samsungLogo.png',width: 50, height: 80,),
                  subtitle: Container(
                      child: Text("Samsung ", textAlign: TextAlign.center,)),

                )),
            Container(
                height: 100,
                width: 100,
                child: ListTile(
                  title: Image.asset('images/HpLogo.png', width: 50, height: 80,),
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Hp()));
                  },

                  subtitle: Container(
                      child: Text("HP ", textAlign: TextAlign.center,)),

                )),
            Container(
                height: 100,
                width: 100,
                child: ListTile(
                  title: Image.asset('images/DellLogo.png', width: 50, height: 80,),
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Ios(market: 'Apple')));
                  },

                  subtitle: Container(
                      child: Text("Dell ", textAlign: TextAlign.center,)),

                )),
            // Container(
            //     height: 80,
            //     width: 100,
            //     child: ListTile(
            //       title: Image.asset('images/LenovoLogo.png',width: 50, height: 80,),
            //       onTap: (){
            //         Navigator.push(
            //             context, MaterialPageRoute(builder: (context) => Iphone()));                  },
            //       subtitle: Container(
            //           child: Text("Lenovo ", textAlign: TextAlign.center,)),
            //     )),
            Container(
                height: 80,
                width: 100,
                child: ListTile(
                  title: Image.asset('images/HUAWEILOGO.png',width: 50, height: 80,),
                  subtitle: Container(
                      child: Text("HUAWEI ", textAlign: TextAlign.center,)),
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Huawei()));
                  },
                )),

          ],)),
        Container(padding: EdgeInsets.all(10), child: Text("Best Sales",
            style: TextStyle(fontSize: 30, color: Colors.black,))),
        Expanded(
          flex: 1,
          child: itemsFlowList(context),
        ), ],
        ),
      drawer: AppDrawer(),

    );
  }

  Widget itemsFlowList(BuildContext context) {
    if (items == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: items.docs.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProDetalis(
                          imag: items2.docs[i].data()['imageUrl'],
                        //  Capicty: items.docs[i].data()['Capicty'],
                          price: items2.docs[i].data()['Price'],
                          store: items2.docs[i].data()['store'],
                          description: items2.docs[i].data()['Descrption'],
                          model: items2.docs[i].data()['Title'],
                          other: items2.docs[i].data()['Other'],
                        )));
              },
              child: Card(
                  color: Color(0xff03989E),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          items2.docs[i].data()['imageUrl'],))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        items2.docs[i]
                                            .data()['Price']
                                            .toString() +
                                            ' SR',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        items2.docs[i].data()['Title'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  // Column(
                                  //   children: [
                                  //     Text(
                                  //       'Capcity ',
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontSize: 15,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       items.docs[i].data()['Capicty'],
                                  //       style: TextStyle(
                                  //           color: Colors.white,
                                  //           fontSize: 15,
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: 345,
                          child: IconButton(
                            icon: Icon(
                              //product.isFavorite ? Icons.favorite : Icons.favorite_border,
                                Icons.favorite_border),
                            color: Colors.red[600],
                            onPressed: () {
                              //product.toggleFavoriteStatus();
                            },
                          ),
                        ),
                        Positioned(
                          left: 345,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                ),
                                onPressed: () {
                                  setState(() {
                                    getItemsFromFBLast();
                                //    itemsInCart.docs.length;
                                  });
                                  creatdoc(
                                    items2.docs[i].data()['Title'],
                                    items2.docs[i].data()['Price'],
                                    items2.docs[i].data()['store'],
                                  //  items.docs[i].data()['Capicty'],
                                  );
                                  Scaffold.of(context).hideCurrentSnackBar();
                                  //  Scaffold.of(context).openDrawer(); // حيفتح لما اضغط على الكارت صفحه الاوردر
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added item to cart!',
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },

      );

  }
  }
  creatdoc(model,b, store) async {
    try {
      DocumentReference reference =
      FirebaseFirestore.instance.collection("Cart").doc();
      Map<String, dynamic> c = {
        'model': model,
        'id': reference.id,
        'userid': FirebaseAuth.instance.currentUser.uid,
        'price': b,
        'state': "inCart",
        "email": FirebaseAuth.instance.currentUser.email,
        "time": DateFormat("dd/MM/yyy/hh:mm").format(DateTime.now()).toString(),
        "store": store,
        //  "Capicty": Capicty,
        "StateOrder": "waiting",
      };
      reference
          .set(c)
          .whenComplete(() => print("@@@@@${reference.id} is coplete"));
    } catch (e) {
      print('$e -- in method creatdoc');
    }
  }
}
