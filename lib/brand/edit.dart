// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:electro_mania_afnan/Pages/CustomerLoction.dart';
// import 'package:electro_mania_afnan/Pages/ShopShop.dart';
// import 'package:electro_mania_afnan/Shopping/AppDrawer.dart';
// import 'package:electro_mania_afnan/homePage/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../main.dart';
//
//
// class CartCart extends StatefulWidget {
//   @override
//   _CartCartState createState() => _CartCartState();
//   CartCart(
//       {this.majorID,this.routeName,this.ModelId}); // Here we create an instance of this class as a parameter
//   final String majorID; // this is the first parameter assigned as final
//   final String routeName;
//   final String ModelId;
//
// }
//
// class _CartCartState extends State<CartCart> {
//   QuerySnapshot items;
//   var total;
//   var inCartQty;
//   var d;
//   var message;
//   //List yourItemList = [];
//   // int getTotals = 0;
//   @override
//   void initState() {
//     getItemsFromFB();
//     setState(() {
//       d = FirebaseAuth.instance.currentUser.uid;
//     });
//     super.initState();
//   }
//
//   Future getItemsFromFB() async {
//     print('Getting Items #FB.....');
//     await FirebaseFirestore.instance.collection('Cart').get().then((value) {
//       // print(value);
//       // print(value.docs[0].data()["price"]);
//
//       var number = 0;
//       var qtyCounter = 0;
//       int i;
//       for (i = 0; i < value.docs.length; i++) {
//         // print(value.docs[i].data()["price"]);
//         if (value.docs[i].data()['state'] == 'inCart') {
//           number = number + value.docs[i].data()['price'];
//           qtyCounter = qtyCounter + 1;
//         }
//       }
//       print(inCartQty);
//       print(number);
//       setState(() {
//         items = value;
//         total = number;
//         inCartQty = qtyCounter;
//         cartBadgQTY=qtyCounter;
//       });
//     });
//     print(items.docs.length.toString());
//   }
//
//   int returnTotal() {
//     return total;
//   }
//
//   int returnQty() {
//     return inCartQty;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//         backgroundColor: Color(0xff03989E),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             switch(widget.routeName){
//               case 'ShopHelp':{
//                 return  Navigator.of(context).pushReplacement(// Navigating without replacement
//                     new CupertinoPageRoute(builder: (BuildContext context) => ShopHelp(
//                       majorID: widget.majorID,
//                     ))
//                 );
//               }break;
//               case 'ShopShop':{
//                 Navigator.of(context).pushReplacement(// Navigating without replacement
//                     new CupertinoPageRoute(builder: (BuildContext context) => ShopShop(
//                       ModelId: widget.ModelId,
//                     ))
//                 );
//               }break;
//             }
//           },
//         ),
//       ),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('Cart')
//               .where("state", isEqualTo: "inCart")
//               .where("userid", isEqualTo: d)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.data == null)
//               return Center(
//                   child: CircularProgressIndicator(
//                     backgroundColor: Colors.grey,
//                     valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
//                   ));
//             else if (snapshot.data.docs.length == 0) {
//               return Center(
//                 child: Container(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 150.0),
//                     child: Column(
//                       children: [
//                         Image(image: AssetImage("images/EmptyCart.png" ,
//                         ),
//                         ),
//                         Text(
//                           'Oops...Your cart is empty !',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }
//             ;
//             return ListView.builder(
//                 itemCount: snapshot.data.docs.length,
//                 itemBuilder: (context, index) {
//                   DocumentSnapshot product = snapshot.data.docs[index];
//                   return Card(
//                     child: ListTile(
//                       title: Text(product['Title']),
//                       subtitle: Text("${product['price']} SR"),
//                       trailing: IconButton(
//                           icon: Icon(
//                             Icons.delete,
//                             color: Colors.red[400],
//                           ),
//                           onPressed: ()async{
//                             //if(mounted){return null;}
//                             _showCupertinoDialog(context,snapshot.data.docs[index].data()["id"]);
//                           }
//                       ),
//                     ),
//                   );
//                 });
//           }),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(),
//         child: returnQty() == 0
//             ? SizedBox(
//           height: 1,
//         )
//             : Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               flex: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       child: Text(
//                         'The total amount:',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 25,
//                           backgroundColor: Colors.teal[100],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                         child: returnTotal().toString() == "null"
//                             ? CircularProgressIndicator(
//                           backgroundColor: Colors.grey,
//                           valueColor:
//                           AlwaysStoppedAnimation<Color>(
//                               Colors.teal),
//                         )
//                             : Text(
//                           returnTotal().toString() + " SR",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold),
//                         )
//                       // Text(
//                       //   returnTotal().toString() == "null"
//                       //       ? ""
//                       //       : returnTotal().toString(),
//                       //   style: TextStyle(
//                       //     color: Colors.black,
//                       //     fontSize: 30,
//                       //   ),
//                       // ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               flex: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       child: Text(
//                         'Number of items:',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 25,
//                           backgroundColor: Colors.teal[100],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                         child: returnQty().toString() == "null"
//                             ? CircularProgressIndicator(
//                           backgroundColor: Colors.grey,
//                           valueColor:
//                           AlwaysStoppedAnimation<Color>(
//                               Colors.teal),
//                         )
//                             : Text(
//                           returnQty().toString(),
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold),
//                         )
//                       // Text(
//                       //   returnTotal().toString() == "null"
//                       //       ? ""
//                       //       : returnTotal().toString(),
//                       //   style: TextStyle(
//                       //     color: Colors.black,
//                       //     fontSize: 30,
//                       //   ),
//                       // ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             FlatButton(
//               color: returnQty() == 0
//                   ? Colors.grey[400]
//                   : Color(0xff03989E),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => LoctionInformation()));
//                 //     Order();
//               },
//               textColor: Colors.teal,
//               minWidth: 2000,
//               height: 50.0,
//               child: Text(
//                 'Order Now',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//       drawer: AppDrawer(),
//
//     );
//
//   }
//
//   Future deleteProd(String id) async {
//     await FirebaseFirestore.instance.collection('Cart').doc(id).delete().then((value) {
//       print('Item Deleted');
//       getItemsFromFB().then((value) {
//         Navigator.of(context).pop();
//       });
//     });
//   }
//
//   Future _showCupertinoDialog(BuildContext context,String id) async {
//     return showDialog(
//         context: context,
//         builder: (_) => new CupertinoAlertDialog(
//           title: Text("Are You Sure"),
//           content: Text(
//             "Do you want to remove the item",
//           ),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('No'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             FlatButton(
//                 child: Text('Yes'),
//                 onPressed: () {
//                   // if(mounted){return null;}
//                   deleteProd(id);
//
//                 }
//
//               // تعديل حذف عنصر واحد فق
//             ),
//           ],
//         ));
//   }
//   Future<void> Order() {
//     try {
//       FirebaseFirestore.instance
//           .collection('Cart')
//           .where("email", isEqualTo: FirebaseAuth.instance.currentUser.email)
//           .where("state", isEqualTo: "inCart")
//           .where("StateOrder", isEqualTo: "waiting")
//           .get()
//           .then((value) {
//         value.docs.forEach((element) {
//           print(element.reference.id);
//           element.reference.update({"state": "inOrder"});
//           element.reference.update({"StateOrder": "order is done"});
//         });
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
// }
// class LoctionInformation extends StatefulWidget {
//   @override
//   _LoctionInformationState createState() => _LoctionInformationState();
// }
//
// class _LoctionInformationState extends State<LoctionInformation> {
//   final _form = GlobalKey<FormState>();
//   TextEditingController _StreetController = TextEditingController();
//   TextEditingController _AddressdetailsController = TextEditingController();
//   TextEditingController _AddressLineController = TextEditingController();
//
//   String _submit() {
//     final form = _form.currentState;
//     if (form.validate()) {
//       return 'OK';
//     }
//   }
//   void _saveForm() {
//     final isValid = _form.currentState.validate();
//     if (!isValid) {
//       return;
//     }
//     _form.currentState.save();
//     AddAdress();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Shipping Loction'),
//         backgroundColor:  Color(0xff03989E),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.home),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Home()));
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _form,
//           child: ListView(
//             children: <Widget>[
//               TextFormField(
//                 controller: _AddressdetailsController,
//                 decoration: InputDecoration(labelText: 'Address details'),
//                 textInputAction: TextInputAction.next,
//                 //   border: OutlineInputBorder(),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please Enter a Address details.';
//                   }
//                   return null;
//                 },
//
//               ),
//               TextFormField(
//                 controller: _AddressLineController,
//                 decoration: InputDecoration(labelText: 'Address Line'),
//                 textInputAction: TextInputAction.next,
//                 // border: OutlineInputBorder(),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please Enter a Address Line.';
//                   }
//                   return null;
//                 },
//
//               ),
//               TextFormField(
//                 controller: _StreetController,
//                 decoration: InputDecoration(labelText: 'Street'),
//                 textInputAction: TextInputAction.next,
//                 //  border: OutlineInputBorder(),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please Enter a Street.';
//                   }
//                   return null;
//                 },
//
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       Image(image: AssetImage("images/Loction.png"),),
//                     ],
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary:Color(0xff03989E),
//                         padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                       ),
//                       child: Text('Select Location' ),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => CustomerLoction()));
//                         _saveForm();
//                         AddAdress();
//                       }),
//                 ],
//               ),
//             ],),  ),
//       ),
//     );
//   }
//   Future<void> AddAdress() {
//     try {
//       FirebaseFirestore.instance.collection('Users').
//       doc(FirebaseAuth.instance.currentUser.uid).
//       update({
//         "Address details": _AddressdetailsController.text,
//         "AddressLine":_AddressLineController.text,
//         "Street":_StreetController.text,
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
// }
//
//
// class OrderPage extends StatefulWidget {
//   @override
//   _OrderPageState createState() => _OrderPageState();
// }
//
// class _OrderPageState extends State<OrderPage> {
//   QuerySnapshot items;
//   var d;
//   @override
//   void initState() {
//     getItemsFromFB();
//     setState(() {
//       d = FirebaseAuth.instance.currentUser.uid;
//     });
//     super.initState();
//   }
//
//   getItemsFromFB() async {
//     print('Getting Items #FB.....');
//     await FirebaseFirestore.instance.collection('Cart').get().then((value) {
//       setState(() {
//         items = value;
//       });
//     });
//     print(items.docs.length.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Order"),
//         backgroundColor: Color(0xff03989E),
//       ),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('Cart')
//               .where("state", isEqualTo: "inOrder")
//               .where("userid", isEqualTo: d)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.data == null)
//               return Center(
//                   child: CircularProgressIndicator(
//                     backgroundColor: Colors.grey,
//                     valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
//                   ));
//
//             return ListView.builder(
//                 itemCount: snapshot.data.docs.length,
//                 itemBuilder: (context, index) {
//                   DocumentSnapshot product = snapshot.data.docs[index];
//                   return Card(
//                     shadowColor: Color(0xff03989E),
//                     child: ListTile(
//                       title: Text(
//                         product['price'].toString()+" SR",
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       trailing: Text(
//                         product['time'],
//                         style: TextStyle(fontSize: 14 ),
//                       ),
//                       subtitle:
//                       product['StateOrder']=='order is delivered'?
//                       Text(
//                         product['StateOrder'],
//                         style: TextStyle(fontSize: 14,color: Colors.green),
//                       ):
//                       Text(
//                         product['StateOrder'],
//                         style: TextStyle(fontSize: 14, color: Colors.red),
//                       ),
//                       leading: Text(
//                         product['Title'],
//                         style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   );
//                 });
//           }),
//     );
//   }
// }