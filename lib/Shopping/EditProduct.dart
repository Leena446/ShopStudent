import 'package:electro_mania_afnan/Shopping/SendedOrder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'OrdeItem.dart';
import 'Orders.dart';
import 'cartt.dart';

class EditProduct extends StatefulWidget {
  static const String id = 'EditProduct';
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _priceFocsNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  @override
  void dispose() {
    _priceFocsNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartt>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Write Shiping Location"),),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child:ListView(
            children: <Widget>[
              TextFormField(decoration: InputDecoration(
                labelText: 'Your Name',labelStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.teal,
                ),),
               textInputAction: TextInputAction.next,
                onFieldSubmitted:(_){
                FocusScope.of(context).requestFocus(_priceFocsNode);
                },
              ),
              TextFormField(decoration: InputDecoration(
                labelText: 'The Phone number ', labelStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),),
                //   textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                //  focusNode: _priceFocsNode, //خلى كيبورد الارقام يظهربس
                onFieldSubmitted:(_){
                  //    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
              ),
              TextFormField(decoration: InputDecoration(
                  labelText: 'The street ', labelStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.teal,
                ),),
           //     textInputAction: TextInputAction.next,
          //      keyboardType: TextInputType.number,
             //   focusNode: _priceFocsNode, //خلى كيبورد الارقام يظهربس
              onFieldSubmitted:(_){
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
            ),

              TextFormField(decoration: InputDecoration(
                labelText: 'Floor number',labelStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.home,
                  color: Colors.teal,
                ),),
                keyboardType: TextInputType.text,
              ),
              TextFormField(decoration: InputDecoration(
                labelText: 'Home number ',labelStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.home,
                  color: Colors.teal,
                ),),
                keyboardType: TextInputType.text,
              ),
              TextFormField(decoration: InputDecoration(
                labelText: 'building number',labelStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.home,
                  color: Colors.teal,
                ),),
                keyboardType: TextInputType.text,
              ),
              TextFormField(decoration: InputDecoration(
                labelText: 'Description about home',labelStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  Icons.home,
                  color: Colors.teal,
                ),),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
              ),
               RaisedButton(
                 disabledColor: Colors.red[600],
                 splashColor: Colors.teal[200],
                   elevation:5.0,
                   animationDuration: Duration(microseconds: 1),
                   shape: RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(18.0),
                     side: BorderSide(color: Colors.teal[700]),
                   ),
                 onPressed: (){
                   Provider.of<Orders>(context,listen: false).addOrder(
                     cart.items.values.toList(),
                     cart.totalAmount,);
                   cart.clear();
                 },
                child: Text('Send', style: TextStyle(fontSize: 20 ,)),
              ),
            ],
          ) ,
        ),


              ),


          );
  }
}
