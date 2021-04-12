import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Pages/CustomerLoction.dart';
import 'package:electro_mania_afnan/homePage/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../main.dart';

import 'ProDetalis.dart';


class CartCart extends StatefulWidget {
  @override
  _CartCartState createState() => _CartCartState();
}

class _CartCartState extends State<CartCart> {
  QuerySnapshot items;
  var total;
  var inCartQty;
  var d;
  var message;
  //List yourItemList = [];
  // int getTotals = 0;
  @override
  void initState() {
    getItemsFromFB();
    setState(() {
      d = FirebaseAuth.instance.currentUser.uid;
    });
    super.initState();
  }

  Future getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Cart').get().then((value) {
      // print(value);
      // print(value.docs[0].data()["price"]);
      var number = 0;
      var qtyCounter = 0;
      int i;
      for (i = 0; i < value.docs.length; i++) {
        // print(value.docs[i].data()["price"]);
        if (value.docs[i].data()['state'] == 'inCart') {
          if (value.docs[i].data()['email'] == FirebaseAuth.instance.currentUser.email) {
            number = number + value.docs[i].data()['price'];
            qtyCounter = qtyCounter + 1;
          }
        }
      //  print(inCartQty);
       // print(number);
        setState(() {
          items = value;
          total = number;
          inCartQty = qtyCounter;
          //  cartBadgQTY=qtyCounter;
        });
      } });
  // print(items.docs.length.toString());
  }

  int returnTotal() {
    return total;
  }

  int returnQty() {
    return inCartQty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Color(0xff03989E),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //   },
        // ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Cart')
              .where("state", isEqualTo: "inCart")
              .where("userid", isEqualTo: d)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null)
              return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  ));
            else if (snapshot.data.docs.length == 0) {
              return Center(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage("images/EmptyCart.png" ,
                        ),
                        ),
                        Text(
                          'Oops...Your cart is empty !',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            ;
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot product = snapshot.data.docs[index];
                  return Container(
                    // height: 80.0,
                    // color: Color(0xff03989E),
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(product['model']),
                        subtitle: Text("${product['price']} SR"),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red[400],
                            ),
                            onPressed: ()async{
                              //if(mounted){return null;}
                              _showCupertinoDialog(context,snapshot.data.docs[index].data()["id"]);
                            }
                        ),
                      ),
                    ),
                  );
                });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(),
        child: returnQty() == 0
            ? SizedBox(
          height: 1,
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: returnTotal().toString() == "null"
                            ? CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(
                              Colors.teal),
                        )
                            : Text(
                          returnTotal().toString() + " SR",
                          style: TextStyle(
                              backgroundColor: Colors.white,
                              color: Color(0xff03989E),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),

                        )
                      // Text(
                      //   returnTotal().toString() == "null"
                      //       ? ""
                      //       : returnTotal().toString(),
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 30,
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          'Number of items',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: returnQty().toString() == "null"
                            ? CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(
                              Colors.teal),
                        )
                            : Text(
                          returnQty().toString(),
                          style: TextStyle(
                              color: Color(0xff03989E),
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      // Text(
                      //   returnTotal().toString() == "null"
                      //       ? ""
                      //       : returnTotal().toString(),
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 30,
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: returnQty() == 0
                  ? Colors.grey[400]
                  : Color(0xff03989E),
              onPressed: () {
                 Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                        builder: (context) => LoctionInformation()));
                   //  Order();
              },
              textColor: Colors.teal,
              minWidth: 2000,
              height: 50.0,
              child: Text(
                'Order Now',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),

    );

  }

  Future deleteProd(String id) async {
    await FirebaseFirestore.instance.collection('Cart').doc(id).delete().then((value) {
      print('Item Deleted');
      getItemsFromFB().then((value) {
        Navigator.of(context).pop();
      });
    });
  }

  Future _showCupertinoDialog(BuildContext context,String id) async {
    return showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
          title: Text("Are You Sure"),
          content: Text(
            "Do you want to remove the item",
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  // if(mounted){return null;}
                  deleteProd(id);

                }

              // تعديل حذف عنصر واحد فق
            ),
          ],
        ));
  }
  // Future<void> Order() {
  //   try {
  //     FirebaseFirestore.instance
  //         .collection('Cart')
  //         .where("email", isEqualTo: FirebaseAuth.instance.currentUser.email)
  //         .where("state", isEqualTo: "inCart")
  //         .where("StateOrder", isEqualTo: "waiting")
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((element) {
  //         print(element.reference.id);
  //         element.reference.update({"state": "inOrder"});
  //         element.reference.update({"StateOrder": "order is done"});
  //       });
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
class LoctionInformation extends StatefulWidget {
  @override
  _LoctionInformationState createState() => _LoctionInformationState();
}

class _LoctionInformationState extends State<LoctionInformation> {
  final _form = GlobalKey<FormState>();
  TextEditingController _StreetController = TextEditingController();
  TextEditingController _AddressdetailsController = TextEditingController();
  TextEditingController _AddressLineController = TextEditingController();
  void initState() {
//    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  String _submit() {
    final form = _form.currentState;
    if (form.validate()) {
      return 'OK';
    }
  }
  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Shipping Loction'),
        backgroundColor:  Color(0xff03989E),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _AddressdetailsController,
                decoration: InputDecoration(labelText: 'Address details'),
                textInputAction: TextInputAction.next,
                //   border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Address details.';
                  }
                  return null;
                },

              ),
              TextFormField(
                controller: _AddressLineController,
                decoration: InputDecoration(labelText: 'Address Line'),
                textInputAction: TextInputAction.next,
                // border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Address Line.';
                  }
                  return null;
                },

              ),
              TextFormField(
                controller: _StreetController,
                decoration: InputDecoration(labelText: 'Street'),
                textInputAction: TextInputAction.next,
                //  border: OutlineInputBorder(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter a Street.';
                  }
                  return null;
                },

              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Image(image: AssetImage("images/Loction.png"),),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:Color(0xff03989E),
                        padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                      child: Text('Select Location' ),
                      onPressed: () {
                  Navigator.push(context,
                     MaterialPageRoute(builder: (context) => CustomerLoction()));
                  _saveForm();
                  AddAdress();
                      }),

                ],
              ),
            ],),  ),
      ),
    );
  }
  Future AddAdress() async {
    _submit();
    if (_submit() == 'OK') {
      try {
        await FirebaseFirestore.instance.collection('Users').
        doc(FirebaseAuth.instance.currentUser.uid).
        update({
          "Address details": _AddressdetailsController.text,
          "AddressLine": _AddressLineController.text,
          "Street": _StreetController.text,
        });
      } catch (e) {
        print(e);
      }
    }
  }
