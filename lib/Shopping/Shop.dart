// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:electro_mania_afnan/DashBoard/Admin.dart';
//
// import 'package:electro_mania_afnan/Shopping/AppDrawer.dart';
// import 'package:electro_mania_afnan/Pages/ShopHelp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../Pages/ShopShop.dart';
//
// class Shop extends StatefulWidget {
//   @override
//   _ShopState createState() => _ShopState();
// }
//
// class _ShopState extends State<Shop> {
//   QuerySnapshot items;
//   @override
//   void initState() {
//     getItemsFromFB();
//     super.initState();
//   }
//
//   getItemsFromFB() async {
//     print('Getting Items #FB.....');
//     await FirebaseFirestore.instance.collection('AddModel').get().then((value) {
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
//         title: Text("Shop"),
//         backgroundColor: Color(0xff03989E),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => Admin()));
//             },
//           ),],),
//       backgroundColor:Color(0xff03989E),
//       body: Center(
//         child: SafeArea(
//           child: Column(
//             //  mainAxisAlignment: MainAxisAlignment.center,
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text("Select Model ",
//                   style: TextStyle(fontSize: 40,),),),
//               Expanded(
//                 flex: 1,
//                 child: itemsFlowListBrand(context),
//               )
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//
//   Widget itemsFlowListBrand(BuildContext context) {
//     if(items==null){
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }else {
//       return ListView.builder(
//         itemCount: items.docs.length,
//         itemBuilder: (context, i)
//         {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 // Navigator.of(context).pushNamed(ProudctDetails.id ,
//                 //              arguments: product.idd );
//               },
//               child:
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//
//                   RoundHelp(
//                     title: items.docs[i].data()['AddModel'],
//                     color: Colors.white,
//                     onPressed: () {
//                       Navigator.pushReplacement(context ,
//                           MaterialPageRoute(builder:(context) => ShopShop(
//                             ModelId: items.docs[i].data()['Model_id'].toString(),
//                           )));
//                     },
//                   ),
//
//                 ],
//               ),
//             ),);
//         },);
//     }}
// }
// class Colorr extends StatefulWidget {
//   @override
//   _ColorrState createState() => _ColorrState();
// }
//
// class _ColorrState extends State<Colorr> {
//   QuerySnapshot items;
//   @override
//   void initState() {
//     getItemsFromFB();
//     super.initState();
//   }
//
//   getItemsFromFB() async {
//     print('Getting Items #FB.....');
//     await FirebaseFirestore.instance.collection('AddColor').get().then((value) {
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
//         title: Text("Shop"),
//         backgroundColor: Color(0xff03989E),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => Admin()));
//             },
//           ),],),
//       backgroundColor:Color(0xff03989E),
//       body: Center(
//         child: SafeArea(
//           child: Column(
//             //  mainAxisAlignment: MainAxisAlignment.center,
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text("Select Color ",
//                   style: TextStyle(fontSize: 40,),),),
//               Expanded(
//                 flex: 1,
//                 child: itemsFlowListBrand(context),
//               )
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//
//   Widget itemsFlowListBrand(BuildContext context) {
//     if(items==null){
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }else {
//       return ListView.builder(
//         itemCount: items.docs.length,
//         itemBuilder: (context, i)
//         {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 // Navigator.of(context).pushNamed(ProudctDetails.id ,
//                 //              arguments: product.idd );
//               },
//               child:
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//
//                   RoundHelp(
//                     title: items.docs[i].data()['AddColor'],
//                     color: Colors.white,
//                     onPressed: () {
//                       Navigator.pushReplacement(context ,
//                           MaterialPageRoute(builder:(context) => ShopShop(
//                             ModelId: items.docs[i].data()['Model_id'].toString(),
//                           )));
//                     },
//                   ),
//
//                 ],
//               ),
//             ),);
//         },);
//     }}
// }
// class RoundHelp extends StatelessWidget {
//   RoundHelp({this.color,this.onPressed,this.title, });
//   final Color color;
//   final String title;
//   final Function onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 5,top: 30 , right: 10),
//       child: Material(
//         elevation: 5.0,
//         color: color,
//         borderRadius: BorderRadius.circular(30.0),
//         child: MaterialButton(
//           onPressed: onPressed,
//           minWidth: 50.0,
//           height: 50.0,
//           child: Text(
//             title,
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }