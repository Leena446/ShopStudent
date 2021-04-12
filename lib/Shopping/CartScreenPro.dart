import 'package:electro_mania_afnan/Shopping/CheakOut.dart';
import 'package:electro_mania_afnan/Shopping/EditProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Orders.dart';
import 'SendedOrder.dart';
import 'cart_item.dart' ;
import 'cartt.dart' show Cartt;

class CartScreenPro extends StatelessWidget {
  static const String id = 'CartScreenPro';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartt>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Order"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15,
          ),
              child:Padding(padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Total",style: TextStyle(fontSize: 20),),
                  Spacer(),
              //    SizedBox(width: 10,),
                Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}', style:
                  TextStyle(
                    color: Theme.of(context).primaryTextTheme.title.color,
                  ),),
                backgroundColor: Colors.teal,),
                ],),),),
          SizedBox(height: 10,),
          Expanded(child:
    ListView.builder(itemCount: cart.items.length, itemBuilder: (ctx,i)=>
        CartItem(
        cart.items.values.toList()[i].idd,
        cart.items.values.toList()[i].price,
        cart.items.values.toList()[i].quantity,
        cart.items.values.toList()[i].title,
          cart.items.keys.toList()[i],

        ),),),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Material(
              color: Color(0xff03989E),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child:  FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, CheakOut.id);

                    //  Provider.of<Orders>(context,listen: false).addOrder(
               //   cart.items.values.toList(),
              //    cart.totalAmount,);
              //    cart.clear();
                  },
                  textColor: Colors.teal,
                  minWidth: 200.0,
                  height: 50.0,
                  child: Text(
                  'Order Now',
                  style: TextStyle(color: Colors.white),

    ),),),),
        ],
      ),
    );
  }
}