// Future<void> Order() {
//   try {
//     FirebaseFirestore.instance
//         .collection('Cart')
//         .where("email", isEqualTo: FirebaseAuth.instance.currentUser.email)
//         .where("state", isEqualTo: "inCart")
//         .where("StateOrder", isEqualTo: "waiting")
//         .get()
//         .then((value) {
//       value.docs.forEach((element) {
//         print(element.reference.id);
//         element.reference.update({"state": "inOrder"});
//         element.reference.update({"StateOrder": "order is done"});
//       });
//     });
//   } catch (e) {
//     print(e);
//   }
// }
}
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  QuerySnapshot items;
  var d;
  @override
  void initState() {
    getItemsFromFB();
    setState(() {
      d = FirebaseAuth.instance.currentUser.uid;
    });
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB.....');
    await FirebaseFirestore.instance.collection('Cart').get().then((value) {
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
        title: Text("Order"),
        backgroundColor: Color(0xff03989E),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Orders')
              .where("userId", isEqualTo: d)
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
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Order Date',
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              product['oderTime'],
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Waiting',
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  color: Color(0xff03989E),
                                  elevation: 6,
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Details",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ]),
                                  onPressed: () {
                                    // if (isShown == false) {
                                    //   _tabBarCount =
                                    //       _tabBarCount - 1;
                                    //   _countController.sink
                                    //       .add(_tabBarCount);
                                    //   FirebaseFirestore.instance
                                    //       .collection('Order')
                                    //       .doc(order.orderId)
                                    //       .update({
                                    //     "isShown": true,
                                    //   });
                                    // }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              OrderDetailsPage(
                                                orderTime: product['oderTime'],
                                              )),
                                    );
                                    //I'm going to sent the event Id and fetch all the requests for all users
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                  );
                });
          }),
    );
  }
 }
 class OrderDetailsPage extends StatefulWidget {
  final orderTime;

  const OrderDetailsPage({Key key, this.orderTime}) : super(key: key);
   @override
   _OrderDetailsPageState createState() => _OrderDetailsPageState();
 }
 
 class _OrderDetailsPageState extends State<OrderDetailsPage> {
   var d;
   @override
   void initState() {
     setState(() {
       d = FirebaseAuth.instance.currentUser.uid;
     });
     super.initState();
   }
   
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Customer Orders"),
         backgroundColor: Color(0xff03989E),
       ),
       body: StreamBuilder(
           stream: FirebaseFirestore.instance
               .collection('Cart')
               .where("userid", isEqualTo: d)
           .where('timeOrder', isEqualTo: widget.orderTime)
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
                   return Card(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           ListTile(
                             title: Text(
                               product['model'],
                               style: TextStyle(fontSize: 14),
                             ),
                             trailing: Text(
                               product['price'].toString(),
                               style: TextStyle(fontSize: 14, color: Colors.red),
                             ),
                           ),
                           // ListTile(
                           //   title: Text(
                           //     product['store'],
                           //     style: TextStyle(fontSize: 14),
                           //   ),
                           //   trailing: Text(
                           //     product['state'],
                           //     style: TextStyle(fontSize: 14, color: Colors.red),
                           //   ),
                           // ),
                         ],
                       ),

                     ),
                   );
                 });
           }),
     );
   }
 }
 
class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  QuerySnapshot items;
  QuerySnapshot itemsInCart;

  @override
  void initState() {
    getItemsFromFB();
    super.initState();
  }

  getItemsFromFB() async {
    print('Getting Items #FB2.....');
    await FirebaseFirestore.instance
        .collection('WishListUser')
        .where('wishList', isEqualTo: 'inListWish')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser.email)
        .get()
        .then((value2) {
      // print(value);
      // print(value.docs[0].data()["price"]);
      setState(() {
        items = value2;
      });
    });
    print(itemsInCart.docs.length.toString());
    print(items.docs.length.toString());
}

  String returnCartQty() {
    return itemsInCart.docs.length.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("WishList"),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          // Consumer<Cartt>(
          //   builder: (
          //       _,
          //       cart,
          //       ch,
          //       ) =>
          //       Badge(
          //         child: ch,
          //         value: cartBadgQTY.toString(),
          //         color: Colors.black54,
          //       ),
          //    child:
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>
                      CartCart(
                        // majorID: widget.majorID,
                        // routeName: 'ShopHelp',
                      )));
            },
          ),
          //),
        ],
      ),
      body: GestureDetector(
        onTap: () {},
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: itemsFlowList(context),
              )
            ],
          ),
        ),
      ),
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
                        builder: (context) =>
                            ProDetalis(
                              imag: items.docs[i].data()['img'],
                              //  Capicty: items.docs[i].data()['Capicty'],
                              price: items.docs[i].data()['price'],
                              store: items.docs[i].data()['store'],
                            //  description: items.docs[i].data()['description'],
                              model: items.docs[i].data()['model'],
                            //  other: items.docs[i].data()['other'],
                            )));
              },
              child: Card(
                  color: Colors.white,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          items.docs[i].data()['img']))),
                            ),
                            Text(
                              items.docs[i].data()['model'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
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
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items.docs[i]
                                            .data()['price']
                                            .toString() +
                                            ' SR',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'store ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items.docs[i].data()['store'],
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 20,
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
                                  //         fontSize: 20,
                                  //       ),
                                  //     ),
                                  // Text(
                                  //   items.docs[i].data()['Capicty'],
                                  //   style: TextStyle(
                                  //       color: Colors.deepOrangeAccent,
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
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
                                Icons.favorite),
                            color: Colors.red[600],
                            onPressed: () async{
                              setState(() {
                                deletWish(context, items.docs[i].data()['id']);
                              });
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
                                    cartBadgQTY = cartBadgQTY + 1;
                                    getItemsFromFB();
                                    itemsInCart.docs.length;
                                  });
                                  creatdoc(
                                    items.docs[i].data()['model'],
                                    items.docs[i].data()['price'],
                                    items.docs[i].data()['store'],
                                    //items.docs[i].data()['Capicty'],
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
                                color: Colors.teal,
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
  Future<void> deletWishList(String id ){
    FirebaseFirestore.instance.collection('WishListUser').doc(id).delete();

  }

  void deletWish(BuildContext context, String id ) async {
    if (await _showCupertinoDialog(context)) {
      try {
        await deletWishList(id);
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
          content: Text("Do you want to remove the item from wishList",
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