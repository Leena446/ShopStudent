
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppDrawer.dart';
import 'OrderItem.dart';
import 'Orders.dart' show Orders;

class OrderScreen extends StatelessWidget {
  static const String id = 'OrderScreen';

  @override
  Widget build(BuildContext context) {
    final OrderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Your order"),
      ),
      body:ListView.builder(
          itemCount: OrderData.orders.length,
          itemBuilder: (ctx,i) => OrderItem(OrderData.orders[i]),),
    );
  }
}
